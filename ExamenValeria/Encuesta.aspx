<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="ExamenValeria.Encuesta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos/Estilos2.css" rel="stylesheet" />
    <link href="Estilos/Botones.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div>
            <label for="Nombre" >Nombre:</label>
            <asp:TextBox ID="tnombre" runat="server" OnTextChanged="tnombre_TextChanged1" Width="326px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tnombre" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000">Ingrese un nombre</asp:RequiredFieldValidator>
        </div>
         <div>
            <label for="Genero">Genero:</label>&nbsp;<asp:DropDownList ID="tgenero" runat="server" ValidateRequestMode="Enabled">
                 <asp:ListItem>Femenino</asp:ListItem>
                 <asp:ListItem>Masculino</asp:ListItem>
             </asp:DropDownList>
             <br />
        </div>
        <div>
            <label for="Edad">Edad:</label>
            <asp:TextBox ID="tedad" runat="server" TextMode="Number" ValidateRequestMode="Enabled"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tedad" ErrorMessage="RangeValidator" ForeColor="#CC0000" MaximumValue="50" MinimumValue="18">Edad requerida de 18 a 50 años</asp:RangeValidator>
            <br />
        </div>
        <div>
            <label for="Correo">Correo:</label>
            <asp:TextBox ID="tcorreo" runat="server"  ValidateRequestMode="Enabled" Width="326px"></asp:TextBox>            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tcorreo" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Ingrese un correo valido</asp:RegularExpressionValidator>
        </div>
         <div>
            <label for="Partido">Partido Político:</label>&nbsp;<asp:DropDownList ID="tpartido" runat="server" ValidateRequestMode="Enabled">
                 <asp:ListItem>PLN</asp:ListItem>
                 <asp:ListItem>PUSC</asp:ListItem>
                 <asp:ListItem>PAC</asp:ListItem>
             </asp:DropDownList>
             <br />
        </div>

        <div class="button-container">
            <asp:Button ID="BAgregar" CssClass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
            <br />
        </div>

    <div class="footer">
        Copyright &copy; Valeria Ugalde- Todos los derechos 2023
    </div>
 </div>
</asp:Content>
