using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using System.IO;
using System.Net;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Nombre_Sup"] != null)
        {
            Response.Redirect("~/Admin/Default.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //Configuracion de Cadena de conexion
        string conexion5 = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(conexion5);
        try
        {
            //Consulta para la busqueda del usuario dentro del la BD con los datos que se requieren del usuario
            SqlCommand command = new SqlCommand("SELECT T1.[id], T2.[nombre], T1.[del], T1.[sub], [user_type], [cargo],[depto], [user] FROM [Supervision].[dbo].[User] T1 INNER JOIN [Panel_Control].[dbo].[Usuarios] T2 ON T1.[id]=T2.[id] WHERE T2.[user]='" + inputusuario.Text + "' AND T2.[pass]='" + inputpassword.Text + "' AND T1.[id]=T2.[id]", conn);
            conn.Open();
            //ejecucion de la consulta
            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    //Asignacion de variables a cookies
                    Int32 id = reader.GetInt32(0);
                    Response.Cookies["ID_Sup"].Value = Convert.ToString(id);
                    Response.Cookies["Nombre_Sup"].Value = string.Format(reader.GetString(1));
                    Response.Cookies["Del_Sup"].Value = string.Format(reader.GetString(2));
                    Response.Cookies["Sub_Sup"].Value = string.Format(reader.GetString(3));
                    Response.Cookies["Tipo_Sup"].Value = string.Format(reader.GetString(4));
                    Response.Cookies["Cargo_Sup"].Value = string.Format(reader.GetString(5));
                    Response.Cookies["Depto_Sup"].Value = string.Format(reader.GetString(6));
                    Response.Cookies["User_Sup"].Value = string.Format(reader.GetString(7));
                    
                    Response.Cookies["ID_Sup"].Expires = DateTime.Now.AddYears(2);
                    Response.Cookies["Nombre_Sup"].Expires = DateTime.Now.AddYears(2);
                    Response.Cookies["Del_Sup"].Expires = DateTime.Now.AddYears(2);
                    Response.Cookies["Sub_Sup"].Expires = DateTime.Now.AddYears(2);
                    Response.Cookies["Tipo_Sup"].Expires = DateTime.Now.AddYears(2);
                    Response.Cookies["Cargo_Sup"].Expires = DateTime.Now.AddYears(2);
                    Response.Cookies["Depto_Sup"].Expires = DateTime.Now.AddYears(2);
                    Response.Cookies["User_Sup"].Expires = DateTime.Now.AddYears(2);
                    Class1.Seguridad(id, Request.Cookies["Del_Sup"].Value, Request.Cookies["Sub_Sup"].Value, "Inicio Sesion", "SISCO", Request.Cookies["Nombre_Sup"].Value, GetIP4Address());
                }
                if (Request.Cookies["Tipo_Sup"].Value == "0" || Request.Cookies["Tipo_Sup"].Value == "1" || Request.Cookies["Tipo_Sup"].Value == "2" || Request.Cookies["Tipo_Sup"].Value == "3")
                {
                    //Redirecciona a la siguiente pagina ya que el usuario es correcto
                    Response.Redirect("~/Admin/Default.aspx");
                }
                else
                {
                    //El usuario y contraseña son incorrectos
                    Response.Write("<script language=javascript>alert('" + "El Usuario NO tiene los Permisos Para Acceder" + "');</script>");
                }
            }
            else
            {
                //El usuario y contraseña son incorrectos
                Response.Write("<script language=javascript>alert('" + "El Usuario y Contraseña No son Correctos" + "');</script>");
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script language=javascript>alert('" + ex.Message + "');</script>");
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
}