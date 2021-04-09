<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs"
Inherits="ExpenseTracker.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>ExpenseTracker - Login</title>
  </head>
  <body>
    <form id="form1" runat="server">
      <div style="text-align: center">
        <p
          style="
            color: #33cc33;
            text-align: center;
            font-family: Calibri;
            font-style: normal;
          "
        >
          <asp:Label
            ID="Label1"
            runat="server"
            Font-Bold="True"
            Font-Italic="True"
            Font-Overline="False"
            Font-Size="XX-Large"
            ForeColor="Blue"
            Text="Expense Tracker"
          ></asp:Label>
          <br />
        </p>
        <p style="color: #33cc33; text-align: center; font-style: italic">
          Enter UserId and Password to Login
        </p>
        <p style="text-align: center">
          <asp:Label
            ID="LblUserId"
            runat="server"
            Text="UserId:"
            Font-Names="Times New Roman"
            Font-Size="Large"
            ForeColor="Blue"
          ></asp:Label>
          &nbsp;&nbsp;<asp:RequiredFieldValidator
            ID="ReqValUserId"
            runat="server"
            ControlToValidate="TxtUserId"
            ErrorMessage="UserId Required!"
            ForeColor="Red"
            SetFocusOnError="True"
            >*</asp:RequiredFieldValidator
          >
          &nbsp;&nbsp;
          <asp:TextBox
            ID="TxtUserId"
            runat="server"
            BorderStyle="Solid"
            Font-Size="Medium"
            TextMode="Email"
            CausesValidation="True"
          ></asp:TextBox>
          &nbsp;
        </p>
        <p style="text-align: center">
          <asp:Label
            ID="LblPassword"
            runat="server"
            Text="Password:"
            Font-Size="Large"
            ForeColor="Blue"
          ></asp:Label>
          <asp:RequiredFieldValidator
            ID="ReqValPassword"
            runat="server"
            ControlToValidate="TxtPassword"
            ErrorMessage="Password Required!"
            ForeColor="Red"
            SetFocusOnError="True"
            >*</asp:RequiredFieldValidator
          >
          &nbsp;<asp:TextBox
            ID="TxtPassword"
            runat="server"
            BorderStyle="Solid"
            Font-Size="Medium"
            TextMode="Password"
            CausesValidation="True"
          ></asp:TextBox>
          &nbsp;
        </p>
        <p style="text-align: center">
          <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <asp:ValidationSummary
          ID="ValSummaryLogin"
          runat="server"
          DisplayMode="List"
          ForeColor="Red"
          Height="41px"
        />
        <p style="color: #0000ff; text-align: center">
          <asp:Button
            ID="BtnLogin"
            runat="server"
            Font-Size="Large"
            ForeColor="White"
            OnClick="BtnLogIn_Click"
            Text="Log In"
            BorderStyle="Solid"
            BackColor="#000099"
            BorderColor="#000099"
          />
        </p>
        <p style="color: #0000ff; text-align: center">
          &nbsp;
          <asp:Label
            ID="LblRememberMe"
            runat="server"
            ForeColor="Black"
            Text="Remember Me"
          ></asp:Label>
          &nbsp;
          <asp:CheckBox ID="ChkRememberMe" runat="server" />
        </p>
        <p style="text-align: center">
          <asp:Label
            ID="Label2"
            runat="server"
            Font-Size="Small"
            Text="Don't have account? "
          ></asp:Label>
          <asp:LinkButton
            ID="LbSignUp"
            runat="server"
            Font-Size="Small"
            PostBackUrl="~/SignUp.aspx"
            CausesValidation="False"
            >SignUp</asp:LinkButton
          >
        </p>
      </div>
    </form>
  </body>
</html>
