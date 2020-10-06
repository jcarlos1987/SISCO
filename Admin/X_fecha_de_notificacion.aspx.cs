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

public partial class Admin_X_fecha_de_notificacion : System.Web.UI.Page
{
    String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    double v;
    double v1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LabelMensaje.Visible = false;
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
            Subdelegacion.AppendDataBoundItems = true;
            try
            {
                this.Subdelegacion.Items.Insert(0, new ListItem("-- Selecione una Subdelegación --", ""));
                this.Subdelegacion.Items.Insert(1, new ListItem("DELEGACIONAL", "3"));
                this.Subdelegacion.Items.Insert(2, new ListItem("TOLUCA", "1"));
                this.Subdelegacion.Items.Insert(3, new ListItem("NAUCALPAN", "5"));
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
        GridView1.Visible = false;
        Encabezado.Visible = false;
        Depurado.Visible = false;
        accordion_options.Visible = false;
        LabelMensaje.Text = "";
        incidencia.Items.Clear();

        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.Enabled = false;
        Subdelegacion.Enabled = false;
        Rale_base.Items.Clear();
        Rale_base.Items.Add(new ListItem("-- Selecciona Rale Base --", ""));
        Rale_comparar.Items.Clear();
        Rale_comparar.Items.Add(new ListItem("-- Selecciona Rale a Comparar --", ""));
        Rale_comparar.Enabled = false;
        Rale_base.Enabled = false;
        Rale_base.AppendDataBoundItems = true;
        String strQuery = "SELECT CONVERT(NVARCHAR, fecha_rale, 105) AS MOSTRAR, CONVERT (NVARCHAR, fecha_rale, 112) AS VALUE FROM Rales_Combo WHERE (tipo_rale = @COP_RCV ) ORDER BY VALUE ASC";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@COP_RCV", Tipo_Rale.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            Rale_base.DataSource = cmd.ExecuteReader();
            Rale_base.DataTextField = "MOSTRAR";
            Rale_base.DataValueField = "VALUE";
            Rale_base.DataBind();
            if (Rale_base.Items.Count > 1)
            {
                Rale_base.Enabled = true;
            }
            else
            {
                Rale_base.Enabled = false;
                Rale_base.Enabled = false;
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
    protected void Rale1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        Encabezado.Visible = false;
        Depurado.Visible = false;
        accordion_options.Visible = false;
        LabelMensaje.Text = "";
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.Enabled = false;
        Subdelegacion.Enabled = false;
        Rale_comparar.Items.Clear();
        Rale_comparar.Items.Add(new ListItem("-- Selecciona Rale a Comparar --", ""));
        Rale_comparar.AppendDataBoundItems = true;
        String strQuery = "SELECT CONVERT(NVARCHAR, [fecha_rale], 105) AS MOSTRAR,CONVERT(NVARCHAR, [fecha_rale], 105) AS VALUE,CONVERT (NVARCHAR, fecha_rale, 112) AS VALUE1 FROM [Supervision].[dbo].[Rales_Combo] WHERE [tipo_rale]= @TIPO  AND [fecha_rale] > @FEC ORDER BY VALUE1 ASC";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@TIPO", Tipo_Rale.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@FEC", Rale_base.SelectedItem.Value);
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = strQuery;
        cmd.Connection = con;
        try
        {
            con.Open();
            Rale_comparar.DataSource = cmd.ExecuteReader();
            Rale_comparar.DataTextField = "MOSTRAR";
            Rale_comparar.DataValueField = "VALUE";
            Rale_comparar.DataBind();
            if (Rale_comparar.Items.Count > 1)
            {
                Rale_comparar.Enabled = true;                
            }
            else
            {
                Rale_comparar.Enabled = false;
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
    protected void Rale2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        Encabezado.Visible = false;
        Depurado.Visible = false;
        accordion_options.Visible = false;
        LabelMensaje.Text = "";
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.Enabled = false;
        LabelMensaje.Text = "";
        Subdelegacion.Enabled = true;           
    }
    protected void TIPO_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = false;
        Encabezado.Visible = false;
        Depurado.Visible = false;
        accordion_options.Visible = false;
        LabelMensaje.Text = "";
        try
        {
            LabelMensaje.Visible = false;
            incidencia.Items.Clear();
            incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
            incidencia.AppendDataBoundItems = true;
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter cmd = new SqlDataAdapter("COMBO_INCI_FECH_NOTI", con);
            cmd.SelectCommand.CommandType = CommandType.StoredProcedure;
            cmd.SelectCommand.Parameters.AddWithValue("@SUB", Subdelegacion.SelectedValue);
            cmd.SelectCommand.Parameters.AddWithValue("@TIPO", Tipo_Rale.SelectedValue);
            cmd.SelectCommand.Parameters.AddWithValue("@FECHA1", Convert.ToString(Rale_base.SelectedItem));

            DataTable dt = new DataTable();
            if (cmd != null)
            {
                cmd.Fill(dt);
            }
            try
            {
                con.Open();
                incidencia.DataSource = dt;
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
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
        catch(Exception excep)
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : " + excep.Message + "</p>" +
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
    protected void Comparar_Click(object sender, EventArgs e)
    {
        if(Tipo_Rale.SelectedValue != "")
        {
            if(Rale_base.SelectedValue != "")
            {
                if(Rale_comparar.SelectedValue != "")
                {
                    if(Subdelegacion.SelectedValue != "")
                    {
                        if(incidencia.SelectedValue != "")
                        {
                            try
                            {
                                using (SqlConnection conn = new SqlConnection(strConnString))
                                {
                                    conn.Open();
                                    // Create the sample database
                                    SqlCommand cmd = new SqlCommand("RTP_xFECHA_NOTIFICACION", conn);
                                    cmd.Parameters.Add("@INCIDENCIA", SqlDbType.Int);
                                    cmd.Parameters["@INCIDENCIA"].Value = incidencia.SelectedValue;

                                    cmd.Parameters.Add("@SUB", SqlDbType.Int);
                                    cmd.Parameters["@SUB"].Value = Subdelegacion.SelectedValue;

                                    cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar, 20);
                                    cmd.Parameters["@TIPO"].Value = Tipo_Rale.SelectedValue;

                                    cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar, 20);
                                    cmd.Parameters["@FECHA1"].Value = Convert.ToString(Rale_base.SelectedItem);

                                    cmd.Parameters.Add("@FECHA2", SqlDbType.NVarChar, 20);
                                    cmd.Parameters["@FECHA2"].Value = Rale_comparar.SelectedValue;

                                    string ClientIP = GetIP4Address();

                                    cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 30);
                                    cmd.Parameters["@IP"].Value = ClientIP;

                                    GridView1.Visible = true;
                                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                                    this.GridView1.DataSource = cmd.ExecuteReader();
                                    this.GridView1.DataBind();
                                    conn.Close();
                                    LabelMensaje.Text = "";
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
                                        LabelMensaje.Visible = true;
                                        LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Valores 0,1,2. " + ex.Message + "</p>" +
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
                                        LabelEncabezado.Text = "Seguimiento por Fecha de Notificación del RALE " + Tipo_Rale.SelectedValue + " del " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Convert.ToString(Rale_base.SelectedItem)));
                                        LabelFechaRale.Text = "Fecha del RALE de Comparación : " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_comparar.SelectedValue));
                                        LabelIncidencia.Text = "Incidencia " + Convert.ToString(incidencia.SelectedItem);
                                                
                                        if (Subdelegacion.SelectedValue == "3")
                                        {
                                            LabelDelegacion.Text = Convert.ToString(Subdelegacion.SelectedItem);
                                        }
                                        else
                                        {
                                            LabelDelegacion.Text = "Subdelegación " + Convert.ToString(Subdelegacion.SelectedItem);
                                        }
                                        this.BindGrid();
                                        this.Detalle();
                                        //imprimir.Visible = true;
                                        this.Detalle_uno();
                                        this.Resumen_dos();
                                        accordion_options.Visible = true;

                                    }
                                    catch (Exception Excep)
                                    {
                                        LabelMensaje.Visible = true;
                                        LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Asignar Valores.  " + Excep.Message + "</p>" +
                                                @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                                    }
                                }
                            }
                            catch(Exception Excep)
                            {
                                LabelMensaje.Visible = true;
                                LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : RTP_xFECHA_NOTIFICACION. " + Excep.Message + "</p>" +
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione una Incidencia por favor.</p>" +
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione una Subdelegación por favor.</p>" +
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione el RALE a Comparar por favor.</p>" +
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione el RALE Base por favor.</p>" +
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione el Tipo de RALE por favor.</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
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
                SqlCommand cmd = new SqlCommand("RPT_DETALLE", conn);
                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;
                // cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView2.DataSource = dt;
                GridView2.DataBind();

                if (GridView2.Rows.Count == 0)
                {
                    VtnRsmenPendientes.Visible = false;
                }
                else
                {
                    VtnRsmenPendientes.Visible = true;
                    divideruno.Visible = true;
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
                    DivDetallePendientes.Visible = false;
                }
                else
                {
                    DivDetallePendientes.Visible = true;
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
                SqlCommand cmd = new SqlCommand("DTLLE_MOVaINC", conn);
                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;
                // cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView3.DataSource = dt;
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
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = "<center><b> RALE" + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_base.SelectedItem.ToString())) + "</b></center>";
            HeaderCell.BackColor = Color.FromName("#0288d1");
            HeaderCell.ForeColor = Color.White;
            HeaderCell.ColumnSpan = 3;//Cantidad de columnas para que ajuste.
            HeaderGridRow.Cells.Add(HeaderCell);


            TableCell HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center><b>MOVIMIENTOS AL RALE AL" + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_comparar.SelectedValue)) + "</b></center>";
            HeaderCell2.BackColor = Color.FromName("#43a047");
            HeaderCell2.ForeColor = Color.White;
            HeaderCell2.ColumnSpan = 4;//Cantidad de columnas para que ajuste.
            HeaderGridRow.Cells.Add(HeaderCell2);


            TableCell HeaderCell3 = new TableCell();
            HeaderCell3.Text = "<center><b>PENDIENTE AL RALE" + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_comparar.SelectedValue)) + "</b></center>";
            HeaderCell3.BackColor = Color.FromName("#0288d1");
            HeaderCell3.ForeColor = Color.White;
            HeaderCell3.ColumnSpan = 3;//Cantidad de columnas para que ajuste.
            HeaderGridRow.Cells.Add(HeaderCell3);

