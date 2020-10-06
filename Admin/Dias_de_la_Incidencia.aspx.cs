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

public partial class Admin_Dias_de_la_Incidencia : System.Web.UI.Page
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
                TIPO.Items.Clear();
                TIPO.Items.Add(new ListItem("-- Selecione la Subdelegación --", ""));
                incidencia.Items.Clear();
                incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
                incidencia.Enabled = false;
                tipo_doc.Items.Clear();
                tipo_doc.Items.Add(new ListItem("-- Seleccione Tipo de Documento --", "-1"));
                tipo_doc.Enabled = false;
                tipo_mov.Items.Clear();
                tipo_mov.Items.Add(new ListItem("-- Seleccione Tipo de Movimiento --", "-1"));
                tipo_mov.Enabled = false;
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
    }

    private bool IsNumeric(string num)
    {
        try
        {
            double x = Convert.ToDouble(num);
            return true;
        }
        catch (Exception)
        {
            return false;
        }
    }

    protected void Tipo_Rale_SelectedIndexChanged(object sender, EventArgs e)
    {
        Titu.Visible = false;
        Literal5.Text = "";
        GridView1.Visible = false;
        Rale1.Items.Clear();
        Rale1.Items.Add(new ListItem("-- Selecciona Rale --", ""));
        TIPO.Items.Clear();
        TIPO.Items.Add(new ListItem("-- Selecione la Subdelegación --", ""));
        TIPO.Enabled = false;
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.Enabled = false;
        Dias.Text = "";
        Dias.Enabled = false;
        tipo_doc.Items.Clear();
        tipo_doc.Items.Add(new ListItem("-- Seleccione Tipo de Documento --", "-1"));
        tipo_doc.Enabled = false;
        tipo_mov.Items.Clear();
        tipo_mov.Items.Add(new ListItem("-- Seleccione Tipo de Movimiento --", "-1"));
        tipo_mov.Enabled = false;

        Rale1.AppendDataBoundItems = true;
        String strQuery = "SELECT CONVERT(NVARCHAR, fecha_rale, 105) AS MOSTRAR, CONVERT (NVARCHAR, fecha_rale, 105) AS VALUE, CONVERT (NVARCHAR, fecha_rale, 102) AS VALUE1 FROM Rales_Combo WHERE (tipo_rale = @COP_RCV ) ORDER BY VALUE1 ASC";
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

    private void BindGrid()
    {
        try
        {
            SqlConnection conn = new SqlConnection(strConnString);
            conn.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("DIAS_INCIDENCIA", conn);
            cmd.Parameters.Add("@TABLA1", SqlDbType.NVarChar, 25);
            cmd.Parameters["@TABLA1"].Value = Rale1.SelectedValue;

            cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar, 5);
            cmd.Parameters["@TIPO"].Value = Tipo_Rale.SelectedValue;

            cmd.Parameters.Add("@SUB", SqlDbType.Int);
            cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

            cmd.Parameters.Add("@INC", SqlDbType.Int);
            cmd.Parameters["@INC"].Value = incidencia.SelectedValue;

            cmd.Parameters.Add("@DIAS", SqlDbType.Int);
            cmd.Parameters["@DIAS"].Value = Dias.Text;

            if (tipo_doc.SelectedValue != "" && tipo_mov.SelectedValue != "")
            {
                cmd.Parameters.Add("@TIP_DOC", SqlDbType.Int);
                cmd.Parameters["@TIP_DOC"].Value = tipo_doc.SelectedValue;

                cmd.Parameters.Add("@TIP_MOVIMIENTO", SqlDbType.Int);
                cmd.Parameters["@TIP_MOVIMIENTO"].Value = tipo_mov.SelectedValue;
            }
            else if (tipo_mov.SelectedValue == "" && tipo_doc.SelectedValue != "")
            {
                cmd.Parameters.Add("@TIP_DOC", SqlDbType.Int);
                cmd.Parameters["@TIP_DOC"].Value = tipo_doc.SelectedValue;
            }
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.Visible = true;
            if (GridView1.Rows.Count == 0)
            {
                Titu.Visible = false;
            }
            else
            {
                Titu.Visible = true;
            }
            conn.Close();
        }
        catch (Exception e)
        {

        }
    }
    protected void Rale1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Titu.Visible = false;
        GridView1.Visible = false;
        Literal5.Text = "";
        TIPO.Enabled = true;
        TIPO.Items.Clear();
        TIPO.AppendDataBoundItems = true;
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.Enabled = false;
        Dias.Text = "";
        Dias.Enabled = false;
        tipo_doc.Items.Clear();
        tipo_doc.Items.Add(new ListItem("-- Seleccione Tipo de Documento --", "-1"));
        tipo_doc.Enabled = false;
        tipo_mov.Items.Clear();
        tipo_mov.Items.Add(new ListItem("-- Seleccione Tipo de Movimiento --", "-1"));
        tipo_mov.Enabled = false;

        try
        {
            this.TIPO.Items.Insert(0, new ListItem("-- Selecione la Subdelegación --", ""));
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

    protected void TIPO_SelectedIndexChanged(object sender, EventArgs e)
    {
        Titu.Visible = false;
        GridView1.Visible = false;
        Literal5.Text = "";
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.AppendDataBoundItems = true;
        Dias.Text = "";
        Dias.Enabled = false;
        tipo_doc.Items.Clear();
        tipo_doc.Items.Add(new ListItem("-- Seleccione Tipo de Documento --", "-1"));
        tipo_doc.Enabled = false;
        tipo_mov.Items.Clear();
        tipo_mov.Items.Add(new ListItem("-- Seleccione Tipo de Movimiento --", "-1"));
        tipo_mov.Enabled = false;

        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter cmd = new SqlDataAdapter("SICOCA_CMBO", con);
        cmd.SelectCommand.CommandType = CommandType.StoredProcedure;
        //SqlCommand cmd = new SqlCommand("COMBO_INCIDENCIAS", con);
        cmd.SelectCommand.Parameters.AddWithValue("@TABLA1", Rale1.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@TIPO", Tipo_Rale.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@SUB", TIPO.SelectedValue);
        DataSet ds = new DataSet();
        if (cmd != null)
        {
            cmd.Fill(ds);
        }
        try
        {
            con.Open();
            incidencia.DataSource = ds;
            incidencia.DataTextField = "DESCRIP";
            incidencia.DataValueField = "ID";
            incidencia.DataBind();
            if (incidencia.Items.Count > 1)
            {
                incidencia.Enabled = true;
            }
            else
            {
                incidencia.Enabled = false;
                incidencia.Enabled = false;
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

    protected void incidencia_SelectedIndexChanged(object sender, EventArgs e)
    {
        Titu.Visible = false;
        GridView1.Visible = false;
        Literal5.Text = "";
        Dias.Enabled = true;
        Dias.Text = "";
        tipo_doc.Items.Clear();
        tipo_doc.Items.Add(new ListItem("-- Seleccione Tipo de Documento --", "-1"));
        tipo_doc.Enabled = false;
        tipo_mov.Items.Clear();
        tipo_mov.Items.Add(new ListItem("-- Seleccione Tipo de Movimiento --", "-1"));
        tipo_mov.Enabled = false;

    }

    public void DOCUMENTO()
    {
        tipo_doc.Items.Clear();
        tipo_doc.Items.Add(new ListItem("-- Seleccione Tipo de Documento --", "-1"));
        tipo_doc.AppendDataBoundItems = true;
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter cmd = new SqlDataAdapter("RALE_TIPO_DOCUMENTO", con);
        cmd.SelectCommand.CommandType = CommandType.StoredProcedure;
        //SqlCommand cmd = new SqlCommand("COMBO_INCIDENCIAS", con);
        cmd.SelectCommand.Parameters.AddWithValue("@TABLA1", Rale1.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@TIPO", Tipo_Rale.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@SUB", TIPO.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@INC", incidencia.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@DIAS", Dias.Text);
        cmd.SelectCommand.Parameters.AddWithValue("@TIPO_MOV", tipo_mov.SelectedValue);

        DataSet ds = new DataSet();
        if (cmd != null)
        {
            cmd.Fill(ds);
        }
        try
        {
            con.Open();
            tipo_doc.DataSource = ds;
            tipo_doc.DataTextField = "DESCRIP";
            tipo_doc.DataValueField = "ID";
            tipo_doc.DataBind();
            if (tipo_doc.Items.Count > 1)
            {
                tipo_doc.Enabled = true;
            }
            else
            {
                tipo_doc.Enabled = false;
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

    public void MOVIMIENTO()
    {
        tipo_mov.Items.Clear();
        tipo_mov.Items.Add(new ListItem("-- Seleccione Tipo de Movimiento --", "-1"));
        tipo_mov.AppendDataBoundItems = true;
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter cmd = new SqlDataAdapter("RALE_TIPO_MOV", con);
        cmd.SelectCommand.CommandType = CommandType.StoredProcedure;
        cmd.SelectCommand.Parameters.AddWithValue("@TABLA1", Rale1.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@TIPO", Tipo_Rale.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@SUB", TIPO.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@INC", incidencia.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@DIAS", Dias.Text);
        cmd.SelectCommand.Parameters.AddWithValue("@TIP_DOC", tipo_doc.SelectedValue);
        DataSet ds = new DataSet();
        if (cmd != null)
        {
            cmd.Fill(ds);
        }
        try
        {
            con.Open();
            tipo_mov.DataSource = ds;
            tipo_mov.DataTextField = "DESCRIP";
            tipo_mov.DataValueField = "ID";
            tipo_mov.DataBind();
            if (tipo_mov.Items.Count > 1)
            {
                tipo_mov.Enabled = true;
            }
            else
            {
                tipo_mov.Enabled = false;
                tipo_mov.Enabled = false;
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

    protected void Dias_TextChanged(object sender, EventArgs e)
    {
        if (IsNumeric(Dias.Text))
        {
            Literal5.Text = "";
            GridView1.Visible = false;
            Titu.Visible = false;
            DOCUMENTO();
            MOVIMIENTO();
        }
        else
        {
            Titu.Visible = false;
            GridView1.Visible = false;
            tipo_doc.Items.Clear();
            tipo_doc.Items.Add(new ListItem("-- Seleccione Tipo de Documento --", "-1"));
            tipo_doc.Enabled = false;
            Literal5.Visible = true;
            Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Ingresa un Número en Dias por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    protected void tipo_doc_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void Aceptar_Click(object sender, EventArgs e)
    {
        if (Tipo_Rale.SelectedValue != "")
        {
            if (Rale1.SelectedValue != "")
            {
                if (TIPO.SelectedValue != "")
                {
                    if (incidencia.SelectedValue != "")
                    {
                        if (Dias.Text != "" && IsNumeric(Dias.Text))
                        {
                            BindGrid();
                        }
                        else
                        {
                            Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Ingresa el Numero de Dias por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                        }
                    }
                    else
                    {
                        Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione Una Incidencia por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                    }
                }
                else
                {
                    Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione la Subdelegación  por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                }
            }
            else
            {
                Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione el Rale a Analizar por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
            }
        }
        else
        {
            Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione el Tipo de Rale por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.BindGrid();
    }
    protected void tipo_mov_SelectedIndexChanged(object sender, EventArgs e)
    {
        DOCUMENTO();
    }
    protected void LinkButtonDtalleInci_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("DIAS_INCIDENCIA", con);

            cmd.Parameters.Add("@TABLA1", SqlDbType.NVarChar, 25);
            cmd.Parameters["@TABLA1"].Value = Rale1.SelectedValue;

            cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar, 5);
            cmd.Parameters["@TIPO"].Value = Tipo_Rale.SelectedValue;

            cmd.Parameters.Add("@SUB", SqlDbType.Int);
            cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

            cmd.Parameters.Add("@INC", SqlDbType.Int);
            cmd.Parameters["@INC"].Value = incidencia.SelectedValue;

            cmd.Parameters.Add("@DIAS", SqlDbType.Int);
            cmd.Parameters["@DIAS"].Value = Dias.Text;

            if (tipo_doc.SelectedValue != "" && tipo_mov.SelectedValue != "")
            {
                cmd.Parameters.Add("@TIP_DOC", SqlDbType.Int);
                cmd.Parameters["@TIP_DOC"].Value = tipo_doc.SelectedValue;

                cmd.Parameters.Add("@TIP_MOVIMIENTO", SqlDbType.Int);
                cmd.Parameters["@TIP_MOVIMIENTO"].Value = tipo_mov.SelectedValue;
            }
            else if (tipo_mov.SelectedValue == "" && tipo_doc.SelectedValue != "")
            {
                cmd.Parameters.Add("@TIP_DOC", SqlDbType.Int);
                cmd.Parameters["@TIP_DOC"].Value = tipo_doc.SelectedValue;
            }

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                cmd.CommandTimeout = 53600;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt, incidencia.SelectedValue);

                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=" + "Inci_" + incidencia.SelectedValue + ".xlsx");
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