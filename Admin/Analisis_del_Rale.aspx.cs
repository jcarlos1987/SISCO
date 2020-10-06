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

public partial class Admin_Analisis_del_Rale : System.Web.UI.Page
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
    }
    protected void Tipo_Rale_SelectedIndexChanged(object sender, EventArgs e)
    {
        EncabezadoSegundaTabla.Visible = false;
        Encabezado.Visible = false;
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = false;
        GridView5.Visible = false;
        Rale1.Items.Clear();
        Rale1.Items.Add(new ListItem("-- Selecciona Rale --", ""));
        TIPO.Items.Clear();
        TIPO.Items.Add(new ListItem("-- Selecione la Subdelegación --", ""));
        TIPO.Enabled = false;
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.Enabled = false;
        Literal6.Text = "";
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
    protected void Rale1_SelectedIndexChanged(object sender, EventArgs e)
    {
        EncabezadoSegundaTabla.Visible = false;
        Encabezado.Visible = false;
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = false;
        GridView5.Visible = false;
        Literal6.Text = "";
        TIPO.Enabled = true;
        TIPO.Items.Clear();
        TIPO.AppendDataBoundItems = true;
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
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
        EncabezadoSegundaTabla.Visible = false;
        Encabezado.Visible = false;
        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = false;
        GridView5.Visible = false;
        buttonReporte.Visible = false;
        Literal6.Text = "";
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
        incidencia.AppendDataBoundItems = true;
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

    protected void Reporte_Click(object sender, EventArgs e)
    {
        if (Tipo_Rale.SelectedValue != "")
        {
            if (Rale1.SelectedValue != "")
            {
                if (TIPO.SelectedValue != "")
                {
                    if (incidencia.SelectedValue != "")
                    {
                        Panel2.Visible = true;
                        this.BindGrid();
                        try
                        {
                            using (SqlConnection conn = new SqlConnection(strConnString))
                            {
                                conn.Open();
                                // Create the sample database
                                SqlCommand cmd = new SqlCommand("DTLLE_SICOCA", conn);

                                cmd.Parameters.Add("@INCI", SqlDbType.Int);
                                cmd.Parameters["@INCI"].Value = incidencia.SelectedValue;

                                cmd.Parameters.Add("@SUB", SqlDbType.Int);
                                cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

                                cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar);
                                cmd.Parameters["@FECHA1"].Value = Rale1.SelectedValue;

                                cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar);
                                cmd.Parameters["@TIPO"].Value = Tipo_Rale.SelectedValue;

                                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                                SqlDataReader reader = cmd.ExecuteReader();
                                if (reader.HasRows)
                                {
                                    while (reader.Read())
                                    {
                                        buttonReporte.Visible = true;
                                        Encabezado.Visible = true;
                                        Int32 id = reader.GetInt32(0);
                                        LabelPatrones.Text = "Patrones : " + Convert.ToString(id);
                                        Int32 id1 = reader.GetInt32(1);
                                        LabelCreditos.Text = "Total de Creditos : " + Convert.ToString(id1);
                                        Double id2 = reader.GetDouble(2);
                                        LabelImporte.Text = "Importe Total : " + String.Format("{0:N2}", id2);
                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            Literal6.Visible = true;
                            Literal6.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : DTLLE_SICOCA " + ex.Message + "</p>" +
                                     @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button> 
                                  </div>";
                        }
                    }
                    else
                    {
                        Literal6.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona una Incidencia por Favor </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                    }
                }
                else
                {
                    Literal6.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona la Subdelegación por Favor </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                }
            }
            else
            {
                Literal6.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona un Rale por Favor </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
            }
        }
        else
        {
            Literal6.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona el Tipo de Rale por Favor.</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }


    private void Detalles(int Inci, string RegPat, string Tabla, string tipo)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("SIC_DTLLE_REG", conn);

                cmd.Parameters.Add("@INCI", SqlDbType.Int);
                cmd.Parameters["@INCI"].Value = Inci;

                cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
                cmd.Parameters["@REG_PAT"].Value = RegPat;

                cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar);
                cmd.Parameters["@FECHA1"].Value = Tabla;

                cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar);
                cmd.Parameters["@TIPO"].Value = tipo;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        LabelPatronesDos.Text = "Número de Patrones : " + Convert.ToString(reader.GetInt32(0));
                        LabelCreditosDos.Text = "Número de Creditos : " + Convert.ToString(reader.GetInt32(1));
                        LabelImporteDos.Text = "Importe Total : " + String.Format("{0:N2}", reader.GetDouble(2));
                        EncabezadoSegundaTabla.Visible = true;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Literal5.Visible = true;
            LabelMsjTabla.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : SIC_DTLLE_REG. " + ex.Message + ".</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    private void BindGrid()
    {
        Panel2.Visible = true;
        buttonReporte.Visible = true;
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("RTP_GRAL_SICOCA", conn);

                cmd.Parameters.Add("@INCI", SqlDbType.Int);
                cmd.Parameters["@INCI"].Value = incidencia.SelectedValue;

                cmd.Parameters.Add("@SUB", SqlDbType.Int);
                cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

                cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
                cmd.Parameters["@TABLA"].Value = Rale1.SelectedValue;

                cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar);
                cmd.Parameters["@TIPO"].Value = Tipo_Rale.SelectedValue;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                GridView1.Visible = true;
                GridView2.Visible = false;
                buttonReporte.Visible = true;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
                if (GridView1.Rows.Count == 0)
                {
                    buttonReporte.Visible = false;
                }
                else
                {
                    buttonReporte.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            Literal5.Visible = true;
            LabelMsjTabla.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : RTP_GRAL_SICOCA. " + ex.Message + ".</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
    protected void incidencia_SelectedIndexChanged(object sender, EventArgs e)
    {
        buttonReporte.Visible = false;
        Literal6.Text = "";
        Panel3.Visible = false;
        GridView1.Visible=false;
        GridView3.Visible = false;
        Encabezado.Visible = false;
        EncabezadoSegundaTabla.Visible = false;
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        BindGrid();
        GridView1.PageIndex = e.NewPageIndex;
        this.GridView1.DataBind();
    }

    protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //LabelMsjTabla.Text = Response.Cookies["Reg_Pat_Dtalle"].Value;
        LleRegPat(Convert.ToInt32(Request.Cookies["Inc_Dtalle"].Value), Request.Cookies["Reg_Pat_Dtalle"].Value, Convert.ToInt32(Request.Cookies["Sub_Dtalle"].Value), Request.Cookies["Tab_Dtalle"].Value, Request.Cookies["Tip_Dtalle"].Value);
        GridView3.PageIndex = e.NewPageIndex;
        this.GridView3.DataBind();
    }
    protected void GridView5_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        RtpRegPat(Request.Cookies["Reg_Pat_Dtalle"].Value, Request.Cookies["Tab_Dtalle"].Value);
        GridView5.PageIndex = e.NewPageIndex;
        this.GridView5.DataBind();
    }
    private void RtpRegPat(string Reg, string tabla)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                this.Detalles(Reg, tabla);                
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("DTLLE_SICO_REG", conn);

                cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
                cmd.Parameters["@REG_PAT"].Value = Reg;

                cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
                cmd.Parameters["@TABLA"].Value = tabla;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView5.Visible = true;
                GridView5.DataSource = dt;
                GridView5.DataBind();
                
            }
        }
        catch (Exception ex)
        {
            LabelMsjTabla.Visible = true;
            LabelMsjTabla.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : DTLLE_SICO_REG. " + ex.Message + ".</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        } 
    }

    private void Detalles(string Reg, string Tabla)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("SICOCA_REG_PAT", conn);

                cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
                cmd.Parameters["@REG_PAT"].Value = Reg;

                cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
                cmd.Parameters["@TABLA"].Value = Tabla;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        DetallesREGPAT.Visible = true;
                        LabelCredCOP.Text = "N° de Creditos COP : " + Convert.ToString(reader.GetInt32(3));
                        LabelImpoCOP.Text = "Importe COP : " + String.Format("{0:N2}", reader.GetDouble(5));
                        LabelCredRCV.Text = "N° de Creditos RCV : " + Convert.ToString(reader.GetInt32(6));
                        LabelImpRCV.Text = "Importe RCV : " + String.Format("{0:N2}", reader.GetDouble(8));
                        LabelTotCOPRCV.Text = "Importe COP/RCV : " + String.Format("{0:N2}", reader.GetDouble(9));
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Literal5.Visible = true;
            LabelMsjTabla.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : SICOCA_REG_PAT. " + ex.Message + ".</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }


    private void LleRegPat(int Inci, string RegPat, int Sub, string Tabla, string Tipo)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                Detalles(Inci, RegPat, Tabla, Tipo);
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("DTLLE_GRAL_SICOCA", conn);

                cmd.Parameters.Add("@INCI", SqlDbType.Int);
                cmd.Parameters["@INCI"].Value = Inci;

                cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
                cmd.Parameters["@REG_PAT"].Value = RegPat;

                cmd.Parameters.Add("@SUB", SqlDbType.Int);
                cmd.Parameters["@SUB"].Value = Sub;

                cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
                cmd.Parameters["@TABLA"].Value = Tabla;

                cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar);
                cmd.Parameters["@TIPO"].Value = Tipo;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView3.DataSource = dt;
                GridView3.DataBind();
                GridView3.Visible = true;                
            }
        }
        catch (Exception ex)
        {
            Literal5.Visible = true;
            LabelMsjTabla.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : " + ex.Message +".</p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        Response.Cookies["Inc_Reg"].Value = RadioButtonList1.SelectedValue;
        Response.Cookies["Sub_Dtalle"].Value = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["sub"]);
        Response.Cookies["Reg_Pat_Dtalle"].Value = Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Id_Reg_Pat"]);
        Response.Cookies["Inc_Dtalle"].Value = incidencia.SelectedValue;
        Response.Cookies["Tab_Dtalle"].Value = Rale1.SelectedValue;
        Response.Cookies["Tip_Dtalle"].Value = Tipo_Rale.SelectedValue;
        LleRegPat(Convert.ToInt32(incidencia.SelectedValue), Convert.ToString(GridView1.DataKeys[row.RowIndex].Values["Id_Reg_Pat"]), Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["sub"]), Rale1.SelectedValue, Tipo_Rale.SelectedValue);        
    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView2.SelectedRow;
        Response.Cookies["Inc_Reg"].Value = RadioButtonList1.SelectedValue;
        Response.Cookies["Sub_Dtalle"].Value = Convert.ToString(GridView2.DataKeys[row.RowIndex].Values["sub"]);
        Response.Cookies["Reg_Pat_Dtalle"].Value = Convert.ToString(GridView2.DataKeys[row.RowIndex].Values["Id_Reg_Pat"]);
        Response.Cookies["Tab_Dtalle"].Value = Rale2.SelectedValue;
        RtpRegPat(Convert.ToString(GridView2.DataKeys[row.RowIndex].Values["Id_Reg_Pat"]), Rale2.SelectedValue);
    }

    protected void Reporte10_Click(object sender, EventArgs e)
    {
        if (Reg_Pat.Text != "")
        {
            if (Rale2.SelectedValue != "")
            {
                try
                {
                    using (SqlConnection conn = new SqlConnection(strConnString))
                    {
                        conn.Open();
                        // Create the sample database
                        SqlCommand cmd = new SqlCommand("SICOCA_REG_PAT", conn);

                        cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
                        cmd.Parameters["@REG_PAT"].Value = Reg_Pat.Text;

                        cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
                        cmd.Parameters["@TABLA"].Value = Rale2.SelectedValue;

                        cmd.CommandType = System.Data.CommandType.StoredProcedure;
                        Titu.Visible = true;
                        Titulo.Visible = true;
                        GridView2.Visible = true;                       
                        this.GridView2.DataSource = cmd.ExecuteReader();
                        this.GridView2.DataBind();
                        this.Detalle_inci();
                        Literal5.Text = "";
                    }
                }
                catch (Exception ex)
                {
                    Literal5.Visible = true;
                    Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : SICOCA_REG_PAT. " + ex.Message + " </p>" +
                                        @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
                }
            }
            else
            {
                Literal5.Visible = true;
                Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione un Rale por Favor </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
            }
        }
        else
        {
            Literal5.Visible = true;
            Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Ingrese un Registro Patronal por Favor </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    private void Detalle_inci()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(strConnString))
            {
                conn.Open();
                // Create the sample database
                SqlCommand cmd = new SqlCommand("DTLLE_SICO_REGxINCI", conn);

                cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
                cmd.Parameters["@REG_PAT"].Value = Reg_Pat.Text;

                cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
                cmd.Parameters["@TABLA"].Value = Rale2.SelectedValue;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView4.DataSource = dt;
                GridView4.DataBind();
                GridView4.Visible = true;     
                if (GridView4.Rows.Count == 0)
                {
                    boton_reg_pat.Visible = false;
                }
                else
                {
                    boton_reg_pat.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            Literal5.Visible = true;
            Literal5.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : DTLLE_SICO_REGxINCI. " + ex.Message + " </p>" +
                                @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "1")
        {
            Literal5.Text = "";
            Panel3.Visible = false;
            Panel2.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
            Rale1.Items.Clear();
            Rale1.Items.Add(new ListItem("-- Selecciona Rale --", ""));
            Rale1.Enabled = false;

            TIPO.Items.Clear();
            TIPO.Items.Add(new ListItem("-- Selecione la Subdelegación --", ""));
            TIPO.Enabled = false;

            incidencia.Items.Clear();
            incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));
            incidencia.Enabled = false;

            Tipo_Rale.Items.Clear();
            Tipo_Rale.Items.Add(new ListItem("-- Selecciona Tipo de Rale --", ""));
            Tipo_Rale.Enabled = true;
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
        else
        {
            if (RadioButtonList1.SelectedValue == "2")
            {
                Literal5.Text = "";
                Encabezado.Visible = false;
                EncabezadoSegundaTabla.Visible = false;
                GridView3.Visible = false;
                Panel2.Visible = false;
                Panel3.Visible = true;
                GridView1.Visible = false;
                Rale2.Items.Clear();
                Reg_Pat.Text = null;
                Rale2.Items.Add(new ListItem("-- Selecciona Rale --", ""));
                Rale2.AppendDataBoundItems = true;
                String strQuery = "SELECT CONVERT(NVARCHAR, fecha_rale, 105) AS MOSTRAR, CONVERT (NVARCHAR, fecha_rale, 105) AS VALUE, CONVERT (NVARCHAR, fecha_rale, 102) AS VALUE1 FROM Rales_Combo WHERE (tipo_rale = 'COP' ) ORDER BY VALUE1 ASC";
                SqlConnection con = new SqlConnection(strConnString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    Rale2.DataSource = cmd.ExecuteReader();
                    Rale2.DataTextField = "MOSTRAR";
                    Rale2.DataValueField = "VALUE";
                    Rale2.DataBind();
                    if (Rale2.Items.Count > 1)
                    {
                        Rale2.Enabled = true;
                    }
                    else
                    {
                        Rale2.Enabled = false;
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
        }
    }
  
    protected void Reg_Pat_TextChanged(object sender, EventArgs e)
    {
        Titu.Visible = false;
        Titulo.Visible = false;
        GridView2.Visible = false;
        GridView1.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = false;
        GridView5.Visible = false;
        DetallesREGPAT.Visible = false;
    }
    protected void Rale2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Titu.Visible = false;
        Titulo.Visible = false;
        GridView2.Visible = false;
        GridView1.Visible = false;
        GridView3.Visible = false;
        GridView4.Visible = false;
        GridView5.Visible = false;
        DetallesREGPAT.Visible = false;
    }

    protected void RepBajarExcel_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("RTP_GRAL_SICOCA", con);

            cmd.Parameters.Add("@INCI", SqlDbType.Int);
            cmd.Parameters["@INCI"].Value = incidencia.SelectedValue;

            cmd.Parameters.Add("@SUB", SqlDbType.Int);
            cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

            cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
            cmd.Parameters["@TABLA"].Value = Rale1.SelectedValue;

            cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar);
            cmd.Parameters["@TIPO"].Value = Tipo_Rale.SelectedValue;

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
                        wb.Worksheets.Add(dt, "Detalles");

                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=" + "Inci_" + incidencia.SelectedItem + ".xlsx");
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
    protected void LinkButtonDetalle_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("DTLLE_GRAL_SICOCA", con);

            cmd.Parameters.Add("@INCI", SqlDbType.Int);
            cmd.Parameters["@INCI"].Value = Request.Cookies["Inc_Dtalle"].Value;

            cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
            cmd.Parameters["@REG_PAT"].Value = Request.Cookies["Reg_Pat_Dtalle"].Value;

            cmd.Parameters.Add("@SUB", SqlDbType.Int);
            cmd.Parameters["@SUB"].Value = Request.Cookies["Sub_Dtalle"].Value;

            cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
            cmd.Parameters["@TABLA"].Value = Request.Cookies["Tab_Dtalle"].Value;

            cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar);
            cmd.Parameters["@TIPO"].Value = Request.Cookies["Tip_Dtalle"].Value;

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
                        wb.Worksheets.Add(dt, Request.Cookies["Reg_Pat_Dtalle"].Value + "_Inci_" + Request.Cookies["Inc_Dtalle"].Value);

                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=" + Request.Cookies["Reg_Pat_Dtalle"].Value + "_Inci_" + Request.Cookies["Inc_Dtalle"].Value + ".xlsx");
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
    protected void LinkButtonInci_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("DTLLE_SICO_REGxINCI", con);

            cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
            cmd.Parameters["@REG_PAT"].Value = Reg_Pat.Text;

            cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
            cmd.Parameters["@TABLA"].Value = Rale2.SelectedValue;

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
                        wb.Worksheets.Add(dt, "Detalles");

                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=" + Reg_Pat.Text + ".xlsx");
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
    protected void LinkButtonDtalleInci_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            con.Open();
            // Create the sample database
            SqlCommand cmd = new SqlCommand("DTLLE_SICO_REG", con);

            cmd.Parameters.Add("@REG_PAT", SqlDbType.NVarChar);
            cmd.Parameters["@REG_PAT"].Value = Request.Cookies["Reg_Pat_Dtalle"].Value;

            cmd.Parameters.Add("@TABLA", SqlDbType.NVarChar);
            cmd.Parameters["@TABLA"].Value = Request.Cookies["Tab_Dtalle"].Value;

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
                        wb.Worksheets.Add(dt, Request.Cookies["Reg_Pat_Dtalle"].Value);

                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=" + Request.Cookies["Reg_Pat_Dtalle"].Value + ".xlsx");
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