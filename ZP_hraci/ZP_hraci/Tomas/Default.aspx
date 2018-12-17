<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_body" runat="Server">
    <h2>Přehled postav hráče</h2><asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
            <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
            <asp:BoundField DataField="strenght" HeaderText="strenght" SortExpression="strenght" />
            <asp:BoundField DataField="dexterity" HeaderText="dexterity" SortExpression="dexterity" />
            <asp:BoundField DataField="constitution" HeaderText="constitution" SortExpression="constitution" />
            <asp:BoundField DataField="inteligence" HeaderText="inteligence" SortExpression="inteligence" />
            <asp:BoundField DataField="wisdom" HeaderText="wisdom" SortExpression="wisdom" />
            <asp:BoundField DataField="charisma" HeaderText="charisma" SortExpression="charisma" />
            <asp:BoundField DataField="dm" HeaderText="dm" SortExpression="dm" />
            <asp:BoundField DataField="nazev" HeaderText="nazev" SortExpression="nazev" />
            <asp:BoundField DataField="save1" HeaderText="save1" SortExpression="save1" />
            <asp:BoundField DataField="save2" HeaderText="save2" SortExpression="save2" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="Hrac_celkovy_vypis_GW" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="hrac" SessionField="login" />
            </SelectParameters>
        </asp:SqlDataSource>
        Editor postav<br />
    <table class="auto-style3">
        <tr>
            <td class="auto-style5">id</td>
            <td class="auto-style4">
                <asp:DropDownList ID="DDL_id" runat="server" DataSourceID="SqlDataSource_id" DataTextField="id" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="DDL_id_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_id" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [hraci] WHERE [id] = @id" SelectCommand="SELECT [id] FROM [hraci] WHERE ([hrac] = @hrac)">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="hrac" SessionField="login" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">jméno</td>
            <td class="auto-style4">
                <asp:TextBox ID="TextBox_jméno" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">level</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_level" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">strenght</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_str" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">dexterity</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_dex" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">constitution</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_con" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">inteligence</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_int" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">wisdom</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_wis" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">charisma</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_cha" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style5">postava</td>
            <td class="auto-style4">
                <asp:DropDownList ID="DDL_postava" runat="server" DataSourceID="SqlDataSource_post" DataTextField="id" DataValueField="id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource_post" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [id] FROM [postavy]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <asp:Button ID="Button_insert" runat="server" Text="Vytvořit" Width="128px" OnClick="Button_insert_Click" />
    <asp:Button ID="Button_update" runat="server" Text="Upravit" Width="128px" OnClick="Button_update_Click" />
    <asp:Button ID="Button_delete" runat="server" Text="Smazat" Width="128px" OnClick="Button_delete_Click" />
    <p>
        &nbsp;Dostupné postavy:
  <br />
        <asp:Label ID="lb_postavy" runat="server" Text="Label"></asp:Label>
    </p>
</asp:Content>