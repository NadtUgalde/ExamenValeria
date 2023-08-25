using System;
using ExamenValeria.Clases;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenValeria
{
    public partial class Encuesta : System.Web.UI.Page
    {
        List<ClsFormularios> formularios = ClsFormularios.ObtenerEncuestas ();
        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

        public void LimpiarCampos()
        {
            tnombre.Text = string.Empty;
            
            
            tcorreo.Text = string.Empty;
            
        }
        protected void BAgregar_Click(object sender, EventArgs e)
        {
            int resultado = ClsFormularios.AgregarEncuestas(tnombre.Text, tgenero.Text , tedad.Text, tcorreo.Text,tpartido.Text);

            if (IsValid)
            {
                if (resultado > 0)
                {
                    alertas("Encuesta ha sido ingresada con éxito");
                    LimpiarCampos();
                  
                }
                else
                {
                    alertas("Error al ingresar Encuesta");
                }
            }

        }

        protected void tnombre_TextChanged1(object sender, EventArgs e)
        {

        }

        protected void tgenero_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}