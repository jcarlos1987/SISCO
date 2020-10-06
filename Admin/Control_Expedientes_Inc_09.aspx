<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="Control_Expedientes_Inc_09.aspx.cs" Inherits="Admin_Control_Expedientes_Inc_09" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


  
  <!-- Custome CSS-->    
 
   <link href="../css/media-hover-effects.css" type="text/css" rel="stylesheet" media="screen,projection">

     
  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
 <%-- <link href="../css/prism.css" type="text/css" rel="stylesheet" media="screen,projection">--%>
 <%-- <link href="../css/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">--%>
  <%--<link href="../css/chartist.min.css" type="text/css" rel="stylesheet" media="screen,projection">--%> <%-- <link href="../css/magnific-popup.css" type="text/css" rel="stylesheet" media="screen,projection">--%>
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
                  <h5 class="breadcrumbs-title">Control de Expendientes Incidencia 09</h5>
                <ol class="breadcrumbs">
                  <li><a href="index.html">Inicio</a>
                  </li>
                  <li><a href="Analisis_del_Rale.aspx">Incidencia 09</a>
                  </li>
                  <li class="active">Control de Expendientes Incidencia 09</li>
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
                                            <li class=""><a href="Analisis_del_Rale.aspx">Análisis</a>
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
                    
    
    
    
     <style>
        .tamano{

            width:250px; 
           height:500px;
        }

    </style>
    
   <%-- <div id="card-stats">
                        <div class="row">
                            <div id="tamano">
                            <div class="col s12 m6 l3">
                                <div class="card">
                                    <div class="card-content  green white-text" >
                                        <p class="card-stats-title"><i class="mdi-social-group-add"></i></p>
                                        <a href="Registro_expedientes_09.aspx">
                                        <h4 class="card-stats-number">Registro de Expedientes</h4>
                                        <br />
                                        <br />
                                            </a>
                                    </div>
                                    <div class="card-action  green darken-2">
                                        <div id="clients-bar" class="center-align"></div>
                                    </div>
                                </div>
                            </div>
                                </div>


                            <div class="col s12 m6 l3">
                                <div class="card">
                                    <div class="card-content pink lighten-1 white-text">
                                        <p class="card-stats-title"><i class="mdi-editor-insert-drive-file"></i></p>
                                        <a href="Estatus_exp_inc_09.aspx">
                                        <h4 class="card-stats-number">Estatus de Expedientes de la Incidencia 09</h4>
                                        <br />
                                        
                                    </div>
                                    <div class="card-action  pink darken-2">
                                        <div id="invoice-line" class="center-align"></div>
                                    </div>
                                </div>
                                </a>
                            </div>
                         
                               <div class="col s12 m6 l3">
                                <div class="card">
                                    <div class="card-content blue-grey white-text">
                                        <p class="card-stats-title"><i class="mdi-action-trending-up"></i></p>
                                        <a href="Seguim_exped_DSC.aspx">
                                        <h4 class="card-stats-number">Seguimiento de Expedientes del Departamento de Supervisión Cobranza</h4>
                                    </a>
                                            </div>
                                    <div class="card-action blue-grey darken-2">
                                        <div id="profit-tristate" class="center-align"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l3">
                                <div class="card">
                                    <div class="card-content purple white-text">
                                        <p class="card-stats-title"><i class="mdi-editor-attach-money"></i></p>
                                        <a href="Seguim_exped_JDSC.aspx">
                                        <h4 class="card-stats-number">Seguimiento de Expedientes de el Jefe de Supervisión Cobranza</h4>
                                            </a>
                                    </div>
                                    <div class="card-action purple darken-2">
                                        <div id="sales-compositebar" class="center-align"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    
    
    
    <!--card stats end-->

   <%--  <div id="card-stats">
                        <div class="row">
                            <div class="col s12 m6 l3">
                                <div class="card">
                                    <div class="card-content  green white-text">
                                        <p class="card-stats-title"><i class="mdi-social-group-add"></i></p>
                                        <a href="Seguim_exped_JAC.aspx">
                                        <h4 class="card-stats-number">Seguimiento de Expedientes De la Jefatura de Servicios de Afiliación y Cobranza</h4>
                                        <br />
                                        <br />
                                    </a>
                                    </div>
                                    
                                    <div class="card-action  green darken-2">
                                        <div id="clients-bar" class="center-align"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l3">
                                <div class="card">
                                    <div class="card-content pink lighten-1 white-text">
                                        <p class="card-stats-title"><i class="mdi-editor-insert-drive-file"></i></p>
                                         <a href="Seguim_exp_Delegado.aspx">
                                        <h4 class="card-stats-number">Seguimiento de Expedientes de el Delegado</h4>
                                        <br />
                                             </a>
                                    </div>
                                    <div class="card-action  pink darken-2">
                                        <div id="invoice-line" class="center-align"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col s12 m6 l3">
                                <div class="card">
                                    <div class="card-content blue-grey white-text">
                                        <p class="card-stats-title"><i class="mdi-action-trending-up"></i></p>
                                         <a href="Seguim_exped_HCCD.aspx">
                                        <h4 class="card-stats-number">Seguimiento de Expedientes del Honorable Consejo Consultivo Delegacional</h4>
                                             </a>
                                    </div>
                                    <div class="card-action blue-grey darken-2">
                                        <div id="profit-tristate" class="center-align"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
   
      
    
   
    
    
    
    
    
     
    <div class="container">
         <div class="card-panel"> 
         <div class="section">
               
          <div class="row">
                <div class="col s12 m6 grid">
                  <figure class="effect-zoe">
                    <img src="../images/1.jpg" alt="img26"/>
                    <figcaption>
                      <h2>Incidencia<span>09</span></h2>
                      <p class="icon-links">
                        <a href="Registro_expedientes_09.aspx"><li class="mdi-action-visibility" style="font-size:50px"></li></a>
                        <a href="Registro_expedientes_09.aspx"><%--<li class="mdi-file-file-upload"></li>--%></a>
                        <a href="Registro_expedientes_09.aspx"><%--<li class="mdi-file-file-upload"></li>--%></a>
                      </p>
                      <p class="description">Registro de Expendientes</p>
                    </figcaption>     
                  </figure>
                </div>


                <div class="col s12 m6 grid">
                  <figure class="effect-zoe">
                    <img src="../images/2.jpg" alt="img26"/>
                    <figcaption>
                      <h2>Incidencia<span>09</span></h2>
                      <p class="icon-links">
                        <a href="Estatus_exp_inc_09.aspx"><li class="mdi-action-visibility" style="font-size:50px"></li></a>
                        <a href="Estatus_exp_inc_09.aspx"><%--<span class="icon-eye"></span>--%></a>
                        <a href="Estatus_exp_inc_09.aspx"><%--<span class="icon-paper-clip"></span>--%></a>
                      </p>
                      <p class="description">Estatus de Expendientes de la Incidencia 09</p>
                    </figcaption>     
                  </figure>
                </div>
                           <div class="col s12 m6 grid">
                  <figure class="effect-zoe">
                    <img src="../images/3.jpg" alt="img26"/>
                    <figcaption>
                      <h2>Incidencia<span>09</span></h2>
                      <p class="icon-links">
                        <a href="Seguim_exped_DSC.aspx"><li class="mdi-action-visibility" style="font-size:50px"></li></a>
                        <a href="Seguim_exped_DSC.aspx"><%--<span class="icon-eye"></span>--%></a>
                        <a href="Seguim_exped_DSC.aspx"><%--<span class="icon-paper-clip"></span>--%></a>
                      </p>
                      <p class="description">Seguimiento de Expendientes del Departamento de Supervisión Cobranza</p>
                    </figcaption>     
                  </figure>
                </div>                 <div class="col s12 m6 grid">
                  <figure class="effect-zoe">
                    <img src="../images/4.jpg" alt="img26"/>
                    <figcaption>
                      <h2>Incidencia<span>09</span></h2>
                      <p class="icon-links">
                        <a href="Seguim_exped_JDSC.aspx"><li class="mdi-action-visibility" style="font-size:50px"></li></a>
                        <a href="Seguim_exped_JDSC.aspx"><%--<span class="icon-eye"></span>--%></a>
                        <a href="Seguim_exped_JDSC.aspx"><%--<span class="icon-paper-clip"></span>--%></a>
                      </p>
                      <p class="description">Seguimiento de Expedientes del Jefe de Supervisión Cobranza</p>
                    </figcaption>     
                  </figure>
                </div>                 <div class="col s12 m6 grid">
                  <figure class="effect-zoe">
                    <img src="../images/5.jpg" alt="img26"/>
                    <figcaption>
                      <h2>Incidencia<span>09</span></h2>
                      <p class="icon-links">
                        <a href="Seguim_exped_JAC.aspx"><li class="mdi-action-visibility" style="font-size:50px"></li></a>
                        <a href="Seguim_exped_JAC.aspx"></a>
                        <a href="Seguim_exped_JAC.aspx"></a>
                      </p>
                      <p class="description">Seguimientos de Expedientes de la Jefatura de Servicios de Afiliación y Cobranza</p>
                    </figcaption>     
                  </figure>
                </div>              <div class="col s12 m6 grid">
                  <figure class="effect-zoe">
                    <img src="../images/6.jpg" alt="img26"/>
                    <figcaption>
                      <h2>Incidencia<span>09</span></h2>
                      <p class="icon-links">
                        <a href="Seguim_exp_Delegado.aspx"><li class="mdi-action-visibility" style="font-size:50px"></li></a>
                        <a href="Seguim_exp_Delegado.aspx"></a>
                        <a href="Seguim_exp_Delegado.aspx"></a>
                      </p>
                      <p class="description">Seguimiento de Expedientes del Delgado</p>
                    </figcaption>     
                  </figure>
                </div>                     <div class="col s12 m6 grid">
                  <figure class="effect-zoe">
                    <img src="../images/7.jpg" alt="img26"/>
                    <figcaption>
                      <h2>Incidencia<span>09</span></h2>
                      <p class="icon-links">
                        <a href="Seguim_exped_HCCD.aspx"><li class="mdi-action-visibility" style="font-size:50px"></li></a>
                        <a href="Seguim_exped_HCCD.aspx"></a>
                        <a href="Seguim_exped_HCCD.aspx"></a>
                      </p>
                      <p class="description">Seguimiento de Expedientes del Honorable Consejo Consultivo Delgacional</p>
                    </figcaption>     
                  </figure>
                </div>          </div>          </div>          </div>          </div>                    </div>
            
        
</asp:Content>
