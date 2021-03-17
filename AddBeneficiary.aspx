<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddBeneficiary.aspx.cs" Inherits="ExpenseTracker.AddBeneficiary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="LblAddBeneficiary" runat="server" Font-Italic="True" ForeColor="#00CC00" Text="Add Beneficiary"></asp:Label>
    </p>
    <p>
        <asp:Label ID="LblBName" runat="server" Text="Name:" Font-Size="Medium" ForeColor="Blue"></asp:Label>
&nbsp;
        <asp:TextBox ID="TxtName" runat="server" BorderColor="Black" BorderStyle="Solid" Font-Size="Medium"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="LblBMobile" runat="server" Text="Mobile:" Font-Size="Medium" ForeColor="Blue"></asp:Label>
&nbsp;
        <asp:TextBox ID="TxtMobileNo" runat="server" BorderColor="Black" BorderStyle="Solid" Font-Size="Medium"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="LblRedirect" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" BorderColor="#0033CC" BorderStyle="Solid" Font-Size="Medium" ForeColor="White" BackColor="#0033CC" />
    </p>
    <p>
        &nbsp;</p>
    <p>
        Beneficiary List</p>
    <p style="text-align: center">
        <asp:GridView ID="GridViewBeneficiaries" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" HorizontalAlign="Center" OnRowEditing="GridViewBeneficiaries_RowEditing" OnRowCancelingEdit="GridViewBeneficiaries_RowCancelingEdit"
    OnRowUpdating="GridViewBeneficiaries_RowUpdating" OnRowDeleting="GridViewBeneficiaries_RowDeleting" >
            <Columns>
                <asp:CommandField ShowEditButton="true" ShowCancelButton="true" ShowDeleteButton="true" DeleteText="Delete"  />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [Beneficiary]"></asp:SqlDataSource>
    </p>
</asp:Content>
