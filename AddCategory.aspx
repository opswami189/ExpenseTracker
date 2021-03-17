<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="ExpenseTracker.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="LblAddCategory" runat="server" Font-Italic="True" ForeColor="#00CC00" Text="Add Category"></asp:Label>
        <br />
        </p>
    <p>
        <asp:Label ID="LblName" runat="server" Text="Name:" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TxtCategoryType" runat="server" BorderColor="Black" BorderStyle="Solid" Font-Size="Medium"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="LblRedirect" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:Button ID="BtnCategory" runat="server" OnClick="BtnCategory_Click" Text="Save" BorderColor="#CC3300" BorderStyle="Solid" Font-Size="Medium" ForeColor="#CC3300" />
    </p>
    <p>
        <asp:GridView ID="GridViewCategories" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="CategoryType" HeaderText="CategoryType" SortExpression="CategoryType" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
    </p>
    <p>
    </p>
</asp:Content>
