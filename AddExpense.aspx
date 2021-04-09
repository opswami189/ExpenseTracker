<%@ Page Title="ExpenseTracker - ManageExpense" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site1.Master"  CodeBehind="AddExpense.aspx.cs"  Inherits="ExpenseTracker.AddExpense" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server" >

    
        <div>
            <asp:Label ID="LblAddExpense" runat="server" Font-Italic="True" Font-Names="Times New Roman" ForeColor="#00CC00" Text="Add Expense"></asp:Label>
            <br />
            <br />
        </div>
        <asp:Label ID="LblDate" runat="server" Text="Date:" ForeColor="Blue"></asp:Label>
        <asp:RequiredFieldValidator ID="ReqValDate" runat="server" ErrorMessage="Date Required!" ForeColor="Red" ControlToValidate="TxtDate" SetFocusOnError="True">*</asp:RequiredFieldValidator>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TxtDate" runat="server" TextMode="Date" BorderColor="Black" BorderStyle="Solid" Font-Size="Medium" ></asp:TextBox>
        <br />
        <p>
            <asp:Label ID="LblAmount" runat="server" Text="Amount:" ForeColor="Blue"></asp:Label>
            <asp:RequiredFieldValidator ID="ReqValAmount" runat="server" ErrorMessage="Amount Required!" ForeColor="Red" ControlToValidate="TxtAmount" SetFocusOnError="True">*</asp:RequiredFieldValidator>
            &nbsp; <asp:TextBox ID="TxtAmount" placeholder="Enter amount" runat="server" BorderColor="Black" BorderStyle="Solid" Font-Size="Small"  ></asp:TextBox>
        &nbsp;</p>
        <p>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtAmount" ForeColor="Red" MaximumValue="infinite" MinimumValue="0.01" SetFocusOnError="True">* Amount must be greater than zero</asp:RangeValidator>
        </p>
        <p>
            <asp:Label ID="LblCategory" runat="server" Text="Category:" ForeColor="Blue"></asp:Label>
            <asp:RequiredFieldValidator ID="ReqValCategory" runat="server" ErrorMessage="Category Required!" ForeColor="Red" ControlToValidate="DropDownCategory" InitialValue="--Select--" SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:DropDownList ID="DropDownCategory" runat="server" DataSourceID="SqlDataSourceCategory" DataTextField="CategoryType" DataValueField="Id" Font-Size="Small" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Selected="True">--Select--</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="LblCheckBox" runat="server" Text="IsCredit:" ForeColor="Blue"></asp:Label>
&nbsp;&nbsp; <asp:CheckBox ID="CheckBoxIsCredit" runat="server" />
        </p>
        <p>
            <asp:Label ID="LblBeneficiary" runat="server" Text="Beneficiary:" ForeColor="Blue"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownBeneficiary" runat="server" DataSourceID="SqlDataSourceBeneficiary" DataTextField="Name" DataValueField="Id" AppendDataBoundItems="True">
                <asp:ListItem Selected="True">--Select--</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceBeneficiary" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [Beneficiary]"></asp:SqlDataSource>
        </p>
        <p>
            <asp:Label ID="LblMode" runat="server" Text="Mode:" ForeColor="Blue"></asp:Label>
            <asp:RequiredFieldValidator ID="ReqValMode" runat="server" ErrorMessage="Mode Required!" ForeColor="Red" ControlToValidate="DropDownMode" InitialValue="--Select--" SetFocusOnError="True" Display="Dynamic">*</asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
            <asp:DropDownList ID="DropDownMode" runat="server" DataSourceID="SqlDataSourceMode" DataTextField="Mode" DataValueField="Id" AppendDataBoundItems="True">
                <asp:ListItem>--Select--</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSourceMode" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand="SELECT * FROM [PaymentMode]"></asp:SqlDataSource>
        </p>
        <p>
        <asp:Label ID="LblDetails" runat="server" Text="Details:" ForeColor="Blue"></asp:Label>
&nbsp;
        <asp:TextBox ID="TxtDetails" placeholder="Enter details" runat="server" BorderColor="Black" BorderStyle="Solid"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
        </p>
        <asp:ValidationSummary ID="ValSummaryAddExpense" runat="server" DisplayMode="List" ForeColor="Red" Height="38px" />
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="BtnAdd" runat="server" OnClick="BtnSave_Click" Text="Add" BorderColor="#000099" BorderStyle="Solid" ForeColor="White" BackColor="#000099" Font-Size="Medium" Width="65px" />
        </p>
        <p>
            <asp:Label ID="LblMessage" runat="server" ForeColor="#00CC00"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
   

    </asp:Content>