            GridView1.Controls[0].Controls.AddAt(0, HeaderGridRow);
        }
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
        if (Subdelegacion.SelectedValue == "3")
        {
            Session["Sub"] = "DELEGACIONAL";
        }
        else if (Subdelegacion.SelectedValue == "1")
        {
            Session["Sub"] = "SUBDELEGACION TOLUCA";
        }
        else if (Subdelegacion.SelectedValue == "5")
        {
            Session["Sub"] = "SUBDELEGACION NAUCALPAN";
        }

        Session["Consulta"] = "Seguimiento por Fecha de Notificación del RALE " + Tipo_Rale.SelectedValue + " del " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Convert.ToString(Rale_base.SelectedItem)));
 
        Session["Reporte"] = "XFechaNoti";
        Session["Tipo"] = Tipo_Rale.SelectedValue;
        Session["Fec_Base"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_base.SelectedItem.ToString()));
        Session["Base_com"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_comparar.SelectedValue));
        Session["In"] = Convert.ToString(incidencia.SelectedItem);
        Session["R_B"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_base.SelectedItem.ToString()));
        Session["R_P"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_comparar.SelectedValue)); ;
        Session["R_M"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale_comparar.SelectedValue)); ;
        v = Convert.ToDouble(Session["Valor2"]) / Convert.ToDouble(Session["Valor1"]);
        v1 = Convert.ToDouble(Session["Valor3"]) / Convert.ToDouble(Session["Valor1"]);
        Session["Depu"] = String.Format("{0:0.00%}", v);
        Session["Xdepu"] = String.Format("{0:0.00%}", v1);
        Session["Grilla2"] = GridView2.Rows.Count;
        Session["Grilla5"] = GridView5.Rows.Count;
        Response.Write("<script>window.open('Rpt.aspx','_blank');</script>");
    }
}