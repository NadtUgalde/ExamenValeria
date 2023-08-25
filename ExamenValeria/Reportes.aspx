<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Reportes.aspx.cs" Inherits="ExamenValeria.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos/tabla.css" rel="stylesheet" />
<link href="Estilos/Estilos2.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="contenedor1">
        <div>
            <label for="Numero" >Numero:</label>
            <asp:TextBox ID="tnumero" runat="server" OnTextChanged="tnumero_TextChanged1"></asp:TextBox>
             </div>
         <div>
            <label for="Genero">Genero:</label>&nbsp;<asp:DropDownList ID="tgenero" runat="server" >
                 <asp:ListItem>Femenino</asp:ListItem>
                 <asp:ListItem>Masculino</asp:ListItem>
             </asp:DropDownList>
        </div>
    
        <div class="button-container">
            <asp:Button ID="Bconsultar" CssClass="button button1" runat="server" Text="Consultar" OnClick="Bconsultar_Click" />
        </div>
        </div>
     <div class="button-container">
            <asp:Button ID="Bborrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="Bborrar_Click" />
        </div>
        </div>
    <%--<div cssclass="rigth">
        <h2 align="center">Encuestas</h2>
        <table id="listadeformularios" align="center" style="border: thin solid #666666; background-color: #2c2d2f; background-repeat: inherit; border-radius: 4px">
            <%--<thead cssclass="table">
                <tr>
                    <th class="auto-style1">Numero</th>
                    <th class="auto-style1">Nombre</th>
                    <th class="auto-style1">Genero</th>
                    <th class="auto-style1">Edad</th>
                    <th class="auto-style1">Correo</th>
                    <th class="auto-style1">Partido</th>
                </tr>
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
            </thead>--%>
             <%--</table>
    </div--%>&nbsp;<div class="datagrid"><h2 align="center">Encuestas</h2>
                <table id="listadeformularios" align="center" style="border: thin solid #666666; background-color: #2c2d2f; background-repeat: inherit; border-radius: 4px">
         
                    <thead><tr>
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

     <div class="footer">
        Copyright &copy; Valeria Ugalde- Todos los derechos 2023
    </div>
</asp:Content>
