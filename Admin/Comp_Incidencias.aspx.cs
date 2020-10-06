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

public partial class Admin_Comp_Incidencias : System.Web.UI.Page
{
    private decimal _Total1 = 0;
    private decimal _Total2 = 0;
    private decimal _Total3 = 0;
    private decimal _Total4 = 0;
    private decimal _Total5 = 0;
    private decimal _Total6 = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Rale1.Items.Clear();
            Rale1.Items.Add(new ListItem("-- Selecciona Anterior --", ""));
            Rale2.Items.Clear();
            Rale2.Items.Add(new ListItem("-- Selecciona Actual --", ""));
            Rale2.Enabled = false;
            TIPO.Items.Clear();
            TIPO.Items.Add(new ListItem("-- Selecciona Subdelegación --", ""));
            Tipo_Rale.Items.Clear();
            incidencia.Items.Clear();
            incidencia.Items.Add(new ListItem("-- Selecciona una Incidencia --", ""));
            Tipo_Rale.Items.Add(new ListItem("-- Selecciona Tipo --", ""));
            Tipo_Rale.AppendDataBoundItems = true;
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
        Encabezado.Visible = false;
        LabelMensaje.Visible = false;
        Rale1.Items.Clear();
        Rale1.Items.Add(new ListItem("-- Selecciona Anterior --", ""));
        Rale2.Items.Clear();
        Rale2.Items.Add(new ListItem("-- Selecciona Actual --", ""));
        Rale2.Enabled = false;
        TIPO.Items.Clear();
        TIPO.Items.Add(new ListItem("-- Selecciona Subdelegación --", ""));
        TIPO.Enabled = false;
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Selecciona una Incidencia --", ""));
        incidencia.Enabled = false;
        Rale1.AppendDataBoundItems = true;
        String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        String strQuery = "SELECT CONVERT(NVARCHAR, [fecha_rale], 105) AS MOSTRAR,CONVERT(NVARCHAR, [fecha_rale], 112) AS VALUE,CONVERT (NVARCHAR, fecha_rale, 112) AS VALUE1 FROM Rales_Combo WHERE (tipo_rale = @COP_RCV ) ORDER BY VALUE1 ASC";
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
    protected void Rale1_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensaje.Visible = false;
        Encabezado.Visible = false;
        Rale2.Items.Clear();
        Rale2.Items.Add(new ListItem("-- Selecciona Actual --", ""));
        TIPO.Items.Clear();
        TIPO.Items.Add(new ListItem("-- Selecciona Subdelegación --", ""));
        TIPO.Enabled = false;
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Selecciona una Incidencia --", ""));
        incidencia.Enabled = false;
        Rale2.AppendDataBoundItems = true;
        String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        String strQuery = "SELECT CONVERT(NVARCHAR, [fecha_rale], 105) AS MOSTRAR,CONVERT(NVARCHAR, [fecha_rale], 105) AS VALUE,CONVERT (NVARCHAR, fecha_rale, 112) AS VALUE1 FROM [Supervision].[dbo].[Rales_Combo] WHERE [tipo_rale]= @TIPO  AND [fecha_rale] > @FEC ORDER BY VALUE1 ASC";
        SqlConnection con = new SqlConnection(strConnString);
        SqlCommand cmd = new SqlCommand();
        cmd.Parameters.AddWithValue("@TIPO", Tipo_Rale.SelectedItem.Value);
        cmd.Parameters.AddWithValue("@FEC", Rale1.SelectedItem.Value);
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
    protected void Rale2_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensaje.Visible = false;
        Encabezado.Visible = false;
        TIPO.AppendDataBoundItems = true;
        try
        {
            incidencia.Items.Clear();
            incidencia.Items.Add(new ListItem("-- Selecciona una Incidencia --", ""));
            incidencia.Enabled = false;
            TIPO.Enabled = true;
            TIPO.Items.Clear();
            this.TIPO.Items.Insert(0, new ListItem("-- Selecciona Subdelegación --", ""));
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
        LabelMensaje.Visible = false;
        Encabezado.Visible = false;
        incidencia.Items.Clear();
        incidencia.Items.Add(new ListItem("-- Seleccione Incidencia --", ""));

        incidencia.AppendDataBoundItems = true;
        String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection con = new SqlConnection(strConnString);
        SqlDataAdapter cmd = new SqlDataAdapter("COMBO_COMPxINCI", con);
        cmd.SelectCommand.CommandType = CommandType.StoredProcedure;
        //SqlCommand cmd = new SqlCommand("COMBO_INCIDENCIAS", con);
        cmd.SelectCommand.Parameters.AddWithValue("@SUB", TIPO.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@TIPO", Tipo_Rale.SelectedValue);
        cmd.SelectCommand.Parameters.AddWithValue("@FECHA1", Convert.ToString(Rale1.SelectedItem));
        cmd.SelectCommand.Parameters.AddWithValue("@FECHA2", Rale2.SelectedValue);

        DataSet ds = new DataSet();
        if (cmd != null)
        {
            cmd.Fill(ds);
        }
        try
        {
            con.Open();
            incidencia.DataSource = ds;
            incidencia.DataTextField = "descrip";
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
            LabelMensaje.Text = ex.Message;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            try
            {
                GridViewRow HeaderRow = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell2 = new TableCell();
                HeaderCell2.ColumnSpan = 1;
                if (Convert.ToString(Rale1.SelectedItem) == "-- Selecciona Anterior --")
                {
                    Response.Cookies["RaleBase"].Value = "11-08-2016";
                }
                else
                {
                    Response.Cookies["RaleBase"].Value = Convert.ToString(Rale1.SelectedItem);
                }
                if (Convert.ToString(Rale2.SelectedItem) == "-- Selecciona Actual --")
                {
                    Response.Cookies["RaleC"].Value = "11-08-2016";
                }
                else
                {
                    Response.Cookies["RaleC"].Value = Convert.ToString(Rale2.SelectedItem);
                }

                /*Response.Write("<script language=javascript>alert('" + Request.Cookies["RaleBase"].Value + "');</script>");
                Response.Write("<script language=javascript>alert('" + Request.Cookies["RaleC"].Value + "');</script>");*/

                HeaderCell2.BackColor = Color.Orange;
                HeaderRow.Cells.Add(HeaderCell2);
                IFormatProvider culture = new System.Globalization.CultureInfo("es-MX", true);
                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "<center><b>" + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["RaleBase"].Value)) + "</b></center>";
                HeaderCell2.ColumnSpan = 2;
                HeaderCell2.BackColor = Color.Orange;
                HeaderCell2.ControlStyle.Font.Size = 14;
                HeaderRow.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "<center><b>" + String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Request.Cookies["RaleC"].Value)) + "</b><center>";
                HeaderCell2.ColumnSpan = 2;
                HeaderCell2.BackColor = Color.Plum;
                HeaderCell2.ControlStyle.Font.Size = 14;
                HeaderRow.Cells.Add(HeaderCell2);

