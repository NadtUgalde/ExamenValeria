using ExamenValeria.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenValeria
{
    public partial class Reportes : System.Web.UI.Page
    {
        List<ClsFormularios> formularios = ClsFormularios.ObtenerEncuestas();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEncuestas();
            }
            else
            {

            }
        }
        private void LimpiarTabla()
        {
            formularios.Clear();
            repeaterEncuestas.DataSource = null;
            repeaterEncuestas.DataBind();
        }

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
            tnumero.Text = string.Empty;
            tgenero.Text = string.Empty;
        
        }
        private void CargarEncuestas()
        {
            LimpiarTabla();
            formularios = ClsFormularios.ObtenerEncuestas();
            repeaterEncuestas.DataSource = formularios;
            repeaterEncuestas.DataBind();
        }
        protected void Bconsultar_Click(object sender, EventArgs e)
        {
            String numero = tnumero.Text.Trim();
            int resultado = ClsFormularios.BorrarEncuesta(numero);
        }

        protected void Bborrar_Click(object sender, EventArgs e)

        {
            String numero = tnumero.Text.Trim();
            int resultado = ClsFormularios.BorrarEncuesta(numero);

            if (resultado > 0)
            {
                alertas("Encuesta ha sido borrada con éxito");
                LimpiarCampos();
                CargarEncuestas();
            }
            else
            {
                alertas("Error al borrar encuesta");
            }
        }

        protected void tnumero_TextChanged1(object sender, EventArgs e)
        {

        }

       
    }


}