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

public partial class Admin_Analisis_de_Eco_por_Inci : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tipo.Items.Add(new ListItem("-- Selecciona Tipo --", ""));
            rale.Items.Add(new ListItem("-- Selecciona Rale --", ""));
            sub.Items.Add(new ListItem("-- Selecciona Subdelegación --", ""));
            tipo.AppendDataBoundItems = true;
            String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            String strQuery = "SELECT DISTINCT [tipo_rale] as id,[tipo_rale] as des FROM [Supervision].[dbo].[Rales_Combo]";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                tipo.DataSource = cmd.ExecuteReader();
                tipo.DataTextField = "des";
                tipo.DataValueField = "id";
                tipo.DataBind();
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
    protected void tipo_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensajeEco.Text = "";
        rale.Items.Clear();
        rale.Items.Add(new ListItem("-- Selecciona Rale --", ""));
        sub.Items.Clear();
        sub.Items.Add(new ListItem("-- Selecciona Subdelegación --", ""));
        sub.Enabled = false;

        rale.AppendDataBoundItems = true;
        String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        String strQuery = "SELECT CONVERT(NVARCHAR, fecha_rale, 105) AS MOSTRAR, CONVERT (NVARCHAR, fecha_rale, 105) AS VALUE ,CONVERT (NVARCHAR, fecha_rale, 112) AS VALUE1 FROM Rales_Combo WHERE (tipo_rale = @COP_RCV ) ORDER BY VALUE1 ASC";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@COP_RCV", tipo.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            rale.DataSource = cmd.ExecuteReader();
            rale.DataTextField = "MOSTRAR";
            rale.DataValueField = "VALUE";
            rale.DataBind();
            if (rale.Items.Count > 1)
            {
                rale.Enabled = true;
            }
            else
            {
                rale.Enabled = false;
                sub.Enabled = false;
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
    protected void rale_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensajeEco.Text = "";
        sub.Items.Clear();
        sub.AppendDataBoundItems = true;
        try
        {
            sub.Enabled = true;
            this.sub.Items.Insert(0, new ListItem("-- Selecciona Subdelegación --", ""));
            this.sub.Items.Insert(1, new ListItem("DELEGACIONAL", "3"));
            this.sub.Items.Insert(2, new ListItem("TOLUCA", "1"));
            this.sub.Items.Insert(3, new ListItem("NAUCALPAN", "5"));
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {

        }
    }
    protected void sub_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensajeEco.Text = "";
    }
    protected void Reporte_Click(object sender, EventArgs e)
    {
        if (tipo.SelectedValue != "")
        {
            if (rale.SelectedValue != "")
            {
                if (sub.SelectedValue != "")
                {
                    this.Detalles();
                    Session["Enca"] = tipo.SelectedValue + " RALE " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(rale.SelectedValue)); ;
                    Session["Rep"] = "ECO";
                    Session["Sub_Ant"] = sub.SelectedItem;
                    LabelMensajeEco.Text = "";
                    Response.Write("<script>window.open('Rtp.aspx','_blank');</script>");
                }
                else
                {                    
                    LabelMensajeEco.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona la Subdelegación por favor.</p>" +
                                            @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                }
            }
            else
            {
                LabelMensajeEco.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona el Rale por favor.</p>" +
                                        @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
            }
        }
        else
        {
            LabelMensajeEco.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona el Tipo de Rale por favor.</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
    private void Detalles()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ToString()))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("ECOxINCIDENCIA", conn);
                string ClientIP = GetIP4Address();

                cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar, 35);
                cmd.Parameters["@FECHA1"].Value = rale.SelectedValue;

                cmd.Parameters.Add("@SUB", SqlDbType.Int);
                cmd.Parameters["@SUB"].Value = sub.SelectedValue;

                cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar, 35);
                cmd.Parameters["@TIPO"].Value = tipo.SelectedValue;

                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.ExecuteReader();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            //Literal1.Text = ex.Message + "ECOxINCIDENCIA";
        }
    }

    public static string GetIP4Address()
    {
        string IP4Address = String.Empty;

        foreach (IPAddress IPA in Dns.GetHostAddresses(HttpContext.Current.Request.UserHostAddress))
        {
            if (IPA.AddressFamily.ToString() == "InterNetwork")
            {
                IP4Address = IPA.ToString();
                break;
            }
        }

        if (IP4Address != String.Empty)
        {
            return IP4Address;
        }

        foreach (IPAddress IPA in Dns.GetHostAddresses(Dns.GetHostName()))
        {
            if (IPA.AddressFamily.ToString() == "InterNetwork")
            {
                IP4Address = IPA.ToString();
                break;
            }
        }
        return IP4Address;
    }
}