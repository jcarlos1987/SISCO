using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ionic.Zip;
using System.IO;
using System.Data.OleDb;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_Carga_Rale : System.Web.UI.Page
{
    string BD_DEL = "";
    string BD_SUB = "";
    string NOM_RALE = "";
    string BD_FECHA = "";
    string BD_TIPOECO = "";
    string BD_PROPIOS = "";
    string PRO = "";
    string FECHA = "";
    Int32 REGISTROS;
    String strConnString = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Cargar_Click(object sender, EventArgs e)
    {
        SqlConnection conexi = new SqlConnection(strConnString);
        conexi.Open();
        SqlCommand consulta = new SqlCommand("ELIMINAR_REG", conexi);
        consulta.CommandType = CommandType.StoredProcedure;
        consulta.ExecuteNonQuery();
        conexi.Close();

        string ruta = "";
        if (FileUpload1.FileName.Replace(" ", "").Equals(""))
        {
            LabelMensaje.Visible = true;
            LabelMensaje.Text = @"<div id='card-alert' class='card red'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta :Seleccione un Rale por Favor </p>" +
                                    @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
        }
        else
        {
            string fecha = String.Format("{0: dd/MM/yyyy}", DateTime.Now);
            ruta = Server.MapPath("~") + "/temp/" + fecha.Replace("/", "_") + FileUpload1.FileName;
            if (System.IO.File.Exists(ruta))
            {
                LabelMensaje.Visible = true;
                LabelMensaje.Text = @"<div id='card-alert' class='card green'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta : RALE " +  FileUpload1.FileName  + " Cargado </p>" +
                                        @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";
            }
            else
            {
                string nombreRale = "";
                FileUpload1.SaveAs(ruta);
                using (ZipFile zip = ZipFile.Read(ruta))
                {
                    zip.StatusMessageTextWriter = System.Console.Out;
                    zip.ExtractAll(ruta.Replace(".zip", ""));
                    zip.Dispose();
                }
                //System.IO.File.Delete(ruta);
                string[] frale = Directory.GetFiles(ruta.Replace(".zip", ""));
                for (Int32 i = 0; i <= (frale.Length - 1); i++)
                {
                    ruta = frale.GetValue(i).ToString();
                }

                System.IO.StreamReader fd = System.IO.File.OpenText(ruta);
                System.IO.StreamWriter ArchivoSalida = new System.IO.StreamWriter(ruta + ".txt");
                string fila = "";
                Int32 indice = 1;
                fila = fd.ReadLine();
                if (indice == 1)
                {
                    PRO = GetPropios(fila);
                }
                while (fd.Peek() > -1)
                {
                    indice += 1;
                    fila = fd.ReadLine();
                    if (indice == 3)
                    {
                        nombreRale = fila.Trim().Replace("COBR", "");
                        BD_DEL = nombreRale.Substring(0, 2);
                        BD_SUB = nombreRale.Substring(2);
                    }
                    else if (indice == 4)
                    {
                        NOM_RALE = nombreRale + getNombreRale(fila);
                    }
                    else
                    {
                        if (fila.Split('/').Length >= 5)
                        {
                            fila = fila.Insert(21, ";");
                            fila = fila.Insert(24, ";");
                            fila = fila.Insert(36, ";");
                            fila = fila.Insert(41, ";");
                            fila = fila.Insert(54, ";");
                            fila = fila.Insert(57, ";");
                            fila = fila.Insert(68, ";");
                            fila = fila.Insert(72, ";");
                            fila = fila.Insert(86, ";");
                            fila = fila.Insert(98, ";");
                            fila = fila.Insert(101, ";");
                            fila = fila.Insert(105, ";");
                            fila = fila.Insert(118, ";");
                            fila = fila.Insert(125, ";");
                            fila = fila.Insert(141, ";");
                            fila = fila.Insert(145, ";");
                            /*fila = fila.Insert(148, ";");
                            fila = fila.Insert(150, ";");*/

                            fila = fila.Replace(",", "");
                            ArchivoSalida.WriteLine(fila.Replace(" ", "").Replace("0//", ""));
                        }
                    }
                }
                ArchivoSalida.Close();
                fd.Close();
                LabelMensaje.Visible = true;
                LabelMensaje.Text = @"<div id='card-alert' class='card green'>
                                    <div class='card-content white-text'>
                                      <p><i class='mdi-alert-error'></i> Alerta :  " + archivoFiltrado(ruta + ".txt") + "  </p>" +
                                        @"</div>
                                    <button type='button' class='close white-text' data-dismiss='alert' aria-label='Close'>
                                      <span aria-hidden='true'>×</span>
                                    </button>
                                  </div>";

            }
            GridView2.Visible = true;
            GridView1.DataBind();
            GridView2.DataBind();
            System.IO.File.Delete(ruta);
            //System.IO.File.Delete(Server.MapPath("~") + "/temp/");
        }        
    }

    private string GetPropios(string fila)
    {
        /*********Propios*******/
        if ((fila.IndexOf("EEAMX14A") == 8))
        {
            BD_PROPIOS = "P";
        }
        else if ((fila.IndexOf("EEAMX14B") == 8))
        {
            BD_PROPIOS = "NP";
        }
        else if ((fila.IndexOf("EEBMX14A") == 8))
        {
            BD_PROPIOS = "P";
        }
        else if ((fila.IndexOf("EEBMX14B") == 8))
        {
            BD_PROPIOS = "NP";
        }
        /**/
        return BD_PROPIOS;
    }
    private string getNombreRale(string fila)
    {
        if ((fila.IndexOf("R.C.V.") == -1))
        {
            BD_TIPOECO = "COP";
        }
        else
        {
            BD_TIPOECO = "RCV";
        }
        BD_FECHA = Convert.ToString(fila.TrimEnd().Split(' ').GetValue((fila.TrimEnd().Split(' ').Length - 1)));
        FECHA = Convert.ToString(fila.TrimEnd().Split(' ').GetValue((fila.TrimEnd().Split(' ').Length - 1)));
        string[] fecha = BD_FECHA.Split('/');
        string fechaAux = fecha[0] + fecha[1] + fecha[2].Substring(2);
        if (fechaAux.Length < 6)
        {
            fechaAux = "0" + fechaAux;
        }
        return (BD_PROPIOS + (BD_TIPOECO));
    }


    private string archivoFiltrado(string ruta)
    {
        System.IO.StreamReader fs = System.IO.File.OpenText(ruta);
        string rutaRaleFinal = Server.MapPath("~") + "\\temp\\" + NOM_RALE + ".csv";
        System.IO.StreamWriter archivoSalida = new System.IO.StreamWriter(rutaRaleFinal);
        string fila = "";
        string[] fila1 = { };
        string[] fila2 = { };
        if (fs.Peek() > -1)
        {
            fila1 = fs.ReadLine().Split(';');
            while (true)
            {
                fila = "";
                if (fs.Peek() > -1)
                {
                    //lee la siguiente linea
                    fila2 = fs.ReadLine().Split(';');
                    //compara la fila1 con la fila2 y lo autoacompleta
                    for (Int32 i = 0; i <= (fila1.Length - 1); i++)
                    {
                        if (fila2.GetValue(i).Equals("") & i < 4)
                        {
                            fila2[i] = Convert.ToString(fila1.GetValue(i));
                        }
                    }
                    //impresion de la fila
                    // string periodo = "";
                    for (Int32 i = 0; i <= (fila1.Length - 1); i++)
                    {
                        if (i != 6)
                        {
                            fila += fila1.GetValue(i) + ";";
                        }
                    }
                    archivoSalida.WriteLine(fila + ";01/" + fila1.GetValue(6).ToString().Replace("13/", "12/") + ";" + BD_TIPOECO + ";" + PRO + ";" + FECHA + ";" + BD_SUB);
                    fila1 = fila2;
                }
                else
                {
                    //escribiendo la ultima linea
                    //string periodo = "";
                    for (Int32 i = 0; i <= (fila1.Length - 1); i++)
                    {
                        if (i != 6)
                        {
                            fila += fila1.GetValue(i) + ";";
                        }
                    }
                    archivoSalida.WriteLine(fila + ";01/" + fila1.GetValue(6).ToString().Replace("13/", "12/") + ";" + BD_TIPOECO + ";" + PRO + ";" + FECHA + ";" + BD_SUB);
                    //termina el ciclo while
                    break; // TODO: might not be correct. Was : Exit While                  
                }
            }
        }
        archivoSalida.Close();
        fs.Close();
        System.IO.File.Delete(ruta);
        string estado = "";

        try
        {
            SqlConnection nwindConn = new SqlConnection(strConnString);
            SqlCommand catCMD = nwindConn.CreateCommand();

            /*OleDbConnection nwindConn = new OleDbConnection(strConnString);
            OleDbCommand catCMD = nwindConn.CreateCommand();*/
            if (BD_TIPOECO == "COP")
            {
                string textConmand = ("BULK INSERT [Supervision].[dbo].[Rale_COP] ");
                textConmand = (textConmand + ("FROM \'" + (rutaRaleFinal + "\' ")));
                textConmand += "WITH( ";
                textConmand += "FIELDTERMINATOR=\';\', ";
                textConmand += "ROWTERMINATOR=\'\\n\', ";
                textConmand += "FIRE_TRIGGERS ";
                textConmand += ")";
                catCMD.CommandText = textConmand;
            }
            else if (BD_TIPOECO == "RCV")
            {
                string textConmand = ("BULK INSERT [Supervision].[dbo].[Rale_RCV] ");
                textConmand = (textConmand + ("FROM \'" + (rutaRaleFinal + "\' ")));
                textConmand += "WITH( ";
                textConmand += "FIELDTERMINATOR=\';\', ";
                textConmand += "ROWTERMINATOR=\'\\n\', ";
                textConmand += "FIRE_TRIGGERS ";
                textConmand += ")";
                catCMD.CommandText = textConmand;
            }
            nwindConn.Open();

            if ((catCMD.ExecuteNonQuery() <= 0))
            {
                estado = "Problemas con la actualizacion";
            }
            else
            {
                if (BD_TIPOECO == "COP")
                {
                    /**/
                    string strCon = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                    string strSql = "SELECT Count([REGPATR]) FROM [Supervision].[dbo].[Rale_COP] ";
                    SqlConnection con = new SqlConnection(strCon);
                    SqlCommand cmd = new SqlCommand(strSql, con);
                    con.Open();
                    REGISTROS = (int)cmd.ExecuteScalar();
                    con.Close();
                    /**/
                }
                else if (BD_TIPOECO == "RCV")
                {
                    /**/
                    string strCon = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
                    string strSql = "SELECT Count([REGPATR]) FROM [Supervision].[dbo].[Rale_RCV] ";
                    SqlConnection con = new SqlConnection(strCon);
                    SqlCommand cmd = new SqlCommand(strSql, con);
                    con.Open();
                    REGISTROS = (int)cmd.ExecuteScalar();
                    con.Close();
                    /**/
                }
                //Procedimiento Almacenado
                int subir = verificar(BD_TIPOECO, FECHA, BD_SUB, PRO);
                if (subir == 0)
                {
                    Cargar_Rale(BD_TIPOECO, FECHA, BD_SUB);
                    agrgarTablaRales();
                    estado = "Se Cargo el RALE " + BD_TIPOECO + " con Fecha del " + FECHA + ". Con un total de : " + REGISTROS + " Registros.";
                }
                else
                {
                    estado = "El RALE " + BD_TIPOECO + " con Fecha del " + FECHA + " ya se encuentra cargado.";
                }
                //
                //actualizarTabActRecRale();
            }
            nwindConn.Close();
            System.IO.File.Delete(rutaRaleFinal);
        }
        catch (Exception e)
        {
            estado = "El RALE " + BD_TIPOECO + " " + PRO + " con Fecha del " + FECHA + " ya se encuentra cargado. " + e.Message;
        }
        return estado;
    }

    public Int32 verificar(string tipo, string nombre, string sub, string p)
    {
        string conexi12 = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection conexi = new SqlConnection(conexi12);
        conexi.Open();
        SqlParameter contar;
        SqlCommand consulta = new SqlCommand("VERIFICAR_RALE", conexi);
        consulta.CommandType = CommandType.StoredProcedure;
        consulta.Parameters.Add("@TIPO", SqlDbType.NVarChar, 30);
        consulta.Parameters["@TIPO"].Value = tipo;
        consulta.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 30);
        consulta.Parameters["@NOMBRE"].Value = nombre;
        consulta.Parameters.Add("@SUB", SqlDbType.NVarChar, 30);
        consulta.Parameters["@SUB"].Value = sub;
        consulta.Parameters.Add("@P_NP", SqlDbType.NVarChar, 30);
        consulta.Parameters["@P_NP"].Value = p;

        contar = new SqlParameter("RETURN_VALUE", SqlDbType.Int);
        contar.Direction = ParameterDirection.ReturnValue;
        consulta.Parameters.Add(contar);
        consulta.ExecuteNonQuery();
        conexi.Close();
        Int32 valor = Convert.ToInt32(contar.Value);
        return valor;
    }


    public Int32 Cargar_Rale(string tipo, string nombre, string sub)
    {
        string conexi12 = ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString;
        SqlConnection conexi = new SqlConnection(conexi12);
        conexi.Open();
        SqlParameter contar;
        SqlCommand consulta = new SqlCommand("CARGAR_RALE", conexi);
        consulta.CommandType = CommandType.StoredProcedure;
        consulta.Parameters.Add("@TIPO", SqlDbType.NVarChar, 30);
        consulta.Parameters["@TIPO"].Value = tipo;
        consulta.Parameters.Add("@NOMBRE", SqlDbType.NVarChar, 30);
        consulta.Parameters["@NOMBRE"].Value = nombre;
        consulta.Parameters.Add("@SUB", SqlDbType.NVarChar, 30);
        consulta.Parameters["@SUB"].Value = sub;

        contar = new SqlParameter("RETURN_VALUE", SqlDbType.Int);
        contar.Direction = ParameterDirection.ReturnValue;
        consulta.Parameters.Add(contar);
        consulta.ExecuteNonQuery();
        conexi.Close();
        Int32 valor = Convert.ToInt32(contar.Value);
        return valor;
    }


    /*private string subirAlServidor(string ruta, string nomRale)
    {
        string estado = "";
        try
        {
            SqlConnection nwindConn = new SqlConnection(strConnString);
            SqlCommand catCMD = nwindConn.CreateCommand();
            /*OleDbConnection nwindConn = new OleDbConnection(strConnString);
            OleDbCommand catCMD = nwindConn.CreateCommand();
            string textConmand = ("CREATE TABLE [rale].[dbo].[" + (nomRale + "]( "));
            textConmand += "\t[REGPATR] [nvarchar](25) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[MOV] [nvarchar](3) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[FMOV] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[SECTOR] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[NUMCRED] [nvarchar](18) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[CE] [nvarchar](4) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[TD] [nvarchar](4) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[FALTA] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[FNOTIFICACION] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[INCD] [nvarchar](8) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[INC] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[FEINC] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[DIAS] [int] NULL, ";
            textConmand += "\t[IMPORTE] [money] NULL, ";
            textConmand += "\t[DC] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[SC] [nvarchar](5) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[OBSERVA] [nvarchar](200) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[PERIODO] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[TIPO_R] [nvarchar](10) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[CE2] [nvarchar](6) COLLATE Modern_Spanish_CI_AS NULL, ";
            textConmand += "\t[FECHA_R] [nvarchar](12) COLLATE Modern_Spanish_CI_AS NULL ";
            textConmand += ") ON [PRIMARY] ";
            textConmand = (textConmand + ("BULK INSERT [rale].[dbo].[" + (nomRale + "] ")));
            textConmand = (textConmand + ("FROM \'" + (ruta + "\' ")));
            textConmand += "WITH( ";
            textConmand += "FIELDTERMINATOR=\';\', ";
            textConmand += "ROWTERMINATOR=\'\\n\', ";
            textConmand += "FIRE_TRIGGERS ";
            textConmand += ")";
            catCMD.CommandText = textConmand;
            nwindConn.Open();
            if ((catCMD.ExecuteNonQuery() <= 0))
            {
                estado = "Problemas con la actualizacion";
            }
            else
            {
                //agrgarTablaRales(nomRale);
                estado = "RALE Actualizada";
                //actualizarTabActRecRale();
            }
            nwindConn.Close();
        }
        catch (Exception e)
        {
            estado = "El RALE ya se encuentra cargado. " + e.Message;
        }
        return estado;
    }*/

    private void agrgarTablaRales()
    {
        SqlConnection con2 = new SqlConnection(strConnString);
        String sentencia = "INSERT INTO [Supervision].[dbo].[tablas](del, subdel,  origen,  tipo,   fecha,  reg)"
                                                           + "VALUES(@del,@subdel, @origen, @tipo, @fecha, @reg)";
        SqlCommand comando = new SqlCommand(sentencia, con2);
        int resultado;
        try
        {
            con2.Open();

            comando.Parameters.Add(new SqlParameter("@del", SqlDbType.NVarChar));
            comando.Parameters["@del"].Value = BD_DEL;

            comando.Parameters.Add(new SqlParameter("@subdel", SqlDbType.NVarChar));
            comando.Parameters["@subdel"].Value = BD_SUB;

            comando.Parameters.Add(new SqlParameter("@origen", SqlDbType.NVarChar));
            comando.Parameters["@origen"].Value = PRO;

            comando.Parameters.Add(new SqlParameter("@tipo", SqlDbType.NVarChar));
            comando.Parameters["@tipo"].Value = BD_TIPOECO;

            comando.Parameters.Add(new SqlParameter("@fecha", SqlDbType.Date));
            comando.Parameters["@fecha"].Value = Convert.ToDateTime(BD_FECHA);

            comando.Parameters.Add(new SqlParameter("@reg", SqlDbType.Float));
            comando.Parameters["@reg"].Value = REGISTROS;

            resultado = comando.ExecuteNonQuery();
        }
        catch (System.Exception e)
        {
            LabelMensaje.Text = e.Message + "Tablas";
        }

       /* try
        {
            SqlCommand cmd3 = new SqlCommand();
            cmd3.Connection = con2;
            string myInsertQuery23 = "INSERT INTO [Supervision].[dbo].[Rales_Combo] ([fecha_rale],[tipo_rale])";
            myInsertQuery23 += " values(?, ?)";
            cmd3.CommandText = myInsertQuery23;
            cmd3.Parameters.Add("@fecha_rale", SqlDbType.Date).Value = Convert.ToDateTime(BD_FECHA);
            cmd3.Parameters.Add("@tipo_rale", SqlDbType.VarChar).Value = BD_TIPOECO;
            con2.Open();
            cmd3.ExecuteNonQuery();
            con2.Close();
        }
        catch (Exception e)
        {
           LabelMensaje.Text = e.Message +"Rales combo";
        }*/



        //historial();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Cookies["ID_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["User_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Nombre_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Del_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Sub_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Tipo_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Cookies["Depto_Sup"].Expires = DateTime.Now.AddYears(-2);
        Response.Redirect("~/Default.aspx");
    }
}