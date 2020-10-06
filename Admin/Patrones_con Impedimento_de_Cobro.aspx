<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="Patrones_con Impedimento_de_Cobro.aspx.cs" Inherits="Admin_Patrones_con_Impedimento_de_Cobro" %>

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
                <img src="../images/SISCO_2_2_2.png" width="150" align="right" alt="Sistema de Supervisión de Cobranza"/>
                  <h5 class="breadcrumbs-title">Patrones con Impedimento de Cobro</h5>
                <ol class="breadcrumbs">
                  <li><a href="Default.aspx">Inicio</a>
                  </li>
                  <li><a href="Analisis_del_Rale.aspx">Comite Delegacional</a>
                  </li>
                  <li class="active">Patrones con Impedimento de Cobro</li>
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
                            <a href="#" class="waves-effect waves-cyan"><i class="mdi-action-visibility"></i>Supervision Web</a>
                        </li>


                        <li class="no-padding">
                            <ul class="collapsible">
                                <li class="bold ">
                                    <a class="collapsible-header waves-effect waves-cyan "><i class="mdi-av-repeat"></i>Seguimiento de Bases</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li ><a href="../Admin/RalevsRale.aspx">Rale vs Rale</a>
                                            </li>
                                            <li >
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
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-communication-location-off"></i>Incidencia 09</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="Incidencia09.aspx">Incidencia 09</a>
                                            </li>
                                            <li><a href="Control_Expedientes_Inc_09.aspx">Cont.ExpendientesInc09</a>
                                            </li>                                        
                                        </ul>
                                    </div>
                                </li>

                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan active"><i class="mdi-social-location-city"></i>Comite Delegacional</a>
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
                                            <li class="active"><a href="Patrones_con Impedimento_de_Cobro.aspx">Patrones <%--con Impedimento de Cobro--%></a>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="row" runat="server">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Seleccione:</h4>
              
                            <div class="row">
                        <div class="row">
                            
                            <div class="col col s12 m4 l4">
                                <label>Tipo de Rale: </label>  
                              <asp:DropDownList ID="tipo" runat="server" AutoPostBack="True" onselectedindexchanged="tipo_SelectedIndexChanged"></asp:DropDownList>
                               <div class="input-field">
                               <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>

                            <div class="col col s12 m4 l4">
                                 <label>Selecciona Rale:</label>
                                <asp:DropDownList ID="rale" runat="server" Enabled="false" AutoPostBack="True" onselectedindexchanged="rale_SelectedIndexChanged"></asp:DropDownList>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                            <div class="col col s12 m4 l4">
                                <label>Subdelegación:</label>
                                  <asp:DropDownList ID="sub" Enabled="false" runat="server" AutoPostBack="True" onselectedindexchanged="sub_SelectedIndexChanged"></asp:DropDownList> 
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>   
                                    </div>
                           
      
                             <div class="input-field col s4">
                                    <div class="input-field col s12">
                                      <asp:Button ID="Reporte" runat="server" CssClass="btn cyan" Text="Generar Reporte" onclick="Reporte_Click" />    
                                    </div>
                            </div>
                        </div>
                    </div>
                         <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                     <div class="row" runat="server" id="grid_general" visible="false"> 
                         
                         <div class="col s12 m12 l12" ><span class="flow-text"><center><b><asp:Label ID="LabelEncabezado" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                        <div class="col s12 m12 l12" ><span class="flow-text"><center><b><asp:Label ID="LabelSubdelegacion" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                        <div class="col s12 m12 l12" ><span class="flow-text"><center><b><asp:Label ID="LabelFecha" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                 
                                <div class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                    <a class="btn-floating btn-large">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>                                       
                                        <li>
                                            <asp:LinkButton ID="ImprimeReporte" CssClass="btn-floating green" runat="server" onclick="Detlle_Click" ><i class="large mdi-action-print"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                          
                  <div class="col s12 m12 l12">
                      <div class="col s12 m12 l12" ><span class="flow-text"><b><asp:Label ID="LabelResumen" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></span>
                                        </div>
                                         <div class="row" runat="server" id="grid_2" >
                                                                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false"  ShowHeader="False"  OnRowCreated="GridView2_RowCreated" CssClass="mGrid responsive-table" AlternatingRowStyle-CssClass="alt">
                                                                             <Columns>
                                                                                 <asp:BoundField DataField="pat6"> 
                                                                                 <ItemStyle  CssClass="right-align"/>
                                                                                 </asp:BoundField>

                                                                                 <asp:BoundField DataField="cred_6" DataFormatString="{0:N0}"> 
                                                                                 <ItemStyle   CssClass="right-align"  />
                                                                                 </asp:BoundField>
  
                                                                                 <asp:BoundField DataField="dias_6"> 
                                                                                 <ItemStyle   CssClass="right-align" />
                                                                                 </asp:BoundField>

                                                                                  <asp:BoundField DataField="impo_6" DataFormatString="{0:N2}"> 
                                                                                  <ItemStyle   CssClass="right-align"  />
                                                                                  </asp:BoundField>

                                                                                  <asp:BoundField DataField="pat_9"> 
                                                                                  <ItemStyle   CssClass="right-align" />
                                                                                  </asp:BoundField>

                                                                                  <asp:BoundField DataField="cred_9" DataFormatString="{0:N0}"> 
                                                                                  <ItemStyle   CssClass="right-align"  />
                                                                                  </asp:BoundField>
  
                                                                                 <asp:BoundField DataField="dias_9"> 
                                                                                 <ItemStyle   CssClass="right-align" />
                                                                                 </asp:BoundField>

                                                                                 <asp:BoundField DataField="impo_9" DataFormatString="{0:N2}"> 
                                                                                 <ItemStyle   CssClass="right-align"  />
                                                                                 </asp:BoundField>

                                                                                  <asp:BoundField DataField="pat_10"> 
                                                                                  <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>

                                                                                  <asp:BoundField DataField="cred_10" DataFormatString="{0:N0}"> 
                                                                                  <ItemStyle   CssClass="right-align"  />
                                                                                  </asp:BoundField>
  
                                                                                  <asp:BoundField DataField="dias_10"> 
                                                                                  <ItemStyle   CssClass="right-align"  />
                                                                                  </asp:BoundField>

                                                                                   <asp:BoundField DataField="impo_10" DataFormatString="{0:N2}"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>

                                                                                   <asp:BoundField DataField="pat_12"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>

                                                                                  <asp:BoundField DataField="cred_12" DataFormatString="{0:N0}"> 
                                                                                  <ItemStyle   CssClass="right-align" />
                                                                                  </asp:BoundField>
  
                                                                                   <asp:BoundField DataField="dias_12"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>

                                                                                    <asp:BoundField DataField="impo_12" DataFormatString="{0:N2}"> 
                                                                                    <ItemStyle   CssClass="right-align"/>
                                                                                    </asp:BoundField>

                                                                                    <asp:BoundField DataField="pat_14"> 
                                                                                    <ItemStyle   CssClass="right-align"  />
                                                                                    </asp:BoundField>

                                                                                   <asp:BoundField DataField="cred_14" DataFormatString="{0:N0}"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>
  
                                                                                   <asp:BoundField DataField="dias_14"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>

                                                                                   <asp:BoundField DataField="impo_14" DataFormatString="{0:N2}"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                    </asp:BoundField>

                                                                                      <asp:BoundField DataField="pat_19"> 
                                                                                      <ItemStyle   CssClass="right-align" />
                                                                                      </asp:BoundField>

                                                                                      <asp:BoundField DataField="cred_19" DataFormatString="{0:N0}"> 
                                                                                      <ItemStyle   CssClass="right-align"  />
                                                                                      </asp:BoundField>
  
                                                                                      <asp:BoundField DataField="dias_19"> 
                                                                                      <ItemStyle   CssClass="right-align"  />
                                                                                      </asp:BoundField>

                                                                                      <asp:BoundField DataField="impo_19" DataFormatString="{0:N2}"> 
                                                                                      <ItemStyle   CssClass="right-align" />
                                                                                      </asp:BoundField>

                                                                                      <asp:BoundField DataField="pat_26"> 
                                                                                      <ItemStyle   CssClass="right-align"  />
                                                                                      </asp:BoundField>

                                                                                     <asp:BoundField DataField="cred_26" DataFormatString="{0:N0}"> 
                                                                                     <ItemStyle   CssClass="right-align"  />
                                                                                    </asp:BoundField>
  
                                                                                    <asp:BoundField DataField="dias_26"> 
                                                                                    <ItemStyle   CssClass="right-align" />
                                                                                    </asp:BoundField>

                                                                                   <asp:BoundField DataField="impo_26" DataFormatString="{0:N2}"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>

                                                                                   <asp:BoundField DataField="pat_tot"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>

                                                                                   <asp:BoundField DataField="cred_tot" DataFormatString="{0:N0}"> 
                                                                                   <ItemStyle   CssClass="right-align"  />
                                                                                   </asp:BoundField>
  
                                                                                  <asp:BoundField DataField="dias_tot"> 
                                                                                  <ItemStyle   CssClass="right-align"  />
                                                                                  </asp:BoundField>

                                                                                 <asp:BoundField DataField="impo_tot" DataFormatString="{0:N2}"> 
                                                                                 <ItemStyle   CssClass="right-align" />
                                                                                 </asp:BoundField>
                                                                                 </Columns>
                                                                                </asp:GridView>
                                                                            </div>
                      <div class="row">
                       <div class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                    <a class="btn-floating btn-large">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>                                       
                                        <li>
                                            <asp:LinkButton ID="LinkButton1" CssClass="btn-floating green" runat="server" onclick="Impri_Click" ><i class="large mdi-action-print"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                      </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

              <ContentTemplate>   
                                   <div class="col s12 m12 l12" ><span class="flow-text"><b><asp:Label ID="LabelDetalles" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></span>
                                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  ShowHeader="False" 
                        onrowcreated="GridView1_RowCreated" CssClass="mGrid responsive-table" AlternatingRowStyle-CssClass="alt" PageSize="25" PagerStyle-CssClass="pgr" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" >
                        <Columns>
                           <asp:BoundField DataField="id"> 
                          <ItemStyle CssClass="center-align"/>
                           </asp:BoundField>
                           <asp:BoundField DataField="reg_pat" >
                           <ItemStyle CssClass="center-align"/>
                           </asp:BoundField>
                           <asp:BoundField DataField="razon" >
                          <ItemStyle CssClass="left-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="cred_6" DataFormatString="{0:N0}">
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="dias_6" >
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="impo_6" DataFormatString="{0:N2}">
                           <ItemStyle CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="cred_9" DataFormatString="{0:N0}" >
                          <ItemStyle CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="dias_9" >
                           <ItemStyle   CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="impo_9" DataFormatString="{0:N2}">
                          <ItemStyle CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="cred_10" DataFormatString="{0:N0}">
                          <ItemStyle CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="dias_10" >
                           <ItemStyle  CssClass="right-align"/>
                           </asp:BoundField>
                           <asp:BoundField DataField="impo_10" DataFormatString="{0:N2}">
                           <ItemStyle CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="cred_12" DataFormatString="{0:N0}">
                           <ItemStyle  CssClass="right-align"/>
                           </asp:BoundField>
                           <asp:BoundField DataField="dias_12" >
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="impo_12" DataFormatString="{0:N2}">
                           <ItemStyle CssClass="right-align" />
                           </asp:BoundField>

                            <asp:BoundField DataField="cred_14" DataFormatString="{0:N0}">
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="dias_14" >
                          <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="impo_14" DataFormatString="{0:N2}">
                          <ItemStyle CssClass="right-align" />
                           </asp:BoundField>

                            <asp:BoundField DataField="cred_19" DataFormatString="{0:N0}">
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="dias_19" >
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="impo_19" DataFormatString="{0:N2}">
                          <ItemStyle CssClass="right-align" />
                           </asp:BoundField>

                            <asp:BoundField DataField="cred_26" DataFormatString="{0:N0}">
                          <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="dias_26" >
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="impo_26" DataFormatString="{0:N2}">
                           <ItemStyle   CssClass="right-align" />
                           </asp:BoundField>

                            <asp:BoundField DataField="cred_tot" DataFormatString="{0:N0}">
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="dias_tot" >
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>
                           <asp:BoundField DataField="impo_tot" DataFormatString="{0:N2}">
                           <ItemStyle CssClass="right-align" />
                           </asp:BoundField>
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
                     </asp:GridView></ContentTemplate></asp:UpdatePanel>
                                   
                           
                      </div>
                </div>

                 </div>
                    </div>
                    </div>
                </div>


            
</asp:Content>                                                                  

