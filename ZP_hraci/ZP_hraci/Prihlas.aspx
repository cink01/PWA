<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Prihlas.aspx.cs" Inherits="Prihlas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_body" runat="Server">
    <table class="auto-style3">
        <tr>
            <td class="auto-style5"><strong>Zadejte login</strong></td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox_login" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">Zadejte heslo</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox_pw" runat="server" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style4">
                <asp:Button ID="Button_log" runat="server" Text="Přihlásit" Width="128px" OnClick="Button_log_Click" />
            </td>
        </tr>
    </table>
</asp:Content>