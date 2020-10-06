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

public partial class Admin_Patrones_con_Impedimento_de_Cobro : System.Web.UI.Page
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
        LabelMensaje.Text = "";
        grid_general.Visible = false;
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
        grid_general.Visible = false;
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
                SqlCommand cmd = new SqlCommand("IMPE_COBRO", conn);
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
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();                                                                                                                                                                                                                                                           
                grid_general.Visible = true;
                //Impri.Visible = true;
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Text = ex.Message + "IMPE_COBRO";
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
                SqlCommand cmd = new SqlCommand("IMPE_COBRO_RESUMEN", conn);
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

                this.GridView2.DataSource = cmd.ExecuteReader();
                this.GridView2.DataBind();
                GridView2.Visible = true;
                grid_2.Visible = true;
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Text = ex.Message + "IMPE_COBRO_RESUMEN";
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
                    this.BindGrid();
                    this.Detalles();
                    LabelMensaje.Text = "";
                    LabelEncabezado.Text = "Patrones con Impedimento de Cobro";
                    LabelFecha.Text = "DEPARTAMENTO DE SUPERVISIÓN COBRANZA - INFORMACIÓN -" + tipo.SelectedValue + " RALE " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(rale.SelectedValue));
                    LabelSubdelegacion.Text = Convert.ToString(sub.SelectedItem) ;
                    LabelResumen.Text = "Resumen General";
                    LabelDetalles.Text = "Detalles ";
                }
                else
                {
                    LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione una Subdelegación por Favor. </p>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione un Rale por Favor. </p>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Seleccione el Tipo de Rale por Favor. </p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
    protected void Impri_Click(object sender, EventArgs e)
    {
        Session["Enca"] = tipo.SelectedValue + " RALE " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(rale.SelectedValue)); ;
        Session["Rep"] = "PIC";
        Session["Sub_Ant"] = sub.SelectedItem;
        Response.Write("<script>window.open('Rtp.aspx','_blank');</script>");
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

            TableCell HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> PATRONES CON IMPEDIMENTO DE COBRO <br> </b> </center>" + sub.SelectedItem;
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.BurlyWood;


            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center><b> INCIDENCIA 6 <br> INCONFORMIDAD </b></center>";
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Orange;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> INCIDENCIA 9 <br> NO LOCALIZADOS </b></center>";
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.CadetBlue;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> INCIDENCIA 10 <br> SUSTITUCIÓN PATRONAL </b></center>";
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.DarkSalmon;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> INCIDENCIA 12 <br> EMPRESAS EN HUELGA </b> </center>";
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.PaleGreen;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> INCIDENCIA 14 <br> JUICIO FISCAL </b> </center>";
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.PapayaWhip;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> INCIDENCIA 19 <br> EN CONCURSO MERCANTIL </b> </center>";
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Peru;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> INCIDENCIA 26 <br> RESPONSABILIDAD SOLIDARIA </b> </center>";
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Plum;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> TOTALES <br> CON IMPEDIMENTO DE COBRO </b> </center>";
            HeaderCell2.ColumnSpan = 3;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Purple;

            GridView1.Controls[0].Controls.AddAt(0, HeaderRow);

            GridViewRow HeaderRow1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Num </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.BurlyWood;
           

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Registro Patronal </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.BurlyWood;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Razon Social </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);           
            HeaderCell.BackColor = Color.BurlyWood;

            HeaderCell = new TableCell();
            HeaderCell.Text = " <center> Casos </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Orange;
           

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Orange;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Orange;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center>Casos </center> ";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.CadetBlue;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.CadetBlue;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.CadetBlue;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Casos </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.DarkSalmon;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.DarkSalmon;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.DarkSalmon;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Casos </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.PaleGreen;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.PaleGreen;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.PaleGreen;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Casos </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.PapayaWhip;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.PapayaWhip;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.PapayaWhip;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Casos </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Peru;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Peru;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Peru;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Casos </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Plum;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Plum;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Plum;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Casos </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Purple;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Purple;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Importe </center>";
            HeaderCell.ControlStyle.Font.Size = 9;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Purple;

            HeaderRow.Attributes.Add("class", "header_grid");
            HeaderRow1.Attributes.Add("class", "header_grid");
            GridView1.Controls[0].Controls.AddAt(1, HeaderRow1);
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {

    }
    protected void sub_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensaje.Text = "";
        //Impri.Visible = false;
        grid_general.Visible = false;
    }
    protected void GridView2_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

            TableCell HeaderCell2 = new TableCell();

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b>INCIDENCIA 6 <br> INCONFORMIDAD </b></center>";
            HeaderCell2.ColumnSpan = 4;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.RosyBrown;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center><b> INCIDENCIA 9 <br> NO LOCALIZADOS </b></center>";
            HeaderCell2.ColumnSpan = 4;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.SeaShell;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center><b>INCIDENCIA 10 <br> SUSTITUCIÓN PATRONAL </b></center>";
            HeaderCell2.ColumnSpan = 4;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Silver;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center><b>INCIDENCIA 12 <br> EMPRESAS EN HUELGA </b></center>";
            HeaderCell2.ColumnSpan = 4;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Tan;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b>INCIDENCIA 14 <br> JUICIO FISCAL <b></center>";
            HeaderCell2.ColumnSpan = 4;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Tomato;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> INCIDENCIA 19 <br> EN CONCURSO MERCANTIL </b> </center>";
            HeaderCell2.ColumnSpan = 4;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Turquoise;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> INCIDENCIA 26 <br> RESPONSABILIDAD SOLIDARIA  </b> </center>";
            HeaderCell2.ColumnSpan = 4;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Violet;

            HeaderCell2 = new TableCell();
            HeaderCell2.Text = "<center> <b> TOTALES <br> CON IMPEDIMENTO DE COBRO </b> </center>";
            HeaderCell2.ColumnSpan = 4;
            HeaderCell2.ControlStyle.Font.Size = 11;
            HeaderRow.Cells.Add(HeaderCell2);
            HeaderCell2.BackColor = Color.Yellow;

            GridView2.Controls[0].Controls.AddAt(0, HeaderRow);

            GridViewRow HeaderRow1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Num. Pat. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.RosyBrown;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Cred. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.RosyBrown;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.RosyBrown;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Imp. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.RosyBrown;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Num. Pat. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.SeaShell;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Cred. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.SeaShell;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.SeaShell;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Imp. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.SeaShell;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Num. Pat. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Silver;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Cred. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Silver;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Silver;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Imp. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Silver;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Num. Pat. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Tan;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Cred. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Tan;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Tan;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Imp. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Tan;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Num. Pat. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Tomato;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Cred. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Tomato;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Tomato;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center>Imp. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Tomato;

            HeaderCell = new TableCell();
            HeaderCell.Text = " <center> Num. Pat. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Turquoise;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Cred. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Turquoise;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Turquoise;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Imp. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Turquoise;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Num. Pat. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Violet;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Cred. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Violet;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Violet;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center>Imp. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Violet;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Num. Pat. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Yellow;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Cred. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Yellow;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Prom. Dias </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Yellow;

            HeaderCell = new TableCell();
            HeaderCell.Text = "<center> Imp. </center>";
            HeaderCell.ControlStyle.Font.Size = 10;
            HeaderRow1.Cells.Add(HeaderCell);
            HeaderCell.BackColor = Color.Yellow;

            HeaderRow.Attributes.Add("class", "header_grid");
            HeaderRow1.Attributes.Add("class", "header_grid2");
            GridView2.Controls[0].Controls.AddAt(1, HeaderRow1);
        }
    }
    protected void Detlle_Click(object sender, EventArgs e)
    {
        Session["Enca"] = tipo.SelectedValue + " RALE " + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(rale.SelectedValue)); ;
        Session["Rep"] = "PIC_dtalle";
        Session["Sub_Ant"] = sub.SelectedItem;
        Response.Write("<script>window.open('Rtp.aspx','_blank');</script>");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        BindGrid();
        GridView1.PageIndex = e.NewPageIndex;
        this.GridView1.DataBind();
    }
}