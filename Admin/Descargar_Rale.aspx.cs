using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Collections;
using System.ComponentModel;
using System.IO;
using System.Net;
using ClosedXML.Excel;

public partial class Admin_Descargar_Rale : System.Web.UI.Page
{
    String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Tipo_Rale.AppendDataBoundItems = true;
            String strQuery = "SELECT DISTINCT [tipo_rale] as id,[tipo_rale] as des FROM [Supervision].[dbo].[Rales_Combo]";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                Tipo_Rale.DataSource = cmd.ExecuteReader();
                Tipo_Rale.DataTextField = "des";
                Tipo_Rale.DataValueField = "id";
                Tipo_Rale.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
        if (!IsPostBack)
        {
            TIPO.AppendDataBoundItems = true;
            try
            {
                this.TIPO.Items.Insert(0, new ListItem("-- Selecione el Tipo --", ""));
                this.TIPO.Items.Insert(1, new ListItem("DELEGACIONAL", "3"));
                this.TIPO.Items.Insert(2, new ListItem("TOLUCA", "1"));
                this.TIPO.Items.Insert(3, new ListItem("NAUCALPAN", "5"));
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

            }
        }
    }
    protected void Tipo_Rale_SelectedIndexChanged(object sender, EventArgs e)
    {
        Rale1.Items.Clear();
        Rale1.Items.Add(new ListItem("-- Selecciona Rale --", ""));
        Rale1.AppendDataBoundItems = true;
        String strQuery = "SELECT CONVERT(NVARCHAR, fecha_rale, 105) AS MOSTRAR, CONVERT (NVARCHAR, fecha_rale, 105) AS VALUE,CONVERT (NVARCHAR, fecha_rale, 112) AS VALUE1 FROM Rales_Combo WHERE (tipo_rale = @COP_RCV ) ORDER BY VALUE1 ASC";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@COP_RCV", Tipo_Rale.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            Rale1.DataSource = cmd.ExecuteReader();
            Rale1.DataTextField = "MOSTRAR";
            Rale1.DataValueField = "VALUE";
            Rale1.DataBind();
            if (Rale1.Items.Count > 1)
            {
                Rale1.Enabled = true;
            }
            else
            {
                Rale1.Enabled = false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    protected void Descargar_Click(object sender, EventArgs e)
    {
        if (Tipo_Rale.SelectedValue != "")
        {
            if (Rale1.SelectedValue != "")
            {
                if (TIPO.SelectedValue != "")
                {
                    using (SqlConnection conn = new SqlConnection(strConnString))
                    {
                        conn.Open();
                        // Create the sample database
                        SqlCommand cmd = new SqlCommand("DESCARGA_SICOCA", conn);
                        cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar);
                        cmd.Parameters["@FECHA1"].Value = Rale1.SelectedValue;

                        cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar);
                        cmd.Parameters["@TIPO"].Value = Tipo_Rale.SelectedValue;

                        cmd.Parameters.Add("@SUB", SqlDbType.Int);
                        cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        {
                            using (SqlDataAdapter sda = new SqlDataAdapter())
                            {
                                cmd.Connection = conn;
                                sda.SelectCommand = cmd;
                                cmd.CommandTimeout = 3600;
                                using (DataTable dt = new DataTable())
                                {
                                    sda.Fill(dt);
                                    using (XLWorkbook wb = new XLWorkbook())
                                    {
                                        wb.Worksheets.Add(dt, Tipo_Rale.SelectedValue + "_" + Rale1.SelectedValue + "_" + TIPO.SelectedItem);

                                        Response.Clear();
                                        Response.Buffer = true;
                                        Response.Charset = "";
                                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                        Response.AddHeader("content-disposition", "attachment;filename=" + Tipo_Rale.SelectedValue + "_" + Rale1.SelectedValue + "_" + TIPO.SelectedItem + ".xlsx");
                                        using (MemoryStream MyMemoryStream = new MemoryStream())
                                        {
                                            wb.SaveAs(MyMemoryStream);
                                            MyMemoryStream.WriteTo(Response.OutputStream);
                                            Response.Flush();
                                            Response.End();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    Literal5.Text = "Selecciona la Subdelegación";
                }
            }
            else
            {
                Literal5.Text = "Selecciona el Rale";
            }
        }
        else
        {
            Literal5.Text = "Selecciona el Tipo de Rale";
        }
    }
}