using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Autorizados : System.Web.UI.Page
{
    string res;
    protected void Page_Load(object sender, EventArgs e)
    {
        string conexion5 = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection conn1 = new SqlConnection(conexion5);
        try
        {
            //Consulta para la busqueda del usuario dentro del la BD con los datos que se requieren del usuario
            SqlCommand command = new SqlCommand("SELECT [sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[Importe_COP],[Importe_RCV],[Importe_Total] ,[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[Obser],[estatus],[socio], [no_cred_cop],[no_cred_rcv] FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal] = '" + Session["Reg_Patronal_Rechazado"].ToString() + "' ", conn1);
            conn1.Open();
            //ejecucion de la consulta
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    sub.Text = reader.GetString(0);
                    Reg.Text = reader.GetString(1);
                    Raz_soc.Text = reader.GetString(2);
                    Fecha_Recep.Text = String.Format("{0:MM/dd/yyyy}", (reader.GetDateTime(3)));
                    Rango.Text = reader.GetString(4);
                    cop.Text = String.Format("{0:N2}", (reader.GetDouble(5)));
                    rcv.Text = String.Format("{0:N2}", (reader.GetDouble(6)));
                    Tot.Text = String.Format("{0:N2}", (reader.GetDouble(7)));
                    res = reader.GetString(8);
                    cop2.Text = String.Format("{0:N2}", (reader.GetDouble(9)));
                    rcv2.Text = String.Format("{0:N2}", (reader.GetDouble(10)));
                    tot2.Text = String.Format("{0:N2}", (reader.GetDouble(11)));
                    status.Text = reader.GetString(13);
                    Response.Cookies["Socios"].Value = reader.GetString(14);
                    Socios.Text = reader.GetString(14);
                    c_cop.Text = Convert.ToString(reader.GetInt32(15));
                    c_rcv.Text = Convert.ToString(reader.GetInt32(16));
                    if (sub.Text == "TOLUCA")
                    {
                        Session["Sub_REP"] = "01";
                        Session["SubDOS_REP"] = "Toluca";
                    }
                    else if (sub.Text == "NAUCALPAN")
                    {
                        Session["Sub_REP"] = "05";
                        Session["SubDOS_REP"] = "Naucalpan";
                    }
                    Session["Reg_Pat_REP"] = Reg.Text;
                    Session["Raz_Soc_REP"] = Raz_soc.Text;
                    Session["Rngo_REP"] = Rango.Text;

                    if (res == "RESPONSABILIDAD SOLIDARIA")
                    {
                        CheckBox1.Checked = true;
                        CheckBox1.Enabled = false;
                        Session["REPORTE"] = "RESPONSABILIDAD SOLIDARIA";
                    }
                    else
                    {
                        CheckBox1.Checked = false;
                        CheckBox1.Enabled = false;
                        Session["REPORTE"] = "RANGO III IV";
                    }
                }
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = ex.Message + "Error Leer Datos";
        }
    }

    public void Actualizar(string estado, string Reg_Pat)
    {
        string conex = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection cnn = new SqlConnection(conex);
        try
        {
            cnn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + estado + "', [fec_termino5]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "'  WHERE [Registro_Patronal] = '" + Reg_Pat + "' ";
            cmd.Connection = cnn;
            int rs = cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            Response.Write("<script>window.open('oficio.aspx','_blank');</script>");
        }
        catch (Exception ex)
        {
            LabelMensaje.Text = ex.Message + "Error ACTUALIZAR";
        }
    }
    protected void Autorizar_Click(object sender, EventArgs e)
    {
        if (Folio.Text != "")
        {
            if (sub.Text == "TOLUCA")
            {
                Session["Sub_REP"] = "01";
                Session["SubDOS_REP"] = "Toluca";
            }
            else if (sub.Text == "NAUCALPAN")
            {
                Session["Sub_REP"] = "05";
                Session["SubDOS_REP"] = "Naucalpan";
            }
            Session["Reg_Pat_REP"] = Reg.Text;
            Session["Raz_Soc_REP"] = Raz_soc.Text;
            Session["Rngo_REP"] = Rango.Text;
            Session["COP_REP"] = "$ " + cop.Text;
            Session["RCV_REP"] = "$ " + rcv.Text;
            Session["Folio_REP"] = Folio.Text;

            if (c_rcv.Text.Length == 1)
            {
                Session["CRCV_REP"] = "0" + c_rcv.Text + " RCV";
            }
            else
            {
                Session["CRCV_REP"] = c_rcv.Text + " RCV";
            }
            if (c_cop.Text.Length == 1)
            {
                Session["CCOP_REP"] = "0" + c_cop.Text + " COP";
            }
            else
            {
                Session["CCOP_REP"] = c_cop.Text + " COP";
            }
            Actualizar("CONCLUIDO", Reg.Text);
            Response.AppendHeader("Refresh", 1.5 + "; URL=Seguim_exp_Delegado.aspx");
        }
        else
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Ingresa tu Número de Folio Por Favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
}