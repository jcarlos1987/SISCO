﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master09.master" AutoEventWireup="true" CodeFile="Cancelacion.aspx.cs" Inherits="Admin_Cancelacion" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
     /*///////////////////////////////*/
        /*                               */
        /*    Estilo del Calendario      */
        /*                               */
        /*///////////////////////////////*/
        .custom-calendar .ajax__calendar_container
        {
            background-color: White;
            border:solid 1px #666;
        }
        .custom-calendar .ajax__calendar_title
        {
            height:20px;
            color:#333;
        }
        .custom-calendar .ajax__calendar_prev,
        .custom-calendar .ajax__calendar_next
        {
            background-color:#aaa; /* darker gray */
            height:20px;
            width:20px;
        }
        .custom-calendar .ajax__calendar_today
        {
            background-color: #00CE6F;  /* pale blue */
            height:20px;
        }
        .custom-calendar .ajax__calendar_days table thead tr td
        {
            color:#333;
        }
        .custom-calendar .ajax__calendar_day
        {
            color:#333; /* normal day - darker gray color */
        }
        .custom-calendar .ajax__calendar_other .ajax__calendar_day
        {
            background-color:#D5D6DA;
            color: Black; /* day not actually in this month - lighter gray color */
        }
        .custom-calendar .ajax__calendar_invalid .ajax__calendar_day
        {
            background-color: #AAAAAA;
            color: Black;
            text-decoration: line-through;
            cursor: not-allowed;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
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
                            <a href="#" class="collapsible-header waves-effect waves-cyan "><i class="mdi-social-person-outline"></i>Incidencias PAE</a>
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
                                            <li><a href="Situacion_de_la cartera_ejerci_anteriores.aspx">Situación <%--de la Cartera Ejer. Anteriores--%></a>
                                            </li>  
                                             <li><a href="Situacion_de_la_Cartera_ejerc_envigor.aspx">Situación <%--de la Cartera Ejer. en Vigor--%></a>
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
                                             <li <%--class="active"--%>><a href="../SUA/Default.aspx">Consulta Información</a>
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
            <!-- Search for small screen -->
            <div class="header-search-wrapper grey hide-on-large-only">
                <i class="mdi-action-search active"></i>
                <input type="text" name="Search" class="header-search-input z-depth-2" placeholder="Explore Materialize"/>
            </div>
          <div class="container">
            <div class="row">
              <div class="col s12 m12 l12">
                <h5 class="breadcrumbs-title">Seguimiento de Expedientes del Departamento de Supervisión Cobranza:</h5>
                <ol class="breadcrumbs">
                  <li><a href="Default.aspx">Inicio</a>
                  </li>
                  <li><a href="Incidencia09.aspx">Incidencia 09</a>
                  </li>
                    <li><a href="Control_Expedientes_Inc_09.aspx">Cont.ExpedientesInc09</a>
                  </li>
                    <li class="active">Seguimiento de Expedientes del Departamento de Supervisión Cobranza:</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <div class="row" runat="server"> 
          <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Información del expediente:</h4>

                        <div class="row">
                            <div class="col col s12 m12 l12">
                            <div class="col col s12 m4 l4">
                                <label>Registro Patronal:</label>  
                                <asp:TextBox ID="Reg" runat="server" Enabled="false" MaxLength="12"></asp:TextBox>  
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                            <div class="col col s12 m8 l8">
                                 <label>Razón Social</label>
                               <asp:TextBox ID="Raz_soc" runat="server" Enabled="false"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>
                                 <div class="col col s12 m12 l12">
                            <div class="col col s12 m5 l5">
                                 <label>Importe C.O.P.</label>
                                 <asp:TextBox ID="cop" runat="server" Enabled="false"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>   
                                    </div>

                                 <div class="col col s12 m5 l5">
                                 <label>No. Creditos C.O.P.</label>
                                 <asp:TextBox ID="c_cop" runat="server" Enabled="false"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>   
                                    </div>
                                     </div>
                                 <div class="col col s12 m12 l12">
                             <div class="col col s12 m4 l5">
                                <label>Importe R.C.V:</label>
                                <asp:TextBox ID="rcv" runat="server" enabled="false"></asp:TextBox>  
                                <div class="input-field">
                                <div class="errorTxt6"></div>
                             </div>
                                 </div>

                                      <div class="col col s12 m5 l5">
                                 <label>No. Creditos R.C.V.</label>
                                 <asp:TextBox ID="c_rcv" runat="server" Enabled="false"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>   
                                    </div>
                                     </div>

                            <div class="col col s12 m4 l4">
                               <label>Importe Total:</label>
                               <asp:TextBox ID="Tot" runat="server" Enabled="false"></asp:TextBox>                               
                              <div class="input-field">
                                <div class="errorTxt6"></div>
                            </div>
                                </div>
                            
                            <div class="col col s12 m4 l4">
                                <label>Subdelegación :</label>  
                              <asp:TextBox ID="sub" runat="server" Enabled="false"></asp:TextBox> 
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                            <div class="col col s12 m4 l4">
                                 <label>Rango :</label>
                                  <asp:TextBox ID="Rango" runat="server" Enabled="false"></asp:TextBox> 
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                            
                           
                            <div class="col col s12 m4 l4">
                                 <label>Fecha de Recepción :</label>
                                <asp:TextBox ID="Fecha_Recep" runat="server" CssClass="custom-calendar" Enabled="false"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                             <div class="col col s12 m4 l4">
                                 <label>Fecha de Sesión :</label>
                                  <asp:TextBox ID="Fecha_se" runat="server" ></asp:TextBox>
                                  <cc1:CalendarExtender ID="Fecha_se_CalendarExtender" runat="server" 
                                    BehaviorID="Fecha_se_CalendarExtender" CssClass="custom-calendar" 
                                    TargetControlID="Fecha_se" Format="dd/MM/yyyy" />
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                             <div class="col col s12 m4 l4">
                                 <label>Folio DSC:</label>
                                  <asp:TextBox ID="folioDSC" runat="server"></asp:TextBox> 
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                                 <div class="col col s12 m4 l4">
                                 <label>Acuerdo:</label>
                                  <asp:TextBox ID="acuerdo" runat="server"></asp:TextBox> 
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                                 <div class="col col s12 m4 l4">
                                 <label>Folio JAC:</label>
                                  <asp:TextBox ID="folioJAC" runat="server"></asp:TextBox> 
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>
                               
                              </div>
                        
    

                              <div class="input-field col s4">
                                    <div class="input-field col s12">    
                                        <a class="waves-effect waves-light btn modal-trigger light-blue" href="#modal1">Autorizar</a>     
                                         <a class="waves-effect waves-light btn modal-trigger red" href="#modal2">Cancelar </a>   
                             </div>
                                  <div id="modal1" class="modal">
                  <div class="modal-content">
                    <p class="center-align">  Confirmación </p>
                       <div class="divider"></div>    
                    <p>¿ Estas seguro(a) que desea generar el oficio del Expediente con Razón Social de <b> <% Response.Write(Raz_soc.Text); %></b> y Registro Patronal <b><% Response.Write(Reg.Text); %> </b> ?</p>
                  </div>
                  <div class="modal-footer">
                      <div class="col m12 s12 l12">
                        <a href="#" class="waves-effect waves-red btn-flat modal-action modal-close red lighten-1">Cancelar</a>    
                                       
                        <asp:Button ID="Autorizar" runat="server" CssClass="waves-effect waves-green btn-flat modal-action modal-close cyan" Text="Aceptar" OnClick="Autorizar_Click"  />
                      </div>
                  </div>
                </div>

                                     <div id="modal2" class="modal">
                  <div class="modal-content">
                    <p class="center-align">  Confirmación </p>
                       <div class="divider"></div>    
                    <p>¿ Estas seguro(a) que desea cancelar la generación del Expediente con Razón Social de <b> <% Response.Write(Raz_soc.Text); %></b> y Registro Patronal <b><% Response.Write(Reg.Text); %> </b> ?</p>
                  </div>
                  <div class="modal-footer">
                      <div class="col m12 s12 l12">
                        <a href="#" class="waves-effect waves-red btn-flat modal-action modal-close red lighten-1">Cancelar</a>    
                          <asp:Button ID="Dev" runat="server" CssClass="waves-effect waves-green btn-flat modal-action modal-close cyan" Text="Aceptar" OnClick="Dev_Click" />   
                      </div>
                  </div>
                </div>

                            </div>
                            <div class="input-field col s4">
                                <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                                </div>
                        </div>
                    </div>
         </div>
 </div>
         </div>
</asp:Content>

