using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Web;
using System.Net;

public partial class Admin_Rtp : System.Web.UI.Page
{
    ReportDocument crystalReport = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Rep"].ToString() == "Anteriores")
        {
            crystalReport.Load(Server.MapPath("../Admin/Reportes/Tipo_doc.rpt"));
            CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
            CrystalDecisions.Shared.ParameterDiscreteValue ejer = new ParameterDiscreteValue();
            sub.Value = Session["Sub_Ant"].ToString();
            ejer.Value = Session["Enca"].ToString();
            string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            string ClientIP = GetIP4Address();
            ClientIP = ClientIP.Replace(".", "_");
            string tabla = "Sit_Cat_" + ClientIP;
            DataSet1 dsCustomers = GetData("SELECT [id_inc],[inc], CASE WHEN CONVERT(NVARCHAR,[Cred_00]) = '0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_00] > 0 THEN CONVERT(NVARCHAR,[Cred_00]) END AS [Cred_00] ,[Impor_00],CASE WHEN CONVERT(NVARCHAR,[Cred_1_2])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_1_2] > 0 THEN CONVERT(NVARCHAR,[Cred_1_2]) END AS [Cred_1_2] ,[Impor_1_2],CASE WHEN CONVERT(NVARCHAR,[Cred_3])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_3] > 0 THEN CONVERT(NVARCHAR,[Cred_3]) END AS [Cred_3] ,[Import_3],CASE WHEN CONVERT(NVARCHAR,[Cred_50_61])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_50_61] > 0 THEN CONVERT(NVARCHAR,[Cred_50_61]) END AS [Cred_50_61] ,[Import_50_61] ,CASE WHEN CONVERT(NVARCHAR,[Cred_80_89])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_80_89] > 0 THEN CONVERT(NVARCHAR,[Cred_80_89]) END AS [Cred_80_89] ,[Import_80_89],CASE WHEN CONVERT(NVARCHAR,[Cred_70_71])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_70_71] > 0 THEN CONVERT(NVARCHAR,[Cred_70_71]) END AS [Cred_70_71],[Impor_70_71],CASE WHEN CONVERT(NVARCHAR,[Cred_tot])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_tot] > 0 THEN CONVERT(NVARCHAR,[Cred_tot]) END AS [Cred_tot] ,[Impor_Tot]  FROM [Supervision].[dbo].[" + tabla + "]");
            crystalReport.SetDataSource(dsCustomers);
            crystalReport.ParameterFields[0].CurrentValues.Add(sub);
            crystalReport.ParameterFields[1].CurrentValues.Add(ejer);
            CrystalReportViewer1.ReportSource = crystalReport;
            crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
        }
        else if (Session["Rep"].ToString() == "Vigor")
        {
            crystalReport.Load(Server.MapPath("../Admin/Reportes/Tipo_doc.rpt"));
            CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
            CrystalDecisions.Shared.ParameterDiscreteValue ejer = new ParameterDiscreteValue();
            sub.Value = Session["Sub_Ant"].ToString();
            ejer.Value = Session["Enca"].ToString();
            string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            string ClientIP = GetIP4Address();
            ClientIP = ClientIP.Replace(".", "_");
            string tabla = "Sit_Cat_" + ClientIP;
            DataSet1 dsCustomers = GetData("SELECT [id_inc],[inc], CASE WHEN CONVERT(NVARCHAR,[Cred_00]) = '0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_00] > 0 THEN CONVERT(NVARCHAR,[Cred_00]) END AS [Cred_00] ,[Impor_00],CASE WHEN CONVERT(NVARCHAR,[Cred_1_2])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_1_2] > 0 THEN CONVERT(NVARCHAR,[Cred_1_2]) END AS [Cred_1_2] ,[Impor_1_2],CASE WHEN CONVERT(NVARCHAR,[Cred_3])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_3] > 0 THEN CONVERT(NVARCHAR,[Cred_3]) END AS [Cred_3] ,[Import_3],CASE WHEN CONVERT(NVARCHAR,[Cred_50_61])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_50_61] > 0 THEN CONVERT(NVARCHAR,[Cred_50_61]) END AS [Cred_50_61] ,[Import_50_61] ,CASE WHEN CONVERT(NVARCHAR,[Cred_80_89])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_80_89] > 0 THEN CONVERT(NVARCHAR,[Cred_80_89]) END AS [Cred_80_89] ,[Import_80_89],CASE WHEN CONVERT(NVARCHAR,[Cred_70_71])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_70_71] > 0 THEN CONVERT(NVARCHAR,[Cred_70_71]) END AS [Cred_70_71],[Impor_70_71],CASE WHEN CONVERT(NVARCHAR,[Cred_tot])='0' THEN CONVERT(NVARCHAR,' -- ') WHEN [Cred_tot] > 0 THEN CONVERT(NVARCHAR,[Cred_tot]) END AS [Cred_tot] ,[Impor_Tot]  FROM [Supervision].[dbo].[" + tabla + "]");
            crystalReport.SetDataSource(dsCustomers);
            crystalReport.ParameterFields[0].CurrentValues.Add(sub);
            crystalReport.ParameterFields[1].CurrentValues.Add(ejer);
            CrystalReportViewer1.ReportSource = crystalReport;
            crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
        }
        else if (Session["Rep"].ToString() == "CompaXInci")
        {
            crystalReport.Load(Server.MapPath("../Admin/Reportes/Comp_Inci.rpt"));
            CrystalDecisions.Shared.ParameterDiscreteValue enca = new ParameterDiscreteValue();
            CrystalDecisions.Shared.ParameterDiscreteValue inci = new ParameterDiscreteValue();
            CrystalDecisions.Shared.ParameterDiscreteValue uno = new ParameterDiscreteValue();
            CrystalDecisions.Shared.ParameterDiscreteValue dos = new ParameterDiscreteValue();
            enca.Value = Session["Sub_Ant"].ToString();
            inci.Value = Session["Inci"].ToString();
            uno.Value = Session["uno"].ToString();
            dos.Value = Session["dos"].ToString();

            /*Carga informacion del Resumen del Primer Detalle*/
            string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            string ClientIP1 = GetIP4Address();
            ClientIP1 = ClientIP1.Replace(".", "_");
            string tabla1 = "Rngo_D_" + ClientIP1;
            string query = "SELECT [Id_rango],[rango_dias],[credito_uno],[importe_uno],[credito_dos],[importe_dos],[Cred_dif],[importe_dif] FROM [Supervision].[dbo].[" + tabla1 + "]";
            SqlCommand cmd = new SqlCommand(query);
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter sda1 = new SqlDataAdapter();
            cmd.Connection = con;
            sda1.SelectCommand = cmd;
            DataSet1 dt2 = new DataSet1();
            sda1.Fill(dt2, "DataTable5");
            /*Fin*/

            crystalReport.SetDataSource(dt2);
            crystalReport.ParameterFields[0].CurrentValues.Add(enca);
            crystalReport.ParameterFields[1].CurrentValues.Add(inci);
            crystalReport.ParameterFields[2].CurrentValues.Add(uno);
            crystalReport.ParameterFields[3].CurrentValues.Add(dos);
            CrystalReportViewer1.ReportSource = crystalReport;
            crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
        }
        else if (Session["Rep"].ToString() == "PIC")
        {
            crystalReport.Load(Server.MapPath("../Admin/Reportes/Impe_Cobro.rpt"));
            CrystalDecisions.Shared.ParameterDiscreteValue enca = new ParameterDiscreteValue();
            CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
            enca.Value = Session["Enca"].ToString();
            sub.Value = Session["Sub_Ant"].ToString();
            /*Carga informacion del Resumen del Primer Detalle*/
            string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            string ClientIP1 = GetIP4Address();
            ClientIP1 = ClientIP1.Replace(".", "_");
            string tabla1 = "ImpCob_" + ClientIP1;
            string query = " SELECT CASE WHEN [reg_pat] IS NULL THEN NULL WHEN [reg_pat] IS NOT NULL THEN [id] END [id],[reg_pat] ,[razon],[cred_6],[dias_6],[impo_6],[cred_9],[dias_9],[impo_9],[cred_10],[dias_10],[impo_10],[cred_12],[dias_12],[impo_12],[cred_14],[dias_14],[impo_14],[cred_19],[dias_19],[impo_19],[cred_26],[dias_26],[impo_26],[cred_tot],[dias_tot],[impo_tot] FROM [Supervision].[dbo].[" + tabla1 + "]";
            SqlCommand cmd = new SqlCommand(query);
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter sda1 = new SqlDataAdapter();
            cmd.Connection = con;
            sda1.SelectCommand = cmd;
            DataSet1 dt2 = new DataSet1();
            sda1.Fill(dt2, "DataTable6");
            /*Fin*/
            crystalReport.SetDataSource(dt2);
            crystalReport.ParameterFields[0].CurrentValues.Add(sub);
            crystalReport.ParameterFields[1].CurrentValues.Add(enca);
            CrystalReportViewer1.ReportSource = crystalReport;
            crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
        }
        else if (Session["Rep"].ToString() == "PIC_dtalle")
        {
            crystalReport.Load(Server.MapPath("../Admin/Reportes/Impe_Cobro_dtlle.rpt"));
            CrystalDecisions.Shared.ParameterDiscreteValue enca = new ParameterDiscreteValue();
            CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
            enca.Value = Session["Enca"].ToString();
            sub.Value = Session["Sub_Ant"].ToString();
            /*Carga informacion del Resumen del Primer Detalle*/
            string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            string ClientIP1 = GetIP4Address();
            ClientIP1 = ClientIP1.Replace(".", "_");
            string tabla1 = "Imp_" + ClientIP1;
            string query = "SELECT [pat6],[cred_6],[dias_6],[impo_6],[pat_9],[cred_9],[dias_9],[impo_9],[pat_10],[cred_10],[dias_10],[impo_10],[pat_12],[cred_12],[dias_12],[impo_12],[pat_14],[cred_14],[dias_14],[impo_14],[pat_19],[cred_19],[dias_19],[impo_19],[pat_26],[cred_26],[dias_26],[impo_26],[pat_tot],[cred_tot],[dias_tot],[impo_tot] FROM [Supervision].[dbo].[" + tabla1 + "]";
            SqlCommand cmd = new SqlCommand(query);
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter sda1 = new SqlDataAdapter();
            cmd.Connection = con;
            sda1.SelectCommand = cmd;
            DataSet1 dt2 = new DataSet1();
            sda1.Fill(dt2, "DataTable7");
            /*Fin*/
            crystalReport.SetDataSource(dt2);
            crystalReport.ParameterFields[0].CurrentValues.Add(sub);
            crystalReport.ParameterFields[1].CurrentValues.Add(enca);
            CrystalReportViewer1.ReportSource = crystalReport;
            crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
        }
        else if (Session["Rep"].ToString() == "ECO")
        {
            crystalReport.Load(Server.MapPath("../Admin/Reportes/Eco.rpt"));
            CrystalDecisions.Shared.ParameterDiscreteValue enca = new ParameterDiscreteValue();
            CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
            enca.Value = Session["Enca"].ToString();
            sub.Value = Session["Sub_Ant"].ToString();
            /*Carga informacion del Resumen del Primer Detalle*/
            string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            string ClientIP1 = GetIP4Address();
            ClientIP1 = ClientIP1.Replace(".", "_");
            string tabla1 = "EcoXinc_" + ClientIP1;
            string query = "SELECT [id],[descrip],[cred],[dias],[impor],[fecha],[cred2],[dias2],[impor2],[fecha2],[cred3],[dias3],[impor3],[fecha3],[cred4],[dias4],[impor4],[fecha4],[cred5],[dias5],[impor5],[fecha5],[cred6],[dias6],[impor6],[fecha6] FROM [Supervision].[dbo].[" + tabla1 + "]";
            SqlCommand cmd = new SqlCommand(query);
            SqlConnection con = new SqlConnection(conString);
            SqlDataAdapter sda1 = new SqlDataAdapter();
            cmd.Connection = con;
            sda1.SelectCommand = cmd;
            DataSet1 dt2 = new DataSet1();
            sda1.Fill(dt2, "DataTable8");
            /*Fin*/
            /*Carga informacion del Resumen del Primer Detalle*/
            ClientIP1 = ClientIP1.Replace(".", "_");
            string tabla2 = "EcoRmen_" + ClientIP1;
            string query2 = "SELECT [id],[descrip],[cred],[dias],[impor],[fecha] FROM [Supervision].[dbo].[" + tabla2 + "]";
            SqlCommand cmd2 = new SqlCommand(query2);
            SqlConnection con2 = new SqlConnection(conString);
            SqlDataAdapter sda12 = new SqlDataAdapter();
            cmd2.Connection = con2;
            sda12.SelectCommand = cmd2;
            DataSet1 dt1 = new DataSet1();
            sda12.Fill(dt1, "DataTable9");
            /*Fin*/
            crystalReport.SetDataSource(dt2);
            crystalReport.OpenSubreport("eco_por_incidencia.rpt").SetDataSource(dt1);
            crystalReport.ParameterFields[0].CurrentValues.Add(sub);
            crystalReport.ParameterFields[1].CurrentValues.Add(enca);
            CrystalReportViewer1.ReportSource = crystalReport;
            crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");

        }
    }
    protected void CrystalReportViewer1_Unload(object sender, EventArgs e)
    {
        crystalReport.Close();
        CrystalReportViewer1.Dispose();
        crystalReport.Dispose();
    }
    private DataSet1 GetData(string query)
    {
        string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlCommand cmd = new SqlCommand(query);
        using (SqlConnection con = new SqlConnection(conString))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter())
            {
                cmd.Connection = con;

                sda.SelectCommand = cmd;
                using (DataSet1 dsCustomers = new DataSet1())
                {
                    sda.Fill(dsCustomers, "DataTable4");
                    return dsCustomers;
                }
            }
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