<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master09.master" AutoEventWireup="true" CodeFile="Seguim_exp_Delegado.aspx.cs" Inherits="Admin_Control_exp_inc09_Seguim_exp_Delegado" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
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
            .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=60);
        opacity: 0.6;
    }
            .modalPopup
    {
        background-color: #FFFFFF;
        width: 400px;
        border: 3px solid;
    }
    .modalPopup .header1
    {
        background-color: #2FBDF1;
        font-size: 12px;
        height: 30px;
        color: White;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }
    .modalPopup .body12
    {
        min-height: 50px;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }    .modalPopup .footer1
    {
        padding: 3px;
    }
    .modalPopup .yes, .modalPopup .no
    {
        height: 23px;
        color: White;
        line-height: 23px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
    }
    .modalPopup .yes
    {
        background-color: #2FBDF1;
        border: 1px solid #0DA9D0;
    }
    .modalPopup .no
    {
        background-color: #9F9F9F;
        border: 1px solid #5C5C5C;
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
                <h5 class="breadcrumbs-title">Seguimiento de Expedientes Del Delegado:</h5>
                <ol class="breadcrumbs">
                  <li><a href="Default.aspx">Inicio</a>
                  </li>
                  <li><a href="Incidencia09.aspx">Incidencia 09</a>
                  </li>
                  <li><a href="Control_Expedientes_Inc_09.aspx">Cont.ExpedientesInc09</a>
                  </li>
                    <li class="active">Seguimiento de Expedientes Del Delegado</li>
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
                                            <li><a href="Situacion_de_la cartera_ejerci_anteriores.aspx">Situación Ejerc Anterior <%--de la Cartera Ejer. Anteriores--%></a>
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
<%--                    <h4 class="header2">Comparación de Rales</h4>--%>
                            <div class="row">
                        <div class="row">
                            <div class="col col s12 m12 l12">
                                

     <asp:GridView ID="GridView1" AutoGenerateColumns="False" runat="server" CssClass="mGrid responsive-table" AlternatingRowStyle-CssClass="alt"
                        DataKeyNames="Registro_Patronal,Razon_Social, Rango, socio, id" DataSourceID="SqlDataSource1" AllowPaging="true"                       
                        onrowcommand="GridView1_RowCommand" PageSize="19" PagerStyle-CssClass="pgr" >
                       
                    <Columns>
                    
             <asp:BoundField DataField="sub" HeaderText=" Subdel. " HeaderStyle-CssClass="center-align" >
            <ItemStyle CssClass="center-align" />
             </asp:BoundField>  

             <asp:BoundField DataField="Registro_Patronal" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align" >
            <ItemStyle CssClass="left-align" />
             </asp:BoundField>

             <asp:BoundField DataField="Razon_Social" HeaderText=" Razon Social " HeaderStyle-CssClass="center-align" >
             <ItemStyle CssClass="left-align" /> 
             </asp:BoundField>

             <asp:BoundField DataField="Fecha_Recepcion" HeaderText=" Fecha de Recepción " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align" >
            <ItemStyle CssClass="center-align" /> 
             </asp:BoundField>

             <asp:BoundField DataField="RANGO" HeaderText=" Rango " HeaderStyle-CssClass="center-align" >
            <ItemStyle CssClass="center-align" /> 
             </asp:BoundField>
             
             <asp:BoundField DataField="IMPORTE_COP" HeaderText=" Importe COP "  DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align" >
             <ItemStyle CssClass="right-align" />
             </asp:BoundField>

             <asp:BoundField DataField="IMPORTE_RCV" HeaderText=" Importe RCV "  DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align" >
            <ItemStyle CssClass="right-align" /> 
             </asp:BoundField>

             <asp:BoundField DataField="IMPORTE_TOT" HeaderText=" Importe Total "  DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align" >
            <ItemStyle CssClass="right-align" /> 
             </asp:BoundField>

            <asp:BoundField DataField="obser" HeaderText=" Observaciones " HeaderStyle-CssClass="center-align" >
             <ItemStyle CssClass="left-align" /> 
             </asp:BoundField>    


             <asp:BoundField DataField="estatus" HeaderText=" Status " HeaderStyle-CssClass="center-align" >
            <ItemStyle CssClass="center-align" /> 
             </asp:BoundField>            

             <asp:BoundField DataField="dias" HeaderText=" Antigüedad " HeaderStyle-CssClass="center-align" >
             <ItemStyle CssClass="center-align" /> 
             </asp:BoundField>

              <asp:TemplateField HeaderText="Autori.">
            <ItemStyle CssClass="center-align"/> 
            <ItemTemplate>
                
               <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Aceptado" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" >
                   <i class="mdi-content-forward" style="font-size:26px; color:green;">   </i>           
               </asp:LinkButton>  
               <cc1:ConfirmButtonExtender ID="LinkButton1_ConfirmButtonExtender" runat="server" 
                      TargetControlID="LinkButton1" DisplayModalPopupID="mpe" />
                    
                    <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="LinkButton1" OkControlID = "btnYes"
                    CancelControlID="btnNo" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>

                   <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup col l8" Style="display: none">
                       <div class="row">
                    <div class="modal-content" style="font-size:17px; text-align:center;">
                      <div class="row">
                      <b>Confirmación</b>  
                          </div>
                   <div class="divider"></div>
                    <div class="modal-footer" style="font-size:15px; text-align:center;">
                         <div class="row">
                       ¿ Esta seguro(a) que desea autorizar el expediente con razón social de <b> <%# Eval("Razon_Social")%> </b> y registro patronal <b> <%# Eval("Registro_Patronal")%> </b>?
                             </div>
                    </div>
                    <div class="row modal-fixed-footer">                       
                        <asp:Button ID="btnYes" CssClass="btn waves-effect waves-green green" runat="server" Text="Aceptar" />
                        <asp:Button ID="btnNo" CssClass="btn waves-effect waves-red red" runat="server" Text="Cancelar" />
                    </div>
                        </div>
                        </div>
                </asp:Panel> 
            </ItemTemplate>
            </asp:TemplateField>
 <asp:TemplateField HeaderText="Devolu." HeaderStyle-CssClass="center-align">
  <ItemStyle CssClass="center-align" /> 
    <ItemTemplate>
         <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Rechazado" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" >
                   <i class="mdi-content-reply-all" style="font-size:26px; color:red;">   </i>           
               </asp:LinkButton>  
               <cc1:ConfirmButtonExtender ID="LinkButton2_ConfirmButtonExtender" runat="server" TargetControlID="LinkButton2" DisplayModalPopupID="mpeRecha" />                    
                    <cc1:ModalPopupExtender ID="mpeRecha" runat="server" PopupControlID="pnlPopupRec" TargetControlID="LinkButton2" OkControlID = "btnYesRec"
                    CancelControlID="btnNoRec" BackgroundCssClass="modalBackground">
                    </cc1:ModalPopupExtender>
                   <asp:Panel ID="pnlPopupRec" runat="server" CssClass="modalPopup col col s12 m8 l8">
                
                    <div class="modal-content col col s12" style="font-size:17px; text-align:center;">
                      <div class="row">
                      <b>Confirmación</b>  
                          </div>
                   <div class="divider"></div>
                    <div class="row col s12" style="font-size:15px; text-align:center;">
                         
                       ¿ Esta seguro(a) que desea regresar el expediente a la Subdelegación con razón social de <b> <%# Eval("Razon_Social")%> </b> y registro patronal <b> <%# Eval("Registro_Patronal")%> </b>?
                            
                    </div>
                    <div class="row col col s12 m8 l12">                       
                        <asp:Button ID="btnYesRec" CssClass="btn waves-effect waves-green green" runat="server" Text="Aceptar" />
                        <asp:Button ID="btnNoRec" CssClass="btn waves-effect waves-red red" runat="server" Text="Cancelar" />
                    </div>
                        </div>
                      
                </asp:Panel>            
    </ItemTemplate>
</asp:TemplateField>
                    </Columns>
                         <emptydatatemplate>                
                                  <div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : No hay Registros que Mostrar</p>
                                    </div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>
                        </emptydatatemplate> 
                             <PagerSettings Mode="NumericFirstLast" />
                     </asp:GridView>


      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SupervisionConnectionString %>" 
                        SelectCommand="SELECT id, sub, Registro_Patronal, Razon_Social, Fecha_Recepcion, CASE WHEN [Resp_Solid] = 'RESPONSABILIDAD SOLIDARIA' THEN [Resp_Solid] WHEN [Resp_Solid] = '' THEN [Rango] END AS RANGO, [socio], CASE WHEN [Resp_Solid] = 'RESPONSABILIDAD SOLIDARIA' THEN [Importe_COP_2] WHEN [Resp_Solid] = '' THEN [Importe_COP] END AS IMPORTE_COP, CASE WHEN [Resp_Solid] = 'RESPONSABILIDAD SOLIDARIA' THEN [Importe_RCV_2] WHEN [Resp_Solid] = '' THEN [Importe_RCV] END AS IMPORTE_RCV, CASE WHEN [Resp_Solid] = 'RESPONSABILIDAD SOLIDARIA' THEN [Importe_Total_2] WHEN [Resp_Solid] = '' THEN [Importe_Total] END AS IMPORTE_TOT, Obser, estatus, CONVERT (NVARCHAR, DATEDIFF(DD, fec_env_del3, GETDATE())) + ' Dias' AS dias FROM Registro_Expedientes WHERE estatus='EN AUTORIZACION DEL C. DELEGADO' ORDER BY Fecha_Recepcion DESC">
                    </asp:SqlDataSource>
                    <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                    <asp:Literal ID="Literal6" runat="server"></asp:Literal>

</div>
                            </div>
                                </div>
                        </div>
                    </div>
                     </div>
          </div>
</asp:Content>