                HeaderCell2 = new TableCell();
                HeaderCell2.Text = "<center><b>Diferencia</b></center>";
                HeaderCell2.BackColor = Color.Plum;
                HeaderCell2.ColumnSpan = 2;
                HeaderCell2.ControlStyle.Font.Size = 14;
                HeaderRow.Cells.Add(HeaderCell2);


                GridView1.Controls[0].Controls.AddAt(0, HeaderRow);

                GridViewRow HeaderRow1 = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "<center><b> Rango en Días </b></center>";
                HeaderCell.BackColor = Color.Orange;
                HeaderCell.ControlStyle.Font.Size = 14;
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "<center><b> Creditos </b></center>";
                HeaderCell.BackColor = Color.Orange;
                HeaderCell.ControlStyle.Font.Size = 14;
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "<center><b> Importe </b></center>";
                HeaderCell.BackColor = Color.Orange;
                HeaderCell.ControlStyle.Font.Size = 14;
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "<center><b> Creditos </b></center>";
                HeaderCell.BackColor = Color.Plum;
                HeaderCell.ControlStyle.Font.Size = 14;
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "<center><b> Importe </b></center>";
                HeaderCell.BackColor = Color.Plum;
                HeaderCell.ControlStyle.Font.Size = 14;
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "<center><b> Creditos </b></center>";
                HeaderCell.BackColor = Color.Plum;
                HeaderCell.ControlStyle.Font.Size = 14;
                HeaderRow1.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "<center><b> Importe </b></center>";
                HeaderCell.BackColor = Color.Plum;
                HeaderCell.ControlStyle.Font.Size = 14;
                HeaderRow1.Cells.Add(HeaderCell);



