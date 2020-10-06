using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.OleDb;
using System.IO;

public partial class SUA_Trabajador : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            for (int i = DateTime.Now.Year; i >= 1997; i--)
            {
                this.anio1.Items.Add(i.ToString());
                this.anio2.Items.Add(i.ToString());
            }
            string value = ConfigurationManager.AppSettings["sub"].ToString();
            string text = ConfigurationManager.AppSettings["sub_nom"].ToString();
            string[] value1 = value.Split(',');
            string[] text1 = text.Split(',');

            for (int i = 0; i < text1.Length; i++)
            {
                ListItem li = new ListItem(text1[i], value1[i]);
                sub.Items.Add(li);

            }
        }
    }
    public string obtenerNombreMesNumero(int numeroMes)
    {
        try
        {
            if (Convert.ToString(numeroMes).Length == 1)
            {
                return "0" + numeroMes;
            }
            else
            {
                return Convert.ToString(numeroMes);
            }
        }
        catch
        {
            return "Desconocido";
        }
    }
}