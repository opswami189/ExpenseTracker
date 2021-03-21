<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddPaymentMode.aspx.cs" Inherits="ExpenseTracker.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="LblAddPaymentMode" runat="server" Font-Italic="True" ForeColor="#00CC00" Text="Add PaymentMode"></asp:Label>
        <br />
        </p>
    <p>
        <asp:Label ID="LblMode" runat="server" Text="Mode:" ForeColor="Blue"></asp:Label>
&nbsp;<asp:TextBox ID="TxtMode" runat="server" BorderColor="Black" BorderStyle="Solid" Font-Size="Medium"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="LblMessage" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:Button ID="BtnAdd" runat="server" OnClick="BtnSave_Click" Text="Add" BorderColor="#000099" BorderStyle="Solid" Font-Size="Medium" ForeColor="White" BackColor="#000099" />
    </p>
    <p>
        <asp:GridView ID="GridViewModes" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSourceModes" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Mode" HeaderText="Mode" SortExpression="Mode" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceModes" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [PaymentMode]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
