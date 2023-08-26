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

            
        private void CargarEncuestas()
        {
            LimpiarTabla();
            formularios = ClsFormularios.ObtenerEncuestas();
            repeaterEncuestas.DataSource = formularios;
            repeaterEncuestas.DataBind();
        }



        //Metodos de reportes
        static List<ClsReportes> reportes = new List<ClsReportes>();

        private void LimpiarTablaReportes()
        {
            reportes.Clear();
            repeaterEncuestas.DataSource = null;
            repeaterEncuestas.DataBind();
        }
        protected void Bconsultar_Click(object sender, EventArgs e)
        {
            consultarReportes();

        }
        public void LimpiarCamposReportes()
        {
            treporte.Text = string.Empty;

        }

        public void consultarReportes()
        {
            LimpiarTablaReportes();
            reportes = ClsReportes.ObtenerReportes(treporte.Text);
            repeaterReportes.DataSource = reportes;
            repeaterReportes.DataBind();
        }

        protected void treporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            consultarReportes();
            CargarEncuestas();
        }
    }


}