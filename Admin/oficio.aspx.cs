using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Admin_oficio : System.Web.UI.Page
{
    ReportDocument crystalReport = new ReportDocument();
    string socios;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["REPORTE"].ToString() == "RANGO")
        {
            using (SqlConnection scSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("JEFES_09", scSqlConnection);
                cmd.Parameters.Add("@SUB", SqlDbType.NVarChar, 10);
                cmd.Parameters["@SUB"].Value = Session["Sub_REP"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable datatable = new DataTable();
                da.Fill(datatable); // getting value according to imageID and fill dataset   
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Devueltos_con_Inconsistenciapt.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue reg_pat = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue raz_soc = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rango = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue observaciones = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rub = new ParameterDiscreteValue();
                reg_pat.Value = Session["Reg_Pat_REP"].ToString();
                raz_soc.Value = Session["Raz_Soc_REP"].ToString();
                rango.Value = Session["Rngo_REP"].ToString();
                observaciones.Value = Session["Observacion_REP"].ToString();
                sub.Value = Session["SubDOS_REP"].ToString();
                rub.Value = Iniciales(Request.Cookies["Nombre_Sup"].Value);

                crystalReport.SetDataSource(datatable);
                crystalReport.ParameterFields[0].CurrentValues.Add(reg_pat);
                crystalReport.ParameterFields[1].CurrentValues.Add(raz_soc);
                crystalReport.ParameterFields[2].CurrentValues.Add(rango);
                crystalReport.ParameterFields[3].CurrentValues.Add(observaciones);
                crystalReport.ParameterFields[4].CurrentValues.Add(sub);
                crystalReport.ParameterFields[5].CurrentValues.Add(rub);

                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
        }
        else if (Session["REPORTE"].ToString() == "RESPONSABILIDAD")
        {
            using (SqlConnection scSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("JEFES_09", scSqlConnection);
                cmd.Parameters.Add("@SUB", SqlDbType.NVarChar, 10);
                cmd.Parameters["@SUB"].Value = Session["Sub_REP"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable datatable = new DataTable();
                da.Fill(datatable); // getting value according to imageID and fill dataset   
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Dic_Resp_Soli.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue reg_pat = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue raz_soc = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue socio = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue observaciones = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rub = new ParameterDiscreteValue();
                socios = Request.Cookies["Socios"].Value;
                reg_pat.Value = Session["Reg_Pat_REP"].ToString();
                raz_soc.Value = Session["Raz_Soc_REP"].ToString();
                socio.Value = socios.Replace("%0d%0a", " ");
                observaciones.Value = Session["Observacion_REP"].ToString();
                sub.Value = Session["SubDOS_REP"].ToString();
                rub.Value = Iniciales(Request.Cookies["Nombre_Sup"].Value);

                crystalReport.SetDataSource(datatable);
                crystalReport.ParameterFields[0].CurrentValues.Add(reg_pat);
                crystalReport.ParameterFields[1].CurrentValues.Add(raz_soc);
                crystalReport.ParameterFields[2].CurrentValues.Add(socio);
                crystalReport.ParameterFields[3].CurrentValues.Add(observaciones);
                crystalReport.ParameterFields[4].CurrentValues.Add(sub);
                crystalReport.ParameterFields[5].CurrentValues.Add(rub);

                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
        }
        else if (Session["REPORTE"].ToString() == "RESPONSABILIDAD SOLIDARIA")
        {
            using (SqlConnection scSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("JEFES_09", scSqlConnection);
                cmd.Parameters.Add("@SUB", SqlDbType.NVarChar, 10);
                cmd.Parameters["@SUB"].Value = Session["Sub_REP"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable datatable = new DataTable();
                da.Fill(datatable); // getting value according to imageID and fill dataset  
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Autoriza_Respon_soli.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue reg_pat = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue raz_soc = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue socio = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue observaciones = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rub = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue folio = new ParameterDiscreteValue();
                socios = Request.Cookies["Socios"].Value;
                reg_pat.Value = Session["Reg_Pat_REP"].ToString();
                raz_soc.Value = Session["Raz_Soc_REP"].ToString();
                socio.Value = socios.Replace("%0d%0a", " ");
                observaciones.Value = "Debidamente autorizado po el C. Delegado.";
                sub.Value = Session["SubDOS_REP"].ToString();
                rub.Value = Iniciales(Request.Cookies["Nombre_Sup"].Value);
                folio.Value = Session["Folio_REP"].ToString();

                crystalReport.SetDataSource(datatable);
                crystalReport.ParameterFields[0].CurrentValues.Add(reg_pat);
                crystalReport.ParameterFields[1].CurrentValues.Add(raz_soc);
                crystalReport.ParameterFields[2].CurrentValues.Add(socio);
                crystalReport.ParameterFields[3].CurrentValues.Add(observaciones);
                crystalReport.ParameterFields[4].CurrentValues.Add(sub);
                crystalReport.ParameterFields[5].CurrentValues.Add(rub);
                crystalReport.ParameterFields[6].CurrentValues.Add(folio);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
        }
        else if (Session["REPORTE"].ToString() == "RANGO III IV")
        {
            using (SqlConnection scSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("JEFES_09", scSqlConnection);
                cmd.Parameters.Add("@SUB", SqlDbType.NVarChar, 10);
                cmd.Parameters["@SUB"].Value = Session["Sub_REP"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable datatable = new DataTable();
                da.Fill(datatable); // getting value according to imageID and fill dataset   
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Autorizados_para_cancelar.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue reg_pat = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue raz_soc = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rango = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue c_cop = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue c_rcv = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue imp_cop = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue imp_rcv = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rub = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue folio = new ParameterDiscreteValue();

                reg_pat.Value = Session["Reg_Pat_REP"].ToString();
                raz_soc.Value = Session["Raz_Soc_REP"].ToString();
                rango.Value = Session["Rngo_REP"].ToString();
                c_cop.Value = Session["CCOP_REP"].ToString();
                c_rcv.Value = Session["CRCV_REP"].ToString();
                imp_cop.Value = Session["COP_REP"].ToString();
                imp_rcv.Value = Session["RCV_REP"].ToString();
                sub.Value = Session["SubDOS_REP"].ToString();
                rub.Value = Iniciales(Request.Cookies["Nombre_Sup"].Value);
                folio.Value = Session["Folio_REP"].ToString();

                crystalReport.SetDataSource(datatable);
                crystalReport.ParameterFields[0].CurrentValues.Add(reg_pat);
                crystalReport.ParameterFields[1].CurrentValues.Add(raz_soc);
                crystalReport.ParameterFields[2].CurrentValues.Add(rango);
                crystalReport.ParameterFields[3].CurrentValues.Add(c_cop);
                crystalReport.ParameterFields[4].CurrentValues.Add(c_rcv);
                crystalReport.ParameterFields[5].CurrentValues.Add(imp_cop);
                crystalReport.ParameterFields[6].CurrentValues.Add(imp_rcv);
                crystalReport.ParameterFields[7].CurrentValues.Add(sub);
                crystalReport.ParameterFields[8].CurrentValues.Add(rub);
                crystalReport.ParameterFields[9].CurrentValues.Add(folio);
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
        }
        else if (Session["REPORTE"].ToString() == "RANGO V")
        {
            using (SqlConnection scSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ToString()))
            {
                SqlCommand cmd = new SqlCommand("JEFES_09", scSqlConnection);
                cmd.Parameters.Add("@SUB", SqlDbType.NVarChar, 10);
                cmd.Parameters["@SUB"].Value = Session["Sub_REP"].ToString();
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable datatable = new DataTable();
                da.Fill(datatable); // getting value according to imageID and fill dataset   
                crystalReport.Load(Server.MapPath("../Admin/Reportes/Auto_Cance_Rango5.rpt"));
                CrystalDecisions.Shared.ParameterDiscreteValue reg_pat = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue raz_soc = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rango = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue c_cop = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue c_rcv = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue imp_cop = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue imp_rcv = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue folio = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue folio_jac = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue acuerdo = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue sub = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue rub = new ParameterDiscreteValue();
                CrystalDecisions.Shared.ParameterDiscreteValue fecSe = new ParameterDiscreteValue();
                

                reg_pat.Value = Session["Reg_Pat_REP"].ToString();
                raz_soc.Value = Session["Raz_Soc_REP"].ToString();
                rango.Value = Session["Rngo_REP"].ToString();
                c_cop.Value = Session["CCOP_REP"].ToString();
                c_rcv.Value = Session["CRCV_REP"].ToString();
                imp_cop.Value = Session["COP_REP"].ToString();
                imp_rcv.Value = Session["RCV_REP"].ToString();
                folio.Value = Session["Folio_REP"].ToString();
                folio_jac.Value = Session["FolioJAC_REP"].ToString();
                acuerdo.Value = Session["Acuerdo_REP"].ToString();
                sub.Value = Session["SubDOS_REP"].ToString();
                rub.Value = Iniciales(Request.Cookies["Nombre_Sup"].Value);
                fecSe.Value = String.Format("{0: dd/MM/yyyy}", Convert.ToDateTime(Session["Fech_Sesion_REP"].ToString()));

                crystalReport.SetDataSource(datatable);
                crystalReport.ParameterFields[0].CurrentValues.Add(reg_pat);
                crystalReport.ParameterFields[1].CurrentValues.Add(raz_soc);
                crystalReport.ParameterFields[2].CurrentValues.Add(rango);
                crystalReport.ParameterFields[3].CurrentValues.Add(c_cop);
                crystalReport.ParameterFields[4].CurrentValues.Add(c_rcv);
                crystalReport.ParameterFields[5].CurrentValues.Add(imp_cop);
                crystalReport.ParameterFields[6].CurrentValues.Add(imp_rcv);
                crystalReport.ParameterFields[7].CurrentValues.Add(folio);
                crystalReport.ParameterFields[8].CurrentValues.Add(folio_jac);
                crystalReport.ParameterFields[9].CurrentValues.Add(acuerdo);
                crystalReport.ParameterFields[10].CurrentValues.Add(sub);
                crystalReport.ParameterFields[11].CurrentValues.Add(rub);
                crystalReport.ParameterFields[12].CurrentValues.Add(fecSe);
                
                CrystalReportViewer1.ReportSource = crystalReport;
                crystalReport.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "Reporte");
            }
        }
    }

    public string Iniciales(string cadena)
    {
        string[] split = cadena.Split(new Char[] { ' ' });
        string fila = "";

        for (Int32 i = 0; i <= (split.Length - 1); i++)
        {
            fila += split[i].Substring(0, 1);
        }
        return fila;
    }
    protected void CrystalReportViewer1_Unload(object sender, EventArgs e)
    {
        crystalReport.Close();
        CrystalReportViewer1.Dispose();
        crystalReport.Dispose();
    }
}