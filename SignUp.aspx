<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="ExpenseTracker.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center; font-family: 'Times New Roman', Times, serif;">
            <p style="color: #33CC33; text-align: center; font-style: italic; font-family: Calibri;">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" Font-Overline="False" Font-Size="XX-Large" ForeColor="Blue" Text="Expense Tracker"></asp:Label>
            </p>
        <p style="color: #33CC33; text-align: center; font-style: italic; font-family: 'Times New Roman', Times, serif;">
            <asp:Label ID="LblDetails" runat="server" Font-Italic="True" Text="Enter the details to create an account"></asp:Label>
            </p>
            <br />
            <br />
            <asp:Label ID="LblFirstName" runat="server" Text="First Name: " Font-Size="Medium" ForeColor="Blue"></asp:Label>
            <asp:TextBox ID="TxtFirstName" runat="server" BorderStyle="Solid" Font-Size="Medium"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LblLastName" runat="server" Text="Last Name:" Font-Size="Medium" ForeColor="Blue"></asp:Label>
&nbsp;<asp:TextBox ID="TxtLastName" runat="server" BorderStyle="Solid" Font-Size="Medium"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LblEmail" runat="server" Text="Email Id:" Font-Size="Medium" ForeColor="Blue"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TxtEmail" runat="server" BorderStyle="Solid" Font-Size="Medium" TextMode="Email"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LblPassword" runat="server" Text="Password:" Font-Size="Medium" ForeColor="Blue"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TxtPassword" runat="server" BorderStyle="Solid" Font-Size="Medium" TextMode="Password"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LblMobileNo" runat="server" Text="Mobile No:" Font-Size="Medium" ForeColor="Blue"></asp:Label>
&nbsp;
            <asp:TextBox ID="TxtMobileNo" runat="server" BorderStyle="Solid" Font-Size="Medium" TextMode="Phone"></asp:TextBox>
            <br />
            <asp:Label ID="LblError" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>
            <br />
            <br />
            <asp:Button ID="BtnSignUp" runat="server" OnClick="BtnSave_Click" Text="Sign Up" BorderStyle="Solid" Font-Size="Medium" ForeColor="White" BackColor="#000099" BorderColor="#000099" />
            <br />
            <br />
            <asp:Label ID="LblSignIn" runat="server" Font-Size="Small" Text="Already have an account?"></asp:Label>
            <asp:LinkButton ID="LbLogin" runat="server" Font-Size="Small" PostBackUrl="~/Login.aspx">Login</asp:LinkButton>
            <br />
            <br />
            <asp:Label ID="LblFeedback" runat="server" ForeColor="#33CC33"></asp:Label>
            <br />
            <asp:Label ID="LblRedirect" runat="server" ForeColor="#33CC33"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
