using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Admin_Control_exp_inc09_Estatus_exp_inc_09 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string _estado = DataBinder.Eval(e.Row.DataItem, "estatus").ToString();

            if (_estado == "DEVOLUCION A LA SUBDELEGACION")
                e.Row.Cells[16].BackColor = Color.FromName("#F44F62");
            else if (_estado == "EN REVISION DEL DSC")
                e.Row.Cells[16].BackColor = Color.FromName("#ffeb9c");
            else if (_estado == "AUTORIZACION DE JDSC")
                e.Row.Cells[16].BackColor = Color.FromName("#B0FAFB");
            else if (_estado == "AUTORIZACION JAC")
                e.Row.Cells[16].BackColor = Color.FromName("#FA9066");
            else if (_estado == "EN AUTORIZACION DEL C. DELEGADO")
                e.Row.Cells[16].BackColor = Color.FromName("#73B7FA");
            else if (_estado == "EN AUTORIZACION DEL HCCD")
                e.Row.Cells[16].BackColor = Color.FromName("#49D304");
            else if (_estado == "CONCLUIDO")
                e.Row.Cells[16].BackColor = Color.FromName("#c6efce");
        }
    }
}