using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master_Master09 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["Nombre_Sup"] != null)
        {
            if (Request.Cookies["Tipo_Sup"].Value == "0" || Request.Cookies["Tipo_Sup"].Value == "1")
            {
                if (Request.Cookies["Nombre_Sup"].Value.Length > 30)
                {
                    LabelNombreUsuario.Text = Request.Cookies["Nombre_Sup"].Value.Substring(0, 30);
                }
                else
                {
                    LabelNombreUsuario.Text = Request.Cookies["Nombre_Sup"].Value;
                }
                if (Request.Cookies["Cargo_Sup"].Value.Length > 30)
                {
                    LabelCargo.Text = Request.Cookies["Cargo_Sup"].Value.Substring(0, 30);
                }
                else
                {
                    LabelCargo.Text = Request.Cookies["Cargo_Sup"].Value;
                }
                if (Request.Cookies["Sub_Sup"].Value == "01")
                {
                    LabelSubdelegacion.Text = "Subdelegación Toluca";
                }
                else if (Request.Cookies["Sub_Sup"].Value == "05")
                {
                    LabelSubdelegacion.Text = "Subdelegación Naucalpan";
                }
                else
                {
                    LabelSubdelegacion.Text = "";
                }
            }
            else
            {
                Response.Redirect("~/Admin/Bloqueo.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Cookies["ID_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["User_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Nombre_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Del_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Sub_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Tipo_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Depto_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Redirect("~/Default.aspx");
    }
}
