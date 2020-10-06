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
public partial class Admin_Control_exp_inc09_Seguim_exped_HCCD : System.Web.UI.Page
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

            if (Ran == "RANGO V")
            {
                Session["Reg_Patronal_Rechazado"] = Code;
                Server.Transfer("Cancelacion.aspx");
            }
        }
        else if (e.CommandName == "Rechazado")
        {
            int index = Int32.Parse((string)e.CommandArgument);
            string Code = (string)GridView1.DataKeys[index].Values["Registro_Patronal"];
            int id = (int)GridView1.DataKeys[index].Values["id"];
            Session["id_expediente"] = Convert.ToString(id);
            Session["Reg_Patronal_Rechazado"] = Code;
            Session["Tipo"] = "HCCD";
            Server.Transfer("Dev_Expedi.aspx");
        }
    }
}