﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="Descargar_Rale.aspx.cs" Inherits="Admin_Descargar_Rale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                  <h5 class="breadcrumbs-title">Descargar Rale</h5>
                <ol class="breadcrumbs">
                  <li><a href="index.html">Inicio</a>
                  </li>
                  <li><a href="Analisis_del_Rale.aspx">Análisis de Rale </a>
                  </li>
                  <li class="active">Descargar Rale</li>
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
                                    <a class="collapsible-header waves-effect waves-cyan active"><i class="mdi-action-search"></i>Analisis de Rale</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li ><a href="Analisis_del_Rale.aspx">Análisis</a>
                                            </li>
                                            <li><a href="Dias_de_la_Incidencia.aspx">Días de la Incidencia</a>
                                            </li>
                                            <li class="active"><a href="Descargar_Rale.aspx">Descargar Rale</a>
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
    <asp:Panel ID="Panel1" runat="server">
    <div class="row" runat="server">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Seleccione:</h4>
                            <div class="row">
                        <div class="row">
                             <div class="col col s12 m6">
                                <label>Tipo de Rale:</label>
                                <asp:DropDownList ID="Tipo_Rale" runat="server" AutoPostBack="True" onselectedindexchanged="Tipo_Rale_SelectedIndexChanged">
                                  <asp:ListItem Text="-- Selecciona Tipo de Rale --" Value=""></asp:ListItem>
                                </asp:DropDownList> 
                            </div> 

                            <div class="col col  s12 m6">
                                <label>Seleccione Rale:</label>
                                        <asp:DropDownList ID="Rale1" runat="server" Enabled="false">
                                        <asp:ListItem Text="-- Selecciona Rale Base --" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </div> 
                                
                            <div class="col col  s12 m6">
                                <label>Subdelegacion:</label>
                                       <asp:DropDownList ID="TIPO" runat="server" Width="280px" >
                    </asp:DropDownList>
                            </div> 

                              <div class="input-field col s4">
                                    <div class="input-field col s12">  
                                        <asp:Button ID="Descargar" runat="server" CssClass="btn btn-move-up cyan" Text="Descargar Rale" onclick="Descargar_Click" />
                                    </div>
                            </div>
                           
                             <div class="input-field col s4">
                                <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>                                
                            </div>
                            </div>
                            <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                        </div>
                    </div>
                 </div>
                    </div>
                    </div>
                
    </asp:Panel>
 
</asp:Content>


