<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="bd_excelvsrale_2_2.aspx.cs" Inherits="Admin_bd_excelvsrale_2_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
* {  
    padding: 0;  
    margin: 0;  
}  
  
body {  
     
}  
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




.mGridPrincipal {  
    width: 100%;  
    background-color: #fff;  
    margin: 5px 0 10px 0;  
    border: solid 1px #525252;  
    border-collapse: collapse;  
}  
  
    .mGridPrincipal td {  
        padding: 2px;  
        border: solid 1px #c1c1c1;  
        color: #717171;  
    }  
  
    .mGridPrincipal th {  
        padding: 4px 2px;  
        color: #fff;  
        /*background: #424242 url(grd_head.png) repeat-x top;  */
        border-left: solid 1px #525252;  
        font-size: 12px;  
    }  
  
    .mGridPrincipal .alt {  
        background: #fcfcfc url(grd_alt.png) repeat-x top;  
    }  
  
    .mGridPrincipal .pgr {  
        background: #424242 url(grd_pgr.png) repeat-x top;  
        text-align:center;
    }  
  
        .mGridPrincipal .pgr table {  
            margin: 5px 0;  
        }  
  
        .mGridPrincipal .pgr td {  
            border-width: 0;  
            padding: 0 6px;  
            border-left: solid 1px #666;  
            font-weight: bold;  
            color: #fff;  
            line-height: 12px;  
        }  
  
        .mGridPrincipal .pgr a {  
            color: #666;  
            text-decoration: none;  
        }  
  
            .mGridPrincipal .pgr a:hover {  
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
                <h5 class="breadcrumbs-title">Base de Datos Excel vs Rale</h5>
                <ol class="breadcrumbs">
                  <li><a href="index.html">Inicio</a>
                  </li>
                  <li><a href="BD_ExcelvsRale.aspx">Seguimiento de Bases</a>
                  </li>
                  <li class="active">BD. Excel vs Rale</li>
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
                                    <a class="collapsible-header waves-effect waves-cyan active"><i class="mdi-av-repeat"></i>Seguimiento de Bases</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li ><a href="../Admin/RalevsRale.aspx">Rale vs Rale</a>
                                            </li>
                                            <li class="active" >
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
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
 <div class="row" runat="server">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Situación de la Cartera por Incidencias</h4>
                        <div class="row">
                            <div class="col col s12 m4 l3">
                                <label>Tipo de Rale: </label>  
                                <div class="col s12 m12 l12 chip light-blue white-text">                                     
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>                                                                          
                                </div>                               
                            </div>
                            <div class="col col s12 m4 l3">
                                 <label>Rale Base:</label>
                               <div class="col s12 m12 l12 chip light-blue white-text">
                                 <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                    </div>                             
                            </div>

                              <div class="col col s12 m4 l3">
                                 <label>Rale a Comparar</label>
                                <div class="col s12 m12 l12 chip light-blue white-text">
                                 <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                </div>  
                              </div>

                             <div class="col col s12 m4 l3">
                                <label>Tipo de Consulta:</label>
                                <div class="col s12 m12 l12 chip light-blue white-text">
                                 <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                    </div>
                            </div>    
                         
                             <div class="col col s12 m4 l3">
                               <label>Periodo de Consulta:</label>  
                                 <div class="col s12 m12 l12 chip light-blue white-text">                               
                                 <asp:Label ID="Label5" runat="server" Text=""></asp:Label> 
                                     </div>                         
                            </div>
  
                             <div class="col col s12 m4 l3">
                                 <label>Tipo de Reporte</label>
                                
                               <asp:DropDownList ID="TIPO" runat="server" OnSelectedIndexChanged="TIPO_SelectedIndexChanged" AutoPostBack="true" >
                                   <asp:ListItem disabled selected="False" Value="" Text=" -- Seleccione la Subdelegación -- "></asp:ListItem>
                                   <asp:ListItem Value="3" Text="DELEGACIONAL"></asp:ListItem>
                                   <asp:ListItem Value="1" Text="TOLUCA"></asp:ListItem>
                                   <asp:ListItem Value="5" Text="NAUCALPAN"></asp:ListItem>
                                </asp:DropDownList>  
                                  
                                                   
                            </div>

                             <div class="col col s12 m8 l6">
                                 <label>No. de Incidencia</label>                                  
                                <asp:DropDownList ID="incidencia" runat="server" Enabled="false" AutoPostBack="True" onselectedindexchanged="incidencia_SelectedIndexChanged">
                                    <asp:ListItem disabled selected Value="" Text="-- Seleccione Incidencia --"></asp:ListItem>
                                </asp:DropDownList>                                                                                       
                            </div>
                            <div class="input-field col s4">
                                    <div class="input-field col s12">
                                        <%--<asp:Button ID="Button1" CssClass="btn btn-move-up cyan" UseSubmitBehavior="false" runat="server" Text="Buscar"  OnClick="Button1_Click" />--%>
                                       <%-- <button class="btn waves-effect waves-light right submit cyan" type="submit" runat="server" formaction="Default.aspx?type=bus" name="action">Buscar
                                              <i class="mdi-content-send right"></i>
                                            </button>--%>
                                        
                                        <asp:Button ID="Reporte" runat="server" CssClass="btn btn-login cyan" Text="Generar Reporte" OnClick="Reporte_Click"/>
                                    </div>
                            </div>
                             <div class="input-field col s4">
                                 <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                             </div>
                        </div>


                        
                             <div id="Encabezado" class="row" runat="server" visible="false">
                                        <div class="col s12 m12 l12" ><span class="flow-text"><center><b><asp:Label ID="LabelEncabezado" style="font-size:20px;" runat="server" Text=""></asp:Label></b></center></span>
                                        </div>
                                        <div class="col s12 m12 l12" ><span class="flow-text"><center><b><asp:Label ID="LabelCreditosPeridos" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                        <div class="col s12 m12 l12" ><span class="flow-text"><center><b><asp:Label ID="LabelDelegacion" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                        <div class="col s12 m12 l12" ><span class="flow-text"><b><asp:Label ID="LabelFechaRale" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></></span>
                                        </div>
                                        <div class="col s12 m12 l12" ><span class="flow-text"><b><asp:Label ID="LabelIncidencia" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></></span>
                                        </div>
                                 
                                <div id="Rtp_Principal" runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                    <a class="btn-floating btn-large">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="RepBajarExcel" CssClass="btn-floating red" runat="server" OnClick="RepBajarExcel_Click"><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>
                                        <li>
                                            <asp:LinkButton ID="ImprimeReporte" CssClass="btn-floating green" runat="server" OnClick="ImprimeReporte_Click"><i class="large mdi-action-print"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                            
                                    </div>
                        </div>

                        
                            <asp:GridView ID="GridView1" runat="server" Visible="False" CssClass="responsive-table mGridPrincipal" BorderColor="Black" AutoGenerateColumns="False" Font-Size="12px"   AlternatingRowStyle-CssClass="alt"                      
                         OnRowCreated="GridView1_RowCreated" >
            
          <Columns>
              <asp:BoundField DataField="cve_inc" HeaderText=" Clave Incidencia " HeaderStyle-CssClass="center-align" >
                  <HeaderStyle BackColor="#0288d1" ForeColor="White"/>
                  <ItemStyle CssClass="center-align" />
              </asp:BoundField>
            <asp:BoundField DataField="credito_R1" HeaderText="Creditos" HeaderStyle-CssClass="center-align">
                <HeaderStyle BackColor="#0288d1" ForeColor="White" />
                <ItemStyle CssClass="center-align" />
            </asp:BoundField>
            <asp:BoundField DataField="sal_tot_R1" HeaderText="Saldo Total" DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                <HeaderStyle BackColor="#0288d1" ForeColor="White" />
                <ItemStyle CssClass="right-align" />
            </asp:BoundField>
            <asp:BoundField DataField="inc_R2" HeaderText="Incidencia" HeaderStyle-CssClass="center-align">
                <HeaderStyle BackColor="#43a047" ForeColor="White" />
                <ItemStyle CssClass="center-align" />
            </asp:BoundField>
            <asp:BoundField DataField="credito_R2" HeaderText="Creditos" HeaderStyle-CssClass="center-align">
                <HeaderStyle BackColor="#43a047" ForeColor="White" />
                <ItemStyle CssClass="right-align" />
            </asp:BoundField>
            <asp:BoundField DataField="importe_R2" HeaderText="Importe" DataFormatString="{0:N2}"  HeaderStyle-CssClass="center-align">
                <HeaderStyle BackColor="#43a047" ForeColor="White" />
                <ItemStyle CssClass="right-align" />
            </asp:BoundField>
            <asp:BoundField DataField="dias_inc_R2" HeaderText="Dias de Incidencia" DataFormatString="{0:N0}" HeaderStyle-CssClass="center-align"> 
                <HeaderStyle BackColor="#43a047" ForeColor="White" />
                <ItemStyle CssClass="right-align" />
            </asp:BoundField>
            <asp:BoundField DataField="cred_R2" HeaderText="Creditos" DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align"> 
                <HeaderStyle BackColor="#0288d1" ForeColor="White" />
                <ItemStyle CssClass="right-align" />
            </asp:BoundField>
            <asp:BoundField DataField="imp_R2" HeaderText="Importe" DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                <HeaderStyle BackColor="#0288d1" ForeColor="White" />
                <ItemStyle CssClass="right-align" />
            </asp:BoundField>
            <asp:BoundField DataField="Prom_dias_inc_R2" HeaderText="Promedio Dias Inci." DataFormatString="{0:N0}" HeaderStyle-CssClass="center-align">
                <HeaderStyle BackColor="#0288d1" ForeColor="White" />
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
<HeaderStyle CssClass="gridViewHeader"></HeaderStyle>

                               

<PagerStyle CssClass="gridViewPaginacion"></PagerStyle>
        </asp:GridView>
                                                      
                       
                     <div id="divideruno" class="divider" runat="server" visible="false"></div>


                           <div id="Depurado" class="row" runat="server" visible="false">
                               <br />
                                        <div class="col s12 m6 l6 " style="font-size: 16px; font-style:italic"><span class="flow-text"><center><b><asp:Label ID="LabelDepurado" runat="server" Text=""></asp:Label></b></center></span>
                                        </div>
                                        <div class="col s12 m6 l6 " style="font-size: 16px; font-style:italic"><span class="flow-text"><center><b><asp:Label ID="LabelXDepurar" runat="server" Text=""></asp:Label></b></center></span>
                                        </div>
                                    </div>
                      


                       
            
                    <div id="accordion_options" runat="server" visible="false">
            <h4 class="header">Detalles</h4>
            <div class="row">
              <div class="col s12 m12 l12">
                <ul class="collapsible popout collapsible-accordion" data-collapsible="accordion">
                  <li>
                    <div id="ResumenCredPen" runat="server" class="collapsible-header"><i class="mdi-image-timer"></i>Resumen de Creditos Pendientes</div>
                    <div class="collapsible-body">
                      <div id="Rtp_RsumenCredPen" runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px; bottom:5px;">
                                    <a class="btn-floating">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="BtnRsmenPendientes" CssClass="btn-floating red" runat="server" OnClick="BtnRsmenPendientes_Click"><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" GridLines="None" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt"
                         CssClass="mGrid responsive-table" AllowPaging="true" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="15" >
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                               <asp:BoundField DataField="id" HeaderText=" Num " HeaderStyle-CssClass="center-align">
                                <HeaderStyle CssClass="center-align" />
                                <ItemStyle CssClass="center-align" /></asp:BoundField>
                               <asp:BoundField DataField="sub" HeaderText=" Sub"  HeaderStyle-CssClass="center-align">
                                <HeaderStyle CssClass="center-align" />
                                <ItemStyle CssClass="center-align" /></asp:BoundField>
                               <asp:BoundField DataField="reg_pat" HeaderText=" Registro Patronal" HeaderStyle-CssClass="center-align">
                                <HeaderStyle CssClass="center-align" />
                                <ItemStyle CssClass="center-align" /></asp:BoundField>
                               <asp:BoundField DataField="raz_social" HeaderText=" Razon Social " HeaderStyle-CssClass="center-align">
                                <HeaderStyle CssClass="center-align" />
                                <ItemStyle CssClass="left-align" /></asp:BoundField>
                               <asp:BoundField DataField="creditos" HeaderText=" Creditos " HeaderStyle-CssClass="center-align">
                                <HeaderStyle CssClass="center-align" />
                                <ItemStyle CssClass="right-align" /></asp:BoundField>
                               <asp:BoundField DataField="importe" HeaderText=" Importe " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                                <HeaderStyle CssClass="center-align" />
                                <ItemStyle CssClass="right-align" /></asp:BoundField>
                               <asp:BoundField DataField="prom_dias" HeaderText=" Prome. Dias " HeaderStyle-CssClass="center-align">
                                <HeaderStyle CssClass="center-align" />
                                <ItemStyle CssClass="right-align" /></asp:BoundField>
                               <asp:BoundField DataField="anti" HeaderText=" Antigüedad " HeaderStyle-CssClass="center-align">
                                <HeaderStyle CssClass="center-align" />
                                <ItemStyle CssClass="left-align" /></asp:BoundField>
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
                            <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                                 </ContentTemplate>  
                            </asp:UpdatePanel>
                    </div>
                  </li>
                  <li>
                    <div id="DetallePendientes" runat="server" class="collapsible-header"><i class="mdi-maps-rate-review"></i>Detalle de Creditos Pendientes</div>
                    <div class="collapsible-body">
                        <div id="RtpDetallePendientes" runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px; bottom:5px;">
                                    <a class="btn-floating">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="BtnDetallePendientes" CssClass="btn-floating red" runat="server" OnClick="BtnDetallePendientes_Click"><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="15" GridLines="None"
                         CssClass="mGrid responsive-table" OnPageIndexChanging="GridView4_PageIndexChanging" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                      <Columns>
                            <asp:BoundField DataField="id" HeaderText=" Num. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sub" HeaderText=" Sub. " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Registro patronal" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tipo Mvto" HeaderText=" Tipo Mvto. " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Razon Social" HeaderText=" Razon Social / Nombre " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="left-align"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="Patronal" DataFormatString="{0:d}" HeaderText=" Patronal " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Sector" HeaderText=" Sector " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Num de Credito" HeaderText=" Num. Cred. " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CE" HeaderText=" CE " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Periodo" DataFormatString="{0:d}"  HeaderText=" Periodo " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Tipo Documento" HeaderText="Tipo Docu. " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fecha Alta" DataFormatString="{0:d}"  HeaderText=" Fecha Alta " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="Fecha Notificacion" DataFormatString="{0:d}"  HeaderText=" Fecha Noti. " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Num de Incidencia" HeaderText="Num. Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Fecha Inci" DataFormatString="{0:d}"  HeaderText=" Fec. Inc. " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="center-align"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="Dias Inci" HeaderText=" Dias Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="right-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Importe" DataFormatString="{0:N2}"  HeaderText=" Importe " HeaderStyle-CssClass="center-align">
                            <ItemStyle  CssClass="right-align"  />
                            </asp:BoundField>
                          <asp:BoundField DataField="DC" HeaderText=" D.C. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                          <asp:BoundField DataField="SC" HeaderText=" S.C. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
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
                     </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                    </div>
                  </li>
                    
                  <li>
                      <div id="ResumenMovimientos" runat="server" class="collapsible-header"><i class="mdi-image-transform"></i>Resumen de Movimientos a otras Incidencias</div>
                      <div class="collapsible-body">
                          <div id="RtpResumenMovimientos" runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px; bottom:5px;">
                                    <a class="btn-floating">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="BtnResumenMovimientos" CssClass="btn-floating red" runat="server" OnClick="BtnResumenMovimientos_Click"><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                          <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                          <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="15" GridLines="None"
                         CssClass="mGrid responsive-table" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" OnPageIndexChanging="GridView5_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText=" Num " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sub" HeaderText=" Sub " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="reg_pat" HeaderText=" Registro Patronal" HeaderStyle-CssClass="center-align">
                             <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="raz_social" HeaderText=" Razon Social " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="left-align" />
                            </asp:BoundField>
                             <asp:BoundField DataField="inc"  HeaderText=" Num. Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>

                            <asp:BoundField DataField="creditos" HeaderText=" Creditos " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="importe" DataFormatString="{0:N2}" HeaderText=" Importe " HeaderStyle-CssClass="center-align">
                             <ItemStyle CssClass="right-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="prom_dias" HeaderText=" Prome. Dias " HeaderStyle-CssClass="center-align">
                             <ItemStyle CssClass="right-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="anti" HeaderText=" Antigüedad " HeaderStyle-CssClass="center-align">
                             <ItemStyle CssClass="center-align" />
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
                    </asp:GridView>
                                </ContentTemplate>
                              </asp:UpdatePanel>
                      </div>
                  </li>

                  <li>
                      <div id="DetalleMovimientos" runat="server" class="collapsible-header"><i class="mdi-av-subtitles"></i>Detalle de Movimientos a otras Incidencias</div>
                      <div class="collapsible-body">
                          <div id="RtpDetalleMovimientos" runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px; bottom:5px;">
                                    <a class="btn-floating">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="BtnDetalleMovi" CssClass="btn-floating red" runat="server" OnClick="BtnDetalleMovi_Click"><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>
                                    </ul>
                                </div>
                          <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                          <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" AllowPaging="true" PageSize="15" GridLines="None"
                         CssClass="mGrid responsive-table" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" OnPageIndexChanging="GridView3_PageIndexChanging">
                     <Columns>
                          <asp:BoundField DataField="id" HeaderText=" Num. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="sub" HeaderText=" Sub. " HeaderStyle-CssClass="center-align">
                           <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Registro patronal" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="Tipo Mvto" HeaderText=" Tipo Mvto. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="Razon Social" HeaderText=" Razon Social / Nombre " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="left-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Patronal" HeaderText=" Patronal " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Sector" HeaderText=" Sector " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Num de Credito" HeaderText=" Num. Cred. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="CE" HeaderText=" CE " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="Periodo" HeaderText=" Periodo " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="Tipo Documento" HeaderText="Tipo Docu. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Fecha Alta" HeaderText=" Fecha Alta " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Fecha Notificacion" HeaderText=" Fecha Noti. " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Num de Incidencia" HeaderText="Num. Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Fecha Inci" HeaderText=" Fec. Inc. " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Dias Inci" HeaderText=" Dias Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="Importe" HeaderText=" Importe " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                         </asp:BoundField>
                         <asp:BoundField DataField="DC" HeaderText=" D.C. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                          <asp:BoundField DataField="SC" HeaderText=" S.C. " HeaderStyle-CssClass="center-align">
                           <ItemStyle CssClass="center-align" />
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
                    </asp:GridView>
                                </ContentTemplate>
                              </asp:UpdatePanel>
                      </div>
                  </li>

                </ul>
              </div>
                </div>
             </div>
          
                    </div>
                    </div>
     </div>
</asp:Content>
