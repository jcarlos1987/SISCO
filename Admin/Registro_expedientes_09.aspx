<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master09.master" AutoEventWireup="true" CodeFile="Registro_expedientes_09.aspx.cs" Inherits="Admin_Control_exp_inc09_Registro_expedientes_09" %>
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
                <h5 class="breadcrumbs-title">Registro de Expendientes Incidencia 09</h5>
                <ol class="breadcrumbs">
                  <li><a href="Default.aspx">Inicio</a>
                  </li>
                  <li><a href="Incidencia09.aspx">Incidencia 09</a>
                  </li>
                  <li><a href="Control_Expedientes_Inc_09.aspx">Control de Expendientes Incidencia 09</a></li>
                  <li class="active">Registro de Expedientes</li>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="row" runat="server"> 
          <div class="col s12 m12 l12">
                <div class="card-panel">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="Reg" EventName="TextChanged" />
                            <asp:PostBackTrigger ControlID="Reg_Exped" />
                        </Triggers>
                        <ContentTemplate>
                    <div class="section">
                    <h4 class="header2">Registre el expediente:</h4>

                        <div class="row">
                            <div class="col col s12 m12 l8">
                            <div class="col col s12 m4 l4">
                                <label>Registro Patronal:</label>  
                                <asp:TextBox ID="Reg" runat="server"  
                                        AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" MaxLength="12"></asp:TextBox>  
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                            <div class="col col s12 m8 l8">
                                 <label>Razón Social</label>
                               <asp:TextBox ID="Raz_soc" runat="server" AutoPostBack="True" Enabled="false"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>
                            <div class="col col s12 m4 l4">
                                 <label>Importe C.O.P.</label>
                                 <asp:TextBox ID="cop" runat="server" Enabled="false"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>   
                                    </div>

                             <div class="col col s12 m4 l4">
                                <label>Importe R.C.V:</label>
                                <asp:TextBox ID="rcv" runat="server" enabled="false"></asp:TextBox>  
                                <div class="input-field">
                                <div class="errorTxt6"></div>
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
                                <label>Subdelegación:</label>  
                              <asp:TextBox ID="sub" runat="server" Enabled="false"></asp:TextBox> 
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                            <div class="col col s12 m4 l4">
                                 <label>Rango</label>
                                  <asp:TextBox ID="Rango" runat="server" Enabled="false"></asp:TextBox> 
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>
                           
                            <div class="col col s12 m4 l4">
                                 <label>Fecha de Recepción:</label>
                                <asp:TextBox ID="Fecha_Recep" runat="server" placeholder="DD/MM/AAAA" CssClass="custom-calendar"></asp:TextBox>
                                <cc1:CalendarExtender ID="Fecha_Recep_CalendarExtender" runat="server" 
                                    BehaviorID="Fecha_Recep_CalendarExtender" CssClass="custom-calendar" 
                                    TargetControlID="Fecha_Recep" Format="dd/MM/yyyy" />
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>
                              </div>





                        
                       <%-- inicio responsabilidad solidaria--%>
                            <div class="col col s12 m12 l4">
                        <div class="col col s12 m4 l6">
                                <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="CheckBox1_CheckedChanged" 
                                    Text=" &nbsp; &nbsp;RESPONSABILIDAD SOLIDARIA" 
                                    ValidationGroup="RESPONSABILIDAD SOLIDARIA" />
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>     
                            </div>

                             <div class="col col s12 m4 l6">
                                 <label>Importe C.O.P.  R.S. :</label>
                                  <asp:TextBox ID="cop2" runat="server" Enabled="false" AutoPostBack="True" ontextchanged="cop2_TextChanged"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                             <div class="col col s12 m4 l6">
                                 <label>Importe R.C.V.  R.S. :</label>
                                   <asp:TextBox ID="rcv2" runat="server" AutoPostBack="True"  
                                    Enabled="false" ontextchanged="rcv2_TextChanged"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>

                             <div class="col col s12 m4 l6">
                                 <label>Importe Total R.S. :</label>
                                 <asp:TextBox ID="tot2" runat="server" class="form-control" Enabled="false" 
                                    Width="170px"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>


                              <div class="col col s12 m4 l12">
                                 <label>Socio(s):</label>
                                  <asp:TextBox ID="Socios" runat="server" Rows="3" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                              
                            </div>
                                </div>
                            <%--fin responsabilidad solidaria--%>

                              <div class="input-field col s4">
                                    <div class="input-field col s12">         
                               <asp:Button ID="Reg_Exped" runat="server" CssClass="btn cyan" Text="Registrar Expediente" onclick="Reg_Exped_Click"/>
                             </div>
                            </div>
                            <div class="input-field col s4">
                                <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                                </div>
                        </div>
                    </div> <%--Fin de Section--%>
                            </ContentTemplate>
                        </asp:UpdatePanel>

         </div>
 </div>
         </div>
    
</asp:Content>