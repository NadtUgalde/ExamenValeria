using System;
using System.Collections.Generic;
using ExamenValeria.Clases;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ExamenValeria.Clases
{
    public class ClsFormularios
    {
        public int numero { get; set; }
        public string nombre { get; set; }
        public string genero { get; set; }
        public int edad { get; set; }
        public string correo { get; set; }
        public string partido { get; set; }

        private static int tipoOperacion = 0;

        public static List<ClsFormularios> formularios = new List<ClsFormularios>();

        public ClsFormularios(int numero, string nombre, string genero, int edad, string correo, string partido)
        {
            this.numero = numero;
            this.nombre = nombre;
            this.genero = genero;
            this.edad = edad;
            this.correo = correo;
            this.partido = partido;
        }
        public ClsFormularios()
        {

        }

        public static int AgregarEncuestas(string nombre, string genero, string edad, string correo, string partido)
        {
            int retorno = 0;
            tipoOperacion = 1;
            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = Clases.ClsConexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Sp_Encuestas", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    cmd.Parameters.Add(new SqlParameter("@Numero", 0));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
                    cmd.Parameters.Add(new SqlParameter("@Genero", genero));
                    cmd.Parameters.Add(new SqlParameter("@Edad", edad));
                    cmd.Parameters.Add(new SqlParameter("@Correo", correo));
                    cmd.Parameters.Add(new SqlParameter("@Partido_politico", partido));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
       
        public static List<ClsFormularios> ObtenerEncuestas()
        {
            int retorno = 0;
            tipoOperacion = 3;
            SqlConnection Conn = new SqlConnection();

            try
            {

                using (Conn = Clases.ClsConexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Sp_Encuestas", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Operacion", tipoOperacion));
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ClsFormularios formulario = new ClsFormularios();
                            formulario.numero = reader.GetInt32(0);
                            formulario.nombre = reader.GetString(1);
                            formulario.genero = reader.GetString(2);
                            formulario.edad = reader.GetInt32(3);
                            formulario.correo = reader.GetString(4);
                            formulario.partido = reader.GetString(5);
                            formularios.Add(formulario);
                        }

                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return formularios;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return formularios;
        }

        

    }
}