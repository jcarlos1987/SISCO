<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master" AutoEventWireup="true" CodeFile="Dias_de_la_Incidencia.aspx.cs" Inherits="Admin_Dias_de_la_Incidencia" %>

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
                <h5 class="breadcrumbs-title">Días de la Incidencia</h5>
                <ol class="breadcrumbs">
                  <li><a href="index.html">Inicio</a>
                  </li>
                  <li><a href="Analisis_del_Rale.aspx">Análisis de Rale </a>
                  </li>
                  <li class="active">Dias en la Incidencia</li>
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
                                            <li class="active"><a href="Dias_de_la_Incidencia.aspx">Días de la Incidencia</a>
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
                                <label>Selecciona Rale:</label>
                                       <asp:DropDownList ID="Rale1" runat="server" AutoPostBack="True" Enabled="false" onselectedindexchanged="Rale1_SelectedIndexChanged">
                                        <asp:ListItem Text="-- Selecciona Rale --" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </div> 
                                
                            <div class="col col  s12 m6">
                                <label>Subdelegacion:</label>
                                        <asp:DropDownList ID="TIPO" runat="server" Enabled="false" AutoPostBack="True" 
                        onselectedindexchanged="TIPO_SelectedIndexChanged">
                    </asp:DropDownList>
                            </div> 

                             <div class="col col  s12 m6">
                                <label>Incidencia</label>
                                        <asp:DropDownList ID="incidencia" runat="server" class="form-control" 
                        Enabled="false" Height="30px" Width="440px" AutoPostBack="True" 
                                    onselectedindexchanged="incidencia_SelectedIndexChanged">
                    </asp:DropDownList>
                            </div> 

                              <div class="col col  s12 m6">
                                <label>Dias</label>
                                         <asp:TextBox ID="Dias" Enabled="false" AutoPostBack="true" placeholder="Dias Incidencia" 
                                    runat="server" ontextchanged="Dias_TextChanged" ></asp:TextBox>
                            </div> 

                              <div class="col col  s12 m6">
                                <label>Tipo de Movimiento</label>
                                       <asp:DropDownList ID="tipo_mov" runat="server" AutoPostBack="True" Enabled="false" 
                                    onselectedindexchanged="tipo_mov_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>

                              <div class="col col  s12 m6">
                                <label>Tipo de Documento </label>
                                       <asp:DropDownList ID="tipo_doc" Enabled="false" runat="server" AutoPostBack="true" 
                                    onselectedindexchanged="tipo_doc_SelectedIndexChanged" >
                                </asp:DropDownList>
                            </div>

                             <div class="col col  s12 m6">                
                                        
                                 <asp:Button ID="Aceptar" runat="server" CssClass="btn cyan" Text="Analizar" OnClick="Aceptar_Click" />
                                    </div>
                            
                            </div>   
                        </div>

                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="Aceptar" />
                                <asp:PostBackTrigger ControlID="LinkButtonDtalleInci" />
                            </Triggers>
                            <ContentTemplate>
                                 <div class="col col  s12 m6"> 
                                  <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                                 </div>
                                 <div id="Titu" class="row" runat="server" visible="false">
                        <h4 class="header2">Resumen General</h4>
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
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20" CssClass="mGrid responsive-table"  
                             AlternatingRowStyle-CssClass="alt">
                        <Columns>
                         <asp:TemplateField HeaderText="Serial No">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"
                                Text='<%# (GridView1.PageSize * GridView1.PageIndex) + Container.DisplayIndex + 1 %>' Font-Bold="True">
                            </asp:Label>
                        </ItemTemplate>
                        <ItemStyle CssClass="left-align" />
                    </asp:TemplateField>
                            <asp:BoundField DataField="SUB" HeaderText=" Sub. ">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                            <asp:BoundField DataField="REGISTRO_PATRONAL" HeaderText="Registro Patronal">
                            <ItemStyle CssClass="center-align"/>
                            </asp:BoundField>
                             <asp:BoundField DataField="TIPO_MOVIM" HeaderText="Tipo Movi.">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                             <asp:BoundField DataField="RAZON_SOCIAL_NOMBRE" HeaderText="Razon Social">
                            <ItemStyle CssClass="left-align" />
                            </asp:BoundField>
                             <asp:BoundField DataField="FEC_ALTA_PAT" HeaderText="Fec. Mov. Patronal" DataFormatString="{0:d}">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                             <asp:BoundField DataField="SECTOR" HeaderText="Sector">
                            <ItemStyle CssClass="center-align"/>
                            </asp:BoundField>
                             <asp:BoundField DataField="CREDITO" HeaderText="N° Credito">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                             <asp:BoundField DataField="TIPO_CRED" HeaderText="Tip. Cred.">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="PERIODO" HeaderText="Periodo" DataFormatString="{0: MM - yyyy}">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="TIP_DOCU" HeaderText="Tip. Docu.">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="FEC_ALTA_CRED" HeaderText="Fech. Inc." DataFormatString="{0:d}">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="FEC_NOTIFICA" HeaderText="Fech. Notifi" DataFormatString="{0:d}">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="INC" HeaderText="Inci.">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="FEC_INC" HeaderText="Fech. Inc." DataFormatString="{0:d}">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="DIAS_INC" HeaderText="Dias Inc.">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="IMPORTE" HeaderText="Importe" DataFormatString="{0:N2}">
                            <ItemStyle CssClass="right-align" />
                            </asp:BoundField>
                              <asp:BoundField DataField="TIPO" HeaderText="Tipo">
                            <ItemStyle CssClass="center-align" />
                            </asp:BoundField>
                        </Columns>
                            <PagerStyle  CssClass = "GridPager pgr center"  />
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
                        </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                 </div>
                    </div>
                    </div>
                
    </asp:Panel>

</asp:Content>

