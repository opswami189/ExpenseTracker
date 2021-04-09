<%@ Page Title="ExpenseTracker - SignUp" Language="C#" AutoEventWireup="true"
CodeBehind="SignUp.aspx.cs" Inherits="ExpenseTracker.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
  </head>
  <body>
    <form id="form1" runat="server">
      <div
        style="text-align: center; font-family: 'Times New Roman', Times, serif"
      >
        <p
          style="
            color: #33cc33;
            text-align: center;
            font-style: italic;
            font-family: Calibri;
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
        </p>
        <p
          style="
            color: #33cc33;
            text-align: center;
            font-style: italic;
            font-family: 'Times New Roman', Times, serif;
          "
        >
          <asp:Label
            ID="LblDetails"
            runat="server"
            Font-Italic="True"
            Text="Enter the details to create an account"
          ></asp:Label>
        </p>
        <br />
        <br />
        <asp:Label
          ID="LblFirstName"
          runat="server"
          Text="First Name: "
          Font-Size="Medium"
          ForeColor="Blue"
        ></asp:Label>
        <asp:RequiredFieldValidator
          ID="ReqValFirstName"
          runat="server"
          ControlToValidate="TxtFirstName"
          ErrorMessage="First Name Required!"
          ForeColor="Red"
          SetFocusOnError="True"
          >*</asp:RequiredFieldValidator
        >
        &nbsp;<asp:TextBox
          ID="TxtFirstName"
          runat="server"
          BorderStyle="Solid"
          Font-Size="Medium"
        ></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator
          ID="RegExpValFirstName"
          runat="server"
          ControlToValidate="TxtFirstName"
          ErrorMessage="First name must be 2-15 characters long."
          ForeColor="Red"
          ValidationExpression="^([A-Za-z0-9]\s*){2,16}$"
        ></asp:RegularExpressionValidator>
        <br />
        <asp:Label
          ID="LblLastName"
          runat="server"
          Text="Last Name:"
          Font-Size="Medium"
          ForeColor="Blue"
        ></asp:Label>
        &nbsp; &nbsp;<asp:TextBox
          ID="TxtLastName"
          runat="server"
          BorderStyle="Solid"
          Font-Size="Medium"
        ></asp:TextBox>
        <br />
        <br />
        <asp:Label
          ID="LblEmail"
          runat="server"
          Text="Email Id:"
          Font-Size="Medium"
          ForeColor="Blue"
        ></asp:Label>
        &nbsp;<asp:RequiredFieldValidator
          ID="ReqValEmail"
          runat="server"
          ControlToValidate="TxtEmail"
          ErrorMessage="Email Id Required!"
          ForeColor="Red"
          SetFocusOnError="True"
          >*</asp:RequiredFieldValidator
        >
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox
          ID="TxtEmail"
          runat="server"
          BorderStyle="Solid"
          Font-Size="Medium"
          TextMode="Email"
        ></asp:TextBox>
        <br />
        <br />
        <asp:Label
          ID="LblPassword"
          runat="server"
          Text="Password:"
          Font-Size="Medium"
          ForeColor="Blue"
        ></asp:Label>
        <asp:RequiredFieldValidator
          ID="ReqValPassword"
          runat="server"
          ControlToValidate="TxtPassword"
          ErrorMessage="Password required!"
          ForeColor="Red"
          SetFocusOnError="True"
          >*</asp:RequiredFieldValidator
        >
        &nbsp;&nbsp;
        <asp:TextBox
          ID="TxtPassword"
          runat="server"
          BorderStyle="Solid"
          Font-Size="Medium"
          TextMode="Password"
        ></asp:TextBox>
        <br />
        <asp:RegularExpressionValidator
          ID="RegExpValPassword"
          runat="server"
          ControlToValidate="TxtPassword"
          ErrorMessage="Password must be 5-15 characters long with at least one numeric character."
          ForeColor="Red"
          ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{5,10})$"
        ></asp:RegularExpressionValidator>
        <br />
        <asp:Label
          ID="LblMobileNo"
          runat="server"
          Text="Mobile No:"
          Font-Size="Medium"
          ForeColor="Blue"
        ></asp:Label>
        &nbsp;
        <asp:TextBox
          ID="TxtMobileNo"
          runat="server"
          BorderStyle="Solid"
          Font-Size="Medium"
          TextMode="Phone"
        ></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Button
          ID="BtnSignUp"
          runat="server"
          OnClick="BtnSave_Click"
          Text="Sign Up"
          BorderStyle="Solid"
          Font-Size="Small"
          ForeColor="White"
          BackColor="#000099"
          BorderColor="#000099"
          Width="65px"
        />
        <br />
        <br />
        <asp:Label
          ID="LblSignIn"
          runat="server"
          Font-Size="Small"
          Text="Already have an account?"
        ></asp:Label>
        <asp:LinkButton
          ID="LbLogin"
          runat="server"
          Font-Size="Small"
          PostBackUrl="~/Login.aspx"
          CausesValidation="False"
          >Login</asp:LinkButton
        >
        <br />
        <br />
        <asp:Label
          ID="LblFeedback"
          runat="server"
          ForeColor="#33CC33"
        ></asp:Label>
        <br />
        <asp:Label
          ID="LblRedirect"
          runat="server"
          ForeColor="#33CC33"
        ></asp:Label>
        <br />
      </div>
    </form>
  </body>
</html>
