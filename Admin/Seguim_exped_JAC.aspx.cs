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

public partial class Admin_Control_exp_inc09_Seguim_exped_JAC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Aceptado")
        {
            int index = Int32.Parse((string)e.CommandArgument);
            string Code = (string)GridView1.DataKeys[index].Values["Registro_Patronal"];

            string conex = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            SqlConnection cnn = new SqlConnection(conex);
            try
            {
                cnn.Open();
                string status = "EN AUTORIZACION DEL C. DELEGADO";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + status + "', [fec_env_del3]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "'  WHERE [Registro_Patronal] = '" + Code + "' ";
                cmd.Connection = cnn;
                int rs = cmd.ExecuteNonQuery();
                cmd.Connection.Close();
                Response.Redirect("Seguim_exped_JAC.aspx");
            }
            catch (Exception ex)
            {
                Literal5.Text = ex.Message + "Error ACTUALIZAR";
            }
        }
        else if (e.CommandName == "Rechazado")
        {
            int index = Int32.Parse((string)e.CommandArgument);
            string Code = (string)GridView1.DataKeys[index].Values["Registro_Patronal"];
            int id = (int)GridView1.DataKeys[index].Values["id"];
            Session["id_expediente"] = Convert.ToString(id);
            Session["Reg_Patronal_Rechazado"] = Code;
            Session["Tipo"] = "JAC";
            Server.Transfer("Dev_Expedi.aspx");
        }
    }
}