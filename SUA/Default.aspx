<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Master.master"  AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="SUA_Default" %>

<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.UI" %>






<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type = "text/javascript">
        function MutExChkList(chk) {
            var chkList = chk.parentNode.parentNode.parentNode;
            var chks = chkList.getElementsByTagName("input");
            for (var i = 0; i < chks.length; i++)
            {
                if (chks[i] != chk && chk.checked) {
                    chks[i].checked = false;
                }
            }
        }
</script>
    <style type="text/css">
    body
    {
        font-family: Arial;
        font-size: 10pt;
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
                  <img src="../images/SISCO_2_2_2.png" width="150" align="right" alt="Sistema de Supervisión de Cobranza"/>
                <h5 class="breadcrumbs-title">Consulta de Información (CD-SUA)</h5>
                <ol class="breadcrumbs">
                    
                  <li><a href="index.html">Inicio</a>
                  </li>
                  <li><a href="#">CD-SUA</a>
                  </li>
                  <li class="active">Consulta Información</li>                    
                </ol>                  
              </div>
            </div>
          </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="menu" Runat="Server">
    
 <li class="bold"><a href="../Admin/Default.aspx" class="waves-effect waves-cyan"><i class="mdi-social-pages"></i>Inicio</a>
                        <div class="collapsible-body">
                        </div>
                    </li>

                        <li class="bold">
                            <a href="index.html" class="waves-effect waves-cyan"><i class="mdi-action-visibility"></i>Supervision Web</a>
                        </li>


                        <li class="no-padding">
                            <ul class="collapsible">
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan <%--active--%>"><i class="mdi-av-repeat"></i>Seguimiento de Bases</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../Admin/RalevsRale.aspx">Rale vs Rale</a>
                                            </li>
                                            <li>
                                                <a href="../Admin/BD_ExcelvsRale.aspx">B.D. Excel vs Rale</a>
                                            </li>
                                             <li>
                                                <a href="../Admin/X_fecha_de_notificacion.aspx">Fecha de Notificación</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                          
                        
                        
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-action-search"></i>Analisis de Rale</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../Admin/Analisis_del_Rale.aspx">Análisis</a>
                                            </li>
                                            <li><a href="../Admin/Dias_de_la_Incidencia.aspx">Días de la Incidencia</a>
                                            </li>
                                            <li><a href="../Admin/Descargar_Rale.aspx">Descargar Rale</a>
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
                                            <li><a href="../Admin/Incidencia09.aspx">Incidencia 09</a>
                                            </li>
                                            <li><a href="../Admin/Control_Expedientes_Inc_09.aspx">Cont.ExpendientesInc09</a>
                                            </li>                                        
                                        </ul>
                                    </div>
                                </li>

                        
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan"><i class="mdi-social-location-city"></i>Comite Delegacional</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li><a href="../Admin/Comp_Incidencias.aspx">Comp.Incidencia</a>
                                            </li>
                                            <li><a href="../Admin/Analisis_de_Eco_por_Inci.aspx">Análisis de Eco por Inc</a>
                                            </li>  
                                            <li><a href="../Admin/Situacion_de_la cartera_ejerci_anteriores.aspx">Situación Ejerc Anterir. <%--de la Cartera Ejer. Anteriores--%></a>
                                            </li>  
                                             <li><a href="../Admin/Situacion_de_la_Cartera_ejerc_envigor.aspx">Situación Ejerc Vigor<%--de la Cartera Ejer. en Vigor--%></a>
                                            </li>  
                                            <li><a href="../Admin/Patrones_con Impedimento_de_Cobro.aspx">Patrones <%--con Impedimento de Cobro--%></a>
                                            </li>                                        
                                        </ul>
                                    </div>
                                </li>
                            
                    
                                <li class="bold">
                                    <a class="collapsible-header waves-effect waves-cyan active"><i class="mdi-notification-disc-full"></i> CD-SUA</a>
                                    <div class="collapsible-body">
                                        <ul>
                                            <li class="active"><a href="../SUA/Default.aspx">Consulta Información</a>
                                            </li>
                                            <li><a href="Historial.aspx">Historial Patronal</a>
                                            </li>
                                             <li><a href="Trabajador.aspx">Historial Trabajador</a>
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
                                                <a href="../Admin/Carga_Rale.aspx">Rale</a>
                                            </li>

                                            <li> 
                                                <a href="../Admin/Base_Personalisada.aspx">Base de Datos Personalizada</a>
                                            </li>
                                        </ul>
                                    </div>
                                </li>
                                 </ul>
                        </li>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
        <div class="row" runat="server">
            <div class="col s12 m12 l12">
                <div class="card-panel">
                    <div class="section">
                    <h4 class="header2">Información</h4>
                    <div class="row">
                        <div class="row">
                            
                            <div class="col col s12 m6">
                                <label>Seleccione un Año</label>  
                                <select  id="anio" name="crole" runat="server" data-error=".errorTxt6" >
                                    <option value="" disabled="disabled" selected="selected"> -- Selecciona una Opción -- </option>                                
                                </select>   
                                 <div class="input-field">
                                <div class="errorTxt6"></div>    
                                    </div>                                
                            </div>
                             <div class="col col s12 m6">
                                <label>Seleccione un Mes</label>
                                <select  id="mes" name="crole" runat="server" data-error=".errorTxt6">
                                    <option value="" disabled="disabled" selected="selected"> -- Selecciona una Opción -- </option>
                                    <option value="01">Enero</option>
                                    <option value="02">Febrero</option>
                                    <option value="03">Marzo</option>
                                    <option value="04">Abril</option>
                                    <option value="05">Mayo</option>
                                    <option value="06">Junio</option>
                                    <option value="07">Julio</option>
                                    <option value="08">Agosto</option>
                                    <option value="09">Septiembre</option>
                                    <option value="10">Octubre</option>
                                    <option value="11">Noviembre</option>
                                    <option value="12">Diciembre</option>                                   
                                </select> 
                                <div class="input-field">
                                <div class="errorTxt4"></div>    
                                    </div>                              
                            </div>
                        </div>
                        <div class="row">
                            <div class="col col s12 m6">
                                <label>Subdelegación</label>
                                <asp:RadioButtonList ID="sub" runat="server" RepeatDirection="Horizontal">
                                </asp:RadioButtonList>
                            </div>
                            <div class="col col s12 m6">
                                <label>Búsqueda por:</label>
                                <asp:CheckBoxList ID="tipo" runat="server"  RepeatDirection="Horizontal" >
                                    <asp:ListItem Text="De Asegurados" Value="AS" onclick="MutExChkList(this);"></asp:ListItem>
                                    <asp:ListItem Text="De Patrones" Value="PA" onclick="MutExChkList(this);"></asp:ListItem>
                                </asp:CheckBoxList>                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-field col col s12 m6"> 
                                <label for="uname">Ejem. Ape. Paterno$Ape. Materno$Nombre(s) </label>
                                <asp:TextBox ID="dato" class="validate" runat="server" data-error=".errorTxt3" ></asp:TextBox>     
                                <div class="errorTxt1"></div>                          
                            </div>
                            <div class="col col s12 m6">  
                                <div class="input-field col s4">
                                    <div class="input-field col s12">
                                        <button class="btn waves-effect waves-light right submit cyan" type="submit" runat="server" formaction="Default.aspx?type=bus" name="action">Buscar
                                              <i class="mdi-content-send right"></i>
                                            </button>
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                        <asp:Label ID="LabelMensaje" runat="server" Text=""></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    <% 
        string ruta = ConfigurationManager.AppSettings.Get("Ruta") + anio.Value + "\\" + mes.Value + "\\CDSU" + ConfigurationManager.AppSettings.Get("Delegacion") + sub.SelectedValue + ".MDB";
        string file = "CDSU" + tipo.SelectedValue + mes.Value + anio.Value;         
        string conString1 = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + ruta + ";Persist Security Info=False";
        OleDbConnection connection = new OleDbConnection(conString1);
       %> 

     <% if (Request.QueryString["type"]== "bus")
        { 
         if(anio.Value != "")
         {
             if(mes.Value != "")
             {
                 if(sub.SelectedValue != "")
                 {
                     if(tipo.SelectedValue != "")
                     {
                         if(dato.Text != "")
                         {  
                             if (tipo.SelectedValue == "AS")
                             {    
                                 %>
                                    <div class="row">
                                        <div class="col s12 m12 l12">
                                            <div class="card-panel">
                                                <div class="row">
                                                    <div class="col s12 m12 l12"> 
                                                        <% 
                                                            if(System.IO.File.Exists(ruta))
                                                            {
                                                                try
                                                                {
                                                                    OleDbCommand cmd_asg = new OleDbCommand(@"SELECT TOP 100 RCAS_NUM_AFIL, RCAS_RFC, RCAS_CURP, RCAS_NOM_TRAB FROM " + file + " WHERE RCAS_NUM_AFIL LIKE @NSS OR RCAS_NOM_TRAB LIKE @NOMBRE ORDER BY RCAS_NOM_TRAB ASC", connection);   
                                                                    connection.Open();  //Abre Conexion  
                                                                    cmd_asg.Parameters.Add(new OleDbParameter("@NSS", "%" + dato.Text + "%"));
                                                                    cmd_asg.Parameters.Add(new OleDbParameter("@NOMBRE", "%" + dato.Text + "%"));
                                                                    OleDbDataReader reader_asg = cmd_asg.ExecuteReader(); 
                                                                    if (reader_asg.HasRows)
                                                                    {
                                                                        %>
                                                                            <!--Responsive Table-->
                                                                            <div class="divider"></div>
                                                                            <div id="responsive-table">
                                                                                <h4 class="header">Consulta de Asegurados</h4>
                                                                                <div class="row">
                                                                                    <div class="col s12 m12 l12">
                                                                                        <table class="responsive-table striped">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th data-field="id">No.</th>
                                                                                                    <th data-field="name">Asegurado</th>
                                                                                                    <th data-field="price">No. de Afil.</th>
                                                                                                    <th data-field="total">R.F.C.</th>
                                                                                                    <th data-field="total">Selecciona</th>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <%
                                                                                                    int n = 1;
                                                                                                    while (reader_asg.Read())
                                                                                                    {
                                                                                                %>
                                                                                                <tr>
                                                                                                    <td><%Response.Write(n); %></td>
                                                                                                    <td><%Response.Write(reader_asg.GetString(3).Replace("$"," ")); %></td>
                                                                                                    <td><%Response.Write(reader_asg.GetString(0).Substring(1,11)); %></td>
                                                                                                    <td><%Response.Write(reader_asg.GetString(1)); %></td>
                                                                                                    <td><div class="col s12 m4 center">
                                                                                                        <a href="Default.aspx?type=<%Response.Write(tipo.SelectedValue);%>&mes=<%Response.Write(mes.Value);%>&anio=<%Response.Write(anio.Value);%>&sub=<%Response.Write(sub.SelectedValue);%>&reg=<% Response.Write(reader_asg.GetString(0)); %>&del=<%=ConfigurationManager.AppSettings.Get("Delegacion")%>" class="btn-floating waves-effect waves-light cyan">
                                                                                                            <i class="mdi-navigation-check"></i>
                                                                                                        </a>
                                                                                                    </div>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <% n++;
                                                                                                     }
                                                                                                %>
                                                                                            </tbody>
                                                                                        </table>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        <% 
                                                                            connection.Close(); 
                                                                    }
                                                                    else
                                                                    {
                                                                        %>
                                                                            <div id="card-alert" class="card red">
                                                                                <div class="card-content white-text">
                                                                                    <p><i class="mdi-alert-error"></i> Alerta : No se Encontraron Coincidencias en la Busqueda. Intente de Nuevo por Favor.</p>
                                                                                </div>
                                                                                <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                                                                    <span aria-hidden="true">×</span>
                                                                                </button>
                                                                            </div>
                                                                     <%
                                                                    }
                                                                }
                                                                catch (Exception ex)
                                                                {
                                                                    Literal1.Visible = true;
                                                                    Literal1.Text = ex.Message + "No se puede abrir la conexión" + ex.Message;
                                                                    Response.Write("<script language=javascript>alert('" + ex.Message + "');</script>");         
                                                                }
                                                            }
                                                            else 
                                                            {
                                                                %>
                                                                <div id="card-alert" class="card red">
                                                                    <div class="card-content white-text">
                                                                        <p><i class="mdi-alert-error"></i> Alerta : La Base de Datos <% Response.Write(ruta); %>  NO Existe</p>
                                                                    </div>
                                                                    <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                                                        <span aria-hidden="true">×</span>
                                                                    </button>
                                                                </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                                            <%
                                                            }
                             }
                             else if (tipo.SelectedValue == "PA")
                             {
                                 %>
                                    <div class="row">
                                        <div class="col s12 m12 l12">
                                            <div class="card-panel">      
                                                <div class="row"> 
                                                    <div class="col s12 m12 l12">
                                                        <% 
                                                            if(System.IO.File.Exists(ruta))
                                                            {
                                                                try
                                                                {
                                                                    OleDbCommand cmd_pa = new OleDbCommand(@"SELECT TOP 100 RCPS_DEL, RCPS_SUB, RCPS_CVE_UNIT, RCPS_PATRON, RCPS_PER_PAGO, RCPS_TASA_ACT, RCPS_TASA_REC, RCPS_FECHA_PAGO, RCPS_NUM_FOL_SUA, RCPS_RFC_PATRON, RCPS_TIPO_PATRON, RCPS_PRI_RIES_TRA, RCPS_TIPO_CONTRIB, RCPS_NOM_PATRON FROM " + file + " WHERE RCPS_PATRON LIKE @RAZON ORDER BY RCPS_PATRON ASC", connection);
                                                                    connection.Open();  //Abre Conexion  
                                                                    cmd_pa.Parameters.Add(new OleDbParameter("@RAZON", "%" + dato.Text + "%"));
                                                                    //cmd_pa.Parameters.Add(new OleDbParameter("@NOMBRE", "%" + dato.Text + "%"));
                                                                    OleDbDataReader reader_pa = cmd_pa.ExecuteReader();
                                                                    if (reader_pa.HasRows)
                                                                    {
                                                                        %>
                                                                        <!--Responsive Table-->
                                                                        <div class="divider"></div>
                                                                        <div id="responsive-table2">
                                                                            <h4 class="header">Consulta de Patrones</h4>
                                                                            <div class="row">
                                                                                <div class="col s12 m12 l12">
                                                                                    <table class="responsive-table striped">
                                                                                        <thead>
                                                                                            <tr>
                                                                                                <th data-field="no">No.</th>
                                                                                                <th data-field="del">Delegación</th>
                                                                                                <th data-field="sub">Subdelegación</th>
                                                                                                <th data-field="reg_pat">Registro Patronal</th>
                                                                                                <th data-field="raz_soc">Nombre /<br /> Razón Social </th>
                                                                                                <th data-field="rfc">R.F.C. </th>
                                                                                            </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                            <% 
                                                                                                int num = 1;
                                                                                                while (reader_pa.Read())
                                                                                                { 
                                                                                            %>      
                                                                                            <tr>
                                                                                                <td><%Response.Write(num); %></td>
                                                                                                <td><%Response.Write(reader_pa.GetInt32(0)); %></td>
                                                                                                <td><%Response.Write(reader_pa.GetInt32(1)); %></td>
                                                                                                <td><%Response.Write(reader_pa.GetString(3).Substring(1,11)); %></td>
                                                                                                <td><%Response.Write(reader_pa.GetString(13)); %></td>
                                                                                                <td><%Response.Write(reader_pa.GetString(9)); %></td>
                                                                                                <td><div class="col s12 m4 center">
                                                                                                    <a href="Default.aspx?type=<%Response.Write(tipo.SelectedValue);%>&mes=<%Response.Write(mes.Value);%>&anio=<%Response.Write(anio.Value);%>&sub=<%Response.Write(sub.SelectedValue);%>&reg=<%Response.Write(reader_pa.GetString(3));%>&del=<%=ConfigurationManager.AppSettings.Get("Delegacion")%>&FolSUA=<%Response.Write(reader_pa.GetInt32(8)); %>" class="btn-floating waves-effect waves-light cyan">
                                                                                                        <i class="mdi-navigation-check"></i>
                                                                                                    </a>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <% 
                                                                                                num ++;
                                                                                                } 
                                                                                            %>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                <%      
                                                                    }
                                                                    else
                                                                    {
                                                                %>
                                                                    <div id="card-alert" class="card red">
                                                                        <div class="card-content white-text">
                                                                            <p><i class="mdi-alert-error"></i> Alerta : No se Encontraron Coincidencias en la Busqueda. Intente de Nuevo por Favor.</p>
                                                                        </div>
                                                                        <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                                                            <span aria-hidden="true">×</span>
                                                                        </button>
                                                                    </div>
                                                                <%
                                                                    }
                                                                }
                                                                catch (Exception ex)
                                                                {
                                                                    Literal1.Visible = true;
                                                                    Literal1.Text = ex.Message + "Error. Consulta de Patrones";
                                                                }  
                                                            }
                                                            else 
                                                            {
                                                                %>
                                                                    <div id="card-alert" class="card red">
                                                                        <div class="card-content white-text">
                                                                            <p><i class="mdi-alert-error"></i> Alerta : La Base de Datos <% Response.Write(ruta); %>  NO Existe</p>
                                                                        </div>
                                                                        <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                                                            <span aria-hidden="true">×</span>
                                                                        </button>
                                                                    </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  
                                                                <%
                                                            }
                             }
                         }
                         else
                         {
                             %>
                             <div id="card-alert" class="card red">
                                 <div class="card-content white-text">
                                     <p><i class="mdi-alert-error"></i> Alerta : Ingrese algun Dato por favor</p>
                                 </div>
                                 <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                     <span aria-hidden="true">×</span>
                                 </button>
                             </div>
                             <%
                         }
                     }
                     else
                     {
                          %>
                             <div id="card-alert" class="card red">
                                 <div class="card-content white-text">
                                     <p><i class="mdi-alert-error"></i> Alerta : Seleccione el tipo de busqueda por favor</p>
                                 </div>
                                 <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                     <span aria-hidden="true">×</span>
                                 </button>
                             </div>
                          <%
                     }
                 }
                 else
                 {
                     %>
                        <div id="card-alert" class="card red">
                            <div class="card-content white-text">
                                <p><i class="mdi-alert-error"></i> Alerta : Seleccione la Subdelegación por favor</p>
                            </div>
                            <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                     <%
                 }              
              }
              else
              {
                  %>
                     <div id="card-alert" class="card red">
                      <div class="card-content white-text">
                        <p><i class="mdi-alert-error"></i> Alerta : Seleccione un Mes por favor</p>
                      </div>
                      <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                      </button>
                    </div>
                  <%
              }
           }
           else 
           {
               %>
                  <div id="card-alert" class="card red">
                     <div class="card-content white-text">
                        <p><i class="mdi-alert-error"></i> Alerta : Seleccione un Año por favor</p>
                     </div>
                     <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">×</span>
                     </button>
                  </div>
               <%
           }
        }
        
        if (Request.QueryString["type"] == "PA" || Request.QueryString["type"] == "AS")
        {
            
            %>
               
                    <div class="row">
                        <div class="col s12 m12 l12">
                            <div class="card-panel">
                                <%
                                    if (Request.QueryString["type"] == "PA" || Request.QueryString["type"] == "AS")
                                    { 
                                %>
                                <div class="row">   
                                    <div class="col s12 m8 l10">
                                        <ul class="pagination">
                                            <%
                                                for(int m=1; m <= 12; m++)
                                                {
                                                    if (Convert.ToInt32(Request.QueryString["mes"]) == m )
                                                    {
                                                        %>
                                                        <li class="active"><% = obtenerNombreMesNumero(m) %></li>
                                                        <%
                                                    }
                                                    else
                                                    {
                                                        %>
                                                        <li class="waves-effect"><a href='Default.aspx?type=<%=Request.QueryString["type"]%>&mes=<%=rellena(Convert.ToString(m),"0",2)%>&anio=<%= Request.QueryString["anio"] %>&sub=<%= Request.QueryString["sub"] %>&reg=<%= Request.QueryString["reg"] %>&del=<%=ConfigurationManager.AppSettings.Get("Delegacion")%>'><%= obtenerNombreMesNumero(m) %></a> - </li>
                                                        <%
                                                    }
                                                    if (m < 12 )
                                                    {
                                                        %> <%
                                                    }
                                               }
                                            %>
                                        </ul>
                                    </div>
                                    <div class="col s12 m8 l2">
                                        <ul class="pagination">
                                            <%
                                                if(Convert.ToInt32((Request.QueryString["anio"]))-1 >= 1997)
                                                {
                                                    %>
                                                    <%
                                                        if(Convert.ToInt32((Request.QueryString["anio"]))-1 == 1997)
                                                        {
                                                            %>                                <%--Default.aspx?type=pa&mes=<%Response.Write(mes.Value);%>   &anio=<%Response.Write(anio.Value);%>                          &sub=<%Response.Write(sub.SelectedValue);%>&reg=<%Response.Write(reader_pa.GetString(3));%>&tipo=<%Response.Write(tipo.SelectedValue);%>--%>
                                                            <li class="waves-effect"><a href='Default.aspx?type=<%=Request.QueryString["type"]%>&mes=<%= Request.QueryString["mes"] %>&anio=<%= (Convert.ToInt32((Request.QueryString["anio"])))-1 %>&sub=<%= Request.QueryString["sub"] %>&reg=<%= Request.QueryString["reg"]  %>&del=<%=ConfigurationManager.AppSettings.Get("Delegacion") %>'><%= (Convert.ToInt32((Request.QueryString["anio"])))-1 %></a> - </li>
			                                                <%
                                                        }
                                                        else
                                                        {
                                                            %>
			                                                <li class="waves-effect"><a href='Default.aspx?type=<%=Request.QueryString["type"]%>&mes=<%= Request.QueryString["mes"] %>&anio=<%= (Convert.ToInt32((Request.QueryString["anio"])))-1 %>&sub=<%= Request.QueryString["sub"]  %>&reg=<%= Request.QueryString["reg"]  %>&del=<%=ConfigurationManager.AppSettings.Get("Delegacion") %>'><%= (Convert.ToInt32((Request.QueryString["anio"])))-1 %></a> -</li>
			                                                <%
                                                        }
                                                            %>
                                                            <% 
                                                        }
                                                            %>
                                                        <li class="active"> <%= Request.QueryString["anio"] %> </li>
                                                            <%
                                                                if ((Convert.ToInt32(Request.QueryString["anio"]))+1 <= DateTime.Today.Year)
                                                                {
                                                                    %>
                                                                    <li class="waves-effect"> - <a href='Default.aspx?type=<%=Request.QueryString["type"]%>&mes=<%= Request.QueryString["mes"] %>&anio=<%= (Convert.ToInt32((Request.QueryString["anio"])))+1 %>&sub=<%= Request.QueryString["sub"]  %>&reg=<%= Request.QueryString["reg"]  %>&del=<%=ConfigurationManager.AppSettings.Get("Delegacion") %>'><%= (Convert.ToInt32((Request.QueryString["anio"])))+1 %></a> </li>
		                                                            <%
                                                                }
                                                                
                                                            %>
                                        </ul>
                                    </div>
                                </div>
                                <%  
                                    }

                                string ruta_SUA = ConfigurationManager.AppSettings.Get("Ruta") + Request.QueryString["anio"] + "\\" + Request.QueryString["mes"] + "\\CDSU" + ConfigurationManager.AppSettings.Get("Delegacion") + Request.QueryString["sub"] + ".MDB";
                                string file_SUA = "CDSU" + Request.QueryString["type"] + Request.QueryString["mes"] + Request.QueryString["anio"];         
                                string conString_SUA = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + ruta_SUA + ";Persist Security Info=False";
                                OleDbConnection connection_SUA = new OleDbConnection(conString_SUA);
                                
                                
                                
                                
                                if (System.IO.File.Exists(ruta_SUA))
                                {
                                    if (Request.QueryString["type"] == "PA")
                                    {
                                        OleDbDataReader ReaderAseg = null;
                                        try
                                        {
                                            string sql = "";
                                                sql = @"SELECT RCPS_DEL,RCPS_SUB,RCPS_CVE_UNIT,RCPS_PATRON,RCPS_PER_PAGO,RCPS_TASA_ACT,RCPS_TASA_REC,RCPS_FECHA_PAGO,RCPS_NUM_FOL_SUA FROM "
                                                                                             + file_SUA + "  WHERE RCPS_PATRON = @REG_PAT ";
                                            OleDbCommand cmd_reg_pat =  new OleDbCommand(sql, connection_SUA);
                                            connection_SUA.Open();                                                                           
                                            cmd_reg_pat.Parameters.Add(new OleDbParameter("@REG_PAT", Request.QueryString["reg"])); 
                                            OleDbDataReader reader_patronesSUA = cmd_reg_pat.ExecuteReader();
                                            if (reader_patronesSUA.HasRows)
                                            { 
                                            %>
                                            <div class="row">
                                                 <label>Seleccione un Folio SUA: </label>
                                                            <div class="col s12 m12 l12">
                                                                <ul class="pagination">  
                                                                    <%         
                                                            while (reader_patronesSUA.Read())
                                                            {
                                                                if (reader_patronesSUA.GetInt32(8) == Convert.ToInt32(Request.QueryString["FolSUA"]))
                                                                {
                                                                    %>
                                                                    <li class="active"> - <%= reader_patronesSUA.GetInt32(8) %> </li>
                                                                    <%      
                                                                }
                                                                else
                                                                { 
                                                                Response.Write("<li class='waves-effect'> - <a href='Default.aspx?type=" + Request.QueryString["type"] + "&mes=" + Request.QueryString["mes"] + "&anio=" + (Convert.ToInt32((Request.QueryString["anio"]))) + "&sub=" + Request.QueryString["sub"] + "&reg=" + Request.QueryString["reg"] + "&del=" + ConfigurationManager.AppSettings.Get("Delegacion") + "&FolSUA="+ reader_patronesSUA.GetInt32(8)+"'>" + Convert.ToString(reader_patronesSUA.GetInt32(8)) + "</a></li>");
                                                                }                                                    
                                                            }
                                                               reader_patronesSUA.NextResult();
                                             
                                               connection_SUA.Close();   
                                                %>
                                                     </ul>
                                                  </div>
                                               </div>
                                            <%
                                               
                                                   
                                              string QUERY = "";
                                              if (Convert.ToInt32((Request.QueryString["anio"])) > 2006)
                                              {
                                                  QUERY = @"SELECT RCPS_DEL, RCPS_SUB, RCPS_CVE_UNIT, RCPS_PATRON, RCPS_PER_PAGO, RCPS_TASA_ACT, RCPS_TASA_REC, RCPS_FECHA_PAGO, RCPS_NUM_FOL_SUA,
                                                                  RCPS_RFC_PATRON,RCPS_TIPO_PATRON,RCPS_PRI_RIES_TRA,RCPS_TIPO_CONTRIB,RCPS_NOM_PATRON,RCPS_FEC_VAL_IMSS,RCPS_FEC_VAL_RCV,RCPS_ENT_REC,
                                                                  RCPS_PZA_SUC,RCPS_DOC,RCPS_TIP_INF_PAT,RCPS_TOT_DIAS_COT,RCPS_NUM_TRA_COT, RCPS_IMP_EYM_FIJA, RCPS_IMP_EYM_EXC, RCPS_IMP_EYM_PRED, RCPS_IMP_EYM_PREE,
                                                                  RCPS_IMP_RIES_TRA, RCPS_IMP_INV_VIDA, RCPS_IMP_GUAR, RCPS_IMP_ACT, RCPS_IMP_REC, RCPS_IMP_RETIRO, RCPS_IMP_CESA_Y_VEJ, RCPS_IMP_ACT_RCV, RCPS_IMP_REC_RCV,
                                                                  RCPS_IMP_AP_VOL_RCV, RCPS_VERSION_SUA, RCPS_IMP_INF_APO_PAT_IND, RCPS_IMP_INF_AMO_CRED, RCPS_IMP_INF_AMO_CRED_P, RCPS_IMP_INF_REC, RCPS_IMP_INF_ACT,
                                                                  RCPS_IMP_EYM_EXC_O, RCPS_IMP_EYM_PRED_O, RCPS_IMP_EYM_PREE_O, RCPS_IMP_INV_VIDA_O, RCPS_IMP_CESA_Y_VEJ_O, RCPS_TIPO_DOC, RCPS_NUM_CRED, RCPS_FAC_AUSENTISMO,
                                                                  RCPS_IMP_EYM_EXC_O + RCPS_IMP_EYM_PRED_O + RCPS_IMP_EYM_PREE_O + RCPS_IMP_INV_VIDA_O AS IMSS, RCPS_IMP_EYM_EXC - RCPS_IMP_EYM_EXC_O AS EXCEDENTE,
                                                                  RCPS_IMP_EYM_PRED - RCPS_IMP_EYM_PRED_O AS P_DINERO, RCPS_IMP_EYM_PREE - RCPS_IMP_EYM_PREE_O AS PENSIONADOS, RCPS_IMP_INV_VIDA - RCPS_IMP_INV_VIDA_O AS I_V,
                                                                  RCPS_IMP_EYM_FIJA + (RCPS_IMP_EYM_EXC - RCPS_IMP_EYM_EXC_O) + (RCPS_IMP_EYM_PRED - RCPS_IMP_EYM_PRED_O) + (RCPS_IMP_EYM_PREE - RCPS_IMP_EYM_PREE_O) +
                                                                  RCPS_IMP_RIES_TRA  + (RCPS_IMP_INV_VIDA - RCPS_IMP_INV_VIDA_O) + RCPS_IMP_GUAR + RCPS_IMP_ACT + RCPS_IMP_REC AS TOT, RCPS_IMP_CESA_Y_VEJ - RCPS_IMP_CESA_Y_VEJ_O AS CyV,
                                                                  RCPS_IMP_RETIRO + (RCPS_IMP_CESA_Y_VEJ - RCPS_IMP_CESA_Y_VEJ_O) + RCPS_IMP_ACT_RCV + RCPS_IMP_REC_RCV AS TOT_RCV, 
                                                                  RCPS_IMP_EYM_FIJA + RCPS_IMP_EYM_EXC + RCPS_IMP_EYM_PRED + RCPS_IMP_EYM_PREE + RCPS_IMP_RIES_TRA + RCPS_IMP_INV_VIDA +
                                                                  RCPS_IMP_GUAR + RCPS_IMP_ACT + RCPS_IMP_REC AS TOT_IMSS FROM "
                                                                                             + file_SUA + "  WHERE RCPS_PATRON = @REG_PAT AND  RCPS_NUM_FOL_SUA = @FOLIO_SUA";
                                              }
                                              else if (Convert.ToInt32((Request.QueryString["anio"])) <= 2006)
                                              {
                                                  QUERY = @"SELECT RCPS_DEL, RCPS_SUB, RCPS_CVE_UNIT, RCPS_PATRON, RCPS_PER_PAGO, RCPS_TASA_ACT, RCPS_TASA_REC, RCPS_FECHA_PAGO, RCPS_NUM_FOL_SUA,
                                                                  RCPS_RFC_PATRON,RCPS_TIPO_PATRON,RCPS_PRI_RIES_TRA,RCPS_TIPO_CONTRIB,RCPS_NOM_PATRON,RCPS_FEC_VAL_IMSS,RCPS_FEC_VAL_RCV,RCPS_ENT_REC,
                                                                  RCPS_PZA_SUC,RCPS_DOC,RCPS_TIP_INF_PAT,RCPS_TOT_DIAS_COT,RCPS_NUM_TRA_COT, RCPS_IMP_EYM_FIJA, RCPS_IMP_EYM_EXC, RCPS_IMP_EYM_PRED, RCPS_IMP_EYM_PREE,
                                                                  RCPS_IMP_RIES_TRA, RCPS_IMP_INV_VIDA, RCPS_IMP_GUAR, RCPS_IMP_ACT, RCPS_IMP_REC, RCPS_IMP_RETIRO, RCPS_IMP_CESA_Y_VEJ, RCPS_IMP_ACT_RCV, RCPS_IMP_REC_RCV,
                                                                  RCPS_IMP_AP_VOL_RCV,
                                                                   RCPS_IMP_EYM_EXC   AS EXCEDENTE,
                                                                  RCPS_IMP_EYM_PRED  AS P_DINERO, RCPS_IMP_EYM_PREE  AS PENSIONADOS, RCPS_IMP_INV_VIDA   AS I_V,
                                                                  RCPS_IMP_EYM_FIJA + (RCPS_IMP_EYM_EXC ) + (RCPS_IMP_EYM_PRED  ) + (RCPS_IMP_EYM_PREE ) +
                                                                  RCPS_IMP_RIES_TRA  + (RCPS_IMP_INV_VIDA) + RCPS_IMP_GUAR + RCPS_IMP_ACT + RCPS_IMP_REC AS TOT, RCPS_IMP_CESA_Y_VEJ   AS CyV,
                                                                  RCPS_IMP_RETIRO + (RCPS_IMP_CESA_Y_VEJ ) + RCPS_IMP_ACT_RCV + RCPS_IMP_REC_RCV AS TOT_RCV, 
                                                                  RCPS_IMP_EYM_FIJA + RCPS_IMP_EYM_EXC + RCPS_IMP_EYM_PRED + RCPS_IMP_EYM_PREE + RCPS_IMP_RIES_TRA + RCPS_IMP_INV_VIDA +
                                                                  RCPS_IMP_GUAR + RCPS_IMP_ACT + RCPS_IMP_REC AS TOT_IMSS FROM "
                                                                                              + file_SUA + "  WHERE RCPS_PATRON = @REG_PAT AND  RCPS_NUM_FOL_SUA = @FOLIO_SUA";
                                              }                                           
                                              OleDbCommand comandoFOLIOSUA = new OleDbCommand(QUERY, connection_SUA);
                                            connection_SUA.Open();
                                            comandoFOLIOSUA.Parameters.Add(new OleDbParameter("@REG_PAT", Request.QueryString["reg"]));
                                            comandoFOLIOSUA.Parameters.Add(new OleDbParameter("@FOLIO_SUA", Request.QueryString["FolSUA"]));
                                            OleDbDataReader ReaderFOLIOSUA = comandoFOLIOSUA.ExecuteReader();
                                            if (ReaderFOLIOSUA.HasRows)
                                            {
                                                while (ReaderFOLIOSUA.Read())
                                                {
                                                    if (Convert.ToInt32((Request.QueryString["anio"])) > 2006)/*Bases de DAtos 2006 a actualidad*/
                                                    {
                                                        LabelDelegacion.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(0));
                                                        LabelSubdelegacion.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(1));
                                                        LabelReg_Pat.Text = ReaderFOLIOSUA.GetString(3).Substring(1, 11);
                                                        LabelPeriodoPago.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(4));
                                                        LabelFechaPago.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(7)));
                                                        LabelFolioSUA.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(8));
                                                        LabelRFC.Text = ReaderFOLIOSUA.GetString(9);
                                                        LabelTipoPatron.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(10));
                                                        LabelPrimaRiesTrab.Text = Convert.ToString(ReaderFOLIOSUA.GetDouble(11));
                                                        LabelTipoContrib.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(12));
                                                        LabelNombre.Text = ReaderFOLIOSUA.GetString(13);
                                                        LabelFecValIMSS.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(14)));
                                                        LabelFecValIMSS2.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(14)));
                                                        LabelFecValIMSSTotal.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(14)));
                                                        LabelFecValRCV.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(15)));
                                                        LabelFecValRCV2.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(15)));
                                                        LabelFecValRCVTotal.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(15)));
                                                        LabelEntRecau.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(16));
                                                        LabelPzaSucEntRec.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(17));
                                                        LabelTipoDocumento.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(18));
                                                        LabelTipoInfoPatron.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(19));
                                                        LabelTotDiasCotizadosMes.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(20));
                                                        LabelNoCotizantes.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(21));
                                                        LabelCuotaFija.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(22)));
                                                        LabelCuotaFijaTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(22)));
                                                        LabelExcedenteTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(23)));
                                                        LabelPDineroTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(24)));
                                                        LabelPensionadosTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(25)));
                                                        LabelRTrabajoTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(26)));
                                                        LabelRTrabajo.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(26)));
                                                        LabelIyVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(27)));
                                                        LabelGuarderiasTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(28)));
                                                        LabelGuarderias.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(28)));
                                                        LabelActIMSSTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(29)));
                                                        LabelActIMSS.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(29)));
                                                        LabelRecIMSSTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(30)));
                                                        LabelRecIMSS.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(30)));
                                                        LabelRetiro.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(31)));
                                                        LabelRetiroTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(31)));
                                                        LabelActRCV.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(33)));
                                                        LabelActRCVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(33)));
                                                        LabelRecRCV.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(34)));
                                                        LabelRecRCVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(34)));
                                                        LabelAporVoluTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(35)));
                                                        LabelImpINFO.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(37)));
                                                        LabelImpAporINFO.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(38)));
                                                        LabelImpAmorCredINFO.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(39)));
                                                        LabelImpActAporINFO.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(41)));
                                                        LabelImpRecINFO.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(40)));
                                                        LabelExcedente.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(42)));
                                                        LabelPDinero.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(43)));
                                                        LabelPensionados.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(44)));
                                                        LabelIyV.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(45)));
                                                        LabelCyV.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(46)));
                                                        LabelTotalRCV.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(46)));
                                                        LabelNumeroCredito.Text = ReaderFOLIOSUA.GetString(48);
                                                        LabelFactorAusentismo.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(49)));
                                                        LabelTotalIMSS.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(50)));
                                                        LabelExcedente2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(51)));
                                                        LabelPDinero2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(52)));
                                                        LabelPensionados2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(53)));
                                                        LabelIyV2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(54)));
                                                        LabelTotalIMSS2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(55)));
                                                        LabelCyV2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(56)));
                                                        LabelTotalRCV2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(57)));
                                                        LabelTotalIMSSTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(58)));
                                                        LabelCyVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(56) + ReaderFOLIOSUA.GetDecimal(46)));
                                                        LabelTotalRCVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDecimal(57) + ReaderFOLIOSUA.GetDecimal(46)));
                                                    }
                                                    else if (Convert.ToInt32((Request.QueryString["anio"])) <= 2006) /*Bases de DAtos 2006 y anteriores*/
                                                    {
                                                        LabelDelegacion.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(0));
                                                        LabelSubdelegacion.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(1));
                                                        LabelReg_Pat.Text = ReaderFOLIOSUA.GetString(3).Substring(1, 11);
                                                        LabelPeriodoPago.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(4));
                                                        LabelFechaPago.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(7)));
                                                        LabelFolioSUA.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(8));
                                                        LabelRFC.Text = ReaderFOLIOSUA.GetString(9);
                                                        LabelTipoPatron.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(10));
                                                        LabelPrimaRiesTrab.Text = Convert.ToString(ReaderFOLIOSUA.GetDouble(11));
                                                        LabelTipoContrib.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(12));
                                                        LabelNombre.Text = ReaderFOLIOSUA.GetString(13);
                                                        LabelFecValIMSS.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(14)));
                                                        LabelFecValIMSS2.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(14)));
                                                        LabelFecValIMSSTotal.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(14)));
                                                        LabelFecValRCV.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(15)));
                                                        LabelFecValRCV2.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(15)));
                                                        LabelFecValRCVTotal.Text = Convert.ToString(String.Format("{0:dd/MM/yyyy}", ReaderFOLIOSUA.GetDateTime(15)));
                                                        LabelEntRecau.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(16));
                                                        LabelPzaSucEntRec.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(17));
                                                        LabelTipoDocumento.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(18));
                                                        LabelTipoInfoPatron.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(19));
                                                        LabelTotDiasCotizadosMes.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(20));
                                                        LabelNoCotizantes.Text = Convert.ToString(ReaderFOLIOSUA.GetInt32(21));
                                                        LabelCuotaFija.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(22)));
                                                        LabelCuotaFijaTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(22)));
                                                        LabelExcedenteTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(23)));
                                                        LabelPDineroTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(24)));
                                                        LabelPensionadosTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(25)));
                                                        LabelRTrabajoTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(26)));
                                                        LabelRTrabajo.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(26)));
                                                        LabelIyVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(27)));
                                                        LabelGuarderiasTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(28)));
                                                        LabelGuarderias.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(28)));
                                                        LabelActIMSSTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(29)));
                                                        LabelActIMSS.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(29)));
                                                        LabelRecIMSSTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(30)));
                                                        LabelRecIMSS.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(30)));
                                                        LabelRetiro.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(31)));
                                                        LabelRetiroTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(31)));
                                                        LabelActRCV.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(33)));
                                                        LabelActRCVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(33)));
                                                        LabelRecRCV.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(34)));
                                                        LabelRecRCVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(34)));
                                                        LabelAporVoluTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(35)));
                                                        LabelExcedente2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(36)));
                                                        LabelPDinero2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(37)));
                                                        LabelPensionados2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(38)));
                                                        LabelIyV2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(39)));
                                                        LabelTotalIMSS2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(40)));
                                                        LabelCyV2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(41)));
                                                        LabelTotalRCV2.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(42)));
                                                        LabelTotalIMSSTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(43)));
                                                        LabelCyVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(41)));
                                                        LabelTotalRCVTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderFOLIOSUA.GetDouble(42)));
                                                    }
                                                    if (Convert.ToInt32((Request.QueryString["anio"])) > 2006)/*Bases de DAtos 2006 a actualidad*/
                                                    {
                                                        try
                                                        {
                                                            string File_Rever = "CDSUFA" + Request.QueryString["mes"] + Request.QueryString["anio"];
                                                            string Reversion = @"SELECT RCFA_CVE_UNIT,RCFA_TIPO_REG,RCFA_NUM_AFIL,RCFA_FAC_EYM_FIJA,RCFA_FAC_EYM_EXC_P,RCFA_FAC_EYM_EXC_O,RCFA_FAC_EYM_PRED_P,RCFA_FAC_EYM_PRED_O,RCFA_FAC_EYM_PREE_P,
                                                                                RCFA_FAC_EYM_PREE_O,RCFA_FAC_RIES_TRA,RCFA_FAC_INV_VIDA_P,RCFA_FAC_INV_VIDA_O,RCFA_FAC_GUAR 
                                                                           FROM " + File_Rever + " T1 INNER JOIN " + file_SUA + " T2 ON T1.RCFA_CVE_UNIT = T2.RCPS_CVE_UNIT WHERE T1.RCFA_CVE_UNIT = @CVE_UNIT AND T1.RCFA_TIPO_REG = '0'";
                                                            OleDbCommand cmdRever = new OleDbCommand(Reversion, connection_SUA);
                                                            cmdRever.Parameters.Add(new OleDbParameter("@CVE_UNIT", ReaderFOLIOSUA.GetString(2)));
                                                            OleDbDataReader ReaderRever = cmdRever.ExecuteReader();
                                                            if (ReaderRever.HasRows)
                                                            {
                                                                while (ReaderRever.Read())
                                                                {
                                                                    LabelRevCuotaFijaPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(3)));
                                                                    LabelRevExceFacObrera.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(5)));
                                                                    LabelRevExceFacPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(4)));
                                                                    LabelRevDineroFacObrera.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(7)));
                                                                    LabelRevDineroFacPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(6)));
                                                                    LabelRevPensionFacObrera.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(9)));
                                                                    LabelRevPensionFacPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(8)));
                                                                    LabelRevTrabajoFacPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(10)));
                                                                    LabelRevVejezFacObrera.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(11)));
                                                                    LabelRevVejezFacPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(12)));
                                                                    LabelRevGuarderiasFactPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(13)));
                                                                    LabelRevCuotaFijaTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(3)));
                                                                    LabelRevExceFacTotal.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(4) + ReaderRever.GetDecimal(5)));
                                                                    LabelRevDineroFacTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(6) + ReaderRever.GetDecimal(7)));
                                                                    LabelRevPensionFacTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(8) + ReaderRever.GetDecimal(9)));
                                                                    LabelRevTrabajoFacTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(10)));
                                                                    LabelRevVejezFacTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(11) + ReaderRever.GetDecimal(12)));
                                                                    LabelRevGuarderiasFactTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever.GetDecimal(13)));
                                                                }
                                                            }

                                                        }
                                                        catch (Exception mensaje)
                                                        {
                                                            LabelMensaje.Text = mensaje.Message;
                                                        }

                                                        try
                                                        {
                                                            string File_Rever2 = "CDSUFA" + Request.QueryString["mes"] + Request.QueryString["anio"];
                                                            string Reversion2 = @"SELECT RCFA_CVE_UNIT,RCFA_TIPO_REG,RCFA_NUM_AFIL,RCFA_FAC_EYM_FIJA,RCFA_FAC_EYM_EXC_P,RCFA_FAC_EYM_EXC_O,RCFA_FAC_EYM_PRED_P,RCFA_FAC_EYM_PRED_O,RCFA_FAC_EYM_PREE_P,
                                                                                RCFA_FAC_EYM_PREE_O,RCFA_FAC_RIES_TRA,RCFA_FAC_INV_VIDA_P,RCFA_FAC_INV_VIDA_O,RCFA_FAC_GUAR 
                                                                           FROM " + File_Rever2 + " T1 INNER JOIN " + file_SUA + " T2 ON T1.RCFA_CVE_UNIT = T2.RCPS_CVE_UNIT WHERE T1.RCFA_CVE_UNIT = @CVE_UNIT AND T1.RCFA_TIPO_REG = '1'";
                                                            OleDbCommand cmdRever2 = new OleDbCommand(Reversion2, connection_SUA);
                                                            cmdRever2.Parameters.Add(new OleDbParameter("@CVE_UNIT", ReaderFOLIOSUA.GetString(2)));
                                                            OleDbDataReader ReaderRever2 = cmdRever2.ExecuteReader();
                                                            if (ReaderRever2.HasRows)
                                                            {
                                                                while (ReaderRever2.Read())
                                                                {
                                                                    LabelRevCuotaFijaImpPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(3)));
                                                                    LabelRevCuotaFijaImpTotPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(3)));
                                                                    LabelRevExceImpObreTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(5)));
                                                                    LabelRevExceImpPatrTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(4)));
                                                                    LabelRevExceImpOTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(4) + ReaderRever2.GetDecimal(5)));
                                                                    LabelRevDineroImpObrera.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(7)));
                                                                    LabelRevDineroImpPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(6)));
                                                                    LabelRevDineroImpTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(6) + ReaderRever2.GetDecimal(7)));
                                                                    LabelRevPensionImpObrera.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(9)));
                                                                    LabelRevPensionImpPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(8)));
                                                                    LabelRevPensionImpTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(8) + ReaderRever2.GetDecimal(9)));
                                                                    LabelRevTrabajoImpPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(10)));
                                                                    LabelRevTrabajoImpTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(10)));
                                                                    LabelRevVejezImpObrera.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(12)));
                                                                    LabelRevVejezImpPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(11)));
                                                                    LabelRevVejezImpTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(11) + ReaderRever2.GetDecimal(12)));
                                                                    LabelRevGuarderiasImpPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(13)));
                                                                    LabelRevGuarderiasImpTot.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(13)));
                                                                    LabelRevTotImpObrera.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(5) + ReaderRever2.GetDecimal(7) + ReaderRever2.GetDecimal(9) + ReaderRever2.GetDecimal(12)));
                                                                    LabelRevTotImpPatron.Text = Convert.ToString(String.Format("{0:N2}", ReaderRever2.GetDecimal(3) + ReaderRever2.GetDecimal(4) + ReaderRever2.GetDecimal(6) + ReaderRever2.GetDecimal(8) + ReaderRever2.GetDecimal(10) + ReaderRever2.GetDecimal(11) + ReaderRever2.GetDecimal(13)));
                                                                }
                                                            }

                                                        }
                                                        catch (Exception mensaje)
                                                        {
                                                            LabelMensaje.Text = mensaje.Message;
                                                        }
                                                    }
                                                    try
                                                    {
                                                        string File_Aseg = "CDSUAS" + Request.QueryString["mes"] + Request.QueryString["anio"];
                                                        string Aseg = @"SELECT RCAS_CVE_UNIT,RCAS_NUM_AFIL,IIF("+ File_Aseg +".RCAS_RFC IS NULL, '', RCAS_RFC) AS RCAS_RFC, IIF("+ File_Aseg + ".RCAS_CURP IS NULL, '', RCAS_CURP) AS RCAS_CURP,RCAS_NOM_TRAB,RCAS_NUM_MOV_PER,RCAS_TIPO_TRAB,RCAS_JOR_SEM_RED,RCAS_DIAS_COT_MES,RCAS_DIAS_INC_MES,"+
                                                                              "RCAS_DIAS_AUS_MES,RCAS_DIAS_COT_BIM,RCAS_DIAS_INC_BIM,RCAS_DIAS_AUS_BIM,RCAS_IMP_EYM_FIJA,RCAS_IMP_EYM_EXCE,RCAS_IMP_EYM_PRES,RCAS_IMP_EYM_ESPE,"+
                                                                              "RCAS_IMP_RT,RCAS_IMP_IV,RCAS_IMP_GUAR,RCAS_IMP_ACT_REC_I,RCAS_IMP_RET,RCAS_IMP_ACT_REC_RET,RCAS_IMP_CYV,RCAS_IMP_ACT_REC_CYV,RCAS_IMP_APOR_VOL FROM " + File_Aseg + " WHERE RCAS_CVE_UNIT = @CVE_UNIT ORDER BY RCAS_NOM_TRAB ASC";
                                                        OleDbCommand cmdAseg = new OleDbCommand(Aseg, connection_SUA);
                                                        cmdAseg.Parameters.Add(new OleDbParameter("@CVE_UNIT", ReaderFOLIOSUA.GetString(2)));
                                                        ReaderAseg = cmdAseg.ExecuteReader();                                                        
                                                    }
                                                    catch(Exception M)
                                                    {
                                                        LabelMensaje.Text = M.Message;
                                                    }
                                                    
                                                }
                                            %>    
                                                   
                                                   
                                                         
                                                
                                                <div class="row">
                                                  <!--work collections start-->
                                                  <h4 class="header">Consulta de Patrones</h4>
                                                  <div id="work-collections" class="seaction">
                            
                                                  <div class="row">                                                      
                                                      <div class="col s12 m12 l12">
                                                          <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-social-domain circle cyan"></i>
                                                                <span class="title">Registro Patronal</span>
                                                                <p>
                                                                    <asp:Label ID="LabelReg_Pat" Font-Size="Large" runat="server" Text=""></asp:Label>                
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-social-person circle cyan"></i>
                                                                <span class="title">Nombre</span>
                                                                <p><asp:Label ID="LabelNombre" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-image-filter-2 circle cyan"></i>
                                                                <span class="title">R.F.C.</span>
                                                                <p><asp:Label ID="LabelRFC" Font-Size="Large" runat="server" Text=""></asp:Label>                    
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-social-people-outline circle cyan"></i>
                                                                <span class="title">No. de Folio SUA.</span>
                                                                <p><asp:Label ID="LabelFolioSUA" Font-Size="Large" runat="server" Text=""></asp:Label>   
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-maps-local-hospital circle cyan"></i>
                                                                <span class="title">Prima Ries. Trab.</span>
                                                                <p><asp:Label ID="LabelPrimaRiesTrab" Font-Size="Large" runat="server" Text=""></asp:Label> 
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-action-redeem circle cyan"></i>
                                                                <span class="title">Pza/Suc. Ent. Rec. </span>
                                                                <p><asp:Label ID="LabelPzaSucEntRec" Font-Size="Large" runat="server" Text=""></asp:Label> 
                                                                </p>
                                                              </li>
                                                            </ul>
                                                          </div>


                                                          <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-editor-insert-invitation circle cyan"></i>
                                                                <span class="title">Fecha de Pago</span>
                                                                <p><asp:Label ID="LabelFechaPago" Font-Size="Large" runat="server" Text=""></asp:Label>                      
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-social-location-city circle cyan"></i>
                                                                <span class="title">Delegación</span>
                                                                <p><asp:Label ID="LabelDelegacion" Font-Size="Large" runat="server" Text=""></asp:Label>             
                                                                </p>                    
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-action-store circle cyan"></i>
                                                                <span class="title">Subdelegación</span>
                                                                <p><asp:Label ID="LabelSubdelegacion" Font-Size="Large" runat="server" Text=""></asp:Label>                     
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-image-grain circle cyan"></i>
                                                                <span class="title">Tipo de Patrón</span>
                                                                <p><asp:Label ID="LabelTipoPatron" Font-Size="Large" runat="server" Text=""></asp:Label>  
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-av-equalizer circle cyan"></i>
                                                                <span class="title">Ent. Recau.</span>
                                                                <p><asp:Label ID="LabelEntRecau" Font-Size="Large" runat="server" Text=""></asp:Label>  
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-communication-live-help circle cyan"></i>
                                                                <span class="title">Factor de Ausentismo</span>
                                                                <p><asp:Label ID="LabelFactorAusentismo" Font-Size="Large" runat="server" Text=""></asp:Label>  
                                                                </p>
                                                              </li>
                                                            </ul>
                                                          </div>


                                                          <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-notification-event-note circle cyan"></i>
                                                                <span class="title">Periodo de Pago</span>
                                                                <p><asp:Label ID="LabelPeriodoPago" Font-Size="Large" runat="server" Text=""></asp:Label>                     
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-social-group circle cyan"></i>
                                                                <span class="title">No. de Cotiz.</span>
                                                                <p><asp:Label ID="LabelNoCotizantes" Font-Size="Large" runat="server" Text=""></asp:Label>               
                                                                </p>                    
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-image-dehaze circle cyan"></i>
                                                                <span class="title">Tot. Dias Cotiz. en Mes</span>
                                                                <p><asp:Label ID="LabelTotDiasCotizadosMes" Font-Size="Large" runat="server" Text=""></asp:Label>                      
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-editor-insert-drive-file circle cyan"></i>
                                                                <span class="title">Tipo de Documento</span>
                                                                <p><asp:Label ID="LabelTipoDocumento" Font-Size="Large" runat="server" Text=""></asp:Label>  
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-av-recent-actors circle cyan"></i>
                                                                <span class="title">Tipo Info. Patrón</span>
                                                                <p><asp:Label ID="LabelTipoInfoPatron" Font-Size="Large" runat="server" Text=""></asp:Label>  
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-av-closed-caption circle cyan"></i>
                                                                <span class="title">Tipo Contrib.</span>
                                                                <p><asp:Label ID="LabelTipoContrib" Font-Size="Large" runat="server" Text=""></asp:Label>  
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-editor-attach-money circle cyan"></i>
                                                                <span class="title">Número de Credito</span>
                                                                <p><asp:Label ID="LabelNumeroCredito" Font-Size="Large" runat="server" Text=""></asp:Label>  
                                                                </p>
                                                              </li>
                                                            </ul>
                                                          </div>
                                                  </div>
                                                  </div>

                   <div id="preselecting-tab1" class="section">
                    <div class="row">
                         <div class="col s12 m12 l12">
                         <div class="col s12">                       
                        <ul id="tabs-patron" class="tabs tab-demo-active z-depth-5 cyan">
                            <li class="tab col s2"><a class="white-text waves-effect waves-light" href="#test-obrera">Obrera</a></li>
                            <li class="tab col s2"><a class="white-text waves-effect waves-light" href="#test-patronal">Patronal</a></li>
                            <li class="tab col s2"><a class="white-text waves-effect waves-light active" href="#test-total">Total</a></li>
                            <li class="tab col s2"><a class="white-text waves-effect waves-light" href="#test-factores">Factores de Reversión</a></li>
                            <li class="tab col s2"><a class="white-text waves-effect waves-light" href="#test-trabajadores">Trabajadores</a></li>
                        </ul>
                             </div>
                     <div class="col s12">
                        <div id="test-obrera" class="col s12"  >
                            <div class="row">
                                <!--work collections start-->                              
                                <div id="work-collections2" class="seaction">
                                    <div class="row">
                                        <div id="hoverable-table">
                                          <div class="row">
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Excedente</span></td>
                                                    <td><h5><asp:Label ID="LabelExcedente" runat="server" CssClass="right" Text=""></asp:Label> </h5> </td>                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">P. Dinero</span></td>
                                                    <td><h5><asp:Label ID="LabelPDinero" runat="server"  CssClass="right" Text=""></asp:Label></h5>  </td>                                                  
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Pensionados</span></td>
                                                    <td><h5><asp:Label ID="LabelPensionados" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                  
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">I. Y V.</span></td>
                                                    <td><h5><asp:Label ID="LabelIyV" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;"><b>Total I.M.S.S.</b></span></td>
                                                    <td><h5><asp:Label ID="LabelTotalIMSS" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                </tbody>
                                              </table>
                                            </div>
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">C. Y V.</span></td>
                                                    <td><h5><asp:Label ID="LabelCyV" runat="server" Text=""  CssClass="right"></asp:Label></h5></td>                                                    
                                                  </tr>
                                                    <tr><td></td></tr>
                                                    <tr><td></td></tr>
                                                    <tr><td></td></tr>
                                                    <tr><td></td></tr>
                                                    <tr><td></td></tr>
                                                    <tr><td></td></tr><tr><td></td></tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-moneysmall circle cyan"></i>
                                                                <span class="title" style="font-size:18px;"><b>Total R.C.V.</b></span></td>
                                                    <td><h5><asp:Label ID="LabelTotalRCV" runat="server" Text=""  CssClass="right"></asp:Label></h5></td>                                                  
                                                  </tr>
                                                    
                                                </tbody>
                                              </table>
                                            </div>
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Fec. Val. R.C.V.</span></td>
                                                    <td><h5><asp:Label ID="LabelFecValRCV" runat="server" Text=""></asp:Label></h5></td>                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Fec. Val. I.M.S.S.</span></td>
                                                    <td><h5><asp:Label ID="LabelFecValIMSS" runat="server" Text=""></asp:Label></h5></td>                                                  
                                                  </tr>    
                                                </tbody>
                                              </table>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="test-patronal" class="col s12" >
                            <div class="row">
                                <!--work collections start-->                              
                                <div id="work-collections3" class="seaction">
                                    <div class="row">
                                        <div id="hoverable-table2">
                                          <div class="row">
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Cuota Fija</span></td>
                                                    <td><h5><asp:Label ID="LabelCuotaFija" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Excedente</span></td>
                                                    <td><h5><asp:Label ID="LabelExcedente2" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                  
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">P. Dinero</span></td>
                                                    <td><h5><asp:Label ID="LabelPDinero2" runat="server" Text=""  CssClass="right"></asp:Label></h5>  </td>                                                  
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Pensionados</span></td>
                                                    <td><h5><asp:Label ID="LabelPensionados2" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">R. Trabajo</span></td>
                                                    <td><h5><asp:Label ID="LabelRTrabajo" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">I. Y V.</span></td>
                                                    <td><h5><asp:Label ID="LabelIyV2" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Guarderías</span></td>
                                                    <td><h5><asp:Label ID="LabelGuarderias" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Act. I.M.S.S.</span></td>
                                                    <td><h5><asp:Label ID="LabelActIMSS" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Rec. I.M.S.S.</span></td>
                                                    <td><h5><asp:Label ID="LabelRecIMSS" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money circle cyan"></i>
                                                                <span class="title" style="font-size:18px;"><b>Total I.M.S.S.</b></span></td>
                                                    <td><h5><asp:Label ID="LabelTotalIMSS2" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                </tbody>
                                              </table>
                                            </div>
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Retiro</span></td>
                                                    <td><h5><asp:Label ID="LabelRetiro" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">C. Y V.</span></td>
                                                    <td><h5><asp:Label ID="LabelCyV2" runat="server" Text=""  CssClass="right"></asp:Label></h5></td>                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Act. R.C.V.</span></td>
                                                    <td><h5><asp:Label ID="LabelActRCV" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Rec. R.C.V.</span></td>
                                                    <td><h5><asp:Label ID="LabelRecRCV" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr><td></td></tr> <tr><td></td></tr> <tr><td></td></tr>
                                                  <tr><td></td></tr> <tr><td></td></tr> <tr><td></td></tr>
                                                  <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
                                                      <tr><td></td></tr><tr><td></td></tr>
                                                    <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;"><b>Total R.C.V.</b></span></td>
                                                    <td><h5><asp:Label ID="LabelTotalRCV2" runat="server" Text=""  CssClass="right"></asp:Label></h5></td>                                                  
                                                  </tr>
                                                </tbody>
                                              </table>
                                            </div>
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Fec. Val. R.C.V.</span></td>
                                                    <td><h5><asp:Label ID="LabelFecValRCV2" runat="server" Text=""></asp:Label></h5></td>                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Fec. Val. I.M.S.S.</span></td>
                                                    <td><h5><asp:Label ID="LabelFecValIMSS2" runat="server" Text=""></asp:Label></h5></td>                                                  
                                                  </tr>    
                                                </tbody>
                                              </table>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="test-total" class="col s12" >
                            <div class="row">
                                <!--work collections start-->                              
                                <div id="work-collections4" class="seaction">
                                    <div class="row">
                                        <div id="hoverable-table3">
                                          <div class="row">
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Cuota Fija</span></td>
                                                    <td><h5><asp:Label ID="LabelCuotaFijaTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Excedente</span></td>
                                                    <td><h5><asp:Label ID="LabelExcedenteTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                  
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">P. Dinero</span></td>
                                                    <td><h5><asp:Label ID="LabelPDineroTotal" runat="server" Text=""  CssClass="right"></asp:Label></h5>  </td>                                                  
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Pensionados</span></td>
                                                    <td><h5><asp:Label ID="LabelPensionadosTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">R. Trabajo</span></td>
                                                    <td><h5><asp:Label ID="LabelRTrabajoTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">I. Y V.</span></td>
                                                    <td><h5><asp:Label ID="LabelIyVTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Guarderías</span></td>
                                                    <td><h5><asp:Label ID="LabelGuarderiasTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Act. I.M.S.S.</span></td>
                                                    <td><h5><asp:Label ID="LabelActIMSSTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Rec. I.M.S.S.</span></td>
                                                    <td><h5><asp:Label ID="LabelRecIMSSTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;"><b>Total I.M.S.S.</b></span></td>
                                                    <td><h5><asp:Label ID="LabelTotalIMSSTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                </tbody>
                                              </table>
                                            </div>
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Retiro</span></td>
                                                    <td><h5><asp:Label ID="LabelRetiroTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">C. Y V.</span></td>
                                                    <td><h5><asp:Label ID="LabelCyVTotal" runat="server" Text=""  CssClass="right"></asp:Label></h5></td>                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Act. R.C.V.</span></td>
                                                    <td><h5><asp:Label ID="LabelActRCVTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Rec. R.C.V.</span></td>
                                                    <td><h5><asp:Label ID="LabelRecRCVTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Apor. Volu.</span></td>
                                                    <td><h5><asp:Label ID="LabelAporVoluTotal" runat="server" Text=""  CssClass="right"></asp:Label> </h5> </td>                                                   
                                                  </tr>
                                                    <tr><td></td></tr> <tr><td></td></tr> <tr><td></td></tr>
                                                  <tr><td></td></tr> <tr><td></td></tr> <tr><td></td></tr>
                                                  <tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>                                                     
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;"><b>Total R.C.V.</b></span></td>
                                                    <td><h5><asp:Label ID="LabelTotalRCVTotal" runat="server" Text=""  CssClass="right"></asp:Label></h5></td>                                                  
                                                  </tr>
                                                </tbody>
                                              </table>
                                            </div>
                                            <div class="col s12 m6 l4">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Fec. Val. R.C.V.</span></td>
                                                    <td><h5><asp:Label ID="LabelFecValRCVTotal" runat="server" Text=""></asp:Label></h5></td>                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Fec. Val. I.M.S.S.</span></td>
                                                    <td><h5><asp:Label ID="LabelFecValIMSSTotal" runat="server" Text=""></asp:Label></h5></td>                                                  
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Imp. INFO.</span></td>
                                                    <td><h5><asp:Label ID="LabelImpINFO" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                  </tr>  
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Imp. Apor. INFO.</span></td>
                                                    <td><h5><asp:Label ID="LabelImpAporINFO" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                  </tr>  
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Imp. Amor. Cred. INFO.</span></td>
                                                    <td><h5><asp:Label ID="LabelImpAmorCredINFO" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                  </tr>  
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Imp. Act. Apor. INFO.</span></td>
                                                    <td><h5><asp:Label ID="LabelImpActAporINFO" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                  </tr>  
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                <span class="title" style="font-size:18px;">Imp. Rec. INFO.</span></td>
                                                    <td><h5><asp:Label ID="LabelImpRecINFO" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                  </tr>      
                                                </tbody>
                                              </table>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div><!--END star total-->  
                        
                                                           
                        <div id="test-factores" class="col s12" >
                            <div class="row">
                                <!--work collections start-->                              
                                <div id="work-collections5" class="seaction">
                                    <div class="row">
                                        <div id="hoverable-table4">
                                          <div class="row">
                                            <div class="col s12 m12 l12">
                                              <table class="hoverable">
                                                  <h4 class="header"></h4>
                                                <thead>
                                                </thead>
                                                <tbody>
                                                  <tr style="font-size:18px; text-align:center;">
                                                      <td>Rama</td>
                                                      <td><div class="title" style="text-align:center;">Factores</div></td>
                                                      <td><span class="title" style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                      <td><span class="title" style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                      <td><div class="title" style="text-align:center;">Importes</div></td>
                                                      <td><span class="title" style="text-align:center;" >&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                      <td><span class="title" style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>   
                                                  </tr>
                                                  <tr>
                                                      <td><span class="title" style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                      <td><div class="title" style="text-align:center;" >Obrera</div></td>
                                                      <td><div class="title" style="text-align:center;">Patronal</div></td>
                                                      <td><div class="title" style="text-align:center;">Total</div></td>
                                                      <td><div class="title" style="text-align:center;">Obrera</div></td>
                                                      <td><div class="title" style="text-align:center;">Patronal</div></td>
                                                      <td><div class="title" style="text-align:center;">Total</div></td>
                                                  </tr>                                                                                                 
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i><span class="title" style="font-size:18px;">Cuota Fija</span></td>
                                                    <td><span class="title" >&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                    <td><asp:Label ID="LabelRevCuotaFijaPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevCuotaFijaTotal" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>    
                                                    <td><span class="title" >&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                    <td><asp:Label ID="LabelRevCuotaFijaImpPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevCuotaFijaImpTotPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>                                                                                                                                                                                                   
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i><span class="title" style="font-size:18px;">Excedente</span></td>
                                                    <td><asp:Label ID="LabelRevExceFacObrera" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevExceFacPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevExceFacTotal" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>   
                                                    <td><asp:Label ID="LabelRevExceImpObreTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevExceImpPatrTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevExceImpOTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>                                                                                                      
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i><span class="title" style="font-size:18px;">P. Dinero</span></td>
                                                    <td><asp:Label ID="LabelRevDineroFacObrera" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevDineroFacPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevDineroFacTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>   
                                                    <td><asp:Label ID="LabelRevDineroImpObrera" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevDineroImpPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevDineroImpTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>                                                                                                    
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i><span class="title" style="font-size:18px;">Pensionados</span></td>
                                                    <td><asp:Label ID="LabelRevPensionFacObrera" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevPensionFacPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevPensionFacTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>   
                                                    <td><asp:Label ID="LabelRevPensionImpObrera" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevPensionImpPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevPensionImpTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>                                                                                                  
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i><span class="title" style="font-size:18px;">R. Trabajo</span></td>          
                                                    <td><span class="title" style="font-size:18px;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>   
                                                    <td><h5><asp:Label ID="LabelRevTrabajoFacPatron" runat="server" CssClass="right" Text=""></asp:Label></h5></td> 
                                                    <td><h5><asp:Label ID="LabelRevTrabajoFacTot" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                    <td><span class="title" style="font-size:18px;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                    <td><asp:Label ID="LabelRevTrabajoImpPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevTrabajoImpTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>                                                                                             
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i><span class="title" style="font-size:18px;">I. y V.</span></td>
                                                    <td><asp:Label ID="LabelRevVejezFacObrera" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevVejezFacPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevVejezFacTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>   
                                                    <td><asp:Label ID="LabelRevVejezImpObrera" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevVejezImpPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevVejezImpTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>                                                                                                       
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i><span class="title" style="font-size:18px;">Guarderías</span></td>
                                                    <td><span class="title" style="font-size:18px;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>   
                                                    <td><h5><asp:Label ID="LabelRevGuarderiasFactPatron" runat="server" CssClass="right" Text=""></asp:Label></h5></td> 
                                                    <td><h5><asp:Label ID="LabelRevGuarderiasFactTot" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                    <td><span class="title" style="font-size:18px;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                    <td><asp:Label ID="LabelRevGuarderiasImpPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevGuarderiasImpTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>                                                                                                      
                                                  </tr>
                                                  <tr>
                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i><span class="title" style="font-size:18px;">Total</span></td>
                                                    <td><span class="title" style="font-size:18px;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                                    <td><span class="title" style="font-size:18px;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td> 
                                                    <td><span class="title" style="font-size:18px;">&nbsp;&nbsp;&nbsp;&nbsp;</span></td>   
                                                    <td><asp:Label ID="LabelRevTotImpObrera" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>
                                                    <td><asp:Label ID="LabelRevTotImpPatron" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td> 
                                                    <td><asp:Label ID="LabelRevTotImpTot" runat="server" CssClass="right" Font-Size="18" Text=""></asp:Label></td>                                                                                                      
                                                  </tr>
                                                </tbody>
                                              </table>
                                            </div>                                       
                                          </div>
                                        </div>         
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="test-trabajadores" class="col s12" >
                            <div class="row">
                                <!--work collections start-->                              
                                <div id="work-collections6" class="seaction">
                                    <div class="row">
                                        <div id="hoverable-table6">
                                            <div class="row">
                                                <div class="col s12 m12 l12">
                                                    <table class="hoverable">
                                                        <h4 class="header"></h4>
                                                        <thead>
                                                            <tr>
                                                                <th>N°</th>
                                                                <th>Nombre del Asegurado</th>
                                                                <th>N.S.S.</th>
                                                                <th>C.U.R.P.</th>
                                                                <th>R.F.C.</th>
                                                                <th>Detalles</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                try
                                                {
                                                    if (ReaderAseg.HasRows)
                                                    {
                                                        int i = 1;
                                                        while (ReaderAseg.Read())
                                                        { %>
                                                            <tr>
                                                                <td> <% Response.Write(i); %> </td>
                                                                <td> <% Response.Write(ReaderAseg.GetString(4)); %> </td>
                                                                <td> <% Response.Write(ReaderAseg.GetString(1).Substring(1, 11)); %> </td>
                                                                <td> <% Response.Write(ReaderAseg.GetString(3)); %> </td>
                                                                <td> <% Response.Write(ReaderAseg.GetString(2)); %> </td>
                                                                <td>
                                                                    <div class="col s12 m4 center">
                                                                    <a href="Default.aspx?type=AS&mes=<%Response.Write(Request.QueryString["mes"]);%>&anio=<%Response.Write(Convert.ToInt32((Request.QueryString["anio"])));%>&sub=<%Response.Write(Request.QueryString["sub"]);%>&reg=<% Response.Write(ReaderAseg.GetString(1)); %>&del=<%=ConfigurationManager.AppSettings.Get("Delegacion")%>&FolSUA=<% Response.Write(Request.QueryString["FolSUA"]); %>" class="btn-floating waves-effect waves-light cyan">
                                                                    <i class="mdi-content-forward"></i>
                                                                                                        </a>
                                                                                                    </div>
                                                                </td>
                                                            </tr>
                                                             <%   i++;
                                                        }
                                                    }
                                                }
                                                catch (Exception d)
                                                {
                                                    LabelError.Text = d.Message;
                                                } %>
                                                        </tbody>
                                                    </table>
                                                    <asp:Label ID="LabelError" runat="server" Text=""></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                               
                      </div>
                    </div>
                  </div>
    </div>


                                                
                                                 <%
                                            }
                                            }
                                                                           else
                                            {
                                                %>
                                                      <div id="card-alert" class="card red">
                            <div class="card-content white-text">
                                <p><i class="mdi-alert-error"></i> Alerta : No se Encontro el Registro <%Response.Write(Request.QueryString["reg"].Substring(1, 11)); %></p>
                            </div>
                            <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                                                <%
                                            }                
                                        }
                                        catch (Exception ex)
                                        {
                                            Literal1.Text = ex.Message;

                                        }
                                        %>
                                             </div>
                            </div>
                                        <%
                                    }
                                    else if(Request.QueryString["type"] == "AS")
                                    {
                                        OleDbDataReader readerTrabajador2 = null;                                    
                                        try
                                        {
                                            string File_PatInicio = "CDSUPA" + Request.QueryString["mes"] + Request.QueryString["anio"];
                                            string queryInicio = null;
                                            queryInicio = @"SELECT RCPS_DEL, RCPS_SUB, RCPS_PATRON, RCPS_NUM_FOL_SUA, RCPS_PER_PAGO, RCAS_NUM_AFIL FROM " + File_PatInicio + " T1 INNER JOIN " + file_SUA + " T2 ON T1.RCPS_CVE_UNIT = T2.RCAS_CVE_UNIT WHERE T2.RCAS_NUM_AFIL = @NSS";
                                            connection_SUA.Open();
                                            OleDbCommand cmdTrabInicio = new OleDbCommand(queryInicio, connection_SUA);
                                            cmdTrabInicio.Parameters.Add(new OleDbParameter("@NSS", Request.QueryString["reg"]));
                                            OleDbDataReader readerTrabInicio = cmdTrabInicio.ExecuteReader();
                                            if (readerTrabInicio.HasRows)
                                            {
                                                %>
                                                <div class="row">
                                                     <label>Seleccione un Folio SUA: </label>
                                                                <div class="col s12 m12 l12">
                                                                    <ul class="pagination">  
                                                                        <% 
                                                                while (readerTrabInicio.Read())
                                                                {       
                                                                    if (readerTrabInicio.GetInt32(3) == Convert.ToInt32(Request.QueryString["FolSUA"]))
                                                                    {
                                                                        %>
                                                                        <li class="active"> - <%= readerTrabInicio.GetInt32(3) %> </li>
                                                                        <%      
                                                                    }
                                                                    else
                                                                    {
                                                                        Response.Write("<li class='waves-effect'> - <a href='Default.aspx?type=" + Request.QueryString["type"] + "&mes=" + Request.QueryString["mes"] + "&anio=" + (Convert.ToInt32((Request.QueryString["anio"]))) + "&sub=" + Request.QueryString["sub"] + "&reg=" + Request.QueryString["reg"] + "&del=" + ConfigurationManager.AppSettings.Get("Delegacion") + "&FolSUA=" + readerTrabInicio.GetInt32(3) + "'>" + Convert.ToString(readerTrabInicio.GetInt32(3)) + "</a></li>");
                                                                    } 
                                                                }
                                                                 %>
                                                            </ul>
                                                                </div>
                                                    </div><%
                                            try
                                                {                                                    
                                                    string queryTrabajador = "";
                                                    if (Convert.ToInt32((Request.QueryString["anio"])) > 2006)/*Bases de DAtos 2006 a actualidad*/
                                                    {
                                                        queryTrabajador = @"SELECT RCAS_CVE_UNIT,RCAS_NUM_AFIL,IIF(T1.RCAS_RFC IS NULL, '', RCAS_RFC) AS RCAS_RFC, IIF(T1.RCAS_CURP IS NULL, '', RCAS_CURP) AS RCAS_CURP,RCAS_NOM_TRAB,RCAS_NUM_MOV_PER,RCAS_TIPO_TRAB,RCAS_JOR_SEM_RED,RCAS_DIAS_COT_MES,RCAS_DIAS_INC_MES," +
                                                                                          "RCAS_DIAS_AUS_MES,RCAS_DIAS_COT_BIM,RCAS_DIAS_INC_BIM,RCAS_DIAS_AUS_BIM,RCAS_IMP_EYM_FIJA,RCAS_IMP_EYM_EXCE,RCAS_IMP_EYM_PRES,RCAS_IMP_EYM_ESPE," +
                                                                                          "RCAS_IMP_RT,RCAS_IMP_IV,RCAS_IMP_GUAR,RCAS_IMP_ACT_REC_I,RCAS_IMP_RET,RCAS_IMP_ACT_REC_RET,RCAS_IMP_CYV,RCAS_IMP_ACT_REC_CYV,RCAS_IMP_APOR_VOL," +
                                                                                          "RCAS_IMP_EYM_EXCE_O,RCAS_IMP_EYM_PRES_O,RCAS_IMP_EYM_ESPE_O,RCAS_IMP_IV_O,RCAS_IMP_CYV_O,RCAS_MUNICIPIO,RCAS_IMP_INF,RCAS_IMP_INF_APOR," +
                                                                                          "RCAS_IMP_INF_AMORT, T2.RCPS_DEL, T2.RCPS_SUB, T2.RCPS_PATRON, T2.RCPS_NUM_FOL_SUA, T2.RCPS_PER_PAGO FROM " + file_SUA + " T1 INNER JOIN " + File_PatInicio + " T2 ON T1.RCAS_CVE_UNIT = T2.RCPS_CVE_UNIT WHERE T1.RCAS_NUM_AFIL = @NSS AND T2.RCPS_NUM_FOL_SUA = @FOLIOSUA";
                                                    }
                                                    else if (Convert.ToInt32((Request.QueryString["anio"])) <= 2006)/*Bases de DAtos 2006 y anteriores*/
                                                    {
                                                        queryTrabajador = @"SELECT RCAS_CVE_UNIT,RCAS_NUM_AFIL,IIF(T1.RCAS_RFC IS NULL, '', RCAS_RFC) AS RCAS_RFC, IIF(T1.RCAS_CURP IS NULL, '', RCAS_CURP) AS RCAS_CURP,RCAS_NOM_TRAB,RCAS_NUM_MOV_PER,RCAS_TIPO_TRAB,RCAS_JOR_SEM_RED,RCAS_DIAS_COT_MES,RCAS_DIAS_INC_MES,
                                                                                      RCAS_DIAS_AUS_MES,RCAS_DIAS_COT_BIM,RCAS_DIAS_INC_BIM,RCAS_DIAS_AUS_BIM,RCAS_IMP_EYM_FIJA,RCAS_IMP_EYM_EXCE,RCAS_IMP_EYM_PRES,RCAS_IMP_EYM_ESPE,
                                                                                      RCAS_IMP_RT,RCAS_IMP_IV,RCAS_IMP_GUAR,RCAS_IMP_ACT_REC_I,RCAS_IMP_RET,RCAS_IMP_ACT_REC_RET,RCAS_IMP_CYV,RCAS_IMP_ACT_REC_CYV,RCAS_IMP_APOR_VOL,
                                                                                      T2.RCPS_DEL, T2.RCPS_SUB, T2.RCPS_PATRON, T2.RCPS_NUM_FOL_SUA, T2.RCPS_PER_PAGO FROM " + file_SUA + " T1 INNER JOIN " + File_PatInicio + " T2 ON T1.RCAS_CVE_UNIT = T2.RCPS_CVE_UNIT WHERE T1.RCAS_NUM_AFIL = @NSS AND T2.RCPS_NUM_FOL_SUA = @FOLIOSUA";
                                                    }
                                                    OleDbCommand cmdTrabajador = new OleDbCommand(queryTrabajador, connection_SUA);
                                                    cmdTrabajador.Parameters.Add(new OleDbParameter("@NSS", Request.QueryString["reg"]));
                                                    cmdTrabajador.Parameters.Add(new OleDbParameter("@FOLIOSUA", Request.QueryString["FolSUA"]));
                                                    OleDbDataReader readerTrabajador = cmdTrabajador.ExecuteReader();
                                                    if (readerTrabajador.HasRows)
                                                    {
                                                        while (readerTrabajador.Read())
                                                        {
                                                            if (Convert.ToInt32((Request.QueryString["anio"])) > 2006)/*Bases de DAtos 2006 a actualidad*/
                                                            {
                                                                LabelNSS.Text = readerTrabajador.GetString(1).Substring(1, 11);
                                                                LabelRFCTrabahador.Text = readerTrabajador.GetString(2);
                                                                LabelNombreTrabjador.Text = readerTrabajador.GetString(4).Replace('$', ' ');
                                                                LabelNumMvtosPeriodo.Text = Convert.ToString(readerTrabajador.GetInt32(5));
                                                                LabelTipoTrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(6));
                                                                LabelJornadaSemReducida.Text = Convert.ToString(readerTrabajador.GetInt32(7));
                                                                Label1DiasCotizadosMes.Text = Convert.ToString(readerTrabajador.GetInt32(8));
                                                                LabelDiasIncapacidad.Text = Convert.ToString(readerTrabajador.GetInt32(9));
                                                                Label1DiasAusentismoMes.Text = Convert.ToString(readerTrabajador.GetInt32(10));
                                                                LabelDiasCotizadosBimestre.Text = Convert.ToString(readerTrabajador.GetInt32(11));
                                                                LabelDiasIncapacidadBimestre.Text = Convert.ToString(readerTrabajador.GetInt32(12));
                                                                LabelDiasAusentismoBimestre.Text = Convert.ToString(readerTrabajador.GetInt32(13));
                                                                LabelDelegacTrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(36));
                                                                LabeSubdeleTrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(37));
                                                                LabelRegistroPatronalTrabjador.Text = readerTrabajador.GetString(38).Substring(1, 11);
                                                                LabelRegPatTraba.Text = readerTrabajador.GetString(38);
                                                                LabelFolioSUATrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(39));
                                                                LabelPeriodoPagoTrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(40));
                                                                LabelExcedenteObreraTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(27)));
                                                                LabelPDineroObreraTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(28)));
                                                                LabelPensionaObreraTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(29)));
                                                                LabelIyVObreraTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(30)));
                                                                LabelTotIMSSObreTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(27) + readerTrabajador.GetDecimal(28) + readerTrabajador.GetDecimal(29) + readerTrabajador.GetDecimal(30)));
                                                                LabelCyVObreraTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(31)));
                                                                LabelTotRCVObreTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(31)));
                                                                LabelCuotaFijaPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(14)));
                                                                LabelExcedentePatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(15) - readerTrabajador.GetDecimal(27)));
                                                                LabelPDineroPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(16) - readerTrabajador.GetDecimal(28)));
                                                                LabelPensionaPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(17) - readerTrabajador.GetDecimal(29)));
                                                                LabelRTrabajoPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(18)));
                                                                LabelIyVPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(19) - readerTrabajador.GetDecimal(30)));
                                                                LabelPSocialesPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(20)));
                                                                LabelActRecIMSSPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(21)));
                                                                LabelTotalIMSSPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(14) + (readerTrabajador.GetDecimal(15) - readerTrabajador.GetDecimal(27)) + (readerTrabajador.GetDecimal(16) - readerTrabajador.GetDecimal(28)) + (readerTrabajador.GetDecimal(17) - readerTrabajador.GetDecimal(29)) + readerTrabajador.GetDecimal(18) + (readerTrabajador.GetDecimal(19) - readerTrabajador.GetDecimal(30)) + readerTrabajador.GetDecimal(20) + readerTrabajador.GetDecimal(21)));
                                                                LabelRetiroPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(22)));
                                                                LabelActRecRetiroPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(23)));
                                                                LabelCyVPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(24)));
                                                                LabelActRecCyVPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(25)));
                                                                LabelTotalRCVPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(22) + readerTrabajador.GetDecimal(23) + readerTrabajador.GetDecimal(24) + readerTrabajador.GetDecimal(25)));
                                                                LabelCuotasFijasTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(14)));
                                                                LabelExcenteTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(15) + readerTrabajador.GetDecimal(27)));
                                                                LabelPDineroTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(16)));
                                                                LabelPensionadosTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(17)));
                                                                LabelRTrabajoTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(18)));
                                                                LabelIyVTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(19)));
                                                                LabelPSocialesTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(20)));
                                                                LabelActRecIMSSTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(21)));
                                                                LabelTotalIMSSTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(14) + (readerTrabajador.GetDecimal(15) + readerTrabajador.GetDecimal(27)) + readerTrabajador.GetDecimal(16) + readerTrabajador.GetDecimal(17) + readerTrabajador.GetDecimal(18) + readerTrabajador.GetDecimal(19) + readerTrabajador.GetDecimal(20) + readerTrabajador.GetDecimal(21)));
                                                                LabelRetiroTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(22)));
                                                                LabelActRecRetiroTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(23)));
                                                                LabelCyVTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(24)));
                                                                LabelActRecCyVTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(25)));
                                                                LabelAporVoluntariasTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(26)));
                                                                LabelTotalRCVTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(22) + readerTrabajador.GetDecimal(23) + readerTrabajador.GetDecimal(24) + readerTrabajador.GetDecimal(25) + readerTrabajador.GetDecimal(26)));
                                                                LabelImpTotInfonavitTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(33)));
                                                                LabelImpAporInfonavitTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(34)));
                                                                LabelImpAmorInfonavitTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDecimal(35)));
                                                            }
                                                            else if (Convert.ToInt32((Request.QueryString["anio"])) <= 2006)/*Bases de DAtos 2006 y anteriores*/
                                                            {
                                                                LabelNSS.Text = readerTrabajador.GetString(1).Substring(1, 11);
                                                                LabelRFCTrabahador.Text = readerTrabajador.GetString(2);
                                                                LabelNombreTrabjador.Text = readerTrabajador.GetString(4).Replace('$', ' ');
                                                                LabelNumMvtosPeriodo.Text = Convert.ToString(readerTrabajador.GetInt32(5));
                                                                LabelTipoTrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(6));
                                                                LabelJornadaSemReducida.Text = Convert.ToString(readerTrabajador.GetInt32(7));
                                                                Label1DiasCotizadosMes.Text = Convert.ToString(readerTrabajador.GetInt32(8));
                                                                LabelDiasIncapacidad.Text = Convert.ToString(readerTrabajador.GetInt32(9));
                                                                Label1DiasAusentismoMes.Text = Convert.ToString(readerTrabajador.GetInt32(10));
                                                                LabelDiasCotizadosBimestre.Text = Convert.ToString(readerTrabajador.GetInt32(11));
                                                                LabelDiasIncapacidadBimestre.Text = Convert.ToString(readerTrabajador.GetInt32(12));
                                                                LabelDiasAusentismoBimestre.Text = Convert.ToString(readerTrabajador.GetInt32(13));
                                                                LabelDelegacTrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(27));
                                                                LabeSubdeleTrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(28));
                                                                LabelRegistroPatronalTrabjador.Text = readerTrabajador.GetString(29).Substring(1, 11);
                                                                LabelRegPatTraba.Text = readerTrabajador.GetString(29);
                                                                LabelFolioSUATrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(30));
                                                                LabelPeriodoPagoTrabajador.Text = Convert.ToString(readerTrabajador.GetInt32(31));
                                                                LabelCuotaFijaPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(14)));
                                                                LabelExcedentePatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(15)));
                                                                LabelPDineroPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(16)));
                                                                LabelPensionaPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(17)));
                                                                LabelRTrabajoPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(18)));
                                                                LabelIyVPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(19)));
                                                                LabelPSocialesPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(20)));
                                                                LabelActRecIMSSPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(21)));
                                                                LabelTotalIMSSPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(14) + (readerTrabajador.GetDouble(15)) + (readerTrabajador.GetDouble(16)) + (readerTrabajador.GetDouble(17)) + readerTrabajador.GetDouble(18) + (readerTrabajador.GetDouble(19)) + readerTrabajador.GetDouble(20) + readerTrabajador.GetDouble(21)));
                                                                LabelRetiroPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(22)));
                                                                LabelActRecRetiroPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(23)));
                                                                LabelCyVPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(24)));
                                                                LabelActRecCyVPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(25)));
                                                                LabelTotalRCVPatTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(22) + readerTrabajador.GetDouble(23) + readerTrabajador.GetDouble(24) + readerTrabajador.GetDouble(25)));
                                                                LabelCuotasFijasTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(14)));
                                                                LabelExcenteTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(15)));
                                                                LabelPDineroTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(16)));
                                                                LabelPensionadosTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(17)));
                                                                LabelRTrabajoTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(18)));
                                                                LabelIyVTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(19)));
                                                                LabelPSocialesTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(20)));
                                                                LabelActRecIMSSTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(21)));
                                                                LabelTotalIMSSTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(14) + (readerTrabajador.GetDouble(15)) + readerTrabajador.GetDouble(16) + readerTrabajador.GetDouble(17) + readerTrabajador.GetDouble(18) + readerTrabajador.GetDouble(19) + readerTrabajador.GetDouble(20) + readerTrabajador.GetDouble(21)));
                                                                LabelRetiroTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(22)));
                                                                LabelActRecRetiroTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(23)));
                                                                LabelCyVTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(24)));
                                                                LabelActRecCyVTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(25)));
                                                                LabelAporVoluntariasTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(26)));
                                                                LabelTotalRCVTotTrab.Text = Convert.ToString(String.Format("{0:N2}", readerTrabajador.GetDouble(22) + readerTrabajador.GetDouble(23) + readerTrabajador.GetDouble(24) + readerTrabajador.GetDouble(25) + readerTrabajador.GetDouble(26)));
                                                               
                                                            }
                                                            try
                                                            {
                                                                string File_Aseg2 = "CDSUMO" + Request.QueryString["mes"] + Request.QueryString["anio"];
                                                                string queryTrabajador2 = "";
                                                                queryTrabajador2 = @"SELECT RCMS_CVE_UNIT,RCMS_NUM_AFIL,RCMS_TIP_MOV_INCI,RCMS_FEC_MOV_INCI,IIF(" + File_Aseg2 + ".RCMS_FOL_INCA IS NULL, '', RCMS_FOL_INCA) AS RCMS_FOL_INCA,RCMS_DIAS_INCIN,RCMS_SAL_DIA_INT" +
                                                                                      " FROM " + File_Aseg2 + " WHERE RCMS_CVE_UNIT= @CVE AND RCMS_NUM_AFIL = @NSS ORDER BY RCMS_FEC_MOV_INCI ASC";
                                                                OleDbCommand cmdTrabajador2 = new OleDbCommand(queryTrabajador2, connection_SUA);

                                                                cmdTrabajador2.Parameters.Add(new OleDbParameter("@CVE", readerTrabajador.GetString(0)));
                                                                cmdTrabajador2.Parameters.Add(new OleDbParameter("@NSS", Request.QueryString["reg"]));
                                                                readerTrabajador2 = cmdTrabajador2.ExecuteReader();
                                                            }
                                                            catch (Exception H)
                                                            {
                                                                LabelMensaje.Text = H.Message;
                                                            }
                                                            
                                                        }
                                                
                                        %>
                                            
                                            <div class="row">
                                                <!--work collections start-->
                                                  <h4 class="header">Consulta de Trabajadores</h4>
                                                  <div id="work-collectionsTra" class="seaction">
                                                  <asp:Label ID="LabelErrorTrabajador" runat="server" Text=""></asp:Label>
                                                  <div class="row">                                                      
                                                      <div class="col s12 m12 l12">
                                                          <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-communication-business circle cyan"></i>
                                                                <span class="title">Registro Patronal</span>
                                                                <p>                                                                    
                                                                    <a href="Default.aspx?type=PA&mes=<%Response.Write(Request.QueryString["mes"]);%>&anio=<%Response.Write(Convert.ToInt32((Request.QueryString["anio"])));%>&sub=<%Response.Write(Request.QueryString["sub"]);%>&reg=<% Response.Write(LabelRegPatTraba.Text); %>&del=<%=ConfigurationManager.AppSettings.Get("Delegacion")%>&FolSUA=<% Response.Write(LabelFolioSUATrabajador.Text); %>">
                                                                        <asp:Label ID="LabelRegistroPatronalTrabjador" Font-Size="Large" runat="server" Text=""></asp:Label>
                                                                        <asp:Label ID="LabelRegPatTraba" Font-Size="Large" runat="server" Text="" Visible="false"></asp:Label>
                                                                    </a>          
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-maps-local-library circle cyan"></i>
                                                                <span class="title">Número de Seguridad Social</span>
                                                                <p><asp:Label ID="LabelNSS" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-image-timer-auto circle cyan"></i>
                                                                <span class="title">Nombre</span>
                                                                <p><asp:Label ID="LabelNombreTrabjador" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                            </ul>
                                                          </div>


                                                          <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-social-people-outline circle cyan"></i>
                                                                <span class="title">No. de Folio SUA</span>
                                                                <p><asp:Label ID="LabelFolioSUATrabajador" Font-Size="Large" runat="server" Text=""></asp:Label>                      
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-editor-insert-invitation circle cyan"></i>
                                                                <span class="title">Periodo de Pago</span>
                                                                <p><asp:Label ID="LabelPeriodoPagoTrabajador" Font-Size="Large" runat="server" Text=""></asp:Label>             
                                                                </p>                    
                                                              </li>                                                            
                                                            </ul>
                                                          </div>

                                                          <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-social-location-city circle cyan"></i>
                                                                <span class="title">Delegación</span>
                                                                <p><asp:Label ID="LabelDelegacTrabajador" Font-Size="Large" runat="server" Text=""></asp:Label>                     
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-maps-store-mall-directory circle cyan"></i>
                                                                <span class="title">Subdelegación</span>
                                                                <p><asp:Label ID="LabeSubdeleTrabajador" Font-Size="Large" runat="server" Text=""></asp:Label>               
                                                                </p>                    
                                                              </li>
                                                            </ul>
                                                          </div>
                                                  </div>
                                                  </div>
                                            </div>
                                            
                                                
                                            <!--Preselecting a tab-->
                                              <div id="preselecting-tab" class="section">
                                                <div class="row">
                                                  <div class="col s12 m12 l12">
                                                    <div class="row">
                                                      <div class="col s12">
                                                        <ul class="tabs tab-demo-active z-depth-5 cyan">
                                                          <li class="tab col s3"><a class="white-text waves-effect waves-light active" href="#datos">Datos Principales</a>
                                                          </li>
                                                          <li class="tab col s3"><a class="white-text waves-effect waves-light" href="#movimientos">Movimientos</a>
                                                          </li>
                                                        </ul>
                                                      </div>
                                                        
                                                      <div class="col s12">
                                                        <div id="datos" class="col s12  cyan lighten-5">
                                                            <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-image-filter-2 circle cyan"></i>
                                                                <span class="title">R.F.C.</span>
                                                                <p>
                                                                    <asp:Label ID="LabelRFCTrabahador" Font-Size="Large" runat="server" Text=""></asp:Label>                
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-av-shuffle circle cyan"></i>
                                                                <span class="title">Num. Mvtos. Periodo</span>
                                                                <p><asp:Label ID="LabelNumMvtosPeriodo" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-maps-local-mall circle cyan"></i>
                                                                <span class="title">Jornada / Sem. Reducida</span>
                                                                <p><asp:Label ID="LabelJornadaSemReducida" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-image-brightness-4 circle cyan"></i>
                                                                <span class="title">Días Cotizados Més</span>
                                                                <p><asp:Label ID="Label1DiasCotizadosMes" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                            </ul>
                                                          </div>
                                                          

                                                          <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-maps-local-pharmacy circle cyan"></i>
                                                                <span class="title">Días Incapacidad Més</span>
                                                                <p>
                                                                    <asp:Label ID="LabelDiasIncapacidad" Font-Size="Large" runat="server" Text=""></asp:Label>                
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-action-work  circle cyan"></i>
                                                                <span class="title">Tipo de Trabajador</span>
                                                                <p><asp:Label ID="LabelTipoTrabajador" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-editor-insert-invitation circle cyan"></i>
                                                                <span class="title">Días de Ausentismo Més</span>
                                                                <p><asp:Label ID="Label1DiasAusentismoMes" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                            </ul>
                                                          </div>

                                                          <div class="col s12 m12 l4">
                                                            <ul class="collection">
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-editor-insert-invitation circle cyan"></i>
                                                                <span class="title">Días Cotizados Bimestre</span>
                                                                <p>
                                                                    <asp:Label ID="LabelDiasCotizadosBimestre" Font-Size="Large" runat="server" Text=""></asp:Label>                
                                                                </p>
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-editor-insert-invitation circle cyan"></i>
                                                                <span class="title">Días Incapacidad Bimestre</span>
                                                                <p><asp:Label ID="LabelDiasIncapacidadBimestre" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                              <li class="collection-item avatar">
                                                                <i class="mdi-editor-insert-invitation circle cyan"></i>
                                                                <span class="title">Días Ausentismo Bimestre</span>
                                                                <p><asp:Label ID="LabelDiasAusentismoBimestre" Font-Size="Large" runat="server" Text=""></asp:Label>                 
                                                                </p>                    
                                                              </li>
                                                            </ul>
                                                          </div>
                                                          

                                                        </div>
                                                        <div id="movimientos" class="col s12  cyan lighten-5">
                                                           <table class="hoverable col l8">
                                                        <h4 class="header"></h4>
                                                        <thead>
                                                            <tr>
                                                                <th>N°</th>
                                                                <th>Fecha Movimiento</th>
                                                                <th>Tipo</th>
                                                                <th>Folio</th>
                                                                <th>Dias Incidencia</th>
                                                                <th>Salario Diario</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                           if (readerTrabajador2.HasRows)
                                                        {                                                            
                                                            int num = 1;
                                                            while(readerTrabajador2.Read())
                                                            {
                                                            %><tr>
                                                                <td> <% Response.Write(num); %>  </td>
                                                                <td> <% Response.Write(String.Format("{0:dd/MM/yyyy}",readerTrabajador2.GetDateTime(3))); %></td>
                                                                <td> <% Response.Write(Convert.ToString(readerTrabajador2.GetInt32(2))); %>  </td>
                                                                <td> <% Response.Write(readerTrabajador2.GetString(4)); %> </td>
                                                                <td> <% Response.Write(Convert.ToString(readerTrabajador2.GetInt32(5))); %>  </td>
                                                                <td style="text-align: right;"> <% if (Convert.ToInt32((Request.QueryString["anio"])) > 2006)/*Bases de DAtos 2006 a actualidad*/
                                                                                                   {
                                                                                                       Response.Write(Convert.ToString(String.Format("{0:N2}", readerTrabajador2.GetDecimal(6))));
                                                                                                   }
                                                                                                   else if (Convert.ToInt32((Request.QueryString["anio"])) <= 2006)/*Bases de DAtos 2006 y anteriores*/
                                                                                                   {
                                                                                                       Response.Write(Convert.ToString(String.Format("{0:N2}", readerTrabajador2.GetDouble(6))));
                                                                                                   } %> </td>
                                                            </tr>
                                                        <%
                                                                        num++;
                                                            }
                                                          } %>    
                                                        </tbody>
                                                    </table>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                                </div>
                                              </div>
                                                
                                                
                                                
                                              <!--Preselecting a tab-->
                                              <div id="preselecting-tab9" class="section">
                                                <div class="row">
                                                  <div class="col s12 m12 l12">
                                                    <div class="row">
                                                      <div class="col s12">
                                                        <ul class="tabs tab-demo-active z-depth-5 cyan">
                                                          <li class="tab col s3"><a class="white-text waves-effect waves-light active" href="#obrera">Obrera</a>
                                                          </li>
                                                          <li class="tab col s3"><a class="white-text waves-effect waves-light" href="#patronal">Patronal</a>
                                                          </li>
                                                           <li class="tab col s3"><a class="white-text waves-effect waves-light" href="#total">Total</a>
                                                          </li>
                                                        </ul>
                                                      </div>
                                                        
                                                      <div class="col s12">
                                                        <div id="obrera" class="col s12  cyan lighten-5">
                                                            <div class="col s12 m12 l6">
                                                               <table class="hoverable">
                                                                  <h4 class="header">Pagos</h4>
                                                                <thead>
                                                                </thead>
                                                                <tbody>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Excedente</span></td>
                                                                    <td><h5><asp:Label ID="LabelExcedenteObreraTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                    
                                                                  </tr>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">P. Dinero</span></td>
                                                                    <td><h5><asp:Label ID="LabelPDineroObreraTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td> 
                                                                    <td></td> 
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">C. y V.</span></td>                                                
                                                                    <td><h5><asp:Label ID="LabelCyVObreraTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>  
                                                                  </tr>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Pensionados</span></td>
                                                                    <td><h5><asp:Label ID="LabelPensionaObreraTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                                  </tr>  
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">I. y V.</span></td>
                                                                    <td><h5><asp:Label ID="LabelIyVObreraTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Total R.C.V.</span></td>    
                                                                    <td><h5><asp:Label ID="LabelTotRCVObreTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                
                                                                  </tr>  
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Total I.M.S.S.</span></td>
                                                                    <td><h5><asp:Label ID="LabelTotIMSSObreTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                                  </tr>                                                                          
                                                                </tbody>
                                                              </table>
                                                          </div>
                                                        </div>
                                                        <div id="patronal" class="col s12  cyan lighten-5">
                                                             <div class="col s12 m12 l8">
                                                                 <table class="hoverable">
                                                                  <h4 class="header">Pagos</h4>
                                                                <thead>
                                                                </thead>
                                                                <tbody>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Cuota Fija</span></td>
                                                                    <td><h5><asp:Label ID="LabelCuotaFijaPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                      <td></td>
                                                                     <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Retiro</span></td>       
                                                                    <td><h5><asp:Label ID="LabelRetiroPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                
                                                                  </tr>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Excedente</span></td>
                                                                    <td><h5><asp:Label ID="LabelExcedentePatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td> 
                                                                      <td></td> 
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Act. y Rec. Retiro</span></td>      
                                                                    <td><h5><asp:Label ID="LabelActRecRetiroPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                            
                                                                  </tr>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">P. Dinero</span></td>
                                                                    <td><h5><asp:Label ID="LabelPDineroPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                     <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">C. y V.</span></td>  
                                                                    <td><h5><asp:Label ID="LabelCyVPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                   
                                                                  </tr>  
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Pensionados</span></td>
                                                                    <td><h5><asp:Label ID="LabelPensionaPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Act. y Rec. C. y V.</span></td>
                                                                    <td><h5><asp:Label ID="LabelActRecCyVPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                 
                                                                  </tr>  
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">R. Trabajo</span></td>
                                                                    <td><h5><asp:Label ID="LabelRTrabajoPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                                  </tr>   
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">I. y V.</span></td>
                                                                    <td><h5><asp:Label ID="LabelIyVPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                      <td></td>
                                                                     <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Total R.C.V.</span></td>                                                   
                                                                     <td><h5><asp:Label ID="LabelTotalRCVPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>  
                                                                  </tr>   
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">P. Sociales</span></td>
                                                                    <td><h5><asp:Label ID="LabelPSocialesPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                                  </tr>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Act. y Rec. I.M.S.S.</span></td>
                                                                    <td><h5><asp:Label ID="LabelActRecIMSSPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                                  </tr>                                                                         
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Total I.M.S.S.</span></td>
                                                                    <td><h5><asp:Label ID="LabelTotalIMSSPatTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                                  </tr>       
                                                                </tbody>
                                                              </table>
                                                             </div>                                               
                                                        </div>
                                                        <div id="total" class="col s12  cyan lighten-5">
                                                             <div class="col s12 m12 l8">
                                                                 <table class="hoverable">
                                                                  <h4 class="header">Pagos</h4>
                                                                <thead>
                                                                </thead>
                                                                <tbody>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Cuota Fija</span></td>
                                                                    <td><h5><asp:Label ID="LabelCuotasFijasTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                     <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Retiro</span></td>
                                                                     <td><h5><asp:Label ID="LabelRetiroTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                       
                                                                  </tr>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Excedente</span></td>
                                                                    <td><h5><asp:Label ID="LabelExcenteTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>  
                                                                    <td></td>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Act. y Rec. Retiro</span></td>    
                                                                    <td><h5><asp:Label ID="LabelActRecRetiroTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                              
                                                                  </tr>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">P. Dinero</span></td>
                                                                    <td><h5><asp:Label ID="LabelPDineroTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                     <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">C. y V.</span></td>   
                                                                     <td><h5><asp:Label ID="LabelCyVTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                                  </tr>  
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Pensionados</span></td>
                                                                    <td><h5><asp:Label ID="LabelPensionadosTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Act. y Rec. C. y V.</span></td>   
                                                                    <td><h5><asp:Label ID="LabelActRecCyVTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                 
                                                                  </tr>  
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">R. Trabajo</span></td>
                                                                    <td><h5><asp:Label ID="LabelRTrabajoTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Apor. Voluntarias</span></td>  
                                                                    <td><h5><asp:Label ID="LabelAporVoluntariasTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                       
                                                                  </tr>   
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">I. y V.</span></td>
                                                                    <td><h5><asp:Label ID="LabelIyVTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                     <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Total R.C.V.</span></td>     
                                                                     <td><h5><asp:Label ID="LabelTotalRCVTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                
                                                                  </tr>   
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">P. Sociales</span></td>
                                                                    <td><h5><asp:Label ID="LabelPSocialesTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Imp. Tot. INFONAVIT</span></td>       
                                                                    <td><h5><asp:Label ID="LabelImpTotInfonavitTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                  
                                                                  </tr>
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Act. y Rec. I.M.S.S.</span></td>
                                                                    <td><h5><asp:Label ID="LabelActRecIMSSTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>
                                                                    <td></td>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Imp. Apor. INFONAVIT</span></td>   
                                                                    <td><h5><asp:Label ID="LabelImpAporInfonavitTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                                      
                                                                  </tr>                                                                         
                                                                  <tr>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Total I.M.S.S.</span></td>
                                                                    <td><h5><asp:Label ID="LabelTotalIMSSTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>       
                                                                    <td></td>
                                                                    <td><i class="mdi-editor-attach-money small circle cyan"></i>
                                                                                <span class="title" style="font-size:18px;">Imp. Amor. INFONAVIT</span></td>   
                                                                    <td><h5><asp:Label ID="LabelImpAmorInfonavitTotTrab" runat="server" CssClass="right" Text=""></asp:Label></h5></td>                                               
                                                                  </tr>       
                                                                </tbody>
                                                              </table>
                                                             </div>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                                </div>
                                              </div>                                              
                                        <%
                                        }
                                                }
                                                catch (Exception d)
                                                {
                                                    LabelRFCTrabahador.Text = d.Message;
                                                }
                                                          
                                            }
                                            else
                                            {
                                                %>
                                                      <div id="card-alert" class="card red">
                            <div class="card-content white-text">
                                <p><i class="mdi-alert-error"></i> Alerta : No se Encontro el Registro <%Response.Write(Request.QueryString["reg"].Substring(1,11)); %></p>
                            </div>
                            <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                                                <%
                                            }
                                         }
                                         catch(Exception d)
                                         {
                                            LabelErrorTrabajador.Text = d.Message;
                                         }
                                    }                                       
                                }
                                else
                                {
                                     %>
                                                      <div id="card-alert" class="card red">
                            <div class="card-content white-text">
                                <p><i class="mdi-alert-error"></i> Alerta : La Base de Datos <% Response.Write(ruta_SUA); %>  NO Existe</p>
                            </div>
                            <button type="button" class="close white-text" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                                                <%
                                }
                   
                        
                    %>
                  



                   
                </div>
            </div>
        </div>        
     
        

    
        <%} %>
     
  
        </div>
</asp:Content> 
 

