<%@ Page Title="ExpenseTracker - ManageBeneficiary" Language="C#"
    MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="ManageBeneficiary.aspx.cs" Inherits="ExpenseTracker.AddBeneficiary" %>

<asp:Content
    ID="Content1"
    ContentPlaceHolderID="MainContentPlaceHolder1"
    runat="server">
    <p>
        <asp:Label
            ID="LblAddBeneficiary"
            runat="server"
            Font-Italic="True"
            ForeColor="#00CC00"
            Text="Add Beneficiary"></asp:Label>
    </p>
    <p>
        <asp:Label
            ID="LblBName"
            runat="server"
            Text="Name:"
            Font-Size="Medium"
            ForeColor="Blue"></asp:Label>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator1"
            runat="server"
            ControlToValidate="TxtName"
            ErrorMessage="Name Required!"
            ForeColor="Red"
            SetFocusOnError="True"
            ValidateRequestMode="Enabled" ValidationGroup="addBeneficiary">*</asp:RequiredFieldValidator>
        &nbsp;
    <asp:TextBox
        ID="TxtName"
        runat="server"
        BorderColor="Black"
        BorderStyle="Solid"
        Font-Size="Medium">
    </asp:TextBox>
        &nbsp;
    </p>
    <p>
        <asp:RegularExpressionValidator
            ID="RegExpValName"
            runat="server"
            ControlToValidate="TxtName"
            ErrorMessage="Name must be 2-25 characters long."
            ForeColor="Red"
            ValidationExpression="^([A-Za-z0-9]\s*){2,25}$" ValidationGroup="addBeneficiary"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label
            ID="LblBMobile"
            runat="server"
            Text="Mobile:"
            Font-Size="Medium"
            ForeColor="Blue"></asp:Label>
        &nbsp;
    <asp:TextBox
        ID="TxtMobileNo"
        runat="server"
        BorderColor="Black"
        BorderStyle="Solid"
        Font-Size="Medium">
    </asp:TextBox>
    </p>
    <asp:ValidationSummary
        ID="ValidationSummary1"
        runat="server"
        DisplayMode="List"
        ForeColor="Red" ValidationGroup="addBeneficiary" />
    <p>
        <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:Button
            ID="BtnAdd"
            runat="server"
            Text="Add"
            OnClick="BtnSave_Click"
            BorderColor="#000099"
            BorderStyle="Solid"
            Font-Size="Medium"
            ForeColor="White"
            BackColor="#000099"
            ValidateRequestMode="Enabled"
            Width="65px" ValidationGroup="addBeneficiary" />
    </p>
    <p>
        <asp:Label ID="LblMessage" runat="server" ForeColor="#00CC00"></asp:Label>
    </p>
    <p>&nbsp;</p>
    <p>Beneficiary List</p>
    <p style="text-align: center">
        <asp:GridView
            ID="GridViewBeneficiaries"
            runat="server"
            AutoGenerateColumns="False"
            DataKeyNames="Id"
            DataSourceID="SqlDataBeneficiary"
            HorizontalAlign="Center">
            <columns>
        <asp:BoundField
          DataField="Id"
          HeaderText="Id"
          InsertVisible="False"
          ReadOnly="True"
          SortExpression="Id"
        />
          <asp:TemplateField HeaderText="Name" SortExpression="Name" ConvertEmptyStringToNull="False">
              <EditItemTemplate>
                  </asp:Label>
    <asp:RequiredFieldValidator
      ID="RequiredFieldValidatorGrid"
      runat="server"
      ControlToValidate="TextNameGrid"
      ErrorMessage="Name Required!"
      ForeColor="Red"
      SetFocusOnError="True"
      ValidateRequestMode="Enabled" ValidationGroup="UpdateNameGrid"
      >*</asp:RequiredFieldValidator
    ><asp:TextBox ID="TextNameGrid" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
              </EditItemTemplate>
              <ItemTemplate>
                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
              </ItemTemplate>
          </asp:TemplateField>
        <asp:BoundField
          DataField="MobileNo"
          HeaderText="MobileNo"
          SortExpression="MobileNo"
        />
          <asp:CommandField ShowEditButton="True" />
          <asp:CommandField ShowDeleteButton="True" />
                <asp:TemplateField></asp:TemplateField>
      </columns>
            
        </asp:GridView>
        <asp:SqlDataSource
            ID="SqlDataBeneficiary"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
            SelectCommand="SELECT [Id], [Name], [MobileNo] FROM [Beneficiary]
                     where UserProfileId = @Id and IsDeleted = 0"
            UpdateCommand="Update Beneficiary set Name = @Name, MobileNo = @MobileNo where Id = @Id "
            DeleteCommand=" Update Beneficiary set IsDeleted = 1 where Id = @Id">
            <selectparameters>
            <asp:SessionParameter Name="Id" SessionField="Id" />
        </selectparameters>
            <updateparameters>
            <asp:Parameter Name ="Name" Type ="String" />
            <asp:Parameter Name ="MobileNo" Type ="String" />
            <asp:Parameter Name ="Id" Type ="Int32" />
        </updateparameters>
            <deleteparameters>
            <asp:Parameter Name ="Id" Type ="Int32" />
        </deleteparameters>
        </asp:SqlDataSource>
    <asp:ValidationSummary
        ID="ValidationSummaryGrid"
        runat="server"
        DisplayMode="List"
        ForeColor="Red" ValidationGroup="UpdateNameGrid" />
    </asp:Content>