                HeaderRow.Attributes.Add("class", "header_grid2");
                HeaderRow1.Attributes.Add("class", "header_grid");
                GridView1.Controls[0].Controls.AddAt(1, HeaderRow1);
            }
            catch(Exception E)
            {
                Response.Write("<script language=javascript>alert('" + Request.Cookies["RaleBase"].Value + E.Message + "');</script>");
            }
        }
    }
    protected void Reporte_Click(object sender, EventArgs e)
    {
        if (Tipo_Rale.SelectedValue != "")
        {
            if (Rale1.SelectedValue != "")
            {
                if (Rale2.SelectedValue != "")
                {
                    if (TIPO.SelectedValue != "")
                    {
                        if (incidencia.SelectedValue != "")
                        {
                            LabelMensaje.Visible = false;
                            this.BindGrid();
                            if (TIPO.SelectedValue == "1")
                            {
                                LabelDelegacion.Text = "Subdelegación TOLUCA " + Tipo_Rale.SelectedValue;
                            }
                            else if (TIPO.SelectedValue == "5")
                            {
                                LabelDelegacion.Text = "Subdelegación NAUCALPAN " + Tipo_Rale.SelectedValue;
                            }
                            else if (TIPO.SelectedValue == "3")
                            {
                                LabelDelegacion.Text = "DELEGACIONAL " + Tipo_Rale.SelectedValue;
                            }
                            LabelIncidencia.Text = "Comparativo por Incidencia : " + Convert.ToString(incidencia.SelectedItem);
                        }
                        else
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona la Inicidencia por Favor</p>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona la Subdelegación por Favor</p>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona el RALE Actual por Favor</p>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Selecciona el RALE Anterior por Favor</p>
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
            LabelMensaje.Text = "<div id='card-alert' class='card red'>" +
                                "    <div class='card-content white-text'>"+
                                 "     <p><i class='mdi-alert-error'></i> Alerta : Selecciona el Tipo de RALE por Favor</p>"+
                                  "  </div>"+
                                   " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>"+
                                    "  <span aria-hidden='true'>×</span>"+
                                    "</button>"+
                                  "</div>";
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
                SqlCommand cmd = new SqlCommand("COMPA_X_INCI", conn);
                string ClientIP = GetIP4Address();
                cmd.Parameters.Add("@IP", SqlDbType.NVarChar, 35);
                cmd.Parameters["@IP"].Value = ClientIP;

                cmd.Parameters.Add("@INCI", SqlDbType.Int);
                cmd.Parameters["@INCI"].Value = incidencia.SelectedValue;

                cmd.Parameters.Add("@SUB", SqlDbType.Int);
                cmd.Parameters["@SUB"].Value = TIPO.SelectedValue;

                cmd.Parameters.Add("@FECHA1", SqlDbType.NVarChar, 35);
                cmd.Parameters["@FECHA1"].Value = Rale1.SelectedValue.Substring(6, 2) + "-" + Rale1.SelectedValue.Substring(4, 2) + "-" + Rale1.SelectedValue.Substring(0, 4);

                cmd.Parameters.Add("@FECHA2", SqlDbType.NVarChar, 35);
                cmd.Parameters["@FECHA2"].Value = Rale2.SelectedValue;

                cmd.Parameters.Add("@TIPO", SqlDbType.NVarChar, 35);
                cmd.Parameters["@TIPO"].Value = Tipo_Rale.SelectedValue;
                // cmd.CommandType = CommandType.StoredProcedure;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                this.GridView1.DataSource = cmd.ExecuteReader();
                this.GridView1.DataBind();
                Encabezado.Visible = true;
                conn.Close();
            }
        }
        catch (Exception ex)
        {
            //Literal1.Text = ex.Message + "COMPA_X_INCI";
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

    protected void Impri_Click(object sender, EventArgs e)
    {
        if (TIPO.SelectedValue == "1")
        {
            Session["Sub_Ant"] = "SUBDELEGACIÓN TOLUCA " + Tipo_Rale.SelectedValue;
        }
        else if (TIPO.SelectedValue == "5")
        {
            Session["Sub_Ant"] = "SUBDELEGACIÓN NAUCALPAN " + Tipo_Rale.SelectedValue;
        }
        else if (TIPO.SelectedValue == "3")
        {
            Session["Sub_Ant"] = "DELEGACIONAL " + Tipo_Rale.SelectedValue;
        }
        Session["uno"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale1.SelectedValue.Substring(6, 2) + "-" + Rale1.SelectedValue.Substring(4, 2) + "-" + Rale1.SelectedValue.Substring(0, 4)));
        Session["dos"] = String.Format("{0: dd MMMM  yyyy}", Convert.ToDateTime(Rale2.SelectedValue));
        Session["Rep"] = "CompaXInci";
        Session["Inci"] = "Comparativo Incidencia " + Convert.ToString(incidencia.SelectedItem);
        Response.Write("<script>window.open('Rtp.aspx','_blank');</script>");
    }
    protected void incidencia_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensaje.Visible = false;
        Encabezado.Visible = false;
    }
}