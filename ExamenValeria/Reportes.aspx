<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ExamenValeria.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos/tabla.css" rel="stylesheet" />
<link href="Estilos/Estilos2.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor1" style="background-color: #ffffff9d">
        <div>
            <label for="Numero"  >Reportes:</label>
            <asp:RadioButtonList ID="treporte" runat="server" AutoPostBack="True" OnSelectedIndexChanged="treporte_SelectedIndexChanged">
                <asp:ListItem Value="T">Cantidad Encuestas Total</asp:ListItem>
                <asp:ListItem Value="M">Cantidad Encuestas Masculinas</asp:ListItem>
                <asp:ListItem Value="F">Cantidad Encuestas Femeninas</asp:ListItem>
            </asp:RadioButtonList>
             </div>
    
        <div class="button-container">
        </div>
       
     <div class="button-container">
        </div>
        </div>
   <div class="h2"><h2 align="center" >Reportes</h2></div>

               <div class="datagrid"> <table id="listadeencuestas" align="center" >
         
                    <thead ><tr>
                     <th >Reporte</th>
                     <th >Cantidad</th>                
                        </tr></thead>
                    <asp:Repeater runat="server" ID="repeaterReportes">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("reporte") %></td>  
                            <td><%# Eval("cantidad") %></td>               
                        </tr>
                                                 
                </ItemTemplate>
                </asp:Repeater>
                    </table>

             </div>

    <div class="button-container">
        </div>
    
    <div class="h2"><h2 align="center" >Encuestas</h2></div>

               <div class="datagrid"> <table id="listadeformularios" align="center" >
         
                    <thead ><tr>
                     <th >Numero</th>
                    <th >Nombre</th>
                    <th >Genero</th>
                    <th >Edad</th>
                    <th >Correo</th>
                    <th >Partido</th>
                        </tr></thead>
                    <asp:Repeater runat="server" ID="repeaterEncuestas">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Numero") %></td>
                            <td><%# Eval("Nombre") %></td>
                            <td><%# Eval("Genero") %></td>
                            <td><%# Eval("Edad") %></td>
                            <td><%# Eval("Correo") %></td>
                            <td><%# Eval("Partido") %></td>
                        </tr>
                        
                         
                </ItemTemplate>
                </asp:Repeater>
                    </table>

             </div>

     <div class="footer" >
        Copyright &copy; Valeria Ugalde- Todos los derechos 2023
    </div>
</asp:Content>
