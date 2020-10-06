<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master"  AutoEventWireup="true" CodeFile="CmbioPwd.aspx.cs" Inherits="Admin_CmbioPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
     <li class="bold active"><a href="CmbioPwd.aspx" class="waves-effect waves-cyan"><i class="mdi-social-pages"></i>Inicio</a>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
        <div id="breadcrumbs-wrapper" class=" grey lighten-3">           
          <div class="container">
            <div class="row">
              <div class="col s12 m12 l12">
             <img src="../images/SISCO_2_2_2.png" width="150" align="right" alt="Sistema de Supervisión de Cobranza"/>
                 <h5 class="breadcrumbs-title">DEPARTAMENTO DE SUPERVISIÓN COBRANZA</h5>
                <ol class="breadcrumbs">
                  <li ><a href="Default.aspx">Inicio</a>
                  </li>
                 <li class="active"> Cambio de Contraseña </li>
                </ol>
              </div>
            </div>
          </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">       
    </asp:ScriptManager>
                <div class="card-panel">
                    <div class="section">
    <div class="row">
         <h4 class="header2">Ingrese los Datos:</h4>
                        <div class="input-field col s12 l6 m12">
                          <i class="mdi-action-settings prefix"></i>
                          <asp:TextBox ID="PassAnterior" runat="server" TextMode="Password" OnTextChanged="PassAnterior_TextChanged" AutoPostBack="true" ></asp:TextBox>
                          <label for="icon_prefix3">Contraseña Anterior</label>
                        </div>
                        <div class="input-field col s12 l6 m12">
                          <i class="mdi-social-person prefix"></i>
                           <asp:TextBox ID="PassNueva" runat="server" TextMode="Password" ></asp:TextBox>
                          <label for="icon_telephone">Nueva Contraseña</label>
                        </div>

                        <div class="input-field col s12 l6 m12">
                          <i class="mdi-social-person prefix"></i>
                           <asp:TextBox ID="PassConfirmacion" runat="server" TextMode="Password"></asp:TextBox>
                          <label for="icon_telephone">Confirmar Nueva Contraseña</label>
                        </div>
                      
                        <div class="col s12 l6 m12 input-field">
                            <asp:Button ID="Reporte" runat="server" CssClass="btn cyan" Text="Cambiar Contraseña" OnClick="Reporte_Click"   />                 
                        </div>
        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="PassNueva" ControlToCompare="PassConfirmacion" runat="server" CssClass="card red" ErrorMessage="Las Contraseñas no Coinciden. Intente de Nuevo."></asp:CompareValidator>
                      </div>
                        <asp:Label ID="LabelErrorPass" runat="server" Text=""></asp:Label>
                        <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
     

</asp:Content>

