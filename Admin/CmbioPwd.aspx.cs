using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class Admin_CmbioPwd : System.Web.UI.Page
{
    String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
    }
    protected void PassAnterior_TextChanged(object sender, EventArgs e)
    {
        SqlConnection conn1 = new SqlConnection(strConnString);
        try
        {
            SqlCommand command = new SqlCommand("SELECT T1.[id], T2.[nombre], T1.[del], T1.[sub], [user_type], [cargo],[depto] FROM [Supervision].[dbo].[User] T1 INNER JOIN [Panel_Control].[dbo].[Usuarios] T2 ON T1.[id]=T2.[id] WHERE T2.[user]='" + Request.Cookies["User_Sup"].Value + "' AND T2.[pass]='" + PassAnterior.Text + "' AND T1.[id]=T2.[id]", conn1);
            conn1.Open();
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                LabelErrorPass.Text = "";
                PassAnterior.Attributes.Add("value", PassAnterior.Text);
                PassNueva.Focus();
            }
            else
            {
                PassAnterior.Attributes.Add("value", PassAnterior.Text);
                PassAnterior.Focus();
                LabelErrorPass.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : La Constraseña Ingresada no es la correcta. Intenta de nuevo por favor. </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
            }
        }
        catch (Exception Msj)
        {
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta :" + Msj.Message + " </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";

        }
    }
    protected void Reporte_Click(object sender, EventArgs e)
    {
        if (PassAnterior.Text != "")
        {
            if (PassNueva.Text != "")
            {
                if (PassConfirmacion.Text != "")
                {
                    if (PassNueva.Text.Equals(PassConfirmacion.Text))
                    {
                        SqlConnection conn1 = new SqlConnection(strConnString);
                        try
                        {
                            conn1.Open();
                            string sql = null;
                            sql = "UPDATE [Panel_Control].[dbo].[Usuarios] SET [pass] = @PASSWORD WHERE [user] = @USER AND [pass] = @PASS";
                            SqlCommand cmd = new SqlCommand(sql, conn1);

                            cmd.Parameters.Add("@PASSWORD", SqlDbType.NVarChar, 50);
                            cmd.Parameters["@PASSWORD"].Value = PassNueva.Text;

                            cmd.Parameters.Add("@USER", SqlDbType.NVarChar, 50);
                            cmd.Parameters["@USER"].Value = Request.Cookies["User_Sup"].Value;

                            cmd.Parameters.Add("@PASS", SqlDbType.NVarChar, 50);
                            cmd.Parameters["@PASS"].Value = PassAnterior.Text;

                            cmd.Connection = conn1;
                            int rs = cmd.ExecuteNonQuery();
                            cmd.Connection.Close();
                            if (rs == 1)
                            {
                                Response.Cookies["ID_Sup"].Expires = DateTime.Now.AddYears(-2);
                                Response.Cookies["User_Sup"].Expires = DateTime.Now.AddYears(-2);
                                Response.Cookies["Nombre_Sup"].Expires = DateTime.Now.AddYears(-2);
                                Response.Cookies["Del_Sup"].Expires = DateTime.Now.AddYears(-2);
                                Response.Cookies["Sub_Sup"].Expires = DateTime.Now.AddYears(-2);
                                Response.Cookies["Tipo_Sup"].Expires = DateTime.Now.AddYears(-2);
                                Response.Cookies["Depto_Sup"].Expires = DateTime.Now.AddYears(-2);
                                Response.Redirect("CmbioPwd.aspx");
                            }
                        }
                        catch (Exception Excep)
                        {
                            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta :" + Excep.Message + " </p>" +
                                    @"</div>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Confirma los campos de Contraseña por favor. Intenta de nuevo por favor. </p>" +
                                    @"</div>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Ingrese la Confirmación de la Contraseña por favor. Intente de nuevo por favor. </p>" +
                                    @"</div>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Ingrese la Nueva Contraseña por favor. Intente de nuevo por favor. </p>" +
                                    @"</div>
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
                                      <p><i class='mdi-alert-error'></i> Alerta : Ingrese la Contraseña Anterior por favor. Intente de nuevo por favor. </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>"; 
        }
    }
}