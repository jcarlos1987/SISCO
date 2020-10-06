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

public partial class Admin_Rpt : System.Web.UI.Page
{
    ReportDocument crystalReport = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        /*******************************************/
        /*Inicio para crear reporte de Base de Datos de Excel VS Rale*/
        /*******************************************/
        /*******************************************/
        if (Session["Reporte"].ToString() == "BaseExcel")
        {
            if (Session["Grilla2"].ToString() != "0" && Session["Grilla5"].ToString() != "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = "DEPURACION DE LA BASE DE DATOS PROPORCIONADA POR LA UNIDAD DE FISCALIZACION Y COBRANZA";
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                /*Carga informacion del Resumen del Primer Detalle*/
                string ClientIP1 = GetIP4Address();
                ClientIP1 = ClientIP1.Replace(".", "_");
                string tabla1 = "Rpt_Deta_" + ClientIP1;
                string query = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla1 + "]";
                SqlCommand cmd = new SqlCommand(query);
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                cmd.Connection = con;
                sda1.SelectCommand = cmd;
                DataSet1 dt2 = new DataSet1();
                sda1.Fill(dt2, "DataTable2");
                /*Fin*/
                /*Carga informacion del Resumen del Segundo detalle*/
                string ClientIP2 = GetIP4Address();
                ClientIP2 = ClientIP2.Replace(".", "_");
                string tabla2 = "Rpt_DetDOS_" + ClientIP2;
                string query2 = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[inc],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla2 + "]";
                SqlCommand cmd2 = new SqlCommand(query2);
                SqlConnection con2 = new SqlConnection(conString);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                cmd2.Connection = con2;
                sda2.SelectCommand = cmd2;
                DataSet1 dt4 = new DataSet1();
                sda2.Fill(dt4, "DataTable3");
                /*Fin*/
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_uno.rpt").SetDataSource(dt2);
                crystalReport.OpenSubreport("Dtle_dos.rpt").SetDataSource(dt4);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
            else if (Session["Grilla5"].ToString() == "0" && Session["Grilla2"].ToString() != "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias1.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = "DEPURACION DE LA BASE DE DATOS PROPORCIONADA POR LA UNIDAD DE FISCALIZACION Y COBRANZA";
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                /*Carga informacion del Resumen del Primer Detalle*/
                string ClientIP1 = GetIP4Address();
                ClientIP1 = ClientIP1.Replace(".", "_");
                string tabla1 = "Rpt_Deta_" + ClientIP1;
                string query = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla1 + "]";
                SqlCommand cmd = new SqlCommand(query);
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                cmd.Connection = con;
                sda1.SelectCommand = cmd;
                DataSet1 dt2 = new DataSet1();
                sda1.Fill(dt2, "DataTable2");
                /*Fin*/               
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_uno.rpt").SetDataSource(dt2);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
            else if (Session["Grilla2"].ToString() == "0" && Session["Grilla5"].ToString() != "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias2.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = "DEPURACION DE LA BASE DE DATOS PROPORCIONADA POR LA UNIDAD DE FISCALIZACION Y COBRANZA";
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
               
                /*Carga informacion del Resumen del Segundo detalle*/
                string ClientIP2 = GetIP4Address();
                ClientIP2 = ClientIP2.Replace(".", "_");
                string tabla2 = "Rpt_DetDOS_" + ClientIP2;
                string query2 = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[inc],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla2 + "]";
                SqlCommand cmd2 = new SqlCommand(query2);
                SqlConnection con2 = new SqlConnection(conString);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                cmd2.Connection = con2;
                sda2.SelectCommand = cmd2;
                DataSet1 dt4 = new DataSet1();
                sda2.Fill(dt4, "DataTable3");
                /*Fin*/
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_dos.rpt").SetDataSource(dt4);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");/**/
            }
            else if (Session["Grilla2"].ToString() == "0" && Session["Grilla5"].ToString() == "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias3.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = "DEPURACION DE LA BASE DE DATOS PROPORCIONADA POR LA UNIDAD DE FISCALIZACION Y COBRANZA";
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
           
        }
            /*******************************************/
            /*Inicio para crear reporte de Rale VS Rale*/
            /*******************************************/
            /*******************************************/
        else if (Session["Reporte"].ToString() == "RaleVSRale")
        {
            if (Session["Grilla2"].ToString() != "0" && Session["Grilla5"].ToString() != "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = "CREDITOS " + Session["Consulta"].ToString();
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                /*Carga informacion del Resumen del Primer Detalle*/
                string ClientIP1 = GetIP4Address();
                ClientIP1 = ClientIP1.Replace(".", "_");
                string tabla1 = "Rpt_Deta_" + ClientIP1;
                string query = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla1 + "]";
                SqlCommand cmd = new SqlCommand(query);
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                cmd.Connection = con;
                sda1.SelectCommand = cmd;
                DataSet1 dt2 = new DataSet1();
                sda1.Fill(dt2, "DataTable2");
                /*Fin*/
                /*Carga informacion del Resumen del Segundo detalle*/
                string ClientIP2 = GetIP4Address();
                ClientIP2 = ClientIP2.Replace(".", "_");
                string tabla2 = "Rpt_DetDOS_" + ClientIP2;
                string query2 = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[inc],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla2 + "]";
                SqlCommand cmd2 = new SqlCommand(query2);
                SqlConnection con2 = new SqlConnection(conString);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                cmd2.Connection = con2;
                sda2.SelectCommand = cmd2;
                DataSet1 dt4 = new DataSet1();
                sda2.Fill(dt4, "DataTable3");
                /*Fin*/
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_uno.rpt").SetDataSource(dt2);
                crystalReport.OpenSubreport("Dtle_dos.rpt").SetDataSource(dt4);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
            else if (Session["Grilla5"].ToString() == "0" && Session["Grilla2"].ToString() != "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias1.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = "CREDITOS " + Session["Consulta"].ToString();
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                /*Carga informacion del Resumen del Primer Detalle*/
                string ClientIP1 = GetIP4Address();
                ClientIP1 = ClientIP1.Replace(".", "_");
                string tabla1 = "Rpt_Deta_" + ClientIP1;
                string query = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla1 + "]";
                SqlCommand cmd = new SqlCommand(query);
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                cmd.Connection = con;
                sda1.SelectCommand = cmd;
                DataSet1 dt2 = new DataSet1();
                sda1.Fill(dt2, "DataTable2");
                /*Fin*/               
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_uno.rpt").SetDataSource(dt2);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
            if (Session["Grilla2"].ToString() == "0" && Session["Grilla5"].ToString() != "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias2.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = "CREDITOS " + Session["Consulta"].ToString();
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                
                /*Carga informacion del Resumen del Segundo detalle*/
                string ClientIP2 = GetIP4Address();
                ClientIP2 = ClientIP2.Replace(".", "_");
                string tabla2 = "Rpt_DetDOS_" + ClientIP2;
                string query2 = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[inc],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla2 + "]";
                SqlCommand cmd2 = new SqlCommand(query2);
                SqlConnection con2 = new SqlConnection(conString);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                cmd2.Connection = con2;
                sda2.SelectCommand = cmd2;
                DataSet1 dt4 = new DataSet1();
                sda2.Fill(dt4, "DataTable3");
                /*Fin*/
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_dos.rpt").SetDataSource(dt4);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
            else if (Session["Grilla2"].ToString() == "0" && Session["Grilla5"].ToString() == "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias3.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = "CREDITOS " + Session["Consulta"].ToString();
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");               
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);                
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
        }
        else if (Session["Reporte"].ToString() == "XFechaNoti")
        {
            if (Session["Grilla2"].ToString() != "0" && Session["Grilla5"].ToString() != "0")
            {
                /*Reporte Completo*/
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = Session["Consulta"].ToString();
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                /*Carga informacion del Resumen del Primer Detalle*/
                string ClientIP1 = GetIP4Address();
                ClientIP1 = ClientIP1.Replace(".", "_");
                string tabla1 = "Rpt_Deta_" + ClientIP1;
                string query = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla1 + "]";
                SqlCommand cmd = new SqlCommand(query);
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                cmd.Connection = con;
                sda1.SelectCommand = cmd;
                DataSet1 dt2 = new DataSet1();
                sda1.Fill(dt2, "DataTable2");
                /*Fin*/
                /*Carga informacion del Resumen del Segundo detalle*/
                string ClientIP2 = GetIP4Address();
                ClientIP2 = ClientIP2.Replace(".", "_");
                string tabla2 = "Rpt_DetDOS_" + ClientIP2;
                string query2 = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[inc],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla2 + "]";
                SqlCommand cmd2 = new SqlCommand(query2);
                SqlConnection con2 = new SqlConnection(conString);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                cmd2.Connection = con2;
                sda2.SelectCommand = cmd2;
                DataSet1 dt4 = new DataSet1();
                sda2.Fill(dt4, "DataTable3");
                /*Fin*/
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_uno.rpt").SetDataSource(dt2);
                crystalReport.OpenSubreport("Dtle_dos.rpt").SetDataSource(dt4);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
            else if (Session["Grilla5"].ToString() == "0" && Session["Grilla2"].ToString() != "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias1.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = Session["Consulta"].ToString();
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                /*Carga informacion del Resumen del Primer Detalle*/
                string ClientIP1 = GetIP4Address();
                ClientIP1 = ClientIP1.Replace(".", "_");
                string tabla1 = "Rpt_Deta_" + ClientIP1;
                string query = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla1 + "]";
                SqlCommand cmd = new SqlCommand(query);
                SqlConnection con = new SqlConnection(conString);
                SqlDataAdapter sda1 = new SqlDataAdapter();
                cmd.Connection = con;
                sda1.SelectCommand = cmd;
                DataSet1 dt2 = new DataSet1();
                sda1.Fill(dt2, "DataTable2");
                /*Fin*/
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_uno.rpt").SetDataSource(dt2);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
            if (Session["Grilla2"].ToString() == "0" && Session["Grilla5"].ToString() != "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias2.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = Session["Consulta"].ToString();
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");

                /*Carga informacion del Resumen del Segundo detalle*/
                string ClientIP2 = GetIP4Address();
                ClientIP2 = ClientIP2.Replace(".", "_");
                string tabla2 = "Rpt_DetDOS_" + ClientIP2;
                string query2 = "SELECT CASE WHEN [sub] IS NULL THEN [sub] WHEN [sub] IS NOT NULL THEN [id] END AS [id],[sub],[reg_pat],[raz_social],[inc],[creditos],[importe],[prom_dias],CASE WHEN [anios] = 1 THEN CONVERT(NVARCHAR,[anios])+ ' Año ' WHEN [anios] >= 0 THEN CONVERT(NVARCHAR,[anios])+ ' Años ' END + CASE WHEN [meses] = 1 THEN CONVERT(NVARCHAR,[meses])+ ' Mes ' WHEN [meses] >= 0 THEN CONVERT(NVARCHAR,[meses])+ ' Meses ' END + CASE WHEN [dias] = 1 THEN CONVERT(NVARCHAR,[dias]) + ' Dia ' WHEN [dias] >= 0 THEN CONVERT(NVARCHAR,[dias]) + ' Dias ' END AS Antiguedad FROM [Supervision].[dbo].[" + tabla2 + "]";
                SqlCommand cmd2 = new SqlCommand(query2);
                SqlConnection con2 = new SqlConnection(conString);
                SqlDataAdapter sda2 = new SqlDataAdapter();
                cmd2.Connection = con2;
                sda2.SelectCommand = cmd2;
                DataSet1 dt4 = new DataSet1();
                sda2.Fill(dt4, "DataTable3");
                /*Fin*/
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.OpenSubreport("Dtle_dos.rpt").SetDataSource(dt4);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
            else if (Session["Grilla2"].ToString() == "0" && Session["Grilla5"].ToString() == "0")
            {
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Reporte_Incidencias3.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue tipo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecha = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Enca = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Dele = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rale_comp = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue Inciden = new ParameterDiscreteValue();
                tipo.Value = Session["Tipo"].ToString();
                fecha.Value = Session["Fec_Base"].ToString();
                Enca.Value = Session["Consulta"].ToString();
                Dele.Value = Session["Sub"].ToString();
                rale_comp.Value = Session["Base_com"].ToString();
                Inciden.Value = Session["In"].ToString();
                /*Carga informacion del Resumen del Reporte*/
                string conString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                string ClientIP = GetIP4Address();
                ClientIP = ClientIP.Replace(".", "_");
                string tabla = "Rpt_Inci_" + ClientIP;
                DataSet1 dsCustomers = GetData("SELECT [cve_inc] ,[credito_R1],[sal_tot_R1],[inc_R2],[credito_R2],[importe_R2],[dias_inc_R2],[cred_R2],[imp_R2],[Prom_dias_inc_R2] FROM [Supervision].[dbo].[" + tabla + "]");
                crystalReport.OpenSubreport("Reporte_Principal.rpt").SetDataSource(dsCustomers);
                crystalReport.SetParameterValue("r_base", Session["R_B"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_movi", Session["R_P"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("r_pendi", Session["R_M"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("depurado", Session["Depu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.SetParameterValue("Xdepurar", Session["Xdepu"].ToString(), "Reporte_Principal.rpt");
                crystalReport.ParameterFields[0].CurrentValues.Add(tipo);
                crystalReport.ParameterFields[1].CurrentValues.Add(fecha);
                crystalReport.ParameterFields[2].CurrentValues.Add(Enca);
                crystalReport.ParameterFields[3].CurrentValues.Add(Dele);
                crystalReport.ParameterFields[4].CurrentValues.Add(rale_comp);
                crystalReport.ParameterFields[5].CurrentValues.Add(Inciden);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
        }
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
                    sda.Fill(dsCustomers, "DataTable1");
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
    protected void CrystalReportViewer1_Unload(object sender, EventArgs e)
    {
        crystalReport.Close();
        CrystalReportViewer1.Dispose();
        crystalReport.Dispose();
    }
}