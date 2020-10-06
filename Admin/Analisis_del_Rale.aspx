<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="Analisis_del_Rale.aspx.cs" Inherits="Admin_Analisis_del_Rale" %>

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
                  <h5 class="breadcrumbs-title">Análisis de Rale</h5>
                <ol class="breadcrumbs">
                  <li><a href="index.html">Inicio</a>
                  </li>
                  <li><a href="Analisis_del_Rale.aspx">Análisis de Rale </a>
                  </li>
                  <li class="active">Análisis</li>
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
                                            <li class="active"><a href="Analisis_del_Rale.aspx">Análisis</a>
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
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-social-location-city"></i>Comite Delegacional</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="Comp_Incidencias.aspx">Comp.Incidencia</a>
                                            </li>
                                            <li><a href="Analisis_de_Eco_por_Inci.aspx">Análisis de Eco por Inc</a>
                                            </li>  
                                            <li><a href="Situacion_de_la cartera_ejerci_anteriores.aspx">Situación Ejerc Anterior.<%--de la Cartera Ejer. Anteriores--%></a>
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
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  <asp:Panel ID="Panel1" runat="server">
    <div class="row" runat="server">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Seleccione:</h4>
              
                            <div class="row">
                        <div class="row">

                             <div class="col col s12 m6">
                                <label>Tipo de Consulta:</label>
                                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"  AutoPostBack="true" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
                                    <asp:ListItem Value="1">Incidencia</asp:ListItem>
                                     <asp:ListItem Value="2">Registro Patronal</asp:ListItem>
                                </asp:RadioButtonList> 
                            </div> 

                            <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                        </div>
                    </div>
                 </div>
                    </div>
                    </div>
                </div>
    </asp:Panel>   
      
     <asp:Panel ID="Panel2" runat="server" Visible="false">
    <div class="row" runat="server">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Por Incidencia:</h4>
              
                            <div class="row">
                        <div class="row">
                              <div class="col col s12 m4 l4">
                                 <label>Tipo de Rale: </label>  
                                     <asp:DropDownList ID="Tipo_Rale" runat="server" AutoPostBack="True"  onselectedindexchanged="Tipo_Rale_SelectedIndexChanged">
                                     <asp:ListItem Text="-- Selecciona Tipo de Rale --" Value=""></asp:ListItem>
                                     </asp:DropDownList>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                            <div class="col col s12 m4 l4">
                                 <label>Seleccione Rale: </label>  
                                     <asp:DropDownList ID="Rale1" runat="server" AutoPostBack="True" Enabled="false" onselectedindexchanged="Rale1_SelectedIndexChanged">
                                        <asp:ListItem Text="-- Selecciona Rale --" Value=""></asp:ListItem>
                                     </asp:DropDownList>
                                <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                            <div class="col col s12 m4 l4">
                                <label>Subdelegación:</label>
                                   <asp:DropDownList ID="TIPO" runat="server" class="form-control" Enabled="false" AutoPostBack="True" 
                                     onselectedindexchanged="TIPO_SelectedIndexChanged">
                                   </asp:DropDownList>
                                <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>  
                            </div>
                            <div class="col col s12 m4 l4">
                                <label>Incidencia:</label>
                                 <asp:DropDownList ID="incidencia" runat="server" AutoPostBack="true" class="form-control" Enabled="false" OnSelectedIndexChanged="incidencia_SelectedIndexChanged">
                                 </asp:DropDownList>
                                <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>  
                            </div>

                             <div class="input-field col s4">
                                    <div class="input-field col s12">
                                   <asp:Button ID="Reporte" runat="server" CssClass="btn cyan" onclick="Reporte_Click" Text="Analizar Rale" />       
                                    </div>
                             </div>
                        </div> 
                            </div>
                        <asp:UpdatePanel ID="UpdatePanel1" Updatemode="Always" runat="server">

                            <Triggers>
                               <asp:AsyncPostBackTrigger ControlID="Reporte" />     
                                <asp:PostBackTrigger ControlID="LinkButtonDetalle" />  
                                <asp:PostBackTrigger ControlID="RepBajarExcel" />                         
                                <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="GridView3" EventName="PageIndexChanging" />
            </Triggers>
                            <ContentTemplate>
                                <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                                <div id="Encabezado" class="row" runat="server" visible="false">
                                        <div class="col s12 m12 l4" ><span class="flow-text"><center><b><asp:Label ID="LabelPatrones" style="font-size:20px;" runat="server" Text=""></asp:Label></b></center></span>
                                        </div>
                                        <div class="col s12 m12 l4" ><span class="flow-text"><center><b><asp:Label ID="LabelCreditos" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                        <div class="col s12 m12 l4" ><span class="flow-text"><center><b><asp:Label ID="LabelImporte" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                    <div id="buttonReporte" runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                    <a class="btn-floating">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="RepBajarExcel" CssClass="btn-floating red" runat="server" OnClick="RepBajarExcel_Click" ><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>                                        
                                    </ul>
                                </div>

                                   
                                    </div>


                         <asp:GridView ID="GridView1" runat="server" Visible="false" AutoGenerateColumns="False"  DataKeyNames="sub, Id_Reg_Pat" CssClass="mGrid responsive-table" PagerStyle-CssClass="pgr" 
                             AlternatingRowStyle-CssClass="alt" OnPageIndexChanging="GridView1_PageIndexChanging" onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" PageSize="15"  >
                             <AlternatingRowStyle CssClass="alt" />
                        <Columns>
                            <asp:TemplateField HeaderText="N.">
                                                <ItemTemplate>                                                    
                                                        <asp:Label ID="Label1" runat="server" Text='<%# (GridView1.PageSize * GridView1.PageIndex) + Container.DisplayIndex + 1 %>' Font-Size="10px" Font-Bold="True">
                                                        </asp:Label>                                                   
                                                </ItemTemplate>
                                                <ItemStyle ForeColor="Black"  Width="2px" />
                                            </asp:TemplateField>
                            <asp:BoundField DataField="sub" HeaderText=" Subdel. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Id_Reg_Pat" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Nombre" HeaderText=" Razon Social " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="left-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Num_Cred" HeaderText=" Numero Creditos " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Prom_Dias" HeaderText=" Dias en la Inc. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Importe" DataFormatString="{0:N2}"  HeaderText=" Importe " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Detalles" HeaderStyle-CssClass="center-align">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" CommandName="Select" runat="server" CausesValidation="false" ><i class="mdi-file-file-upload"></i></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle CssClass="center-align" />
                            </asp:TemplateField>
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
                                <asp:Label ID="LabelMsjTabla" runat="server" Text=""></asp:Label>

                                <div id="EncabezadoSegundaTabla" class="row" runat="server" visible="false">
                                        <div class="col s12 m12 l4" ><span class="flow-text"><center><b><asp:Label ID="LabelPatronesDos" style="font-size:20px;" runat="server" Text=""></asp:Label></b></center></span>
                                        </div>
                                        <div class="col s12 m12 l4" ><span class="flow-text"><center><b><asp:Label ID="LabelCreditosDos" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                        <div class="col s12 m12 l4" ><span class="flow-text"><center><b><asp:Label ID="LabelImporteDos" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>

                                    <div runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                    <a class="btn-floating">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="LinkButtonDetalle" CssClass="btn-floating red" runat="server" OnClick="LinkButtonDetalle_Click" ><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>                                        
                                    </ul>
                                </div>
                                    </div>
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Visible="false" CssClass="mGrid responsive-table" PagerStyle-CssClass="pgr" 
                             AlternatingRowStyle-CssClass="alt" AllowPaging="True" PageSize="15" OnPageIndexChanging="GridView3_PageIndexChanging" >
                    <Columns>
                        <asp:TemplateField HeaderText="N.">
                                                <ItemTemplate>                                                    
                                                        <asp:Label ID="Label1" runat="server" Text='<%# (GridView3.PageSize * GridView3.PageIndex) + Container.DisplayIndex + 1 %>' Font-Size="10px" Font-Bold="True">
                                                        </asp:Label>                                                   
                                                </ItemTemplate>
                                                <ItemStyle ForeColor="Black"  Width="2px" />
                                            </asp:TemplateField>
                         <asp:BoundField DataField="SUB" HeaderText=" Sub. " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="REG_PATRO" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                          <asp:BoundField DataField="TIPO" HeaderText=" Tipo Mvto. " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                          <asp:BoundField DataField="RAZON_SOCIAL" HeaderText=" Razon Social / Nombre " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="left-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="MOV_PATRON" HeaderText=" Mov. Patronal " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="SECTOR" HeaderText=" Sector " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="NUMERO_CREDITO" HeaderText=" Num. Cred. " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                          <asp:BoundField DataField="CE" HeaderText=" CE " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                          <asp:BoundField DataField="PERIODO" HeaderText=" Periodo " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                          <asp:BoundField DataField="TIPO_DOCTO" HeaderText="Tipo Docu. " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="FECHA_ALTA" HeaderText=" Fecha Alta " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="FECHA_NOTIFICACION" HeaderText=" Fecha Noti. " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="NUM_INC" HeaderText="Num. Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="FECHA" HeaderText=" Fec. Inc. " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="DIAS_INC" HeaderText=" Dias Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="IMPORTE" HeaderText=" Importe " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="right-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="DC" HeaderText=" DC " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align"  />
                         </asp:BoundField>

                         <asp:BoundField DataField="SC" HeaderText=" SC " HeaderStyle-CssClass="center-align">
                            <ItemStyle ForeColor="Black" CssClass="center-align" />
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
                    </asp:GridView>


                                </ContentTemplate>
                            </asp:UpdatePanel>
                 </div>
                    </div>
                    </div>
                </div>
    </asp:Panel>

     <asp:Panel ID="Panel3" runat="server" Visible="false">
    <div class="row" runat="server">    
                 <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Por Registro Patronal:</h4>
                        <div class="row">
                              <div class="col col s12 m4 l4">
                                 <label>Ingresar Registro Patronal: </label>   
                                   <asp:TextBox ID="Reg_Pat" runat="server" MaxLength="12" OnTextChanged="Reg_Pat_TextChanged" AutoPostBack="true"></asp:TextBox>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                       
                              <div class="col col s12 m4 l4">
                                 <label>Seleccione Rale: </label>  
                                     <asp:DropDownList ID="Rale2" runat="server" Enabled="false" Width="230px" OnSelectedIndexChanged="Rale2_SelectedIndexChanged" AutoPostBack="true">
                                       <asp:ListItem Text="-- Selecciona Rale --" Value=""></asp:ListItem>
                                      </asp:DropDownList>
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>    
                      
                             <div class="input-field col s4">
                                    <div class="input-field col s12">     
                                 <asp:Button ID="Reporte10" runat="server" CssClass="btn cyan"  Text="Analizar Rale" onclick="Reporte10_Click" />    
                                    </div>
                            </div>
                             </div>

                          <asp:UpdatePanel ID="UpdatePanel2" Updatemode="Conditional" runat="server">

                            <Triggers>
                                <asp:PostBackTrigger ControlID="LinkButtonInci" />
                                <asp:PostBackTrigger ControlID="LinkButtonDtalleInci" />
                               <asp:AsyncPostBackTrigger ControlID="Reporte10" />
                                <asp:AsyncPostBackTrigger ControlID="Reg_Pat" EventName="TextChanged" />
                                <asp:AsyncPostBackTrigger ControlID="Rale2" EventName="SelectedIndexChanged" />
                                <asp:AsyncPostBackTrigger ControlID="GridView2" EventName="SelectedIndexChanged" />
                                <%--<asp:AsyncPostBackTrigger ControlID="GridView3" EventName="PageIndexChanging" />--%>
            </Triggers>
                            <ContentTemplate>
                        <div id="Titu" class="row" runat="server" visible="false">
                        <h4 class="header2">Resumen General</h4>
                    </div>
                        <asp:GridView ID="GridView2" runat="server" DataKeyNames="sub, Id_Reg_Pat" onselectedindexchanged="GridView2_SelectedIndexChanged" AutoGenerateColumns="False" Visible="false" CssClass="mGrid responsive-table" PagerStyle-CssClass="pgr" 
                             AlternatingRowStyle-CssClass="alt" >
                    <Columns>
                        <asp:TemplateField HeaderText="N." HeaderStyle-CssClass="center-align">
                                                <ItemTemplate>                                                    
                                                        <asp:Label ID="Label1" runat="server" Text='<%# (GridView2.PageSize * GridView2.PageIndex) + Container.DisplayIndex + 1 %>' Font-Size="10px" Font-Bold="True">
                                                        </asp:Label>                                                   
                                                </ItemTemplate>
                                                <ItemStyle CssClass="left-align"/>
                                            </asp:TemplateField>
                            <asp:BoundField DataField="sub" HeaderText=" Subdel. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>

                             <asp:BoundField DataField="Id_Reg_Pat" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Nombre" HeaderText=" Razon Social " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="left-align" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Num_Cred_COP" HeaderText=" Num. Cred. COP " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Prom_Dias_COP" HeaderText=" Prom Dias COP " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>

                            <asp:BoundField DataField="Importe_COP" HeaderText=" Imp. COP " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>

                             <asp:BoundField DataField="Num_Cred_RCV" HeaderText=" Num. Cred RCV " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>

                             <asp:BoundField DataField="Prom_Dias_RCV" HeaderText=" Prom Dias RCV" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>

                             <asp:BoundField DataField="Importe_RCV" HeaderText=" Imp. RCV" DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>

                             <asp:BoundField DataField="TOT_COP_RCV" HeaderText=" Imp. COP/RCV" DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>
                            
                             <asp:TemplateField HeaderText="Detalles" HeaderStyle-CssClass="center-align">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" CommandName="Select" runat="server" CausesValidation="false"><i class="mdi-file-file-upload"></i></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle  CssClass="center-align"/>
                            </asp:TemplateField>

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
                    </asp:GridView>
                     
                   <div id="DetallesREGPAT" class="row" runat="server" visible="false">
                        <h4 class="header2">Detalles de Creditos COP y RCV</h4>
                                         <div class="col s12 m6 l2" ><span class="flow-text"></span>
                                             <div runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                            <a class="btn-floating">
                                                <i class="mdi-editor-vertical-align-bottom"></i>
                                            </a>
                                            <ul>
                                                <li>
                                                    <asp:LinkButton ID="LinkButtonDtalleInci" CssClass="btn-floating red" runat="server" OnClick="LinkButtonDtalleInci_Click" ><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                                </li>                                        
                                            </ul>
                                        </div>
                                        </div>
                                        <div class="col s12 m6 l2" ><span class="flow-text"><center><b><asp:Label ID="LabelCredCOP" style="font-size:20px;" runat="server" Text=""></asp:Label></b></center></span>
                                        </div>
                                        <div class="col s12 m6 l2" ><span class="flow-text"><center><b><asp:Label ID="LabelImpoCOP" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                        <div class="col s12 m6 l2" ><span class="flow-text"><center><b><asp:Label ID="LabelCredRCV" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                         <div class="col s12 m6 l2" ><span class="flow-text"><center><b><asp:Label ID="LabelImpRCV" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>
                                         <div class="col s12 m6 l2" ><span class="flow-text"><center><b><asp:Label ID="LabelTotCOPRCV" style="font-size:20px;" runat="server" Text=""></asp:Label>  </b></center></span>
                                        </div>                                       
                                    </div>                   

                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CssClass="mGrid responsive-table" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AllowPaging="true" PageSize="15" OnPageIndexChanging="GridView5_PageIndexChanging" >
                <Columns>
                         <asp:TemplateField HeaderText="N." HeaderStyle-CssClass="center-align">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# (GridView5.PageSize * GridView5.PageIndex) + Container.DisplayIndex + 1 %>' Font-Size="10px" Font-Bold="True">
                                                        </asp:Label> 
                                </ItemTemplate>
                                <ItemStyle  CssClass="left-align" />
                            </asp:TemplateField>
                         <asp:BoundField DataField="SUB" HeaderText=" Sub. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="REG_PATRO" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="TIPO" HeaderText=" Tipo Mvto. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="RAZON_SOCIAL" HeaderText=" Razon Social / Nombre " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="left-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="MOV_PATRONAL" HeaderText="Mov. Patronal " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align"/>
                         </asp:BoundField>

                         <asp:BoundField DataField="SECTOR" HeaderText=" Sector " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="NUMERO_CREDITO" HeaderText=" Num. Cred. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="CE" HeaderText=" CE " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="PERIODO" HeaderText=" Periodo " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                          <asp:BoundField DataField="TIPO_DOCTO" HeaderText="Tipo Docu. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="FECHA_ALTA" HeaderText=" Fecha Alta " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="FECHA_NOTIFICACION" HeaderText=" Fecha Noti. " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="NUM_INC" HeaderText="Num. Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="FECHA" HeaderText=" Fec. Inc. " DataFormatString="{0:d}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="DIAS_INC" HeaderText=" Dias Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="TIPO_SICO" HeaderText=" Tipo " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="IMPORTE" HeaderText=" Importe " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                         </asp:BoundField>

                         <asp:BoundField DataField="DC" HeaderText=" DC " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align"/>
                         </asp:BoundField>

                         <asp:BoundField DataField="SC" HeaderText=" SC " HeaderStyle-CssClass="center-align">
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
                </asp:GridView>

                    <div id="Titulo" class="row" runat="server" visible="false">
                        <h4 class="header2">Resumen por Incidencia</h4>
                        <div id="boton_reg_pat" runat="server" class="fixed-action-btn" style="position: relative; display: inline-block; left:15px;">
                                    <a class="btn-floating">
                                        <i class="mdi-editor-vertical-align-bottom"></i>
                                    </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="LinkButtonInci" CssClass="btn-floating red" runat="server" OnClick="LinkButtonInci_Click" ><i class="large mdi-action-get-app"></i></asp:LinkButton>
                                        </li>                                        
                                    </ul>
                                </div>
                    </div>

                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="false" CssClass="mGrid responsive-table" PagerStyle-CssClass="pgr" 
                             AlternatingRowStyle-CssClass="alt">
                        <Columns>
                            <asp:TemplateField HeaderText="N." HeaderStyle-CssClass="center-align">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# (GridView4.PageSize * GridView4.PageIndex) + Container.DisplayIndex + 1 %>' Font-Size="10px" Font-Bold="True">
                                                        </asp:Label> 
                                </ItemTemplate>
                                <ItemStyle  CssClass="left-align" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="sub" HeaderText=" Subdel. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>

                             <asp:BoundField DataField="REG_PATRO" HeaderText=" Registro Patronal " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>

                            <asp:BoundField DataField="RAZON_SOCIAL" HeaderText=" Razon Social " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="left-align" />
                            </asp:BoundField>

                             <asp:BoundField DataField="TIPO_SICO" HeaderText=" Tipo " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>

                            <asp:BoundField DataField="NUM_INCI" HeaderText=" Num. Incidencia " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>

                             <asp:BoundField DataField="CONTEO" HeaderText=" Total por Inci. " HeaderStyle-CssClass="center-align">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>

                            <asp:BoundField DataField="IMPORTE" HeaderText=" Importe " DataFormatString="{0:N2}" HeaderStyle-CssClass="center-align">
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
                    </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                 </div>
                    </div>
                    </div>
                </div>
    </asp:Panel>

</asp:Content>