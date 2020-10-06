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

public partial class Admin_Dev_Expedi : System.Web.UI.Page
{
    string conexion = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    string res;
    string estatus = "DEVOLUCION A LA SUBDELEGACION";
    int ID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn1 = new SqlConnection(conexion);
        try
        {
            //Consulta para la busqueda del usuario dentro del la BD con los datos que se requieren del usuario
            SqlCommand command = new SqlCommand("SELECT [sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[Importe_COP],[Importe_RCV],[Importe_Total] ,[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[Obser],[estatus],[socio],[id] FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal] = '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + Session["id_expediente"].ToString() + "' ", conn1);
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
                    Fecha_Recep.Text = String.Format("{0:dd/MM/yyyy}", (reader.GetDateTime(3)));
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
                    ID = reader.GetInt32(15);
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
                        CheckBox1.Enabled = false;
                        CheckBox1.Checked = false;
                        Session["REPORTE"] = "RESPONSABILIDAD";
                    }
                    else
                    {
                        CheckBox1.Enabled = false;
                        CheckBox1.Checked = false;
                        Session["REPORTE"] = "RANGO";
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
    protected void Reg_Exped_Click(object sender, EventArgs e)
    {
        if (Observaciones.Text != "")
        {
            Session["Observacion_REP"] = Observaciones.Text;
            string status = "DEVOLUCION A LA SUBDELEGACION";
            if (Session["Tipo"].ToString() == "HCCD")
            {
                SqlConnection con = new SqlConnection(conexion);
                try
                {
                    String sentencia = "INSERT INTO [Supervision].[dbo].[Expedientes_Dev] ([sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi],[Obser],[estatus],[fec_dev_sub1],[fec_env_j1],[fec_dev_j2],[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5])"
                                                                                 + "SELECT [sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi], ('" + Observaciones.Text + "'),'" + status + "',[fec_dev_sub1],[fec_env_j1],[fec_dev_j2],[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],'" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "',[fec_termino5] FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal]= '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "'";
                    SqlCommand comando = new SqlCommand(sentencia, con);
                    int resultado;
                    try
                    {
                        con.Open();
                        resultado = comando.ExecuteNonQuery();
                        /**********************************************************/
                        /**********Consulta de actualizacion de estatus************/
                        /**********************************************************/
                        SqlConnection cnn = new SqlConnection(conexion);
                        try
                        {
                            cnn.Open();
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + estatus + "', [fec_dev_hcc5]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "'  WHERE [Registro_Patronal] = '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "' ";
                            cmd.Connection = cnn;
                            int rs = cmd.ExecuteNonQuery();
                            cmd.Connection.Close();
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Text = ex.Message + "Error ACTUALIZAR JDSC";
                        }
                        /**********************************************************/
                        /**********Fin consulta de actualizacion de estatus********/
                        /**********************************************************/
                        Eliminar();
                        Response.AppendHeader("Refresh", 2.5 + "; URL=Seguim_exped_HCCD.aspx");
                    }
                    catch (System.Exception d)
                    {

                        LabelMensaje.Visible = true;
                        LabelMensaje.Text = "No se guardaron los Datos" + "Error reading from {0}. Message = {1}" + d.Message;
                    }
                }
                catch (Exception ex)
                {
                    LabelMensaje.Text = ex.Message + "Error ACTUALIZAR HCCD";
                }
            }
            else if (Session["Tipo"].ToString() == "DSC")
            {
                SqlConnection con = new SqlConnection(conexion);
                try
                {
                    String sentencia = "INSERT INTO [Supervision].[dbo].[Expedientes_Dev] ([sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi],[Obser],[estatus],[fec_dev_sub1],[fec_env_j1],[fec_dev_j2],[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5])"
                                                                                 + "SELECT [sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi], ('" + Observaciones.Text + "'),'" + status + "','" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "',[fec_env_j1],[fec_dev_j2],[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5] FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal]= '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "'";
                    SqlCommand comando = new SqlCommand(sentencia, con);
                    int resultado;
                    try
                    {
                        con.Open();
                        resultado = comando.ExecuteNonQuery();
                        /**********************************************************/
                        /**********Consulta de actualizacion de estatus************/
                        /**********************************************************/
                        SqlConnection cnn = new SqlConnection(conexion);
                        try
                        {
                            cnn.Open();
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + estatus + "', [fec_dev_sub1]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "'  WHERE [Registro_Patronal] = '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "' ";
                            cmd.Connection = cnn;
                            int rs = cmd.ExecuteNonQuery();
                            cmd.Connection.Close();
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Text = ex.Message + "Error ACTUALIZAR JDSC";
                        }
                        /**********************************************************/
                        /**********Fin consulta de actualizacion de estatus********/
                        /**********************************************************/
                        Eliminar();
                        Response.AppendHeader("Refresh", 2.5 + "; URL=Seguim_exped_DSC.aspx");
                    }
                    catch (System.Exception d)
                    {

                        LabelMensaje.Visible = true;
                        LabelMensaje.Text = "No se guardaron los Datos" + ". " + d.Message;
                    }
                }
                catch (Exception ex)
                {
                    LabelMensaje.Text = ex.Message + "Error ACTUALIZAR DSC";
                }
            }
            else if (Session["Tipo"].ToString() == "JDSC")
            {
                SqlConnection con = new SqlConnection(conexion);
                try
                {
                    String sentencia = "INSERT INTO [Supervision].[dbo].[Expedientes_Dev] ([sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi],[Obser],[estatus],[fec_dev_sub1],[fec_env_j1],[fec_dev_j2],[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5])"
                                                                                 + "SELECT [sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi], ([Obser] +'. ' +'" + Observaciones.Text + "'),'" + status + "',[fec_dev_sub1],[fec_env_j1],'" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "',[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5] FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal]= '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "'";
                    SqlCommand comando = new SqlCommand(sentencia, con);
                    int resultado;
                    try
                    {
                        con.Open();
                        resultado = comando.ExecuteNonQuery();
                        /**********************************************************/
                        /**********Consulta de actualizacion de estatus************/
                        /**********************************************************/
                        SqlConnection cnn = new SqlConnection(conexion);
                        try
                        {
                            cnn.Open();
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + estatus + "', [fec_dev_j2]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "'  WHERE [Registro_Patronal] = '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "' ";
                            cmd.Connection = cnn;
                            int rs = cmd.ExecuteNonQuery();
                            cmd.Connection.Close();
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Text = ex.Message + "Error ACTUALIZAR JDSC";
                        }
                        /**********************************************************/
                        /**********Fin consulta de actualizacion de estatus********/
                        /**********************************************************/
                        Eliminar();
                        Response.AppendHeader("Refresh", 2.5 + "; URL=Seguim_exped_JDSC.aspx");
                    }
                    catch (System.Exception d)
                    {

                        LabelMensaje.Visible = true;
                        LabelMensaje.Text = "No se guardaron los Datos" + "Error reading from {0}. Message = {1}" + d.Message;
                    }
                }
                catch (Exception ex)
                {
                    LabelMensaje.Text = ex.Message + "Error ACTUALIZAR JDSC";
                }
            }
            else if (Session["Tipo"].ToString() == "JAC")
            {
                SqlConnection con = new SqlConnection(conexion);
                try
                {
                    String sentencia = "INSERT INTO [Supervision].[dbo].[Expedientes_Dev] ([sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi],[Obser],[estatus],[fec_dev_sub1],[fec_env_j1],[fec_dev_j2],[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5])"
                                                                                 + "SELECT [sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi], ('" + Observaciones.Text + "'),'" + status + "',[fec_dev_sub1],[fec_env_j1],[fec_dev_j2],[fec_env_jac2],'" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "',[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5] FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal]= '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "'";
                    SqlCommand comando = new SqlCommand(sentencia, con);
                    int resultado;
                    try
                    {
                        con.Open();
                        resultado = comando.ExecuteNonQuery();
                        /**********************************************************/
                        /**********Consulta de actualizacion de estatus************/
                        /**********************************************************/
                        SqlConnection cnn = new SqlConnection(conexion);
                        try
                        {
                            cnn.Open();
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + estatus + "', [fec_dev_jac3]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "'  WHERE [Registro_Patronal] = '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "' ";
                            cmd.Connection = cnn;
                            int rs = cmd.ExecuteNonQuery();
                            cmd.Connection.Close();
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Text = ex.Message + "Error ACTUALIZAR JDSC";
                        }
                        /**********************************************************/
                        /**********Fin consulta de actualizacion de estatus********/
                        /**********************************************************/
                        Eliminar();
                        Response.AppendHeader("Refresh", 2.5 + "; URL=Seguim_exped_JAC.aspx");
                    }
                    catch (System.Exception d)
                    {

                        LabelMensaje.Visible = true;
                        LabelMensaje.Text = "No se guardaron los Datos" + "Error reading from {0}. Message = {1}" + d.Message;
                    }
                }
                catch (Exception ex)
                {
                    LabelMensaje.Text = ex.Message + "Error ACTUALIZAR JDSC";
                }
            }
            else if (Session["Tipo"].ToString() == "DELEGADO")
            {
                SqlConnection con = new SqlConnection(conexion);
                try
                {
                    String sentencia = "INSERT INTO [Supervision].[dbo].[Expedientes_Dev] ([sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi],[Obser],[estatus],[fec_dev_sub1],[fec_env_j1],[fec_dev_j2],[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],[fec_dev_del4],[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5])"
                                                                                 + "SELECT [sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],[user_regi], ('" + Observaciones.Text + "'),'" + status + "',[fec_dev_sub1],[fec_env_j1],[fec_dev_j2],[fec_env_jac2],[fec_dev_jac3],[fec_env_del3],'" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "',[fec_env_hcc4],[fec_dev_hcc5],[fec_termino5] FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal]= '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "'";
                    SqlCommand comando = new SqlCommand(sentencia, con);
                    int resultado;
                    try
                    {
                        con.Open();
                        resultado = comando.ExecuteNonQuery();
                        /**********************************************************/
                        /**********Consulta de actualizacion de estatus************/
                        /**********************************************************/
                        SqlConnection cnn = new SqlConnection(conexion);
                        try
                        {
                            cnn.Open();
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + estatus + "', [fec_dev_del4]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "'  WHERE [Registro_Patronal] = '" + Session["Reg_Patronal_Rechazado"].ToString() + "' AND [id]= '" + ID + "' ";
                            cmd.Connection = cnn;
                            int rs = cmd.ExecuteNonQuery();
                            cmd.Connection.Close();
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Text = ex.Message + "Error ACTUALIZAR DELEGADO";
                        }
                        /**********************************************************/
                        /**********Fin consulta de actualizacion de estatus********/
                        /**********************************************************/
                        Eliminar();
                        Response.AppendHeader("Refresh", 2.5 + "; URL=Seguim_exp_Delegado.aspx");
                    }
                    catch (System.Exception d)
                    {

                        LabelMensaje.Visible = true;
                        LabelMensaje.Text = "No se guardaron los Datos" + "Error reading from {0}. Message = {1}" + d.Message;
                    }
                }
                catch (Exception ex)
                {
                    LabelMensaje.Text = ex.Message + "Error DELEGADO";
                }
            }
        }
        else
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : Ingresa la Observacion Por Favor</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
    }
    private void Eliminar()
    {
        if (Session["Tipo"].ToString() == "HCCD")
        {
            Response.Write("<script>window.open('oficio.aspx','_blank');</script>");
        }
        else if (Session["Tipo"].ToString() == "DSC")
        {
            Response.Write("<script>window.open('oficio.aspx','_blank');</script>");
        }
        else if (Session["Tipo"].ToString() == "JDSC")
        {
            Response.Write("<script>window.open('oficio.aspx','_blank');</script>");
        }
        else if (Session["Tipo"].ToString() == "JAC")
        {
            Response.Write("<script>window.open('oficio.aspx','_blank');</script>");
        }
        else if (Session["Tipo"].ToString() == "DELEGADO")
        {
            Response.Write("<script>window.open('oficio.aspx','_blank');</script>");
        }
    }
    protected void Dev_Click(object sender, EventArgs e)
    {
        if (Session["Tipo"].ToString() == "HCCD")
        {
            Response.Redirect("Seguim_exped_HCCD.aspx");
        }
        else if (Session["Tipo"].ToString() == "DSC")
        {
            Response.Redirect("Seguim_exped_DSC.aspx");
        }
        else if (Session["Tipo"].ToString() == "JDSC")
        {
            Response.Redirect("Seguim_exped_JDSC.aspx");
        }
        else if (Session["Tipo"].ToString() == "JAC")
        {
            Response.Redirect("Seguim_exped_JAC.aspx");
        }
        else if (Session["Tipo"].ToString() == "DELEGADO")
        {
            Response.Redirect("Seguim_exp_Delegado.aspx");
        }
    }
}