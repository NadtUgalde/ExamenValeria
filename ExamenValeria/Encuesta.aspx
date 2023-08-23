<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="ExamenValeria.Encuesta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <label for="Codigo" requiered>Codigo:</label>
            <asp:TextBox ID="tcodigo" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="Nombre">Nombre Cliente:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tnombre" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000">Campo requerido</asp:RequiredFieldValidator>
            </label>
            &nbsp;<asp:TextBox ID="tnombre" runat="server" OnTextChanged="tnombre_TextChanged"></asp:TextBox>
        </div>
        <div>
            <label for="Direccion">Direccion:</label>
            <asp:TextBox ID="tdireccion" runat="server"></asp:TextBox>
        </div>
        <div>
            <label for="Telefono">Telefono:</label>
            <asp:TextBox ID="ttelefono" runat="server"></asp:TextBox>
        </div>

        <div class="button-container">
            <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
            <asp:Button ID="BBorrar" CssClass="button button1" runat="server" Text="Borrar" OnClick="BBorrar_Click" />
            <asp:Button ID="BModificar" CssClass="button button1" runat="server" Text="Modificar" OnClick="BModificar_Click" />
            <asp:Button ID="BConsultar" CssClass="button button1" runat="server" Text="Consultar" />
        </div>
    </div>

    <div cssclass="rigth">
        <h2 align="center">Lista de Clientes</h2>
        <table id="clientListTable" align="center" style="border: thin solid #666666; background-color: #2c2d2f; background-repeat: inherit; border-radius: 4px">
            <thead cssclass="table">
                <tr>
                    <th class="auto-style1">Codigo</th>
                    <th class="auto-style1">Nombre</th>
                    <th class="auto-style1">Direccion</th>
                    <th class="auto-style1">Telefono</th>
                </tr>
                <asp:Repeater runat="server" ID="repeaterClientes">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("Id") %></td>
                            <td><%# Eval("Nombre") %></td>
                            <td><%# Eval("Direccion") %></td>
                            <td><%# Eval("Telefono") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </thead>
        </table>
    </div>
    <div class="footer">
        Copyright &copy; Valeria Ugalde y Bryan Leiva - Todos los derechos 2023
    </div>
</asp:Content>
