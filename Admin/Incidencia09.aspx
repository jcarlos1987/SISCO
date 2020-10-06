<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" EnableEventValidation = "false" CodeFile="Incidencia09.aspx.cs" Inherits="Admin_Incidencia09" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">

.mGrid {  
    width: 100%;  
    background-color: #fff;  
    /*margin: 5px 0 10px 0;*/  
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
        /*color: #fff;  
        background: #424242 url(grd_head.png) repeat-x top;*/  
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







.mGridDos {  
    width: 100%;  
    background-color: #fff;  
    margin: 5px 0 10px 0;  
    border: solid 1px #525252;  
    border-collapse: collapse;  
}  
  
    .mGridDos td {  
        padding: 2px;  
        border: solid 1px #c1c1c1;  
        color: #717171;  
        font: 11px Tahoma; 
    }  
  
    .mGridDos th {  
        padding: 4px 2px;  
        color: #fff;  
        background: #424242 url(grd_head.png) repeat-x top;  
        border-left: solid 1px #525252;  
        font-size: 12px;  
    }  
  
    .mGridDos .altDos {  
        background: #fcfcfc url(grd_alt.png) repeat-x top;  
    }  
  
    .mGridDos .pgrDos {  
        background: #424242 url(grd_pgr.png) repeat-x top;  
        text-align:center;
    }  
  
        .mGridDos .pgrDos table {  
            margin: 5px 0;  
        }  
  
        .mGridDos .pgrDos td {  
            border-width: 0;  
            padding: 0 6px;  
            border-left: solid 1px #666;  
            font-weight: bold;  
            color: #fff;  
            line-height: 12px;  
        }  
  
        .mGridDos .pgrDos a {  
            color: #666;  
            text-decoration: none;  
        }  
  
            .mGridDos .pgrDos a:hover {  
                color: #000;  
                text-decoration: none;  
            }  
            .GridPager a, .GridPager span
    {
        display: block;
        height: 20px;
        width: 25px;
        font-weight: bold;
        text-align: center;
        text-decoration: none;
    }
    .GridPager a
    {
        background-color: #f5f5f5;
        color: #969696;
        border: 1px solid #969696;
    }
    .GridPager span
    {
        background-color: #A1DCF2;
        color: #000;
        border: 1px solid #3AC0F2;
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
                  <h5 class="breadcrumbs-title">Incidencia 09</h5>
                <ol class="breadcrumbs">
                  <li><a href="index.html">Inicio</a>
                  </li>
                  <li><a href="Analisis_del_Rale.aspx">Incidencia 09</a>
                  </li>
                  <li class="active">Incidencia 09</li>
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
                                            <li ><a href="Analisis_del_Rale.aspx">Análisis</a>
                                            </li>
                                            <li><a href="Dias_de_la_Incidencia.aspx">Días de la Incidencia</a>
                                            </li>
                                            <li ><a href="Descargar_Rale.aspx">Descargar Rale</a>
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
                                            <li class="active"><a href="Incidencia09.aspx">Incidencia 09</a>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="row" runat="server" id="Formulario">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Incidencia 09</h4>     
                        <div class="row">
                              <div class="col col s12 m4 l4">
                                 <label>Rale:</label>   
                                    <asp:DropDownList ID="Rale" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Rale_SelectedIndexChanged">
                                 <asp:ListItem Text = "-- Selecciona Rale --" Value = ""></asp:ListItem>
                                </asp:DropDownList>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                            <div class="col col s12 m4 l4">
                                 <label>Tipo de Rale: </label>  
                                    <asp:DropDownList ID="TIPO" runat="server" Enabled="false" AutoPostBack="True" OnSelectedIndexChanged="TIPO_SelectedIndexChanged">
                                       </asp:DropDownList>
                                <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                             <div class="input-field col s4">
                                    <div class="input-field col s12">
                                  <asp:Button ID="Button1" runat="server"  
                                    CssClass="btn cyan" onclick="Reporte_Click" Text="Generar Reporte"/>
                             </div>
                            </div>
                    </div>


                <asp:UpdatePanel ID="UpdatePanel2" Updatemode="Conditional" runat="server">

                            <Triggers>
                            <%--    
                                <asp:PostBackTrigger ControlID="LinkButtonDtalleInci" />
                               <asp:AsyncPostBackTrigger ControlID="Reporte10" />
                                <asp:AsyncPostBackTrigger ControlID="Reg_Pat" EventName="TextChanged" />
                                <asp:AsyncPostBackTrigger ControlID="Rale2" EventName="SelectedIndexChanged" />--%>
                                <asp:PostBackTrigger ControlID="BajarExcel" />
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged" />
                            </Triggers>
                    <ContentTemplate>
                        <div class="input-field col s4">
                        <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                            </div>
                        <br />
                    <div class="row" runat="server" id="Analisis" visible="false"> 
                         <h4 class="header2">Resumen General por Rango</h4>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="mGrid responsive-table" AlternatingRowStyle-CssClass="alt" DataKeyNames="rango" onselectedindexchanged="GridView1_SelectedIndexChanged">
                     <Columns>
                     <asp:TemplateField HeaderText="Detalles" HeaderStyle-CssClass="center-align">
                    <ItemTemplate>                    
                    <asp:LinkButton ID="LinkButton1" CommandName="Select" runat="server" CausesValidation="false" ><i class="mdi-file-file-upload"></i></asp:LinkButton>             
                    </ItemTemplate>
                          <HeaderStyle BackColor="#999999" />
                         <ItemStyle CssClass="center-align" /> 
                    </asp:TemplateField>
             <asp:BoundField DataField="rango" HeaderText=" Incidencia 09 " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="center-align" /> 
                  <HeaderStyle BackColor="#999999" />
             </asp:BoundField>           
             <asp:BoundField DataField="NUM_CASOS" HeaderText=" Numero de Patrones " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align" /> 
                 <HeaderStyle BackColor="#999999" />
             </asp:BoundField>
             <asp:BoundField DataField="NUM_CRED_COP" HeaderText=" Num. Cred. COP " HeaderStyle-CssClass="center-align"> 
             <ItemStyle CssClass="right-align" />
              <HeaderStyle BackColor="#006A00" />
              </asp:BoundField>          
             <asp:BoundField DataField="DIAS_INC_COP" HeaderText=" Promedio Dias COP " HeaderStyle-CssClass="center-align"> 
             <ItemStyle CssClass="right-align" />
              <HeaderStyle BackColor="#006A00" />
             </asp:BoundField>           
             <asp:BoundField DataField="IMP_COP" HeaderText=" Importe COP " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align" />
              <HeaderStyle BackColor="#006A00" />
              </asp:BoundField>  
               <asp:BoundField DataField="CRED_RCV" HeaderText=" Num. Cred. RCV " HeaderStyle-CssClass="center-align"> 
             <ItemStyle CssClass="right-align" />
             <HeaderStyle BackColor="#FF9933" />
              </asp:BoundField>  
               <asp:BoundField DataField="DIAS_INC_RCV" HeaderText=" Promedio Dias RCV " HeaderStyle-CssClass="center-align"> 
             <ItemStyle CssClass="right-align" />
              <HeaderStyle BackColor="#FF9933" />
             </asp:BoundField>  
             <asp:BoundField DataField="IMP_RCV" HeaderText=" Importe RCV " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align" />
              <HeaderStyle BackColor="#FF9933" />
              </asp:BoundField>  
             <asp:BoundField DataField="IMP_TOT" HeaderText=" Total COP/RCV " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align"> 
             <ItemStyle CssClass="right-align" />
                  <HeaderStyle BackColor="#999999" />
             </asp:BoundField> 
              </Columns>
                        
                    </asp:GridView>
         </div>


                          <div class="row" runat="server" id="Detalles" visible="false"> 
                              <h4 class="header2">
                                  <asp:Label ID="LabelDetalle" runat="server" Text=""></asp:Label> </h4>

                              <div id="buttonReporte" runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                    <a class="btn-floating">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="BajarExcel" CssClass="btn-floating red" runat="server" OnClick="BajarExcel_Click" ><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>                                        
                                    </ul>
                                </div>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Visible="false" CssClass="mGridDos responsive-table" PagerStyle-CssClass="pgrDos" 
                             AlternatingRowStyle-CssClass="altDos" AllowPaging="true" PageSize="20" OnPageIndexChanging="GridView2_PageIndexChanging" >
                         <Columns>
                              <asp:TemplateField HeaderText="No" HeaderStyle-CssClass="center-align">
                        <ItemTemplate>                        
                            <asp:Label ID="Label1" runat="server"
                                Text='<%# (GridView2.PageSize * GridView2.PageIndex) + Container.DisplayIndex + 1 %>' Font-Bold="True">
                            </asp:Label>                      
                        </ItemTemplate>
                        <ItemStyle CssClass="left-align" />
                    </asp:TemplateField>
             <asp:BoundField DataField="sub" HeaderText=" Sub " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="center-align"/> 
             </asp:BoundField> 

                         <asp:BoundField DataField="nombre" HeaderText=" Razon Social " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="left-align" /> 
             </asp:BoundField> 
              <asp:BoundField DataField="reg_pat" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="center-align" /> 
             </asp:BoundField> 
              <asp:BoundField DataField="cred_cop" HeaderText=" Num. Cred. COP " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align" /> 
             </asp:BoundField> 

             <asp:BoundField DataField="dia_inc_cop" HeaderText=" Prom. Dias COP "  HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align" /> 
             </asp:BoundField> 

             <asp:BoundField DataField="imp_cop" HeaderText=" Importe COP " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align"/> 
             </asp:BoundField> 

             <asp:BoundField DataField="cred_rcv" HeaderText=" Num. Cred. RCV " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align" /> 
             </asp:BoundField> 

             <asp:BoundField DataField="dia_inc_rcv" HeaderText=" Prom. Dias RCV " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align"/> 
             </asp:BoundField> 

             <asp:BoundField DataField="imp_rcv" HeaderText=" Importe RCV " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align" /> 
             </asp:BoundField>

             <asp:BoundField DataField="imp_tot" HeaderText=" Imp. Tot. COP/RCV " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="right-align" /> 
             </asp:BoundField>

             <asp:BoundField DataField="rango" HeaderText=" Rango " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="center-align"/> 
             </asp:BoundField>
             <asp:BoundField DataField="estatus" HeaderText=" Estatus " HeaderStyle-CssClass="center-align">
             <ItemStyle CssClass="center-align" /> 
             </asp:BoundField>
             <asp:BoundField DataField="FECHA" HeaderText=" Antigüedad " HeaderStyle-CssClass="center-align" >
             <ItemStyle CssClass="center-align" /> 
             </asp:BoundField>
                         </Columns>
                            <PagerSettings Mode="NumericFirstLast" />
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
                    </asp:GridView>
         </div>

</ContentTemplate>
                        </asp:UpdatePanel>



                    </div> <%--Fin Section--%>
                </div>
 </div>
    </div>

     

   
</asp:Content>


