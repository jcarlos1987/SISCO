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


public partial class Admin_BD_ExcelvsRale : System.Web.UI.Page
{
    String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            for (int i = 2005; i < DateTime.Now.Year + 1; i++)
            {
                fecha1.Items.Add(i.ToString());
            }
            for (int i = 2005; i < DateTime.Now.Year + 1; i++)
            {
                fecha2.Items.Add(i.ToString());
            }
        }
        if (!IsPostBack)
        {
            //Literal2.Visible = false;
            Tipo_Rale.AppendDataBoundItems = true;            
            String strQuery = "SELECT DISTINCT [tipo_rale] as id,[tipo_rale] as des FROM [Supervision].[dbo].[Ral_Comb_Per]";
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
        LabelMensaje.Visible = false;
        Rale1.Items.Clear();
        Rale1.Items.Add(new ListItem("-- Selecciona Rale Base --", ""));
        Rale2.Items.Clear();
        Rale2.Items.Add(new ListItem("-- Selecciona Rale a Comparar --", ""));
        Rale2.Enabled = false;
        RadioButtonList1.ClearSelection();
        RadioButtonList1.Enabled = false;
        RadioButtonList2.ClearSelection();
        RadioButtonList2.Enabled = false;
        fecha1.Items.Clear();
        fecha1.Items.Add(new ListItem("-- Seleccione el Periodo Inicial --", ""));
        fecha1.Enabled = false;
        fecha2.Items.Clear();
        fecha2.Items.Add(new ListItem("-- Seleccione el Periodo Final --", ""));
        fecha2.Enabled = false;
        Rale1.AppendDataBoundItems = true;
        String strQuery = "SELECT [Nombr] AS MOSTRAR, CONVERT(NVARCHAR,[fecha_rale],112) AS VALUE  FROM [Supervision].[dbo].[Ral_Comb_Per] WHERE (tipo_rale = @COP_RCV ) ORDER BY VALUE ASC";
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
        RadioButtonList1.Enabled = false;
        RadioButtonList1.ClearSelection();
        RadioButtonList2.Enabled = false;
        RadioButtonList2.ClearSelection();
        fecha1.Items.Clear();
        fecha1.Items.Add(new ListItem("-- Seleccione el Periodo Inicial --", ""));
        fecha1.Enabled = false;
        fecha2.Items.Clear();
        fecha2.Items.Add(new ListItem("-- Seleccione el Periodo Final --", ""));
        fecha2.Enabled = false;
        Rale2.Items.Clear();
        Rale2.Items.Add(new ListItem("-- Selecciona Rale a Comparar --", ""));
        Rale2.AppendDataBoundItems = true;
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
        RadioButtonList1.Enabled = true;
        RadioButtonList1.ClearSelection();
        RadioButtonList2.Enabled = false;
        RadioButtonList2.ClearSelection();
        fecha1.Items.Clear();
        fecha1.Items.Add(new ListItem("-- Seleccione el Periodo Inicial --", ""));
        fecha1.Enabled = false;
        fecha2.Items.Clear();
        fecha2.Items.Add(new ListItem("-- Seleccione el Periodo Final --", ""));
        fecha2.Enabled = false;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensaje.Visible = false;
        RadioButtonList2.Enabled = true;
        fecha1.Items.Clear();
        fecha1.Items.Add(new ListItem("-- Seleccione el Periodo Inicial --", ""));
        fecha1.Enabled = false;
        fecha2.Items.Clear();
        fecha2.Items.Add(new ListItem("-- Seleccione el Periodo Final --", ""));
        fecha2.Enabled = false;
        RadioButtonList2.ClearSelection();
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelMensaje.Visible = false;
        if (RadioButtonList2.SelectedValue == "2")
        {
            fecha1.Items.Clear();
            fecha1.Enabled = true;
            fecha2.Enabled = false;
            fecha1.Items.Add(new ListItem("-- Seleccione el Periodo Inicial --", ""));
            for (int i = 2005; i < DateTime.Now.Year + 1; i++)
            {
                fecha1.Items.Add(i.ToString());
            }
            fecha2.Items.Clear();
            fecha2.Items.Add(new ListItem("-- Seleccione el Periodo Final --", ""));
        }
        else if (RadioButtonList2.SelectedValue == "1")
        {
            fecha2.Items.Clear();
            fecha2.Items.Add(new ListItem("-- Seleccione el Periodo Final --", ""));
            for (int i = 2005; i < DateTime.Now.Year + 1; i++)
            {
                fecha2.Items.Add(i.ToString());
            }
            fecha1.Items.Clear();
            fecha1.Items.Add(new ListItem("-- Seleccione el Periodo Inicial --", ""));
            for (int i = 2005; i < DateTime.Now.Year + 1; i++)
            {
                fecha1.Items.Add(i.ToString());
            }
            fecha1.Enabled = true;
            fecha2.Enabled = true;
        }
    }
    protected void Comparar_Click(object sender, EventArgs e)
    {
        if (Tipo_Rale.SelectedValue != "")
        {
            if (Convert.ToString(Rale1.SelectedItem) != "-- Selecciona Rale Base --")
            {
                if (Rale2.SelectedValue != "")
                {
                    if (RadioButtonList1.SelectedValue != "")
                    {
                        if (RadioButtonList2.SelectedValue != "")
                        {
                            if (RadioButtonList2.SelectedValue == "1")
                            {
                                if (fecha1.SelectedValue != "" && fecha2.SelectedValue != "")
                                {
                                    if (Convert.ToInt32(fecha1.SelectedValue) <= Convert.ToInt32(fecha2.SelectedValue))
                                    {                                        
                                        Response.Cookies["Tipo_Rale_P"].Value = Tipo_Rale.SelectedValue;
                                        Response.Cookies["Rale_Base_P"].Value = Convert.ToString(Rale1.SelectedItem);
                                        Response.Cookies["Rale_Comp_P"].Value = Rale2.SelectedValue;
                                        Response.Cookies["CC_P"].Value = RadioButtonList1.SelectedValue;
                                        Response.Cookies["RA_P"].Value = RadioButtonList2.SelectedValue;
                                        Response.Cookies["Per_Ini_P"].Value = fecha1.SelectedValue;
                                        Response.Cookies["Per_Fin_P"].Value = fecha2.SelectedValue;

                                        Response.Cookies["Tipo_Rale_P"].Expires = DateTime.Now.AddYears(2);
                                        Response.Cookies["Rale_Base_P"].Expires = DateTime.Now.AddYears(2);
                                        Response.Cookies["Rale_Comp_P"].Expires = DateTime.Now.AddYears(2);
                                        Response.Cookies["CC_P"].Expires = DateTime.Now.AddYears(2);
                                        Response.Cookies["RA_P"].Expires = DateTime.Now.AddYears(2);
                                        Response.Cookies["Per_Ini_P"].Expires = DateTime.Now.AddYears(2);
                                        Response.Cookies["Per_Fin_P"].Expires = DateTime.Now.AddYears(2);
                                        Response.Redirect("bd_excelvsrale_2_2.aspx");
                                    }
                                    else
                                    {
                                        LabelMensaje.Visible = true;
                                        LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                              <div class='card-content white-text'>
                                                                <p><i class='mdi-alert-error'></i> Alerta : El Periodo Inicial debe ser Menor o Igual que El Periodo Final por favor</p>
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
                                                            <p><i class='mdi-alert-error'></i> Alerta : Selecciona El Periodo Inicial y El Periodo Final por favor</p>
                                                          </div>
                                                          <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                                            <span aria-hidden='true'>×</span>
                                                          </button>
                                                        </div>";
                                }
                            }
                            else if (RadioButtonList2.SelectedValue == "2")
                            {
                                if (fecha1.SelectedValue != "")
                                {                                    
                                    Response.Cookies["Tipo_Rale_P"].Value = Tipo_Rale.SelectedValue;
                                    Response.Cookies["Rale_Base_P"].Value = Convert.ToString(Rale1.SelectedItem);
                                    Response.Cookies["Rale_Comp_P"].Value = Rale2.SelectedValue;
                                    Response.Cookies["CC_P"].Value = RadioButtonList1.SelectedValue;
                                    Response.Cookies["RA_P"].Value = RadioButtonList2.SelectedValue;
                                    Response.Cookies["Per_Ini_P"].Value = fecha1.SelectedValue;
                                    Response.Cookies["Tipo_Rale_P"].Expires = DateTime.Now.AddYears(2);
                                    Response.Cookies["Rale_Base_P"].Expires = DateTime.Now.AddYears(2);
                                    Response.Cookies["Rale_Comp_P"].Expires = DateTime.Now.AddYears(2);
                                    Response.Cookies["CC_P"].Expires = DateTime.Now.AddYears(2);
                                    Response.Cookies["RA_P"].Expires = DateTime.Now.AddYears(2);
                                    Response.Cookies["Per_Ini_P"].Expires = DateTime.Now.AddYears(2);
                                    Response.Redirect("bd_excelvsrale_2_2.aspx");
                                }
                                else
                                {
                                    LabelMensaje.Visible = true;
                                    LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Selecciona El Periodo Inicial por favor</p>
                                                          </div>
                                                          <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                                            <span aria-hidden='true'>×</span>
                                                          </button>
                                                        </div>";
                                }
                            }
                        }
                        else
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                  <div class='card-content white-text'>
                                                    <p><i class='mdi-alert-error'></i> Alerta : Selecciona Por Rango y/o Por Antigüedad por favor</p>
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
                                                <p><i class='mdi-alert-error'></i> Alerta : Selecciona Alta de Credito y/o Periodo de Credito por favor</p>
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
                                            <p><i class='mdi-alert-error'></i> Alerta : Selecciona El Rale a Comparar por favor</p>
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
                                        <p><i class='mdi-alert-error'></i> Alerta : Selecciona El Rale Base por favor</p>
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
                                    <p><i class='mdi-alert-error'></i> Alerta : Selecciona El Tipo de Rale por favor</p>
                                  </div>
                                  <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                    <span aria-hidden='true'>×</span>
                                  </button>
                                </div>";
        }
    }
}
