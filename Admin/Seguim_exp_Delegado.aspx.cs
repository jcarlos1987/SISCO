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

public partial class Admin_Control_exp_inc09_Seguim_exp_Delegado : System.Web.UI.Page
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

            string Ran = (string)GridView1.DataKeys[index].Values["Rango"];
            string status = "";
            if (Ran == "RANGO III" || Ran == "RANGO IV" || Ran == "RESPONSABILIDAD SOLIDARIA")
            {
                Session["Reg_Patronal_Rechazado"] = Code;
                Server.Transfer("Autorizados.aspx");
            }
            else if (Ran == "RANGO V")
            {
                status = "EN AUTORIZACION DEL HCCD";
                Actualizar(status, Code);
                Response.Redirect("Seguim_exp_Delegado.aspx");
            }
        }
        else if (e.CommandName == "Rechazado")
        {
            int index = Int32.Parse((string)e.CommandArgument);
            string Code = (string)GridView1.DataKeys[index].Values["Registro_Patronal"];
            int id = (int)GridView1.DataKeys[index].Values["id"];
            Session["id_expediente"] = Convert.ToString(id);
            Session["Reg_Patronal_Rechazado"] = Code;
            Session["Tipo"] = "DELEGADO";
            Server.Transfer("Dev_Expedi.aspx");
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
            cmd.CommandText = "UPDATE [Supervision].[dbo].[Registro_Expedientes] SET [estatus] ='" + estado + "', [fec_env_hcc4]='" + String.Format("{0: dd/MM/yyyy hh:mm:ss}", DateTime.Now) + "'  WHERE [Registro_Patronal] = '" + Reg_Pat + "' ";
            cmd.Connection = cnn;
            int rs = cmd.ExecuteNonQuery();
            cmd.Connection.Close();
        }
        catch (Exception ex)
        {
            Literal5.Text = ex.Message + "Error ACTUALIZAR";
        }
    }
}