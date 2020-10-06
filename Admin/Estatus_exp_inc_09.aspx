<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="Estatus_exp_inc_09.aspx.cs" Inherits="Admin_Control_exp_inc09_Estatus_exp_inc_09" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div id="breadcrumbs-wrapper" class=" grey lighten-3">
            <!-- Search for small screen -->
            <div class="header-search-wrapper grey hide-on-large-only">
                <i class="mdi-action-search active"></i>
                <input type="text" name="Search" class="header-search-input z-depth-2" placeholder="Explore Materialize"/>
            </div>
          <div class="container">
            <div class="row">
              <div class="col s12 m12 l12">
                <h5 class="breadcrumbs-title">Estatus de Expendientes de la Incidencia 09</h5>
                <ol class="breadcrumbs">
                  <li><a href="Default.aspx">Inicio</a>
                  </li>
                  <li><a href="Incidencia09.aspx">Incidencia 09</a>
                  </li>
                  <li><a href="Control_Expedientes_Inc_09.aspx">Cont.ExpedientesInc09</a></li>
                 <li class="active">Estatus de Expendientes de la Incidencia 09</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="menu" Runat="Server">
    
 <li class="bold"><a href="Default.aspx" class="waves-effect waves-cyan"><i class="mdi-social-pages"></i>Inicio</a>
                        <div class="collapsible-body">
                        </div>
                    </li>

                        <li class="bold">
                            <a href="index.html" class="waves-effect waves-cyan"><i class="mdi-action-visibility"></i>Supervision Web</a>
                        </li>


                        <li class="no-padding">
                            <ul class="collapsible">
                                <li class="bold ">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-av-repeat"></i>Seguimiento de Bases</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../Admin/RalevsRale.aspx">Rale vs Rale</a>
                                            </li>
                                            <li>
                                                <a href="BD_ExcelvsRale.aspx">B.D. Excel vs Rale</a>
                                            </li>
                                             <li>
                                                <a href="X_fecha_de_notificacion.aspx">Fecha de Notificación</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                          
                        
                        
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-action-search"></i>Analisis de Rale</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="Analisis_del_Rale.aspx">Análisis</a>
                                            </li>
                                            <li><a href="Dias_de_la_Incidencia.aspx">Días de la Incidencia</a>
                                            </li>
                                            <li><a href="Descargar_Rale.aspx">Descargar Rale</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>

                        <li class="bold">
                            <a href="#" class="collapsible-header waves-effect waves-cyan"><i class="mdi-social-person-outline"></i>Incidencias PAE</a>
                        </li>
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan active"><i class="mdi-communication-location-off"></i>Incidencia 09</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="Incidencia09.aspx">Incidencia 09</a>
                                            </li>
                                            <li class="active"><a href="Control_Expedientes_Inc_09.aspx">Cont.ExpendientesInc09</a>
                                            </li>                                        
                                        </ul>
                                    </div>
                                </li>

                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-social-location-city"></i>Comite Delegacional</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="Comp_Incidencias.aspx">Comp.Incidencia</a>
                                            </li>
                                            <li><a href="Analisis_de_Eco_por_Inci.aspx">Análisis de Eco por Inc</a>
                                            </li>  
                                            <li><a href="Situacion_de_la cartera_ejerci_anteriores.aspx">Situación Ejerc Anterior. <%--de la Cartera Ejer. Anteriores--%></a>
                                            </li>  
                                             <li><a href="Situacion_de_la_Cartera_ejerc_envigor.aspx">Situación Ejerc Vigor <%--de la Cartera Ejer. en Vigor--%></a>
                                            </li>  
                                            <li><a href="Patrones_con Impedimento_de_Cobro.aspx">Patrones <%--con Impedimento de Cobro--%></a>
                                            </li>                                        
                                        </ul>
                                    </div>
                                </li>
                            
                    
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-notification-disc-full"></i> CD-SUA</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../SUA/Default.aspx">Consulta Información</a>
                                            </li>
                                           <li><a href="../SUA/Historial.aspx">Historial Patronal</a>
                                            </li>
                                             <li><a href="../SUA/Trabajador.aspx">Historial Trabajador</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                           
                                 <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-file-file-upload"></i>Cargas Al sistema</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li>
                                                <%--class="active"--%><a href="#">S. del Presupuesto</a>
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
                                                <a href="Carga_Rale.aspx">Rale</a>
                                            </li>

                                            <li> 
                                                <a href="Base_Personalisada.aspx">Base de Datos Personalizada</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                   


                                 </ul>
                        </li>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
                                </asp:ScriptManager> 
     <div class="row" runat="server">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                  <%--  <h4 class="header2">Comparación de Rales</h4>--%>
                            <div class="row">
                        <div class="row">
                            <div class="col col s12 m12 l12">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
              <ContentTemplate>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="mGrid responsive-table" AlternatingRowStyle-CssClass="alt" OnRowDataBound="GridView1_RowDataBound" AllowPaging="true" PageSize="25" PagerStyle-CssClass="pgr">
        <Columns>
            <asp:TemplateField HeaderText="Serial No" HeaderStyle-CssClass="center-align">
                        <ItemTemplate>
                        <left>
                            <asp:Label ID="Label1" runat="server"
                                Text='<%# (GridView1.PageSize * GridView1.PageIndex) + Container.DisplayIndex + 1 %>' Font-Bold="True">
                            </asp:Label>
                        </left>
                        </ItemTemplate>
                        <ItemStyle ForeColor="Black" HorizontalAlign="Center" Width="5px" />
                    </asp:TemplateField>
    <asp:BoundField DataField="sub" HeaderText="Sub" SortExpression="sub" HeaderStyle-CssClass="center-align" > <ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="Registro_Patronal" HeaderText="Reg. Patronal" SortExpression="Registro_Patronal" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="Razon_Social" HeaderText="Razon Social" SortExpression="Razon_Social" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="left-align" /></asp:BoundField>
    <asp:BoundField DataField="Fecha_Recepcion" HeaderText="Fech. Recep."  SortExpression="Fecha_Recepcion" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="RANGO" HeaderText="Rango" ReadOnly="True" SortExpression="RANGO" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="socio" HeaderText="Socio" SortExpression="socio" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="left-align" /></asp:BoundField>
    <asp:BoundField DataField="IMPORTE_COP" HeaderText="Imp. COP" DataFormatString="{0:N2}"  ReadOnly="True" SortExpression="IMPORTE_COP" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="right-align" /></asp:BoundField>
    <asp:BoundField DataField="IMPORTE_RCV" HeaderText="Imp. RCV" DataFormatString="{0:N2}" ReadOnly="True" SortExpression="IMPORTE_RCV" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="right-align" /></asp:BoundField>
    <asp:BoundField DataField="IMPORTE_TOT" HeaderText="Imp. TOT" DataFormatString="{0:N2}" ReadOnly="True" SortExpression="IMPORTE_TOT" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="right-align" /></asp:BoundField>
    <asp:BoundField DataField="Obser" HeaderText="Observación" SortExpression="Obser" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="left-align" /></asp:BoundField>    
    <asp:BoundField DataField="fec_env_j1" HeaderText="Fec. Env Jefe Supervi."  SortExpression="fec_env_j1" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="fec_env_jac2" HeaderText="Fec. Env JAC"  SortExpression="fec_env_jac2" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="fec_env_del3" HeaderText="Fec. Env Del" SortExpression="fec_env_del3" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="fec_env_hcc4" HeaderText="Fec. Env HCCD"  SortExpression="fec_env_hcc4" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="fec_termino5" HeaderText="Fec. Termino" SortExpression="fec_termino5" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
    <asp:BoundField DataField="estatus" HeaderText="Estatus" SortExpression="estatus" HeaderStyle-CssClass="center-align" ><ItemStyle CssClass="center" /></asp:BoundField>
        </Columns>
        <PagerSettings Mode="NumericFirstLast" />
                        </asp:GridView></ContentTemplate></asp:UpdatePanel>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SupervisionConnectionString %>" 
        SelectCommand="SELECT id, sub, Registro_Patronal, Razon_Social, Fecha_Recepcion, 
	   CASE WHEN [Resp_Solid] = 'RESPONSABILIDAD SOLIDARIA' THEN [Resp_Solid] 
			WHEN [Resp_Solid] = '' THEN [Rango] END AS RANGO, [socio], 
	   CASE WHEN [Resp_Solid] = 'RESPONSABILIDAD SOLIDARIA' THEN [Importe_COP_2] 
			WHEN [Resp_Solid] = '' THEN [Importe_COP] END AS IMPORTE_COP, 
	   CASE WHEN [Resp_Solid] = 'RESPONSABILIDAD SOLIDARIA' THEN [Importe_RCV_2] 
			WHEN [Resp_Solid] = '' THEN [Importe_RCV] END AS IMPORTE_RCV, 
	   CASE WHEN [Resp_Solid] = 'RESPONSABILIDAD SOLIDARIA' THEN [Importe_Total_2] 
			WHEN [Resp_Solid] = '' THEN [Importe_Total] END AS IMPORTE_TOT, 
			Obser, estatus, [fec_env_j1],[fec_env_jac2],[fec_env_del3],[fec_env_hcc4],[fec_termino5]
  FROM [Supervision].[dbo].[Registro_Expedientes] ORDER BY id DESC"></asp:SqlDataSource>
</div>
           </div>
                                </div>
                        </div>
                    </div>
                     </div>
          </div>
</asp:Content>

