<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div id="breadcrumbs-wrapper" class=" grey lighten-3">           
          <div class="container">
            <div class="row">
              <div class="col s12 m12 l12">
             <img src="../images/SISCO_2_2_2.png" width="150" align="right" alt="Sistema de Supervisión de Cobranza"/>
                 <h5 class="breadcrumbs-title">DEPARTAMENTO DE SUPERVISIÓN COBRANZA</h5>
                <ol class="breadcrumbs">
                  <li class="active">Inicio
                  </li>
                 
                </ol>
              </div>
            </div>
          </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="menu" Runat="Server">
    <li class="bold active"><a class="waves-effect waves-cyan"><i class="mdi-social-pages"></i>Inicio</a>
        <div class="collapsible-body">
        </div>
    </li>

                        <li class="bold">
                            <a href="#" class="waves-effect waves-cyan"><i class="mdi-action-visibility"></i>Supervision Web</a>
                        </li>


                        <li class="no-padding">
                            <ul class="collapsible">
                                <li class="bold">
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
                            <a href="#" class="waves-effect waves-cyan"><i class="mdi-social-person-outline"></i>Incidencias PAE</a>
                        </li>
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-communication-location-off"></i>Incidencia 09</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="Incidencia09.aspx">Incidencia 09</a>
                                            </li>
                                            <li><a href="Control_Expedientes_Inc_09.aspx">Control Expendientes</a>
                                            </li>                                        
                                        </ul>
                                    </div>
                                </li>

                        
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-social-location-city"></i>Comite Delegacional</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="Comp_Incidencias.aspx">Comparativo por Inci.</a>
                                            </li>
                                            <li><a href="Analisis_de_Eco_por_Inci.aspx">Análisis de Eco por Inci.</a>
                                            </li>  
                                            <li><a href="Situacion_de_la cartera_ejerci_anteriores.aspx">Situación Ejer. Anterior</a>
                                            </li>  
                                             <li><a href="Situacion_de_la_Cartera_ejerc_envigor.aspx">Situación Ejer. Vigor
                                                  <%--de la Cartera Ejer. en Vigor--%></a>
                                            </li>  
                                            <li><a href="Patrones_con Impedimento_de_Cobro.aspx">Patrones Imp. Cobro</a>
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
<!--media slider-->
    <div class="row">
            <div class="col s12 m12 l12">
                <div class="card-panel">
          <div class="divider"></div>
          <div id="media-slider">
            <h4 class="header"></h4>
            <div class="row">
              <div class="col s12 m12 l12">              
              </div>
              <div class="col s12 m12 l12">
                <div class="slider">
                  <ul class="slides">
                    <li>
                      <img src="../images/62922545_amy.jpg" alt="img-1">
                      <!-- random image -->
                      <div class="caption center-align">
                        <h3>ESTADO DE MÉXICO PONIENTE</h3>
                        <h5 class="light grey-text text-lighten-3">Jefatura de Servicios de Afiliación y Cobranza</h5>
                      </div>
                    </li>
                    <li>
                      <img src="../images/20130821-090829_amy.jpg" alt="img-2">
                      <!-- random image -->
                      <div class="caption left-align">
                        <h3>"2017, Año del Nuevo Sistema de Justicia Penal"</h3>
                        <h5 class="light grey-text text-lighten-3"></h5>
                      </div>
                    </li>
                    <li>
                      <img src="../images/Sub_Toluca_amy.jpg" alt="img-3">
                      <!-- random image -->
                      <div class="caption right-align">
                        <h3>Subdelegación Toluca</h3>
                        <h5 class="light grey-text text-lighten-3">Ubicación:Isabel La Católica 123, Vértice, Toluca de Lerdo, Méx.</h5>
                      </div>
                    </li>
                    <li>
                      <img src="../images/Sub_Naucalpan_amy.jpg" alt="img-4">
                      <!-- random image -->
                      <div class="caption center-align">
                        <h3>Subdelegación Naucalpan</h3>
                        <h5 class="light grey-text text-lighten-3">Ubicación:San Andrés Atoto 100, Industrial San Andres, 53500 Naucalpan de Juárez, Méx.</h5>
                      </div>
                    </li>
                  </ul>
                </div>

              </div>
            </div>
          </div>
                    </div>
                </div>
        </div>
</asp:Content>

