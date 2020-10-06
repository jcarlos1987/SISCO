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

public partial class Admin_Control_exp_inc09_Registro_expedientes_09 : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    string reg_pat_cop;
    string sub_cop;
    string nombre_cop;
    Double imp_cop;
    string reg_pat_RCV;
    string sub_RCV;
    string nombre_RCV;
    Double imp_RCV;
    string res;
    string subde;
    string obs;
    Double salario = 75.49;

    protected void Page_Load(object sender, EventArgs e)
    {
        Fecha_Recep_CalendarExtender.EndDate = DateTime.Now;
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        SqlConnection con1 = new SqlConnection(con);
        try
        {
            SqlCommand command5 = new SqlCommand("SELECT [sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion],[Rango],[Importe_COP],[Importe_RCV] ,[Importe_Total],[Resp_Solid],[Importe_COP_2],[Importe_RCV_2],[Importe_Total_2],LTRIM([Obser]),[estatus],[socio],[no_cred_cop],[no_cred_rcv], [id] FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal]  = '" + Reg.Text + "' AND estatus = 'DEVOLUCION A LA SUBDELEGACION' ", con1);
            con1.Open();  //ejecucion de la consulta
            SqlDataReader reader = command5.ExecuteReader();
            if (reader.HasRows)
            {
                Response.Cookies["Insert"].Value = "Devuelto";
                while (reader.Read())
                {
                    Reg.Text = reader.GetString(1);
                    Raz_soc.Text = reader.GetString(2);
                    cop.Text = String.Format("{0:N2}", reader.GetDouble(5));
                    rcv.Text = String.Format("{0:N2}", reader.GetDouble(6));
                    Tot.Text = String.Format("{0:N2}", reader.GetDouble(7));
                    sub.Text = reader.GetString(0);
                    Rango.Text = reader.GetString(4);
                    cop2.Text = String.Format("{0:N2}", reader.GetDouble(9));
                    rcv2.Text = String.Format("{0:N2}", reader.GetDouble(10));
                    tot2.Text = String.Format("{0:N2}", reader.GetDouble(11));
                    string res = reader.GetString(8);
                    Response.Cookies["Observaciones"].Value = reader.GetString(12);
                    Response.Cookies["Cred_COP"].Value = Convert.ToString(reader.GetInt32(15));
                    Response.Cookies["Cred_RCV"].Value = Convert.ToString(reader.GetInt32(16));
                    Response.Cookies["ID_Dev"].Value = Convert.ToString(reader.GetInt32(17));
                    Socios.Text = reader.GetString(14);
                    if (res == "RESPONSABILIDAD SOLIDARIA")
                    {
                        CheckBox1.Checked = true;
                    }
                    else
                    {
                        CheckBox1.Checked = false;
                    }
                    LabelMensaje.Visible = true;
                    LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Expediente Devuelto a la Subdelegación </p>"+
                                                         " </div>"+
                                                         " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>"+
                                                          "  <span aria-hidden='true'>×</span>"+
                                                        "  </button>"+
                                                      "  </div>";
                    //Literal5.Visible = true;
                    //Literal5.Text = Request.Cookies["Observaciones"].Value;
                    //Literal5.Text = "Expediente Devuelto a la Subdelegación " + Request.Cookies["ID_Dev"].Value + "  " + Reg.Text;
                }
            }
            else
            {
                SqlConnection con2 = new SqlConnection(con);
                try
                {
                    SqlCommand comm = new SqlCommand("SELECT * FROM [Supervision].[dbo].[Registro_Expedientes] WHERE [Registro_Patronal]  = '" + Reg.Text + "' AND (estatus = 'AUTORIZACION DE JDSC' OR estatus = 'CONCLUIDO' OR estatus = 'EN AUTORIZACION DEL C. DELEGADO' OR estatus = 'EN AUTORIZACION DEL HCCD' OR estatus = 'EN REVISION DEL DSC') ", con2);
                    con2.Open();  //ejecucion de la consulta
                    SqlDataReader leer = comm.ExecuteReader();
                    if (leer.HasRows)
                    {
                        LabelMensaje.Visible = true;
                        LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Expediente Ya Registrado </p>" +
                                                             " </div>" +
                                                             " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                              "  <span aria-hidden='true'>×</span>" +
                                                            "  </button>" +
                                                          "  </div>";
                        Raz_soc.Text = null;
                        cop.Text = null;
                        rcv.Text = null;
                        Tot.Text = null;
                        sub.Text = null;
                        Rango.Text = null;
                        CheckBox1.Checked = false;
                        cop2.Text = null;
                        rcv2.Text = null;
                        tot2.Text = null;
                    }
                    else
                    {
                        Response.Cookies["Insert"].Value = "Nuevo";
                        try
                        {
                            using (SqlConnection conn = new SqlConnection(con))
                            {
                                conn.Open();
                                // Create the sample database
                                SqlCommand cmd = new SqlCommand("EXP_COP", conn);
                                cmd.Parameters.Add("@REG_PATRONAL", SqlDbType.NVarChar);
                                cmd.Parameters["@REG_PATRONAL"].Value = Reg.Text;

                                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                                SqlDataReader reader1 = cmd.ExecuteReader();
                                if (reader1.HasRows)
                                {
                                    while (reader1.Read())
                                    {
                                        reg_pat_cop = reader1.GetString(0);
                                        sub_cop = reader1.GetString(1);
                                        nombre_cop = reader1.GetString(2);
                                        imp_cop = reader1.GetDouble(3);
                                        Response.Cookies["Cred_COP"].Value = Convert.ToString(reader1.GetInt32(4));
                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : EXP_COP " + ex.Message + " </p>" +
                                                                 " </div>" +
                                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                                  "  <span aria-hidden='true'>×</span>" +
                                                                "  </button>" +
                                                              "  </div>";
                        }
                        try
                        {
                            using (SqlConnection conn = new SqlConnection(con))
                            {
                                conn.Open();
                                // Create the sample database
                                SqlCommand cmd = new SqlCommand("EXP_RCV", conn);
                                cmd.Parameters.Add("@REG_PATRONAL", SqlDbType.NVarChar);
                                cmd.Parameters["@REG_PATRONAL"].Value = Reg.Text;

                                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                                SqlDataReader reader2 = cmd.ExecuteReader();
                                if (reader2.HasRows)
                                {
                                    while (reader2.Read())
                                    {
                                        reg_pat_RCV = reader2.GetString(0);
                                        sub_RCV = reader2.GetString(1);
                                        nombre_RCV = reader2.GetString(2);
                                        imp_RCV = reader2.GetDouble(3);
                                        Response.Cookies["Cred_RCV"].Value = Convert.ToString(reader2.GetInt32(4));
                                    }
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : EXP_RCV " + ex.Message + " </p>" +
                                                                 " </div>" +
                                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                                  "  <span aria-hidden='true'>×</span>" +
                                                                "  </button>" +
                                                              "  </div>";
                        }
                        if (nombre_cop == null && nombre_RCV == null)
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Registro Patronal NO Existe. Intente de nuevo por favor. </p>" +
                                                                 " </div>" +
                                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                                  "  <span aria-hidden='true'>×</span>" +
                                                                "  </button>" +
                                                              "  </div>";
                            Raz_soc.Text = null;
                            cop.Text = null;
                            rcv.Text = null;
                            Tot.Text = null;
                            sub.Text = null;
                            Rango.Text = null;
                            CheckBox1.Checked = false;
                            cop2.Text = null;
                            rcv2.Text = null;
                            tot2.Text = null;
                            Fecha_Recep.Text = null;
                        }
                        else
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card green lighten-3'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Expediente Nuevo </p>" +
                                                                 " </div>" +
                                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                                  "  <span aria-hidden='true'>×</span>" +
                                                                "  </button>" +
                                                              "  </div>";
                            CheckBox1.Checked = false;
                            cop2.Text = null;
                            rcv2.Text = null;
                            tot2.Text = null;
                            Response.Cookies["Observaciones"].Value = "";

                            if (nombre_cop == null)
                            {
                                Reg.Text = reg_pat_RCV;
                                Raz_soc.Text = nombre_RCV;
                                subde = sub_RCV;
                                Response.Cookies["Cred_COP"].Value = "0";
                            }
                            else if (nombre_RCV == null)
                            {
                                Reg.Text = reg_pat_cop;
                                Raz_soc.Text = nombre_cop;
                                subde = sub_cop;
                                Response.Cookies["Cred_RCV"].Value = "0";
                            }
                            else if (nombre_cop != null && nombre_RCV != null)
                            {
                                Reg.Text = reg_pat_cop;
                                Raz_soc.Text = nombre_cop;
                                subde = sub_cop;
                            }

                            cop.Text = String.Format("{0:N2}", imp_cop);
                            rcv.Text = String.Format("{0:N2}", imp_RCV);
                            Tot.Text = String.Format("{0:N2}", (imp_cop + imp_RCV));
                            if (subde.Trim() == "1" || subde.Trim() == "01")
                            {
                                sub.Text = "TOLUCA";
                            }
                            else if (subde.Trim() == "5" || subde.Trim() == "05")
                            {
                                sub.Text = "NAUCALPAN";
                            }
                            Double rango1 = salario * 365;
                            Double rango2 = salario * 730;
                            Double rango3 = salario * 1460;
                            Double rango4 = salario * 9125;
                            Double rango5 = rango4 + 0.1;

                            if ((imp_cop + imp_RCV) <= 1)
                            {
                                Rango.Text = "MENOR A 1";
                            }
                            else if ((imp_cop + imp_RCV) >= 1 && (imp_cop + imp_RCV) <= rango1)
                            {
                                Rango.Text = "RANGO I";
                            }
                            else if ((imp_cop + imp_RCV) >= (rango1 + 0.1) && (imp_cop + imp_RCV) <= rango2)
                            {
                                Rango.Text = "RANGO II";
                            }
                            else if ((imp_cop + imp_RCV) >= (rango2 + 0.1) && (imp_cop + imp_RCV) <= rango3)
                            {
                                Rango.Text = "RANGO III";
                            }
                            else if ((imp_cop + imp_RCV) >= (rango3 + 0.1) && (imp_cop + imp_RCV) <= rango4)
                            {
                                Rango.Text = "RANGO IV";
                            }
                            else if ((imp_cop + imp_RCV) >= rango5)
                            {
                                Rango.Text = "RANGO V";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    LabelMensaje.Visible = true;
                    LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Consulta " + ex.Message + " </p>" +
                                                         " </div>" +
                                                         " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                          "  <span aria-hidden='true'>×</span>" +
                                                        "  </button>" +
                                                      "  </div>";
                }
            }
        }
        catch (Exception ex)
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Lectura Principal. " + ex.Message + " </p>" +
                                                 " </div>" +
                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                  "  <span aria-hidden='true'>×</span>" +
                                                "  </button>" +
                                              "  </div>";
        }

    }

    protected void Reg_Exped_Click(object sender, EventArgs e)
    {
        if (Reg.Text != "")
        {
            if (Raz_soc.Text != "")
            {
                if (Fecha_Recep.Text != "")
                {
                    DateTime rec = Convert.ToDateTime(Fecha_Recep.Text + " " + DateTime.Now.ToString("hh:mm:ss tt"));
                    if (Request.Cookies["Insert"].Value == "Nuevo")
                    {
                        //Literal5.Visible = true;
                        SqlConnection conex = new SqlConnection(con);
                        String sentencia = "INSERT INTO [Supervision].[dbo].[Registro_Expedientes] ([sub],[Registro_Patronal],[Razon_Social],[Fecha_Recepcion]" +
                                           ",[Rango],[socio],[no_cred_cop],[no_cred_rcv],[Importe_COP],[Importe_RCV],[Importe_Total],[Resp_Solid],[Importe_COP_2]" +
                                           ",[Importe_RCV_2],[Importe_Total_2],[user_regi],[estatus],[Obser])"
                                          + "VALUES(@sub, @Registro_Patronal,@Razon_Social, @Fecha_Recepcion" +
                                          ", @Rango, @socio, @no_cred_cop, @no_cred_rcv, @Importe_COP, @Importe_RCV, @Importe_Total, @Resp_Solid, @Importe_COP_2" +
                                          ", @Importe_RCV_2, @Importe_Total_2, @user_regi, @estatus, @Obser)";
                        SqlCommand comando = new SqlCommand(sentencia, conex);
                        int resultado;
                        try
                        {
                            conex.Open();
                            comando.Parameters.Add(new SqlParameter("@sub", SqlDbType.NVarChar, 10));
                            comando.Parameters["@sub"].Value = sub.Text;

                            comando.Parameters.Add(new SqlParameter("@Registro_Patronal", SqlDbType.NVarChar, 25));
                            comando.Parameters["@Registro_Patronal"].Value = Reg.Text;

                            comando.Parameters.Add(new SqlParameter("@Razon_Social", SqlDbType.NVarChar, 120));
                            comando.Parameters["@Razon_Social"].Value = Raz_soc.Text;

                            comando.Parameters.Add(new SqlParameter("@Fecha_Recepcion", SqlDbType.DateTime));
                            comando.Parameters["@Fecha_Recepcion"].Value = rec;

                            comando.Parameters.Add(new SqlParameter("@Rango", SqlDbType.NVarChar, 10));
                            comando.Parameters["@Rango"].Value = Rango.Text;

                            comando.Parameters.Add(new SqlParameter("@socio", SqlDbType.NVarChar, 500));
                            comando.Parameters["@socio"].Value = Socios.Text.ToUpper();

                            if (Request.Cookies["Cred_COP"].Value == null || Request.Cookies["Cred_COP"].Value == "" || Request.Cookies["Cred_COP"].Value == "0")
                            {
                                Response.Cookies["Cred_COP"].Value = "0";
                            }
                            if (Request.Cookies["Cred_RCV"].Value == null || Request.Cookies["Cred_RCV"].Value == "" || Request.Cookies["Cred_RCV"].Value == "0")
                            {
                                Response.Cookies["Cred_RCV"].Value = "0";
                            }

                            comando.Parameters.Add(new SqlParameter("@no_cred_cop", SqlDbType.Int));
                            comando.Parameters["@no_cred_cop"].Value = Request.Cookies["Cred_COP"].Value;

                            comando.Parameters.Add(new SqlParameter("@no_cred_rcv", SqlDbType.Int));
                            comando.Parameters["@no_cred_rcv"].Value = Request.Cookies["Cred_RCV"].Value;

                            comando.Parameters.Add(new SqlParameter("@Importe_COP", SqlDbType.Float));
                            comando.Parameters["@Importe_COP"].Value = cop.Text;

                            comando.Parameters.Add(new SqlParameter("@Importe_RCV", SqlDbType.Float));
                            comando.Parameters["@Importe_RCV"].Value = rcv.Text;

                            comando.Parameters.Add(new SqlParameter("@Importe_Total", SqlDbType.Float));
                            comando.Parameters["@Importe_Total"].Value = Tot.Text;

                            if (CheckBox1.Checked == false)
                            {
                                res = "";
                                cop2.Text = "0";
                                rcv2.Text = "0";
                                tot2.Text = "0";
                            }
                            if (CheckBox1.Checked == true)
                            {
                                res = "RESPONSABILIDAD SOLIDARIA";
                            }
                            comando.Parameters.Add(new SqlParameter("@Resp_Solid", SqlDbType.NVarChar, 25));
                            comando.Parameters["@Resp_Solid"].Value = res;

                            comando.Parameters.Add(new SqlParameter("@Importe_COP_2", SqlDbType.Float));
                            comando.Parameters["@Importe_COP_2"].Value = cop2.Text;

                            comando.Parameters.Add(new SqlParameter("@Importe_RCV_2", SqlDbType.Float));
                            comando.Parameters["@Importe_RCV_2"].Value = rcv2.Text;

                            comando.Parameters.Add(new SqlParameter("@Importe_Total_2", SqlDbType.Float));
                            comando.Parameters["@Importe_Total_2"].Value = tot2.Text;

                            comando.Parameters.Add(new SqlParameter("@user_regi", SqlDbType.NVarChar, 50));
                            comando.Parameters["@user_regi"].Value = Request.Cookies["Nombre_Sup"].Value;

                            comando.Parameters.Add(new SqlParameter("@estatus", SqlDbType.NVarChar, 50));
                            comando.Parameters["@estatus"].Value = "EN REVISION DEL DSC";

                            if (Request.Cookies["Observaciones"].Value == null || Request.Cookies["Observaciones"].Value == "" || Request.Cookies["Observaciones"].Value == "0")
                            {
                                obs = "";
                            }

                            comando.Parameters.Add(new SqlParameter("@Obser", SqlDbType.NVarChar, 3000));
                            comando.Parameters["@Obser"].Value = obs.Replace("%0d%0a", " ");

                            resultado = comando.ExecuteNonQuery();
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card green lighten-3'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Expediente Registrado Correctamente </p>" +
                                                                 " </div>" +
                                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                                  "  <span aria-hidden='true'>×</span>" +
                                                                "  </button>" +
                                                              "  </div>";
                            //Response.Redirect("Registro_expedientes_09.aspx");
                            Response.AppendHeader("Refresh", 2.5 + "; URL=Registro_expedientes_09.aspx");
                        }
                        catch (System.Exception d)
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : EXP_RCV " + d.Message + " </p>" +
                                                                 " </div>" +
                                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                                  "  <span aria-hidden='true'>×</span>" +
                                                                "  </button>" +
                                                              "  </div>";
                        }
                    }
                    else if (Request.Cookies["Insert"].Value == "Devuelto")
                    {
                        SqlConnection cnn = new SqlConnection(con);
                        try
                        {
                            cnn.Open();
                            string status = "EN REVISION DEL DSC";
                            SqlCommand cmd = new SqlCommand();
                            cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + status + "', [Fecha_Recepcion]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", rec) + "'  WHERE [id] = '" + Request.Cookies["ID_Dev"].Value + "' ";
                            cmd.Connection = cnn;
                            int rs = cmd.ExecuteNonQuery();
                            cmd.Connection.Close();
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta :Expediente Registrado Correctamente </p>" +
                                                                 " </div>" +
                                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                                  "  <span aria-hidden='true'>×</span>" +
                                                                "  </button>" +
                                                              "  </div>";
                            Response.AppendHeader("Refresh", 2.5 + "; URL=Registro_expedientes_09.aspx");
                        }
                        catch (Exception ex)
                        {
                            LabelMensaje.Visible = true;
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Error al Actualizar " + ex.Message + " </p>" +
                                                                 " </div>" +
                                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                                  "  <span aria-hidden='true'>×</span>" +
                                                                "  </button>" +
                                                              "  </div>";
                        }
                    }
                }
                else
                {
                    LabelMensaje.Visible = true;
                    LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Seleccione la Fecha de Recepción por favor </p>" +
                                                         " </div>" +
                                                         " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                          "  <span aria-hidden='true'>×</span>" +
                                                        "  </button>" +
                                                      "  </div>";
                }
            }
            else
            {
                LabelMensaje.Visible = true;
                LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Digite la Razon Social por favor </p>" +
                                                     " </div>" +
                                                     " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                      "  <span aria-hidden='true'>×</span>" +
                                                    "  </button>" +
                                                  "  </div>";
            }
        }
        else
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                                          <div class='card-content white-text'>
                                                            <p><i class='mdi-alert-error'></i> Alerta : Digite el Registro Patronal por favor </p>" +
                                                 " </div>" +
                                                 " <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>" +
                                                  "  <span aria-hidden='true'>×</span>" +
                                                "  </button>" +
                                              "  </div>";
        }
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {

        if (CheckBox1.Checked == false)
        {
            cop2.Enabled = false;
            rcv2.Enabled = false;
            cop2.Text = null;
            rcv2.Text = null;
            tot2.Text = null;
        }
        else if (CheckBox1.Checked == true)
        {
            cop2.Enabled = true;
            rcv2.Enabled = true;
            res = "RESPONSABILIDAD SOLIDARIA";
            Socios.Enabled = true;
        }
    }

    protected void rcv2_TextChanged(object sender, EventArgs e)
    {
        if (cop2.Text != "" && rcv2.Text != "")
        {
            tot2.Text = String.Format("{0:N2}", (Convert.ToDouble(cop2.Text) + Convert.ToDouble(rcv2.Text)));
        }

        if (cop2.Text == "")
        {
            cop2.Text = String.Format("{0:N2}", 0);
            tot2.Text = String.Format("{0:N2}", (Convert.ToDouble(rcv2.Text)));
        }
        if (rcv2.Text == "")
        {
            rcv2.Text = String.Format("{0:N2}", 0);
            tot2.Text = String.Format("{0:N2}", (Convert.ToDouble(cop2.Text)));
        }
    }

    protected void cop2_TextChanged(object sender, EventArgs e)
    {
        if (cop2.Text != "" && rcv2.Text != "")
        {
            tot2.Text = String.Format("{0:N2}", (Convert.ToDouble(cop2.Text) + Convert.ToDouble(rcv2.Text)));
        }
        if (cop2.Text == "")
        {
            cop2.Text = String.Format("{0:N2}", 0);
            tot2.Text = String.Format("{0:N2}", (Convert.ToDouble(rcv2.Text)));
        }
        if (rcv2.Text == "")
        {
            rcv2.Text = String.Format("{0:N2}", 0);
            tot2.Text = String.Format("{0:N2}", (Convert.ToDouble(cop2.Text)));
        }
    }
    
}