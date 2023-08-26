using System;
using System.Collections.Generic;
using ExamenValeria.Clases;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ExamenValeria.Clases
{
    public class ClsReportes
    {
        public string tipoOperacion { get; set; }
        public string reporte { get; set; }
        public int cantidad { get; set; }
        

        public static List<ClsReportes> reportes = new List<ClsReportes>();

        public ClsReportes(string reporte, int cantidad, string tipoOperacion )
        {
            this.tipoOperacion = tipoOperacion;
            this.reporte = reporte;
            this.cantidad = cantidad;
            
           
        }
        public ClsReportes()
        {

        }

        
        public static List<ClsReportes> ObtenerReportes(string tipoOperacion)
        {
            int retorno = 0;
            
            SqlConnection Conn = new SqlConnection();

            try
            {

                using (Conn = Clases.ClsConexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("Sp_ReporteEncuestas", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@ReporteTipo", tipoOperacion));
                    retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            ClsReportes reporte = new ClsReportes();
                            reporte.reporte = reader.GetString(0);
                            reporte.cantidad = reader.GetInt32(1);                    
                            reportes.Add(reporte);
                        }

                    }
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return reportes;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return reportes;
        }
    }
}