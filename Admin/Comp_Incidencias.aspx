﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="Comp_Incidencias.aspx.cs" Inherits="Admin_Comp_Incidencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
* {  
    padding: 0;  
    margin: 0;  
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
                  <h5 class="breadcrumbs-title">Comparativo por Incidencia</h5>
                <ol class="breadcrumbs">
                  <li><a href="Default.aspx">Inicio</a>
                  </li>
                  <li><a href="#">Comite Delegacional</a>
                  </li>
                  <li class="active">Comparativo por Incidencia

                  </li>
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
                                            <li class="active"><a href="Comp_Incidencias.aspx">Comp.Incidencia</a>
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
     <div class="row" runat="server">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Seleccione:</h4>
              
                            <div class="row">
                        <div class="row">
                            
                            <div class="col col s12 m4 l4">
                                <label>Tipo de Rale: </label>  
                               <asp:DropDownList ID="Tipo_Rale" runat="server" AutoPostBack="True" onselectedindexchanged="Tipo_Rale_SelectedIndexChanged">    
                                </asp:DropDownList>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>

                            <div class="col col s12 m4 l4">
                                 <label>Rale Anterior:</label>
                                 <asp:DropDownList ID="Rale1" runat="server" Enabled="false" AutoPostBack="True" onselectedindexchanged="Rale1_SelectedIndexChanged"> 
                                </asp:DropDownList>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                            <div class="col col s12 m4 l4">
                                 <label>Rale Actual:</label>
                                 <asp:DropDownList ID="Rale2" runat="server" Enabled="false" AutoPostBack="True" onselectedindexchanged="Rale2_SelectedIndexChanged"> 
                                </asp:DropDownList>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>   
                                    </div>

                             <div class="col col s12 m4 l4">
                                <label>Subdelegación:</label>
                                 <asp:DropDownList ID="TIPO" runat="server" AutoPostBack="True" Enabled="false" onselectedindexchanged="TIPO_SelectedIndexChanged">
                                </asp:DropDownList>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>   
                                    </div>
                           
                            <div class="col col s12 m6">
                                <label>Incidencia:</label>  
                              <asp:DropDownList ID="incidencia" runat="server" Enabled="false" AutoPostBack="True" onselectedindexchanged="incidencia_SelectedIndexChanged">
                                </asp:DropDownList>
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
                            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    <div class="row">
                         <div id="Encabezado" class="row" runat="server" visible="false">
                                        <div class="col s12 m12 l12" ><span class="flow-text"><center><b><asp:Label ID="LabelDelegacion" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                        <div class="col s12 m12 l12" ><span class="flow-text"><b><asp:Label ID="LabelFechaRale" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></></span>
                                        </div>
                                        <div class="col s12 m12 l12" ><span class="flow-text"><b><asp:Label ID="LabelIncidencia" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></></span>
                                        </div>
                                 
                                <div class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                    <a class="btn-floating btn-large">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>                                       
                                        <li><%--OnClick="ImprimeReporte_Click"--%>
                                            <asp:LinkButton ID="ImprimeReporte" CssClass="btn-floating green" runat="server" onclick="Impri_Click"  ><i class="large mdi-action-print"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>

     <asp:GridView ID="GridView1" runat="server" onrowcreated="GridView1_RowCreated" ShowHeader="false" 
                        AutoGenerateColumns="False" CssClass="mGrid responsive-table" AlternatingRowStyle-CssClass="alt">
                     <Columns>
                           <asp:BoundField DataField="rango_dias"> 
                           <ItemStyle CssClass="left-align" />
                           </asp:BoundField>

                           <asp:BoundField DataField="credito_uno" DataFormatString="{0:N0}"> 
                           <ItemStyle CssClass="right-align"  />
                           </asp:BoundField>

                           <asp:BoundField DataField="importe_uno" DataFormatString="{0:N2}"> 
                           <ItemStyle CssClass="right-align" />
                           </asp:BoundField>

                           <asp:BoundField DataField="credito_dos" DataFormatString="{0:N0}"> 
                           <ItemStyle CssClass="right-align" />
                           </asp:BoundField>

                           <asp:BoundField DataField="importe_dos" DataFormatString="{0:N2}"> 
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>

                           <asp:BoundField DataField="Cred_dif" DataFormatString="{0:N0}"> 
                           <ItemStyle  CssClass="right-align" />
                           </asp:BoundField>

                           <asp:BoundField DataField="importe_dif" DataFormatString="{0:N2}"> 
                           <ItemStyle  CssClass="right-align"  />
                           </asp:BoundField>
                      </Columns>
                    </asp:GridView>

                             </div>
                     
                    </div>


                 </div>
                    </div>
                    </div>
                </div> 
</asp:Content>