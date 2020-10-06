using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Collections;
using System.ComponentModel;
using System.IO;
using System.Windows.Forms;
using System.Net;

public partial class Admin_Base_Personalisada : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "1")
        {
            carga_1.Visible = true;
            eliminar_2.Visible = false;
        }
        else if (RadioButtonList1.SelectedValue == "0")
        {
            carga_1.Visible = false;
            eliminar_2.Visible = true;
        }
        if (!IsPostBack)
        {
            DropDownList1.AppendDataBoundItems = true;
            String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
            String strQuery = "SELECT [Nombr] AS DESCRIP, [Nombr] AS VALUE FROM [Supervision].[dbo].[Ral_Comb_Per]";
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;
            try
            {
                con.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "DESCRIP";
                DropDownList1.DataValueField = "VALUE";
                DropDownList1.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
    }
    protected void Carga_Bas_Per_Click(object sender, EventArgs e)
    {
        if (tipo_base != null)
        {
            if (FileUpload1.PostedFile.ContentType == "application/vnd.ms-excel" || FileUpload1.PostedFile.ContentType == "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            {
                try
                {
                    string fileName = Path.Combine(Server.MapPath("~/Admin/ImportDocument/") + FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(fileName);
                    string conString = "";
                    string ext = Path.GetExtension(FileUpload1.PostedFile.FileName);
                    OleDbConnection origen = default(OleDbConnection);
                    origen = new OleDbConnection(conString);
                    if (ext.ToLower() == ".xls")
                    {
                        conString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + fileName + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\""; ;
                    }
                    else if (ext.ToLower() == ".xlsx")
                    {
                        conString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileName + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
                    }
                    System.Threading.Thread.Sleep(10000);
                    if (Cargar_tmp("VACIAR") == 0)
                    {
                        if (Cargar(conString, tipo_base.Text) == 1)
                        {
                            System.IO.File.Delete(fileName);
                            //Literal2.Text = "Se ha Cargado Correctamente la Base de Datos con el Nombre " + tipo_base.Text;
                            tipo_base.Text = "";
                            Response.AppendHeader("Refresh", 4.5 + "; URL=Pers.aspx");
                        }
                        else
                        {
                            //Literal2.Text = "Ya hay Información o Ya Existe una Base de Datos con el Mismo Nombre";
                        }
                    }
                    else
                    {
                        //Literal2.Text = "Error al Intentar subir la Base de Datos Intente de Nuevo por Favor";
                    }
                }
                catch (System.Exception d)
                {
                    //Literal2.Text = "Error reading from {0}. Message = {1}" + d.Message;
                }
            }
            else
            {
                //Literal2.Text = "Especifica o selecciona un archivo Excel por favor";
            }
        }
        else
        {
            //Literal2.Text = "Especifica un nombre por favor";
        }
    }
    public Int32 Cargar(string cadena, string Nom_base)
    {
        string conexi = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection conexion_destino = new SqlConnection(conexi);
        OleDbConnection origen = default(OleDbConnection);
        origen = new OleDbConnection(cadena);
        OleDbCommand seleccionNa = default(OleDbCommand);
        seleccionNa = new OleDbCommand("SELECT * FROM [Bas_Perso$]", origen);
        OleDbDataAdapter adaptadorNa = new OleDbDataAdapter();
        adaptadorNa.SelectCommand = seleccionNa;
        DataSet ds1 = new DataSet();
        adaptadorNa.Fill(ds1);
        origen.Close();
        conexion_destino.Open();
        SqlBulkCopy importarNa = default(SqlBulkCopy);
        importarNa = new SqlBulkCopy(conexion_destino);
        importarNa.DestinationTableName = "Rale_Per_tmp";
        importarNa.WriteToServer(ds1.Tables[0]);//Carga de hojas
        Cargar_tmp("CARGA_RALE_PERS");
        SqlParameter res;
        SqlCommand Query1 = new SqlCommand("CREAR_TABLAS_PERS", conexion_destino);
        Query1.CommandType = CommandType.StoredProcedure;
        Query1.Parameters.Add("@BASE", SqlDbType.NVarChar, 20);
        Query1.Parameters["@BASE"].Value = Nom_base;
        res = new SqlParameter("RETURN_VALUE", SqlDbType.Int);
        res.Direction = ParameterDirection.ReturnValue;
        Query1.Parameters.Add(res);
        Query1.ExecuteNonQuery();
        conexion_destino.Close();
        Int32 valor = Convert.ToInt32(res.Value);
        return valor;
    }
    public Int32 Cargar_tmp(string NomPro)
    {
        string con = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection conexion = new SqlConnection(con);
        conexion.Open();
        SqlParameter resul;
        SqlCommand delete = new SqlCommand(NomPro, conexion);
        delete.CommandType = CommandType.StoredProcedure;
        resul = new SqlParameter("RETURN_VALUE", SqlDbType.Int);
        resul.Direction = ParameterDirection.ReturnValue;
        delete.Parameters.Add(resul);
        delete.ExecuteNonQuery();
        conexion.Close();
        Int32 valor = Convert.ToInt32(resul.Value);
        return valor;
    }

    public Int32 verificar(string verifi, string nom)
    {
        string conn = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection conexi = new SqlConnection(conn);
        conexi.Open();
        SqlParameter contar;
        SqlCommand consulta = new SqlCommand(nom, conexi);
        consulta.CommandType = CommandType.StoredProcedure;
        consulta.Parameters.Add("@NOMBR", SqlDbType.NVarChar, 30);
        consulta.Parameters["@NOMBR"].Value = verifi;
        contar = new SqlParameter("RETURN_VALUE", SqlDbType.Int);
        contar.Direction = ParameterDirection.ReturnValue;
        consulta.Parameters.Add(contar);
        consulta.ExecuteNonQuery();
        conexi.Close();
        Int32 valor = Convert.ToInt32(contar.Value);
        return valor;
    }

    protected void Eliminar_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue != "")
        {
            if (verificar(DropDownList1.SelectedValue, "ELIMINAR_BD") == 0)
            {
                //Literal5.Text = "La Base de Datos Seleccionada ah sido Eliminada";
                Response.AppendHeader("Refresh", 4.5 + "; URL=Pers.aspx");
            }
            else
            {
                //Literal5.Text = "No Existe la Base de Datos";
            }
        }
        else
        {
            //Literal5.Text = "Selecciona Una Base por Favor";
        }
    }
}