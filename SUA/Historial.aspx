<%@ Page Title="" Language="C#" MasterPageFile="~/Master/MasterSUA.master" AutoEventWireup="true" CodeFile="Historial.aspx.cs" Inherits="SUA_Historial" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="ClosedXML.Excel" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Diagnostics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
* {  
    padding: 0;  
    margin: 0;  
}  
  
body {  
     
}  
  
/*h1 {  
    font: bold 32px Times;  
    color: #666;  
    text-align: center;  
    padding: 20px 0;  
} */ 
  
/*#container {  
    width: 700px;  
    margin: 10px auto;  
} */
.mGrid {  
    width: 100%;  
    background-color: #fff;  
    margin: 5px 0 10px 0;  
    border: solid 1px #525252;  
    border-collapse: collapse;  
}  
  
    .mGrid td {  
        padding: 2px;  
        border: solid 1px #c1c1c1;  
        color: #717171;  
        font: 11px Tahoma; 
    }  
  
    .mGrid th {  
        padding: 4px 2px;  
        color: #fff;  
        background: #424242 url(grd_head.png) repeat-x top;  
        border-left: solid 1px #525252;  
        font-size: 12px;  
    }  
  
    .mGrid .alt {  
        background: #fcfcfc url(grd_alt.png) repeat-x top;  
    }  
  
    .mGrid .pgr {  
        background: #424242 url(grd_pgr.png) repeat-x top;  
        text-align:center;
    }  
  
        .mGrid .pgr table {  
            margin: 5px 0;  
        }  
  
        .mGrid .pgr td {  
            border-width: 0;  
            padding: 0 6px;  
            border-left: solid 1px #666;  
            font-weight: bold;  
            color: #fff;  
            line-height: 12px;  
        }  
  
        .mGrid .pgr a {  
            color: #666;  
            text-decoration: none;  
        }  
  
            .mGrid .pgr a:hover {  
                color: #000;  
                text-decoration: none;  
            }  
          </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
        
 <li class="bold"><a href="../Admin/Default.aspx" class="waves-effect waves-cyan"><i class="mdi-social-pages"></i>Inicio</a>
                        <div class="collapsible-body">
                        </div>
                    </li>

                        <li class="bold">
                            <a href="#" class="waves-effect waves-cyan"><i class="mdi-action-visibility"></i>Supervision Web</a>
                        </li>


                        <li class="no-padding">
                            <ul class="collapsible">
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan <%--active--%>"><i class="mdi-av-repeat"></i>Seguimiento de Bases</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../Admin/RalevsRale.aspx">Rale vs Rale</a>
                                            </li>
                                            <li>
                                                <a href="../Admin/BD_ExcelvsRale.aspx">B.D. Excel vs Rale</a>
                                            </li>
                                            <li>
                                                <a href="../Admin/X_fecha_de_notificacion.aspx">Fecha de Notificación</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                          
                        
                        
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-action-search"></i>Analisis de Rale</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../Admin/Analisis_del_Rale.aspx">Análisis</a>
                                            </li>
                                            <li><a href="../Admin/Dias_de_la_Incidencia.aspx">Días de la Incidencia</a>
                                            </li>
                                            <li><a href="../Admin/Descargar_Rale.aspx">Descargar Rale</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                        <li class="bold">
                            <a href="#" class="collapsible-header waves-effect waves-cyan"><i class="mdi-social-person-outline"></i>Incidencias PAE</a>
                        </li>
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-communication-location-off"></i>Incidencia 09</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../Admin/Incidencia09.aspx">Incidencia 09</a>
                                            </li>
                                            <li><a href="../Admin/Control_Expedientes_Inc_09.aspx">Cont.ExpendientesInc09</a>
                                            </li>                                        
                                        </ul>
                                    </div>
                                </li>

                        
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-social-location-city"></i>Comite Delegacional</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../Admin/Comp_Incidencias.aspx">Comp.Incidencia</a>
                                            </li>
                                            <li><a href="../Admin/Analisis_de_Eco_por_Inci.aspx">Análisis de Eco por Inc</a>
                                            </li>  
                                            <li><a href="../Admin/Situacion_de_la cartera_ejerci_anteriores.aspx">Situación Ejerc Anterior. <%--de la Cartera Ejer. Anteriores--%></a>
                                            </li>  
                                             <li><a href="../Admin/Situacion_de_la_Cartera_ejerc_envigor.aspx">Situación Ejerc Vigor <%--de la Cartera Ejer. en Vigor--%></a>
                                            </li>  
                                            <li><a href="../Admin/Patrones_con Impedimento_de_Cobro.aspx">Patrones <%--con Impedimento de Cobro--%></a>
                                            </li>                                        
                                        </ul>
                                    </div>
                                </li>
                            
                    
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan active"><i class="mdi-notification-disc-full"></i> CD-SUA</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../SUA/Default.aspx">Consulta Información</a>
                                            </li>
                                            <li class="active"><a href="Historial.aspx">Historial Patronal</a>
                                            </li>
                                            <li><a href="Trabajador.aspx">Historial Trabajador</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                           
                                 <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-file-file-upload"></i>Cargas Al sistema</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li>
                                                <%--class="active"--%><a href="layout-fullscreen.html">S. del Presupuesto</a>
                                            </li>
                                            <li>
                                               <a href="#">IBC</a>
                                            </li>
                                             <li> 
                                                <a href="#">MORA</a>
                                            </li>
                                             <li> 
                                                <a href="#">Situación de la Cartera</a>
                                            </li>
                                            <li> 
                                                <a href="../Admin/Carga_Rale.aspx">Rale</a>
                                            </li>

                                            <li> 
                                                <a href="../Admin/Base_Personalisada.aspx">Base de Datos Personalizada</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                   


                                 </ul>
                        </li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
     <div id="breadcrumbs-wrapper" class=" grey lighten-3">
            <!-- Search for small screen -->
            <div class="header-search-wrapper grey hide-on-large-only">
                <i class="mdi-action-search active"></i>
                <input type="text" name="Search" class="header-search-input z-depth-2" placeholder="Explore Materialize"/>
            </div>
          <div class="container">
            <div class="row">
              <div class="col s12 m12 l12">
                  <img src="../images/SISCO_2_2_2.png" width="150" align="right" alt="Sistema de Supervisión de Cobranza"/>
                <h5 class="breadcrumbs-title">CD-SUA</h5>
                <ol class="breadcrumbs">
                    
                  <li><a href="index.html">Inicio</a>
                  </li>
                  <li><a href="#">CD-SUA</a>
                  </li>
                  <li class="active">Historial Patronal</li>                    
                </ol>                  
              </div>
            </div>
          </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager>       
    <div class="row" runat="server">
            <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Ingresa los Datos</h4>
                    <div class="row">
                        <div class="row">
                            
                            <div class="col col s12 m6">
                                <label>Selecciona el Año Inicial</label>  
                                <select  id="anio1" name="crole" runat="server" data-error=".errorTxt6" >
                                    <option value="" disabled="disabled" selected="selected"> -- Selecciona una Opción -- </option>                                
                                </select>   
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                             <div class="col col s12 m6">
                                <label>Seleccione el Año Final</label>
                                <select  id="anio2" name="crole" runat="server" data-error=".errorTxt6">
                                    <option value="" disabled="disabled" selected="selected"> -- Selecciona una Opción -- </option>
                                </select> 
                                <div class="input-field">
                                <div class="errorTxt4"></div>    
                                    </div>                              
                            </div>
                        </div>
                        <div class="row">
                            <div class="col col s12 m6">
                                <label>Subdelegación</label>
                                <asp:RadioButtonList ID="sub" runat="server" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </div>
                            <div class="input-field col col s12 m6"> 
                                <label for="uname">Ingrese Datos</label>
                                <asp:TextBox ID="dato" class="validate" runat="server" data-error=".errorTxt3" ></asp:TextBox>     
                                <div class="errorTxt1"></div>                          
                            </div>
                           <%-- <div class="col col s12 m6">
                                <label>Búsqueda por:</label>
                                <asp:CheckBoxList ID="tipo" runat="server"  RepeatDirection="Horizontal" >
                                    <asp:ListItem Text="De Asegurados" Value="AS" onclick="MutExChkList(this);"></asp:ListItem>
                                    <asp:ListItem Text="De Patrones" Value="PA" onclick="MutExChkList(this);"></asp:ListItem>
                                </asp:CheckBoxList>                                
                            </div>--%>
                        </div>
                        <div class="row">                           
                            <div class="col col s12 m6">  
                                <div class="input-field col s4">
                                    <div class="input-field col s12">
                                        <button class="btn waves-effect waves-light right submit cyan" type="submit" runat="server" formaction="Historial.aspx?type=bus" name="action">Buscar
                                              <i class="mdi-content-send right"></i>
                                            </button>
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
         <%
            if (Request.QueryString["type"] == "bajar")
            { %>
         <div class="row">
             <div class="col s12 m12 l12">
                 <div class="card-panel">
                <%
                string sql = null;
                string queryTrab = null;
                string queryResumen = null;
                int NumHojas = 0;
                XLWorkbook wb = new XLWorkbook();
                DataTable dt = new DataTable();
                DataTable dtResumen = new DataTable();
                DataTable DataTableTrabjador = new DataTable();
                OleDbDataAdapter DataAdapTraba = new OleDbDataAdapter();
                try
                {
                    for (int i = Convert.ToInt32(Request.QueryString["anio1"]); i <= Convert.ToInt32(Request.QueryString["anio2"]); i++)
                    {
                        for (int y = 1; y <= 12; y++)
                        {
                            string ruta_SUA = ConfigurationManager.AppSettings.Get("Ruta") + Convert.ToString(i) + "\\" + obtenerNombreMesNumero(y) + "\\CDSU" + ConfigurationManager.AppSettings.Get("Delegacion") + Request.QueryString["sub"] + ".MDB";
                            string conString_SUA = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + ruta_SUA + ";Persist Security Info=False";
                            OleDbConnection connection_SUA = new OleDbConnection(conString_SUA);
                            if (System.IO.File.Exists(ruta_SUA))
                            {
                                try
                                {
                                    if (i > 2006)
                                    {
                                        sql = @"SELECT RCPS_DEL, RCPS_SUB, RCPS_CVE_UNIT, MID(RCPS_PATRON,2,11) AS RCPS_PATRON, RCPS_PER_PAGO, RCPS_TASA_ACT, RCPS_TASA_REC, 
                                           RCPS_FECHA_PAGO, RCPS_NUM_FOL_SUA ,RCPS_TIPO_PATRON,RCPS_PRI_RIES_TRA, RCPS_TIPO_CONTRIB, RCPS_ENT_REC, RCPS_TIP_INF_PAT, 
                                           RCPS_TOT_DIAS_COT,RCPS_NUM_TRA_COT,
                                           RCPS_IMP_EYM_FIJA,RCPS_IMP_EYM_EXC,RCPS_IMP_EYM_PRED,RCPS_IMP_EYM_PREE,RCPS_IMP_RIES_TRA,RCPS_IMP_INV_VIDA,RCPS_IMP_GUAR,RCPS_IMP_ACT,RCPS_IMP_REC,
                                           RCPS_IMP_EYM_FIJA+RCPS_IMP_EYM_EXC+RCPS_IMP_EYM_PRED+RCPS_IMP_EYM_PREE+RCPS_IMP_RIES_TRA+RCPS_IMP_INV_VIDA+RCPS_IMP_GUAR+RCPS_IMP_ACT+RCPS_IMP_REC AS TOTAL_COP,
                                           RCPS_IMP_RETIRO,RCPS_IMP_CESA_Y_VEJ,RCPS_IMP_ACT_RCV,RCPS_IMP_REC_RCV,RCPS_IMP_AP_VOL_RCV,
                                           RCPS_IMP_RETIRO+RCPS_IMP_CESA_Y_VEJ+RCPS_IMP_ACT_RCV+RCPS_IMP_REC_RCV+RCPS_IMP_AP_VOL_RCV AS TOTAL_RCV,
                                           RCPS_FEC_VAL_IMSS,RCPS_FEC_VAL_RCV, RCPS_IMP_INF_APO_PAT_IND,RCPS_IMP_INF_AMO_CRED,RCPS_IMP_INF_AMO_CRED_P,RCPS_IMP_INF_REC,
                                           RCPS_IMP_INF_ACT FROM CDSUPA" + obtenerNombreMesNumero(y) + Convert.ToString(i) + " WHERE RCPS_PATRON = @REG_PAT";
                                    }
                                    else if (i <= 2006)
                                    {
                                        sql = @"SELECT RCPS_DEL, RCPS_SUB, RCPS_CVE_UNIT, MID(RCPS_PATRON,2,11) AS RCPS_PATRON, RCPS_PER_PAGO, RCPS_TASA_ACT, RCPS_TASA_REC, 
                                           RCPS_FECHA_PAGO, RCPS_NUM_FOL_SUA ,RCPS_TIPO_PATRON,RCPS_PRI_RIES_TRA, RCPS_TIPO_CONTRIB, RCPS_ENT_REC, RCPS_TIP_INF_PAT, 
                                           RCPS_TOT_DIAS_COT,RCPS_NUM_TRA_COT,
                                           RCPS_IMP_EYM_FIJA,RCPS_IMP_EYM_EXC,RCPS_IMP_EYM_PRED,RCPS_IMP_EYM_PREE,RCPS_IMP_RIES_TRA,RCPS_IMP_INV_VIDA,RCPS_IMP_GUAR,RCPS_IMP_ACT,RCPS_IMP_REC,
                                           RCPS_IMP_EYM_FIJA+RCPS_IMP_EYM_EXC+RCPS_IMP_EYM_PRED+RCPS_IMP_EYM_PREE+RCPS_IMP_RIES_TRA+RCPS_IMP_INV_VIDA+RCPS_IMP_GUAR+RCPS_IMP_ACT+RCPS_IMP_REC AS TOTAL_COP,
                                           RCPS_IMP_RETIRO,RCPS_IMP_CESA_Y_VEJ,RCPS_IMP_ACT_RCV,RCPS_IMP_REC_RCV,RCPS_IMP_AP_VOL_RCV,
                                           RCPS_IMP_RETIRO+RCPS_IMP_CESA_Y_VEJ+RCPS_IMP_ACT_RCV+RCPS_IMP_REC_RCV+RCPS_IMP_AP_VOL_RCV AS TOTAL_RCV,
                                           RCPS_FEC_VAL_IMSS,RCPS_FEC_VAL_RCV FROM CDSUPA" + obtenerNombreMesNumero(y) + Convert.ToString(i) + " WHERE RCPS_PATRON = @REG_PAT";
                                    }
                                    
                                    OleDbCommand cmd_pa = new OleDbCommand(sql, connection_SUA);
                                    connection_SUA.Open();
                                    cmd_pa.Parameters.Add(new OleDbParameter("@REG_PAT", Request.QueryString["reg"]));
                                    OleDbDataAdapter DataAdapPatron = new OleDbDataAdapter();
                                    cmd_pa.Connection = connection_SUA;
                                    DataAdapPatron.SelectCommand = cmd_pa;
                                    cmd_pa.CommandTimeout = 3600;
                                    DataAdapPatron.Fill(dt);

                                    /*Resumen*/
                                    queryResumen = @"SELECT RCPS_DEL, RCPS_SUB, MID(RCPS_PATRON,2,11) AS RCPS_PATRON, RCPS_PER_PAGO, RCPS_FECHA_PAGO,RCPS_NUM_TRA_COT,                                           
                                           RCPS_IMP_EYM_FIJA + RCPS_IMP_EYM_EXC + RCPS_IMP_EYM_PRED + RCPS_IMP_EYM_PREE + RCPS_IMP_RIES_TRA + RCPS_IMP_INV_VIDA + RCPS_IMP_GUAR + RCPS_IMP_ACT + RCPS_IMP_REC AS TOTAL_COP,                                           
                                           RCPS_IMP_RETIRO + RCPS_IMP_CESA_Y_VEJ + RCPS_IMP_ACT_RCV + RCPS_IMP_REC_RCV + RCPS_IMP_AP_VOL_RCV AS TOTAL_RCV
                                           FROM CDSUPA" + obtenerNombreMesNumero(y) + Convert.ToString(i) + " WHERE RCPS_PATRON = @REG_PAT";
                                    OleDbCommand cmd_Resumen = new OleDbCommand(queryResumen, connection_SUA);

                                    cmd_Resumen.Parameters.Add(new OleDbParameter("@REG_PAT", Request.QueryString["reg"]));
                                    OleDbDataAdapter DataAdapResumen = new OleDbDataAdapter();
                                    cmd_Resumen.Connection = connection_SUA;
                                    DataAdapResumen.SelectCommand = cmd_Resumen;
                                    cmd_Resumen.CommandTimeout = 3600;
                                    DataAdapResumen.Fill(dtResumen);
                                    /*Fin Resumen*/

                                    queryTrab = @"SELECT MID(RCAS_NUM_AFIL,2,11) AS RCAS_NUM_AFIL, RCAS_RFC, RCAS_CURP,RCAS_NOM_TRAB,RCAS_NUM_MOV_PER,RCAS_TIPO_TRAB,RCAS_JOR_SEM_RED,RCAS_DIAS_COT_MES,RCAS_DIAS_INC_MES,
		                                         RCAS_DIAS_AUS_MES,RCAS_DIAS_COT_BIM,RCAS_DIAS_INC_BIM,RCAS_DIAS_AUS_BIM,RCAS_IMP_EYM_FIJA,RCAS_IMP_EYM_EXCE,RCAS_IMP_EYM_PRES,
		                                         RCAS_IMP_EYM_ESPE,RCAS_IMP_RT,RCAS_IMP_IV,RCAS_IMP_GUAR
                                                ,RCAS_IMP_ACT_REC_I,RCAS_IMP_EYM_FIJA+RCAS_IMP_EYM_EXCE+RCAS_IMP_EYM_PRES+RCAS_IMP_EYM_ESPE+RCAS_IMP_RT+RCAS_IMP_IV+RCAS_IMP_GUAR+RCAS_IMP_ACT_REC_I AS TOTAL_IMSS
                                                ,RCAS_IMP_RET,RCAS_IMP_ACT_REC_RET,RCAS_IMP_CYV,RCAS_IMP_ACT_REC_CYV,RCAS_IMP_APOR_VOL,RCAS_IMP_RET+RCAS_IMP_ACT_REC_RET+RCAS_IMP_CYV+RCAS_IMP_ACT_REC_CYV+RCAS_IMP_APOR_VOL AS	
       	                                        TOTAL_RCV,RCPS_SUB, MID(RCPS_PATRON,2,11) AS RCPS_PATRON,RCPS_PER_PAGO,RCPS_FECHA_PAGO,RCPS_NUM_FOL_SUA FROM CDSUAS" + obtenerNombreMesNumero(y) + Convert.ToString(i) + " T1 INNER JOIN CDSUPA" + obtenerNombreMesNumero(y) + Convert.ToString(i) + " T2 ON T1.RCAS_CVE_UNIT = T2.RCPS_CVE_UNIT WHERE RCPS_PATRON = @REG_PAT ORDER BY RCAS_NOM_TRAB ASC";

                                    OleDbCommand cmd_Trab = new OleDbCommand(queryTrab, connection_SUA);
                                    cmd_Trab.Parameters.Add(new OleDbParameter("@REG_PAT", Request.QueryString["reg"]));
                                    cmd_Trab.Connection = connection_SUA;
                                    DataAdapTraba.SelectCommand = cmd_Trab;
                                    cmd_Trab.CommandTimeout = 3600;
                                    DataAdapTraba.Fill(DataTableTrabjador);
                                    if (DataTableTrabjador.Rows.Count != 0)
                                    {
                                        if (y == 1)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 2)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 3)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 4)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 5)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 6)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 7)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 8)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 9)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 10)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 11)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        else if (y == 12)
                                        {
                                            wb.Worksheets.Add(DataTableTrabjador, obtenerNombreMesNumero(y) + i);
                                            DataTableTrabjador.Clear();
                                            NumHojas++;
                                        }
                                        connection_SUA.Close();
                                    }
                                }
                                catch (Exception M)
                                {
                                    LabelMensaje.Text = M.Message;
                                }
                                connection_SUA.Close();
                            }
                            connection_SUA.Close();
                        }
                    }
                    try
                    {
                        wb.Worksheets.Add(dtResumen, "Resumen"); /*Resumen*/
                        wb.Worksheets.Add(dt, Request.QueryString["reg"].Substring(1, 11)); /*Registro Patronal*/
                        wb.Worksheet(NumHojas + 1).Position = 1;
                        wb.Worksheet(NumHojas + 2).Position = 2;
                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=" + Request.QueryString["reg"].Substring(1, 11) + ".xlsx");
                        using (MemoryStream MyMemoryStream = new MemoryStream())
                        {
                            wb.SaveAs(MyMemoryStream);
                            //MyMemoryStream.ReadTimeout = 5000000;
                            MyMemoryStream.WriteTo(Response.OutputStream);
                            Response.Flush();
                            Response.End();
                        }
                    }
                    catch (Exception e)
                    {
                        LabelMensaje.Text = "Error Memory. " + e.Message;
                    }
                }
                catch (Exception e)
                {
                    LabelMensaje.Text = "Error. " + e.Message;
                }           
        %>
                  </div>
                 <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
            </div>
       </div>
    <%      }
            else if (Request.QueryString["type"] == "bus")
            {                
                %>
                <div class="row">
                    <div class="col s12 m12 l12">
                        <div class="card-panel">  
                            <% 
                if (anio1.Value != "")
                {
                    if(anio2.Value != "")
                    {
                        if(anio1.Value == anio2.Value || Convert.ToInt32(anio2.Value) > Convert.ToInt32(anio1.Value))
                        {
                            if(sub.SelectedValue != "")
                            {
                                if(dato.Text != "")
                                {     
                                string sql = null;
                                DataTable dt = new DataTable();
                                DataTable DataTableTrabjador = new DataTable();
                                OleDbDataAdapter DataAdapTraba = new OleDbDataAdapter();
                                try
                                {
                                    for (int i = Convert.ToInt32(anio1.Value); i <= Convert.ToInt32(anio2.Value); i++)
                                    {
                                        for (int y = 1; y <= 12; y++)
                                        {
                                            string ruta_SUA = ConfigurationManager.AppSettings.Get("Ruta") + Convert.ToString(i) + "\\" + obtenerNombreMesNumero(y) + "\\CDSU" + ConfigurationManager.AppSettings.Get("Delegacion") + sub.SelectedValue + ".MDB";
                                            string conString_SUA = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + ruta_SUA + ";Persist Security Info=False";
                                            OleDbConnection connection_SUA = new OleDbConnection(conString_SUA);
                                            if (System.IO.File.Exists(ruta_SUA))
                                            {
                                                try
                                                {
                                                    if (i > 2006)
                                                    {
                                                        sql = @"SELECT RCPS_DEL, RCPS_SUB, RCPS_CVE_UNIT,MID(RCPS_PATRON,2,11) AS RCPS_PATRON, RCPS_PER_PAGO, RCPS_TASA_ACT, RCPS_TASA_REC, 
                                                           RCPS_FECHA_PAGO, RCPS_NUM_FOL_SUA ,RCPS_TIPO_PATRON,RCPS_PRI_RIES_TRA, RCPS_TIPO_CONTRIB, RCPS_ENT_REC, RCPS_TIP_INF_PAT, 
                                                           RCPS_TOT_DIAS_COT,RCPS_NUM_TRA_COT,
                                                           RCPS_IMP_EYM_FIJA,RCPS_IMP_EYM_EXC,RCPS_IMP_EYM_PRED,RCPS_IMP_EYM_PREE,RCPS_IMP_RIES_TRA,RCPS_IMP_INV_VIDA,RCPS_IMP_GUAR,RCPS_IMP_ACT,RCPS_IMP_REC,
                                                           RCPS_IMP_EYM_FIJA+RCPS_IMP_EYM_EXC+RCPS_IMP_EYM_PRED+RCPS_IMP_EYM_PREE+RCPS_IMP_RIES_TRA+RCPS_IMP_INV_VIDA+RCPS_IMP_GUAR+RCPS_IMP_ACT+RCPS_IMP_REC AS TOTAL_COP,
                                                           RCPS_IMP_RETIRO,RCPS_IMP_CESA_Y_VEJ,RCPS_IMP_ACT_RCV,RCPS_IMP_REC_RCV,RCPS_IMP_AP_VOL_RCV,
                                                           RCPS_IMP_RETIRO+RCPS_IMP_CESA_Y_VEJ+RCPS_IMP_ACT_RCV+RCPS_IMP_REC_RCV+RCPS_IMP_AP_VOL_RCV AS TOTAL_RCV,
                                                           RCPS_FEC_VAL_IMSS,RCPS_FEC_VAL_RCV, RCPS_IMP_INF_APO_PAT_IND,RCPS_IMP_INF_AMO_CRED,RCPS_IMP_INF_AMO_CRED_P,RCPS_IMP_INF_REC,
                                                           RCPS_IMP_INF_ACT FROM CDSUPA" + obtenerNombreMesNumero(y) + Convert.ToString(i) + " WHERE RCPS_PATRON = @REG_PAT ";
                                                    }
                                                    else if(i <= 2006)
                                                    {
                                                        sql = @"SELECT RCPS_DEL, RCPS_SUB, RCPS_CVE_UNIT,MID(RCPS_PATRON,2,11) AS RCPS_PATRON, RCPS_PER_PAGO, RCPS_TASA_ACT, RCPS_TASA_REC, 
                                                           RCPS_FECHA_PAGO, RCPS_NUM_FOL_SUA ,RCPS_TIPO_PATRON,RCPS_PRI_RIES_TRA, RCPS_TIPO_CONTRIB, RCPS_ENT_REC, RCPS_TIP_INF_PAT, 
                                                           RCPS_TOT_DIAS_COT,RCPS_NUM_TRA_COT,
                                                           RCPS_IMP_EYM_FIJA,RCPS_IMP_EYM_EXC,RCPS_IMP_EYM_PRED,RCPS_IMP_EYM_PREE,RCPS_IMP_RIES_TRA,RCPS_IMP_INV_VIDA,RCPS_IMP_GUAR,RCPS_IMP_ACT,RCPS_IMP_REC,
                                                           RCPS_IMP_EYM_FIJA+RCPS_IMP_EYM_EXC+RCPS_IMP_EYM_PRED+RCPS_IMP_EYM_PREE+RCPS_IMP_RIES_TRA+RCPS_IMP_INV_VIDA+RCPS_IMP_GUAR+RCPS_IMP_ACT+RCPS_IMP_REC AS TOTAL_COP,
                                                           RCPS_IMP_RETIRO,RCPS_IMP_CESA_Y_VEJ,RCPS_IMP_ACT_RCV,RCPS_IMP_REC_RCV,RCPS_IMP_AP_VOL_RCV,
                                                           RCPS_IMP_RETIRO+RCPS_IMP_CESA_Y_VEJ+RCPS_IMP_ACT_RCV+RCPS_IMP_REC_RCV+RCPS_IMP_AP_VOL_RCV AS TOTAL_RCV,
                                                           RCPS_FEC_VAL_IMSS,RCPS_FEC_VAL_RCV FROM CDSUPA" + obtenerNombreMesNumero(y) + Convert.ToString(i) + " WHERE RCPS_PATRON = @REG_PAT ";
                                                    }
                                                   
                                                    OleDbCommand cmd_pa = new OleDbCommand(sql, connection_SUA);                                                    
                                                    cmd_pa.Parameters.Add(new OleDbParameter("@REG_PAT", "P"+ dato.Text));
                                                    connection_SUA.Open();
                                                   // Response.Write(sql + "<br>");
                                                    OleDbDataAdapter DataAdapPatron = new OleDbDataAdapter();
                                                    cmd_pa.Connection = connection_SUA;
                                                    DataAdapPatron.SelectCommand = cmd_pa;
                                                    cmd_pa.CommandTimeout = 3600;

                                                    DataAdapPatron.Fill(dt);
                                                    connection_SUA.Close();
                                                }
                                                catch(Exception d)
                                                {
                                                    Response.Write(d.Message);
                                                }
                                            }
                                           
                                        }
                                    }
                                    GridView1.DataSource = dt;
                                    GridView1.DataBind();
                                    if(GridView1.Rows.Count == 0)
                                    {
                                        BotonBajar.Visible = false;
                                    }
                                    else
                                    {
                                        BotonBajar.Visible = true;
                                    }
                                }
                                catch(Exception M)
                                {
                                    Response.Write(M.Message);
                                }
                                     
                            %>
                            <div class="row">
                                <div id="BotonBajar" runat="server" class="fixed-action-btn" style="position:relative; display: inline-block; left:15px;">
                                    <a class="btn-floating btn-large">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li><a href="Historial.aspx?type=bajar&anio1=<%Response.Write(anio1.Value);%>&anio2=<%Response.Write(anio2.Value);%>&reg=<%Response.Write("P" + dato.Text);%>&sub=<%Response.Write(sub.SelectedValue);%>" class="btn-floating red"><i class="large mdi-file-cloud-download"></i></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                 <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" CssClass="mGrid responsive-table" AlternatingRowStyle-CssClass="alt" HeaderStyle-CssClass="gridViewHeader" AutoGenerateColumns="false"  PagerStyle-CssClass="pgr" OnPageIndexChanging="GridView1_PageIndexChanging" >
                                <Columns>
                                     <asp:BoundField DataField="RCPS_DEL" SortExpression="RCPS_DEL" HeaderText="Delegación" >
                                         <ItemStyle CssClass="center-align"  />
                                     </asp:BoundField>
                                     <asp:BoundField DataField="RCPS_SUB" SortExpression="RCPS_SUB" HeaderText="Subdelegación">
                                         <ItemStyle CssClass="center-align"  />
                                     </asp:BoundField>
                                     <asp:BoundField DataField="RCPS_PATRON" SortExpression="RCPS_PATRON" HeaderText="Registro Patronal">
                                          <ItemStyle CssClass="center-align"  />
                                     </asp:BoundField>
                                     <asp:BoundField DataField="RCPS_FECHA_PAGO" DataFormatString="{0:Y}" HeaderText="Mes de Consulta">
                                          <ItemStyle CssClass="center-align"  />
                                     </asp:BoundField>
                                     <asp:BoundField DataField="RCPS_PER_PAGO" HeaderText="Periodo de Pago">
                                        <ItemStyle CssClass="center-align"  />
                                     </asp:BoundField>
                                     <asp:BoundField DataField="RCPS_NUM_TRA_COT" HeaderText="No. Cotizantes">
                                         <ItemStyle CssClass="right-align"  />
                                     </asp:BoundField>
                                     <asp:BoundField DataField="TOTAL_COP" HeaderText="Total C.O.P." DataFormatString="{0:N2}">
                                         <ItemStyle CssClass="right-align"  />
                                     </asp:BoundField>
                                     <asp:BoundField DataField="TOTAL_RCV" HeaderText="Total R.C.V."  DataFormatString="{0:N2}">
                                          <ItemStyle CssClass="right-align"  />
                                     </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate >
                                    <div id="card-alert" class="card red">
                                        <div class="card-content white-text">
                                            <p><i class="mdi-alert-error"></i> Alerta : No se encontraron Registros de <% Response.Write(dato.Text); %> en los años seleccionados.</p>
                                        </div>
                                        <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                            <span aria-hidden="true">×</span>
                                        </button>
                                    </div>
                                </EmptyDataTemplate>
                                <RowStyle Font-Size="14px" />
                            </asp:GridView></ContentTemplate></asp:UpdatePanel>
                            <%
                            }
                            else
                            {
                                  %>
                         <div id="card-alert" class="card red">
                             <div class="card-content white-text">
                                 <p><i class="mdi-alert-error"></i> Alerta : Ingrese un Registro Patronal por favor</p>
                             </div>
                             <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                 <span aria-hidden="true">×</span>
                             </button>
                         </div>
                            <%  
                            }
                            }
                            else
                            {
                                %>
                         <div id="card-alert" class="card red">
                             <div class="card-content white-text">
                                 <p><i class="mdi-alert-error"></i> Alerta : Seleccione una Subdelegación por favor </p>
                             </div>
                             <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                 <span aria-hidden="true">×</span>
                             </button>
                         </div>
                            <%
                            }
                            }
                            else
                            {
                                %>
                         <div id="card-alert" class="card red">
                             <div class="card-content white-text">
                                 <p><i class="mdi-alert-error"></i> Alerta : El Año Final debe de ser Mayor o Igual al Año inicial</p>
                             </div>
                             <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                 <span aria-hidden="true">×</span>
                             </button>
                         </div>
                            <%
                            }
                            }
                            else
                            {
                                 %>
                         <div id="card-alert" class="card red">
                             <div class="card-content white-text">
                                 <p><i class="mdi-alert-error"></i> Alerta : Seleccione el Año Final por favor</p>
                             </div>
                             <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                 <span aria-hidden="true">×</span>
                             </button>
                         </div>
                            <%
                            }
                            }
                            else
                            {
                            %>
                         <div id="card-alert" class="card red">
                             <div class="card-content white-text">
                                 <p><i class="mdi-alert-error"></i> Alerta : Seleccione el Año Inicial por favor</p>
                             </div>
                             <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                 <span aria-hidden="true">×</span>
                             </button>
                         </div>
                            <%
                            }
                            %>
                        </div>
                    </div>
                </div>
                <%               
            } %>
</asp:Content>

