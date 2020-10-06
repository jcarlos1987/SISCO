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
using ClosedXML.Excel;

public partial class Admin_bd_excelvsrale_2_2 : System.Web.UI.Page
{
    double v;
    double v1;
    String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Request.Cookies["Tipo_Rale_P"].Value;        
        Label2.Text = Request.Cookies["Rale_Base_P"].Value;
        Label3.Text = String.Format("{0:dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["Rale_Comp_P"].Value));
        if (Request.Cookies["CC_P"].Value == "1")
        {
            Label4.Text = "Por Alta de Credito";
        }
        else if (Request.Cookies["CC_P"].Value == "2")
        {
            Label4.Text = "Por Periodo de Credito";
        }
        if (Request.Cookies["RA_P"].Value == "1")
        {
            Label4.Text = Label4.Text + " y Rango";
            Label5.Text = "Del " + Request.Cookies["Per_Ini_P"].Value + " Al " + Request.Cookies["Per_Fin_P"].Value;
        }
        else if (Request.Cookies["RA_P"].Value == "2")
        {
            Label4.Text = Label4.Text + " y Antigüedad";
            Label5.Text = Request.Cookies["Per_Ini_P"].Value;
        }
    }
    protected void TIPO_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        Encabezado.Visible = false;
        Depurado.Visible = false;
        accordion_options.Visible = false;
        LabelMensaje.Visible = false;
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.AppendDataBoundItems = true;
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter cmd = new SqlDataAdapter("COMBO_INCIDENCIAS_PNAL", con);
        cmd.SelectCommand.CommandType = CommandType.StoredProcedure;
        cmd.SelectCommand.Parameters.AddWithValue("@SUB", TIPO.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@TIPO", Request.Cookies["Tipo_Rale_P"].Value);
        cmd.SelectCommand.Parameters.AddWithValue("@FECHA1", Request.Cookies["Rale_Base_P"].Value);
        cmd.SelectCommand.Parameters.AddWithValue("@FECHA2", Request.Cookies["Rale_Comp_P"].Value);
        cmd.SelectCommand.Parameters.AddWithValue("@TIPO_CONSUL_AP", Request.Cookies["CC_P"].Value);
        cmd.SelectCommand.Parameters.AddWithValue("@TIPO_CONSUL_RA", Request.Cookies["RA_P"].Value);
        cmd.SelectCommand.Parameters.AddWithValue("@RANGO1", Request.Cookies["Per_Ini_P"].Value);
        if (Request.Cookies["RA_P"].Value == "1")
        {
            cmd.SelectCommand.Parameters.AddWithValue("@RANGO2", Request.Cookies["Per_Fin_P"].Value);
        }
        else if (Request.Cookies["RA_P"].Value == "2")
        {
            cmd.SelectCommand.Parameters.AddWithValue("@RANGO2", "2005");
        }
        DataSet ds = new DataSet();
        if (cmd != null)
        {
            cmd.Fill(ds);
        }
        try
        {
            con.Open();
            incidencia.DataSource = ds;
            incidencia.DataTextField = "desc";
            incidencia.DataValueField = "id_incid";
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

    private void BindGrid()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("RPT_DETALLE_PNAL", conn);
                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();

                if (GridView2.Rows.Count == 0)
                {
                    Rtp_RsumenCredPen.Visible = false;
                }
                else
                {
                    accordion_options.Visible = true;
                    divideruno.Visible = true;
                    Rtp_RsumenCredPen.Visible = true;
                }

                conn.Close();
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : " + ex.Message + "</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    private void Detalle_uno()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("DTLLE_DOS", conn);
                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;
                // cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView4.DataSource = dt;
                GridView4.DataBind();
                if (GridView4.Rows.Count == 0)
                {
                    RtpDetallePendientes.Visible = false;
                }
                else
                {
                    RtpDetallePendientes.Visible = true;
                }
                GridView4.Visible = true;
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : " + ex.Message + "</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    private void Resumen_dos()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("RPT_DTL_RESUMEN", conn);

                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;
                // cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView5.DataSource = dt;
                GridView5.DataBind();
                if (GridView5.Rows.Count == 0)
                {
                    RtpResumenMovimientos.Visible = false;
                }
                else
                {
                    RtpResumenMovimientos.Visible = true;
                }
                GridView5.Visible = true;
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : " + ex.Message + "</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    private void Detalle()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("DTLLE_MOVaINC_PNAL", conn);
                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable datat = new DataTable();
                da.Fill(datat);
                GridView3.DataSource = datat;
                GridView3.DataBind();
                if (GridView3.Rows.Count == 0)
                {
                    RtpDetalleMovimientos.Visible = false;
                }
                else
                {
                    RtpDetalleMovimientos.Visible = true;
                }
                GridView3.Visible = true;
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : " + ex.Message + "</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    protected void incidencia_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        Encabezado.Visible = false;
        Depurado.Visible = false;
        accordion_options.Visible = false;
        LabelMensaje.Text = "";
    }
    protected void Reporte_Click(object sender, EventArgs e)
    {
        if (TIPO.SelectedValue != "")
        {
            if (incidencia.SelectedValue != "")
            {
                LabelMensaje.Visible = false;
                try
                {
                    using (SqlConnection conn = new SqlConnection(strConnString))
                    {
                        conn.Open();
                        // Create the sample database
                        SqlCommand cmd = new SqlCommand("RPT_INCIDENCIAS_PRSNAL", conn);
                        cmd.Parameters.Add("@INCIDENCIA", SqlDbType.Int);
                        cmd.Parameters["@INCIDENCIA"].Value = incidencia.SelectedValue;

                        cmd.Parameters.Add("@SUB", SqlDbType.Int);
                        cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

                        cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar, 20);
                        cmd.Parameters["@TIPO"].Value = Request.Cookies["Tipo_Rale_P"].Value;

                        cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar, 20);
                        cmd.Parameters["@FECHA1"].Value = Request.Cookies["Rale_Base_P"].Value;

                        cmd.Parameters.Add("@FECHA2", SqlDbType.NVarChar, 20);
                        cmd.Parameters["@FECHA2"].Value = Request.Cookies["Rale_Comp_P"].Value;

                        cmd.Parameters.Add("@TIPO_CONSUL_AP", SqlDbType.Int);
                        cmd.Parameters["@TIPO_CONSUL_AP"].Value = Request.Cookies["CC_P"].Value;

                        cmd.Parameters.Add("@TIPO_CONSUL_RA", SqlDbType.Int);
                        cmd.Parameters["@TIPO_CONSUL_RA"].Value = Request.Cookies["RA_P"].Value;

                        cmd.Parameters.Add("@RANGO1", SqlDbType.NVarChar, 10);
                        cmd.Parameters["@RANGO1"].Value = Request.Cookies["Per_Ini_P"].Value;

                        if (Request.Cookies["RA_P"].Value == "1")
                        {
                            cmd.Parameters.Add("@RANGO2", SqlDbType.NVarChar, 10);
                            cmd.Parameters["@RANGO2"].Value = Request.Cookies["Per_Fin_P"].Value;
                        }
                        else if (Request.Cookies["RA_P"].Value == "2")
                        {
                            cmd.Parameters.Add("@RANGO2", SqlDbType.NVarChar, 10);
                            cmd.Parameters["@RANGO2"].Value = "2005";
                        }
                        string ClientIP = GetIP4Address();
                        cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 30);
                        cmd.Parameters["@IP"].Value = ClientIP;

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        this.GridView1.DataSource = cmd.ExecuteReader();
                        this.GridView1.DataBind();
                        Rtp_Principal.Visible = true;
                        conn.Close();
                        
                        try
                        {
                            SqlConnection conn00 = new SqlConnection(strConnString);
                            //Consulta para la busqueda del usuario dentro del la BD con los datos que se requieren del usuario
                            string tabla = ClientIP.Replace(".", "_").ToString();
                            SqlCommand command = new SqlCommand("SELECT [credito_R1],[credito_R2],[cred_R2] FROM [Supervision].[dbo].[Rpt_Inci_" + tabla + "] WHERE [cve_inc]='Total'", conn00);
                            conn00.Open();
                            //ejecucion de la consulta
                            SqlDataReader reader = command.ExecuteReader();
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    Session["Valor1"] = string.Format(reader.GetString(0));
                                    Session["Valor2"] = string.Format(reader.GetString(1));
                                    Session["Valor3"] = string.Format(reader.GetString(2));
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : " + ex.Message + "</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                        }

                        try
                        {
                            GridView1.Visible = true;
                            Encabezado.Visible = true;
                            Depurado.Visible = true;
                            v = Convert.ToDouble(Session["Valor2"]) / Convert.ToDouble(Session["Valor1"]);
                            v1 = Convert.ToDouble(Session["Valor3"]) / Convert.ToDouble(Session["Valor1"]);

                            LabelXDepurar.Text = "Por Depurar : " + String.Format("{0:0.00%}", v1);
                            LabelDepurado.Text = "Porcentaje Depurado : " + String.Format("{0:0.00%}", v);
                            LabelEncabezado.Text = "Depuración de la Base de Datos del RALE " + Request.Cookies["Tipo_Rale_P"].Value + Request.Cookies["Rale_Base_P"].Value;
                            LabelFechaRale.Text = "Fecha del RALE de Comparación : " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["Rale_Comp_P"].Value));
                            LabelIncidencia.Text = "Incidencia " + Convert.ToString(incidencia.SelectedItem);

                            if (Request.Cookies["CC_P"].Value == "1")
                            {
                                if (Request.Cookies["RA_P"].Value == "1")
                                {
                                    LabelCreditosPeridos.Text = "Creditos con Fecha de Alta del " + Request.Cookies["Per_Ini_P"].Value + " AL " + Request.Cookies["Per_Fin_P"].Value;
                                }
                                else
                                {
                                    if (Request.Cookies["RA_P"].Value == "2")
                                    {
                                        LabelCreditosPeridos.Text = "Creditos con Fecha de Alta del " + Request.Cookies["Per_Ini_P"].Value + " Y Años Anteriores";
                                    }
                                }
                            }
                            else
                            {
                                if (Request.Cookies["CC_P"].Value == "2")
                                {
                                    if (Request.Cookies["RA_P"].Value == "1")
                                    {
                                        LabelCreditosPeridos.Text = "Creditos con Periodos del " + Request.Cookies["Per_Ini_P"].Value + " AL " + Request.Cookies["Per_Fin_P"].Value;
                                    }
                                    else
                                    {
                                        if (Request.Cookies["RA_P"].Value == "2")
                                        {
                                            LabelCreditosPeridos.Text = "Creditos con Periodos del " + Request.Cookies["Per_Ini_P"].Value + " Y Años Anteriores";
                                        }
                                    }
                                }
                            }
                            if (TIPO.SelectedValue == "3")
                            {
                                LabelDelegacion.Text = Convert.ToString(TIPO.SelectedItem);
                            }
                            else
                            {
                                LabelDelegacion.Text = "Subdelegación " + Convert.ToString(TIPO.SelectedItem);
                            }
                            this.BindGrid();
                            this.Detalle();
                            this.Detalle_uno();
                            this.Resumen_dos();
                            LabelMensaje.Visible = false;
                        }
                        catch (Exception Excep)
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Datos de los label. " + Excep.Message + "</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                        }
                    }
                }
                catch (Exception ex)
                {
                    LabelMensaje.Visible = true;
                    LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : RPT_INCIDENCIAS_PRSNAL " + ex.Message + "</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                }

            }
            else
            {
                LabelMensaje.Visible = true;
                LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione una Incidencia por Favor por favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
            }
        }
        else
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione el Tipo de Reporte que Require por favor</p>
                                    </div>
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
    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        BindGrid();
        GridView2.PageIndex = e.NewPageIndex;
        this.GridView2.DataBind();
    }
    protected void GridView4_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Detalle_uno();
        GridView4.PageIndex = e.NewPageIndex;
        this.GridView4.DataBind();
    }
    protected void GridView5_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Resumen_dos();
        GridView5.PageIndex = e.NewPageIndex;
        this.GridView5.DataBind();
    }
    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Detalle();
        GridView3.PageIndex = e.NewPageIndex;
        this.GridView3.DataBind();
    }
    protected void RepBajarExcel_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("EXPOR_INCIDEN_EXCEL", con);
            string ClientIP = GetIP4Address();
            cmd.Parameters.Add("@IP", SqlDbType.NVarChar);
            cmd.Parameters["@IP"].Value = ClientIP;

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
    protected void ImprimeReporte_Click(object sender, EventArgs e)
    {
        if (Request.Cookies["CC_P"].Value == "1")
        {
            Label4.Text = "Por Alta de Credito";
        }
        else if (Request.Cookies["CC_P"].Value == "2")
        {
            Label4.Text = "Por Periodo de Credito";
        }
        if (TIPO.SelectedValue == "3")
        {
            Session["Sub"] = "DELEGACIONAL";
        }
        else if (TIPO.SelectedValue == "1")
        {
            Session["Sub"] = "SUBDELEGACION TOLUCA";
        }
        else if (TIPO.SelectedValue == "5")
        {
            Session["Sub"] = "SUBDELEGACION NAUCALPAN";
        }
        if (Request.Cookies["CC_P"].Value == "1")
        {
            if (Request.Cookies["RA_P"].Value == "1")
            {
                Session["Consulta"] = "CON FECHA DE ALTA " + Request.Cookies["Per_Ini_P"].Value + " AL " + Request.Cookies["Per_Fin_P"].Value;
            }
            else
            {
                if (Request.Cookies["RA_P"].Value == "2")
                {
                    Session["Consulta"] = "CON FECHA DE ALTA " + Request.Cookies["Per_Ini_P"].Value + " Y AÑOS ANTERIORES";
                }
            }
        }
        else
        {
            if (Request.Cookies["CC_P"].Value == "2")
            {
                if (Request.Cookies["RA_P"].Value == "1")
                {
                    Session["Consulta"] = "PERIODOS " + Request.Cookies["Per_Ini_P"].Value + " AL " + Request.Cookies["Per_Fin_P"].Value;
                }
                else
                {
                    if (Request.Cookies["RA_P"].Value == "2")
                    {
                        Session["Consulta"] = "PERIODOS " + Request.Cookies["Per_Ini_P"].Value + " Y AÑOS ANTERIORES";
                    }
                }
            }
        }

        Session["Reporte"] = "BaseExcel";
        Session["Tipo"] = Request.Cookies["Tipo_Rale_P"].Value;
        Session["Fec_Base"] = Request.Cookies["Rale_Base_P"].Value;
        Session["Base_com"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["Rale_Comp_P"].Value));
        Session["In"] = Convert.ToString(incidencia.SelectedItem);
        Session["R_B"] = Request.Cookies["Rale_Base_P"].Value;
        Session["R_P"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["Rale_Comp_P"].Value)); ;
        Session["R_M"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["Rale_Comp_P"].Value)); ;
        v = Convert.ToDouble(Session["Valor2"]) / Convert.ToDouble(Session["Valor1"]);
        v1 = Convert.ToDouble(Session["Valor3"]) / Convert.ToDouble(Session["Valor1"]);
        Session["Depu"] = String.Format("{0:0.00%}", v);
        Session["Xdepu"] = String.Format("{0:0.00%}", v1);
        Session["Grilla2"] = GridView2.Rows.Count;
        Session["Grilla5"] = GridView5.Rows.Count;
        Response.Write("<script>window.open('Rpt.aspx','_blank');</script>");
    }
    protected void BtnRsmenPendientes_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("RPT_DETALLE", con);
            string ClientIP = GetIP4Address();
            cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
            cmd.Parameters["@IP"].Value = ClientIP;

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
    protected void BtnDetallePendientes_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("DTLLE_DOS", con);
            string ClientIP = GetIP4Address();
            cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
            cmd.Parameters["@IP"].Value = ClientIP;

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
                        wb.Worksheets.Add(dt, "Detalle_Creditos");

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
    protected void BtnResumenMovimientos_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("RPT_DTL_RESUMEN", con);
            string ClientIP = GetIP4Address();
            cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
            cmd.Parameters["@IP"].Value = ClientIP;

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
                        wb.Worksheets.Add(dt, "Dtlle_Cred_Movi");

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
    protected void BtnDetalleMovi_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("DTLLE_MOVaINC", con);
            string ClientIP = GetIP4Address();
            cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
            cmd.Parameters["@IP"].Value = ClientIP;

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
                        wb.Worksheets.Add(dt, "Creditos");

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
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = "<center><b> RALE" + Request.Cookies["Rale_Base_P"].Value + "</b></center>";
            HeaderCell.BackColor = Color.FromName("#0288d1");
            HeaderCell.ForeColor = Color.White;
            HeaderCell.ColumnSpan = 3;//Cantidad de columnas para que ajuste.
            HeaderGridRow.Cells.Add(HeaderCell);


            TableCell HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center><b>MOVIMIENTOS AL RALE AL" + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["Rale_Comp_P"].Value)) + "</b></center>";
            HeaderCell2.BackColor = Color.FromName("#43a047");
            HeaderCell2.ForeColor = Color.White;
            HeaderCell2.ColumnSpan = 4;//Cantidad de columnas para que ajuste.
            HeaderGridRow.Cells.Add(HeaderCell2);


            TableCell HeaderCell3 = new TableCell();
            HeaderCell3.Text = "<center><b>PENDIENTE AL RALE" + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["Rale_Comp_P"].Value)) + "</b></center>";
            HeaderCell3.BackColor = Color.FromName("#0288d1");
            HeaderCell3.ForeColor = Color.White;
            HeaderCell3.ColumnSpan = 3;//Cantidad de columnas para que ajuste.
            HeaderGridRow.Cells.Add(HeaderCell3);

            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
        }
    }
}