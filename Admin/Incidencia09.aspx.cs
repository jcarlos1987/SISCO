using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing.Printing;
using System.Text;
using System.Data.OleDb;
using System.Net;
using System.Drawing;
using System.IO;
public partial class Admin_Incidencia09 : System.Web.UI.Page
{
    String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Rale.AppendDataBoundItems = true;
            
            String strQuery = "SELECT CONVERT(NVARCHAR, [fecha_rale], 105) AS MOSTRAR,CONVERT(NVARCHAR, [fecha_rale], 105) AS VALUE,CONVERT (NVARCHAR, fecha_rale, 112) AS VALUE1 FROM [Supervision].[dbo].[Rales_Combo] WHERE [tipo_rale]= 'COP' ORDER BY VALUE1 ASC";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                Rale.DataSource = cmd.ExecuteReader();
                Rale.DataTextField = "MOSTRAR";
                Rale.DataValueField = "VALUE";
                Rale.DataBind();
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
                this.TIPO.Items.Insert(0, new ListItem("-- Selecione el Tipo --", "0"));
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
    protected void Reporte_Click(object sender, EventArgs e)
    {
        GridView2.Visible = false;
        if (Rale.SelectedValue != "")
        {
            if (TIPO.SelectedValue != "0")
            {
                this.BindGrid2();
                Analisis.Visible = true;
            }
            else
            {
                LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona el Tipo de Informe por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
            }
        }
        else
        {
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona el Rale por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView2.Visible = true;
        GridViewRow row = GridView1.SelectedRow;
        string rango = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["rango"]);
        Analisis.Visible = true;
        Response.Cookies["Rango"].Value = rango;
        this.BindGrid(rango);
        Detalles.Visible = true;
        LabelDetalle.Text =  "Detalle de Creditos de " + rango;
    }

    private void BindGrid(string RANGO)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("RANGOS", conn);
                cmd.Parameters.Add("@RANGO", SqlDbType.NVarChar);
                cmd.Parameters["@RANGO"].Value = RANGO;
                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;

                cmd.Parameters.Add("@SUB", SqlDbType.Int);
                cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView2.Visible = true;
                GridView2.DataSource = dt;
                GridView2.DataBind();
                if(GridView2.Rows.Count == 0)
                {
                    buttonReporte.Visible = false;
                }
                else
                {
                    buttonReporte.Visible = true;
                }
                Detalles.Visible = true;
                Analisis.Visible = true;
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : RANGOS. " + ex.Message + ".</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    private void BindGrid2()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                System.Threading.Thread.Sleep(2500);
                // Create the sample database
                SqlCommand cmd = new SqlCommand("PATRO_NO_LOC", conn);
                cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar);
                cmd.Parameters["@FECHA1"].Value = Rale.SelectedValue;

                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;

                cmd.Parameters.Add("@SUB", SqlDbType.Int);
                cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                this.GridView1.DataSource = cmd.ExecuteReader();
                this.GridView1.DataBind();
                //Literal1.Text = "";
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : PATRO_NO_LOC. " + ex.Message + ".</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
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

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }


    protected void Rale_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Rale.SelectedValue != "")
        {
            TIPO.Enabled = true;
            Analisis.Visible = false;
            LabelMensaje.Text = "";
            Detalles.Visible = false;
        }
        else
        {
            TIPO.Enabled = false;
            LabelMensaje.Text = "";
        }

    }
    protected void TIPO_SelectedIndexChanged(object sender, EventArgs e)
    {
        Detalles.Visible = false;
        Analisis.Visible = false;
        LabelMensaje.Text = "";
    }
 
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        BindGrid(Request.Cookies["Rango"].Value);
        GridView2.PageIndex = e.NewPageIndex;
        this.GridView2.DataBind();
    }
    protected void BajarExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=Dtlle_Inc09.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            //To Export all pages
            GridView2.AllowPaging = false;
            BindGrid(Request.Cookies["Rango"].Value);
            GridView2.DataBind();

            GridView2.HeaderRow.BackColor = Color.LightBlue;
            foreach (TableCell cell in GridView2.HeaderRow.Cells)
            {
                cell.BackColor = GridView2.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView2.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView2.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView2.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView2.RenderControl(hw);

            //style to format numbers to string
            string style = @"<style> .textmode { mso-number-format:\@; } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }
    }
}