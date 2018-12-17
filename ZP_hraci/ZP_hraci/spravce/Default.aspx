<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style6 {
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_body" Runat="Server">
    <h2> Vítejte správce</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource_hraci" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="hrac" HeaderText="hrac" SortExpression="hrac" />
            <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
            <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
            <asp:BoundField DataField="nazev" HeaderText="nazev" SortExpression="nazev" />
            <asp:BoundField DataField="strenght" HeaderText="strenght" SortExpression="strenght" />
            <asp:BoundField DataField="dexterity" HeaderText="dexterity" SortExpression="dexterity" />
            <asp:BoundField DataField="constitution" HeaderText="constitution" SortExpression="constitution" />
            <asp:BoundField DataField="inteligence" HeaderText="inteligence" SortExpression="inteligence" />
            <asp:BoundField DataField="wisdom" HeaderText="wisdom" SortExpression="wisdom" />
            <asp:BoundField DataField="charisma" HeaderText="charisma" SortExpression="charisma" />
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
    <asp:SqlDataSource ID="SqlDataSource_hraci" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="sprav_celkovy_vypis_GW" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style6" DataKeyNames="id" DataSourceID="SqlDataSource_postavy" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
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
    <asp:SqlDataSource ID="SqlDataSource_postavy" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [postavy] WHERE [id] = @original_id AND (([nazev] = @original_nazev) OR ([nazev] IS NULL AND @original_nazev IS NULL)) AND (([save1] = @original_save1) OR ([save1] IS NULL AND @original_save1 IS NULL)) AND (([save2] = @original_save2) OR ([save2] IS NULL AND @original_save2 IS NULL))" InsertCommand="INSERT INTO [postavy] ([id], [nazev], [save1], [save2]) VALUES (@id, @nazev, @save1, @save2)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [postavy]" UpdateCommand="UPDATE [postavy] SET [nazev] = @nazev, [save1] = @save1, [save2] = @save2 WHERE [id] = @original_id AND (([nazev] = @original_nazev) OR ([nazev] IS NULL AND @original_nazev IS NULL)) AND (([save1] = @original_save1) OR ([save1] IS NULL AND @original_save1 IS NULL)) AND (([save2] = @original_save2) OR ([save2] IS NULL AND @original_save2 IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_nazev" Type="String" />
            <asp:Parameter Name="original_save1" Type="String" />
            <asp:Parameter Name="original_save2" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="nazev" Type="String" />
            <asp:Parameter Name="save1" Type="String" />
            <asp:Parameter Name="save2" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nazev" Type="String" />
            <asp:Parameter Name="save1" Type="String" />
            <asp:Parameter Name="save2" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_nazev" Type="String" />
            <asp:Parameter Name="original_save1" Type="String" />
            <asp:Parameter Name="original_save2" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nový" OnClick="NewButton_Click" />

    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            nazev:
            <asp:TextBox ID="nazevTextBox" runat="server" Text='<%# Bind("nazev") %>' />
            <br />
            save1:
            <asp:TextBox ID="save1TextBox" runat="server" Text='<%# Bind("save1") %>' />
            <br />
            save2:
            <asp:TextBox ID="save2TextBox" runat="server" Text='<%# Bind("save2") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizovat" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Storno" />
        </EditItemTemplate>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            id:
            <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
            <br />
            nazev:
            <asp:TextBox ID="nazevTextBox" runat="server" Text='<%# Bind("nazev") %>' />
            <br />
            save1:
            <asp:TextBox ID="save1TextBox" runat="server" Text='<%# Bind("save1") %>' />
            <br />
            save2:
            <asp:TextBox ID="save2TextBox" runat="server" Text='<%# Bind("save2") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Vložit" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Storno" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            nazev:
            <asp:Label ID="nazevLabel" runat="server" Text='<%# Bind("nazev") %>' />
            <br />
            save1:
            <asp:Label ID="save1Label" runat="server" Text='<%# Bind("save1") %>' />
            <br />
            save2:
            <asp:Label ID="save2Label" runat="server" Text='<%# Bind("save2") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Upravit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Odstranit" />
            &nbsp;
        </ItemTemplate>
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [postavy] WHERE [id] = @original_id AND (([nazev] = @original_nazev) OR ([nazev] IS NULL AND @original_nazev IS NULL)) AND (([save1] = @original_save1) OR ([save1] IS NULL AND @original_save1 IS NULL)) AND (([save2] = @original_save2) OR ([save2] IS NULL AND @original_save2 IS NULL))" InsertCommand="INSERT INTO [postavy] ([id], [nazev], [save1], [save2]) VALUES (@id, @nazev, @save1, @save2)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [postavy] WHERE ([id] = @id)" UpdateCommand="UPDATE [postavy] SET [nazev] = @nazev, [save1] = @save1, [save2] = @save2 WHERE [id] = @original_id AND (([nazev] = @original_nazev) OR ([nazev] IS NULL AND @original_nazev IS NULL)) AND (([save1] = @original_save1) OR ([save1] IS NULL AND @original_save1 IS NULL)) AND (([save2] = @original_save2) OR ([save2] IS NULL AND @original_save2 IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_nazev" Type="String" />
            <asp:Parameter Name="original_save1" Type="String" />
            <asp:Parameter Name="original_save2" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="nazev" Type="String" />
            <asp:Parameter Name="save1" Type="String" />
            <asp:Parameter Name="save2" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView2" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nazev" Type="String" />
            <asp:Parameter Name="save1" Type="String" />
            <asp:Parameter Name="save2" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
            <asp:Parameter Name="original_nazev" Type="String" />
            <asp:Parameter Name="original_save1" Type="String" />
            <asp:Parameter Name="original_save2" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

