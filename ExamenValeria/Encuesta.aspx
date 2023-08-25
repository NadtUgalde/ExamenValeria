<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="ExamenValeria.Encuesta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Estilos/Estilos2.css" rel="stylesheet" />
    <link href="Estilos/Botones.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 529px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style1" style="background-color: #ffffff84 ; text-align: left;"  cssclass="container">
        <div>
            <label for="Nombre" >Nombre:</label>
            <asp:TextBox ID="tnombre" runat="server" OnTextChanged="tnombre_TextChanged1" Width="326px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tnombre" ErrorMessage="RequiredFieldValidator" ForeColor="#CC0000">Ingrese un nombre</asp:RequiredFieldValidator>
        </div>
         <div>
            <label for="Genero">
             <br />
             Genero:</label><asp:RadioButtonList ID="tgenero" runat="server" OnSelectedIndexChanged="tgenero_SelectedIndexChanged" Width="138px">
                 <asp:ListItem>Femenino</asp:ListItem>
                 <asp:ListItem>Masculino</asp:ListItem>
             </asp:RadioButtonList>
             <br />
        </div>
        <div>
            <label for="Edad">Edad:</label>
            <asp:TextBox ID="tedad" runat="server" TextMode="Number"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tedad" ErrorMessage="RangeValidator" ForeColor="#CC0000" MaximumValue="50" MinimumValue="18">Edad requerida de 18 a 50 años</asp:RangeValidator>
            <br />
            <br />
        </div>
        <div>
            <label for="Correo">Correo:<br />
            </label>&nbsp;<asp:TextBox ID="tcorreo" runat="server"  ValidateRequestMode="Enabled" Width="326px" TextMode="Email"></asp:TextBox>            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tcorreo" ErrorMessage="RegularExpressionValidator" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Ingrese un correo valido</asp:RegularExpressionValidator>
        </div>
         <div>
            <label for="Partido">
             <br />
             <br />
             Partido Político:</label><asp:RadioButtonList ID="tpartido" runat="server">
                 <asp:ListItem>PLN</asp:ListItem>
                 <asp:ListItem>PUSC</asp:ListItem>
                 <asp:ListItem>PAC</asp:ListItem>
             </asp:RadioButtonList>
             <br />
             <br />
        </div>

        <div class="button-container">
            <asp:Button ID="BAgregar" cssclass="button button1" runat="server" Text="Agregar" OnClick="BAgregar_Click" />
            <br />
        </div>

    <div class="footer">
        Copyright &copy; Valeria Ugalde- Todos los derechos 2023
    </div>
 </div>
</asp:Content>
