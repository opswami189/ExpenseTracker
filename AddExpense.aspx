<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="AddExpense.aspx.cs"  Inherits="ExpenseTracker.AddExpense" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server" >

    
        <div>
            <asp:Label ID="LblAddExpense" runat="server" Font-Italic="True" Font-Names="Times New Roman" ForeColor="#00CC00" Text="Add Expense"></asp:Label>
            <br />
            <br />
        </div>
        <asp:Label ID="LblDate" runat="server" Text="Date:" ForeColor="#CC3300"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TxtDate" runat="server" TextMode="Date" BorderColor="Black" BorderStyle="Solid" Font-Size="Medium" OnTextChanged="TxtDate_TextChanged1"></asp:TextBox>
        <br />
        <p>
            <asp:Label ID="LblAmount" runat="server" Text="Amount:" ForeColor="#CC3300"></asp:Label>
            &nbsp;<asp:TextBox ID="TxtAmount" placeholder="Enter amount" runat="server" BorderColor="Black" BorderStyle="Solid" Font-Size="Small" ></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="LblCategory" runat="server" Text="Category:" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:DropDownList ID="DropDownCategory" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="CategoryType" DataValueField="Id" Font-Size="Small">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="LblCheckBox" runat="server" Text="IsCredit:" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp; <asp:CheckBox ID="CheckBoxIsCredit" runat="server" />
        </p>
        <p>
            <asp:Label ID="LblBeneficiary" runat="server" Text="Beneficiary:" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownBeneficiary" runat="server" DataSourceID="SqlDataSourceBeneficiary" DataTextField="Name" DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceBeneficiary" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [Beneficiary]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="LblMode" runat="server" Text="Mode:" ForeColor="#CC3300"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:DropDownList ID="DropDownMode" runat="server" DataSourceID="SqlDataSourceMode" DataTextField="Mode" DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceMode" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [PaymentMode]"></asp:SqlDataSource>
        </p>
        <p>
        <asp:Label ID="LblDetails" runat="server" Text="Details:" ForeColor="#CC3300"></asp:Label>
&nbsp;
        <asp:TextBox ID="TxtDetails" placeholder="Enter details" runat="server" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="BtnSave" runat="server" OnClick="BtnSave_Click" Text="Save" style="height: 26px" BorderColor="#CC3300" BorderStyle="Solid" ForeColor="#CC3300" />
        </p>
        <p>
            <asp:Label ID="LblMessage" runat="server"></asp:Label>
        </p>
   

    </asp:Content>