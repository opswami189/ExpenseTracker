<%@ Page Title="ExpenseTracker - ManagePaymentMode" Language="C#"
MasterPageFile="~/Site1.Master" AutoEventWireup="true"
CodeBehind="ManagePaymentMode.aspx.cs" Inherits="ExpenseTracker.WebForm2" %>
<asp:Content
  ID="Content1"
  ContentPlaceHolderID="MainContentPlaceHolder1"
  runat="server"
>
    <p>
    <asp:Label
      ID="LblAddPaymentMode"
      runat="server"
      Font-Italic="True"
      ForeColor="#00CC00"
      Text="Add PaymentMode"
    ></asp:Label>
    <br />
  </p>
  <p>
    <asp:Label
      ID="LblMode"
      runat="server"
      Text="Mode:"
      ForeColor="Blue"
    ></asp:Label>
    <asp:RequiredFieldValidator
      ID="ReqValMode"
      runat="server"
      ControlToValidate="TxtMode"
      ErrorMessage="Mode name required!"
      ForeColor="Red" ValidationGroup="addmode"
      >*</asp:RequiredFieldValidator
    >
    &nbsp;<asp:TextBox
      ID="TxtMode"
      runat="server"
      BorderColor="Black"
      BorderStyle="Solid"
      Font-Size="Medium"
    ></asp:TextBox>
  </p>
  <p>
    <asp:RegularExpressionValidator
      ID="RegExpValMode"
      runat="server"
      ControlToValidate="TxtMode"
      ErrorMessage="Mode name must be 2-10 characters long."
      ForeColor="Red"
      ValidationExpression="^([A-Za-z0-9]\s*){2,16}$" ValidationGroup="addmode"
    ></asp:RegularExpressionValidator>
  </p>
  <asp:ValidationSummary
    ID="ValidationSummary1"
    runat="server"
    DisplayMode="List"
    ForeColor="Red" ValidationGroup="addmode"
  />
  <p>
    <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
  </p>
  <p></p>
  <p>
    <asp:Button
      ID="BtnAdd"
      runat="server"
      OnClick="BtnSave_Click"
      Text="Add"
      BorderColor="#000099"
      BorderStyle="Solid"
      Font-Size="Medium"
      ForeColor="White"
      BackColor="#000099"
      Width="65px" ValidationGroup="addmode"
    />
  </p>
  <p>
    <asp:Label ID="LblMessage" runat="server" ForeColor="#00CC00"></asp:Label>
  </p>
  <p>
    <asp:GridView
      ID="GridViewModes"
      runat="server"
      AutoGenerateColumns="False"
      DataKeyNames="Id"
      DataSourceID="SqlDataPaymentMode"
      HorizontalAlign="Center"
    >
      <Columns>
        <asp:BoundField
          DataField="Id"
          HeaderText="Id"
          InsertVisible="False"
          ReadOnly="True"
          SortExpression="Id"
        />
        <asp:BoundField
          DataField="Mode"
          HeaderText="Mode"
          SortExpression="Mode"
        />
          <asp:CommandField ShowEditButton="True" />
          <asp:CommandField ShowDeleteButton="True" />
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource
      ID="SqlDataPaymentMode"
      runat="server"
      ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
      SelectCommand="SELECT [Id], [Mode] FROM [PaymentMode]
                    where UserProfileId = @Id and IsDeleted = 0"
      UpdateCommand ="Update PaymentMode set Mode = @Mode where Id = @Id "
      DeleteCommand ="Update PaymentMode set IsDeleted = 1 where Id = @Id"
      >
        <SelectParameters>
            <asp:SessionParameter Name="Id" SessionField="Id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name ="Mode" Type ="String" />
            <asp:Parameter Name ="Id" Type ="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name ="Id" Type ="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
  </p>
  <p>&nbsp;</p>
</asp:Content>
