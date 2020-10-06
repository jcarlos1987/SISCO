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

public partial class Admin_Situacion_de_la_cartera_ejerci_anteriores : System.Web.UI.Page
{
    string cadena;
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
        LabelMensaje.Text = "";
        grid_1.Visible = false;
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
        LabelMensaje.Text = "";
        grid_1.Visible = false;
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

    private void BindGrid()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ToString()))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("SIT_CAT_ANTERIOR", conn);
                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;

                cmd.Parameters.Add("@SUB", SqlDbType.Int);
                cmd.Parameters["@SUB"].Value = sub.SelectedValue;

                cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar, 35);
                cmd.Parameters["@FECHA1"].Value = rale.SelectedValue;

                cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar, 35);
                cmd.Parameters["@TIPO"].Value = tipo.SelectedValue;
                // cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                this.GridView1.DataSource = cmd.ExecuteReader();
                this.GridView1.DataBind();
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            //Literal1.Text = ex.Message + "RPT_DETALLE";
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

    protected void Reporte_Click(object sender, EventArgs e)
    {
        if (tipo.SelectedValue != "")
        {
            if (rale.SelectedValue != "")
            {
                if (sub.SelectedValue != "")
                {                    
                    grid_1.Visible = true;
                    this.BindGrid();
                    LabelEncabezado.Text = "SITUACIÓN DE LA CARTERA POR TIPO DE DOCUMENTO";
                    if (sub.SelectedValue == "1")
                    {
                        LabelSubdelegacion.Text = "SUBDELEGACIÓN TOLUCA";
                    }
                    else if (sub.SelectedValue == "5")
                    {
                        LabelSubdelegacion.Text = "SUBDELEGACIÓN NAUCALPAN";
                    }
                    else if (sub.SelectedValue == "3")
                    {
                        LabelSubdelegacion.Text = "DELEGACIONAL";
                    }
                    LabelFecha.Text = "EJERCICIOS ANTERIORES " + tipo.SelectedValue + " RALE AL " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(rale.SelectedValue));
                    string conexi = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                    SqlConnection con1 = new SqlConnection(conexi);
                    try
                    {
                        string ClientIP = GetIP4Address();
                        string tabla = ClientIP.Replace(".", "_").ToString();
                        SqlCommand command1 = new SqlCommand("SELECT COUNT(*) FROM [Supervision].[dbo].[Rpt_DTLLE_" + tabla + "] WHERE [id_docu] IN(0)", con1);
                        SqlCommand command2 = new SqlCommand("SELECT COUNT(*) FROM [Supervision].[dbo].[Rpt_DTLLE_" + tabla + "] WHERE [id_docu] IN(1,2)", con1);
                        SqlCommand command3 = new SqlCommand("SELECT COUNT(*) FROM [Supervision].[dbo].[Rpt_DTLLE_" + tabla + "] WHERE [id_docu] IN(3)", con1);
                        SqlCommand command4 = new SqlCommand("SELECT COUNT(*) FROM [Supervision].[dbo].[Rpt_DTLLE_" + tabla + "] WHERE [id_docu] IN(50,51,52,53,54,55,56,57,58,59,60,61,5)", con1);
                        SqlCommand command5 = new SqlCommand("SELECT COUNT(*) FROM [Supervision].[dbo].[Rpt_DTLLE_" + tabla + "] WHERE [id_docu] IN(80,81,82,83,84,85,86,87,88,89,8)", con1);
                        SqlCommand command6 = new SqlCommand("SELECT COUNT(*) FROM [Supervision].[dbo].[Rpt_DTLLE_" + tabla + "] WHERE [id_docu] IN(70,71)", con1);
                        con1.Open();
                        //ejecucion de la consulta
                        Int32 count1 = (Int32)command1.ExecuteScalar();
                        Int32 count2 = (Int32)command2.ExecuteScalar();
                        Int32 count3 = (Int32)command3.ExecuteScalar();
                        Int32 count4 = (Int32)command4.ExecuteScalar();
                        Int32 count5 = (Int32)command5.ExecuteScalar();
                        Int32 count6 = (Int32)command6.ExecuteScalar();
                        if (count1 > 0)
                        {
                            LinkButtonCapitalConstitutivos.Visible = true;
                        }
                        else if (count1 == 0)
                        {
                            LinkButtonCapitalConstitutivos.Visible = false;
                        }
                        if (count2 > 0)
                        {
                            //Label6.Visible = true;
                            //ImageButton2.Visible = true;
                        }
                        else if (count2 == 0)
                        {
                            //Label6.Visible = false;
                            //ImageButton2.Visible = false;
                        }
                        if (count3 > 0)
                        {
                            //Label7.Visible = true;
                            //ImageButton3.Visible = true;
                        }
                        else if (count3 == 0)
                        {
                            //Label7.Visible = false;
                            //ImageButton3.Visible = false;
                        }
                        if (count4 > 0)
                        {
                            //Label8.Visible = true;
                            //ImageButton4.Visible = true;
                        }
                        else if (count4 == 0)
                        {
                            //Label8.Visible = false;
                            //ImageButton4.Visible = false;
                        }
                        if (count5 > 0)
                        {
                            //Label9.Visible = true;
                            //ImageButton5.Visible = true;
                        }
                        else if (count5 == 0)
                        {
                            //Label9.Visible = false;
                            //ImageButton5.Visible = false;
                        }
                        if (count6 > 0)
                        {
                        //    Label10.Visible = true;
                        //    ImageButton6.Visible = true;
                        }
                        else if (count6 == 0)
                        {
                            //Label10.Visible = false;
                            //ImageButton6.Visible = false;
                        }
                    }
                    catch (Exception ex)
                    {
                        LabelMensaje.Text = "Error" + ex;
                    }
                }
                else
                {
                    LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona una Subdelegación por Favor</p>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione un Rale por Favor </p>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione el Tipo por Favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

            TableCell HeaderCell2 = new TableCell();
            HeaderCell2.Text = " ";
            HeaderCell2.ColumnSpan = 1;
            HeaderRow.Cells.Add(HeaderCell2);            
            HeaderCell2.BackColor = Color.AntiqueWhite;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> Capitales Constitutivos <br> Tipo Doc. 00 </b></center>";
            HeaderCell2.ColumnSpan = 2;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.AntiqueWhite;


            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center><b> Propuestas y ECOS <br> Tipo Doc. 01 y 02 </b></center>";
            HeaderCell2.ColumnSpan = 2;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Aqua;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> SIVEPAS <br> Tipo Doc. 03 </b>  </center>";
            HeaderCell2.ColumnSpan = 2;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.AliceBlue;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> Emisión de Auditoria <br> Tipo Doc. 50 al 61 y 05  </b></center>";
            HeaderCell2.ColumnSpan = 2;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Azure;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> Multas <br> Tipo Doc. 80 al 89 y 08  </b> </center>";
            HeaderCell2.ColumnSpan = 2;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Beige;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> Emisión de Capitales no Derechohabientes <br> Tipo Doc. 70 y 71 </b> </center>";
            HeaderCell2.ColumnSpan = 2;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Bisque;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> Total General </b></center>";
            HeaderCell2.ColumnSpan = 2;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Coral;

            GridView1.Controls[0].Controls.AddAt(0, HeaderRow);

            GridViewRow HeaderRow1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = "<center>Inci.</center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.AntiqueWhite;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Creditos </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.AntiqueWhite;

            HeaderCell = new TableCell();
            HeaderCell.Text = " <center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.AntiqueWhite;

            HeaderCell = new TableCell();
            HeaderCell.Text = " <center> Creditos </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Aqua;

            HeaderCell = new TableCell();
            HeaderCell.Text = " <center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Aqua;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Creditos </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.AliceBlue;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.AliceBlue;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Creditos </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Azure;
          

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Azure;


            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Creditos </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Beige;


            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Beige;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Creditos </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Bisque;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Bisque;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Creditos </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Coral;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 11;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Coral;

            HeaderRow.Attributes.Add("class", "header_grid");
            HeaderRow1.Attributes.Add("class", "header_grid");
            GridView1.Controls[0].Controls.AddAt(1, HeaderRow1);
        }
    }
    protected void Impri_Click(object sender, EventArgs e)
    {
        if (sub.SelectedValue == "1")
        {
            Session["Sub_Ant"] = "SUBDELEGACIÓN TOLUCA";
        }
        else if (sub.SelectedValue == "5")
        {
            Session["Sub_Ant"] = "SUBDELEGACIÓN NAUCALPAN";
        }
        else if (sub.SelectedValue == "3")
        {
            Session["Sub_Ant"] = "DELEGACIONAL";
        }
        Session["Enca"] = "EJERCICIOS ANTERIORES " + tipo.SelectedValue + " RALE AL " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(rale.SelectedValue)); ;
        Session["Rep"] = "Anteriores";
        Response.Write("<script>window.open('Rtp.aspx','_blank');</script>");
    }

    private void Export_Excell(string datos)
    {
        string constr = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("SIT_CAT_DTLLES", con);
            string ClientIP = GetIP4Address();
            cmd.Parameters.Add("@IP", SqlDbType.NVarChar);
            cmd.Parameters["@IP"].Value = ClientIP;

            cmd.Parameters.Add("@DATOS", SqlDbType.NVarChar);
            cmd.Parameters["@DATOS"].Value = datos;


            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;
                sda.SelectCommand = cmd;
                cmd.CommandTimeout = 3600;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt, "Dtlles_Tipo_Dcto");
                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=" + "Sit_CarteEjerAnte" + sub.SelectedItem + ".xlsx");
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
    protected void sub_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensaje.Text = "";
        grid_1.Visible = false;
    }
    protected void LinkButtonCapitalConstitutivos_Click(object sender, EventArgs e)
    {
        cadena = "0";
        Export_Excell(cadena);
    }
    protected void LinkButtonPropuEcos_Click(object sender, EventArgs e)
    {
        cadena = "1,2";
        Export_Excell(cadena);
    }
    protected void LinkButtonSivepas_Click(object sender, EventArgs e)
    {
        cadena = "3";
        Export_Excell(cadena);
    }
    protected void LinkButtonEmisionAuditoria_Click(object sender, EventArgs e)
    {
        cadena = "50,51,52,53,54,55,56,57,58,59,60,61,5";
        Export_Excell(cadena);
    }
    protected void LinkButtonMultas_Click(object sender, EventArgs e)
    {
        cadena = "80,81,82,83,84,85,86,87,88,89,8";
        Export_Excell(cadena);
    }
    protected void LinkButtonCapNODerechoHabientes_Click(object sender, EventArgs e)
    {
        cadena = "70,71";
        Export_Excell(cadena);
    }
}