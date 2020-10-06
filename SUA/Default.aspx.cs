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
public partial class SUA_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            for (int i = DateTime.Now.Year; i >= 1997; i--)
            {
                this.anio.Items.Add(i.ToString());
            }
            string value = ConfigurationManager.AppSettings["sub"].ToString();
            string text = ConfigurationManager.AppSettings["sub_nom"].ToString();
            string[] value1 = value.Split(',');
            string[] text1 = text.Split(',');
  
            for(int i=0; i < text1.Length; i++)
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
            DateTimeFormatInfo formatoFecha = CultureInfo.CurrentCulture.DateTimeFormat;
            string nombreMes = formatoFecha.GetMonthName(numeroMes).ToUpper();
            return nombreMes;
        }
        catch
        {
            return "Desconocido";
        }
    }
    public string rellena(string texto, string con, int largo)
    {
        string res = texto;
        while ((res.Length < largo)) 
        {
            res = (con + res);
        }
        
        return res;
    }
}