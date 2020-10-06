using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


/// <summary>
/// Descripción breve de Class1
/// </summary>
public class Class1
{
	public static int Seguridad(int id, string del, string sub, string tipo, string herra, string reg, string ip)
	{
        using (SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["SupervisionConnectionString"].ConnectionString))
        {
            try
            {
                conn1.Open();
                String sen = null;
                int resul;
                sen = "INSERT INTO [Panel_Control].[dbo].[Acciones] ([id_user],[del],[sub],[tipo],[herra],[reg],[ip],[fecha]) VALUES (@id_user, @del, @sub, @tipo, @herra, @reg, @ip, @fecha)";
                SqlCommand cmd = new SqlCommand(sen, conn1);

                cmd.Parameters.Add(new SqlParameter("@id_user", SqlDbType.Int));
                cmd.Parameters["@id_user"].Value = id;

                cmd.Parameters.Add(new SqlParameter("@del", SqlDbType.NVarChar, 50));
                cmd.Parameters["@del"].Value = del;

                cmd.Parameters.Add(new SqlParameter("@sub", SqlDbType.NVarChar, 50));
                cmd.Parameters["@sub"].Value = sub;

                cmd.Parameters.Add(new SqlParameter("@tipo", SqlDbType.NVarChar, 50));
                cmd.Parameters["@tipo"].Value = tipo;

                cmd.Parameters.Add(new SqlParameter("@herra", SqlDbType.NVarChar, 50));
                cmd.Parameters["@herra"].Value = herra;

                cmd.Parameters.Add(new SqlParameter("@reg", SqlDbType.NVarChar, 50));
                cmd.Parameters["@reg"].Value = reg;

                cmd.Parameters.Add(new SqlParameter("@ip", SqlDbType.NVarChar, 50));
                cmd.Parameters["@ip"].Value = ip;

                cmd.Parameters.Add(new SqlParameter("@fecha", SqlDbType.DateTime));
                cmd.Parameters["@fecha"].Value = DateTime.Now;


                resul = cmd.ExecuteNonQuery();
            }
            catch (Exception Msj)
            {
                
            }
        }

        return 0;
	}
}