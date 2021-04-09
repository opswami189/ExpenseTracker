<%@ Page Title="ExpenseTracker - ManageCategory" Language="C#"
MasterPageFile="~/Site1.Master" AutoEventWireup="true"
CodeBehind="ManageCategory.aspx.cs" Inherits="ExpenseTracker.WebForm1" %>
<asp:Content
  ID="Content1"
  ContentPlaceHolderID="MainContentPlaceHolder1"
  runat="server"
>
    <p>
    <asp:Label
      ID="LblAddCategory"
      runat="server"
      Font-Italic="True"
      ForeColor="#00CC00"
      Text="Add Category"
    ></asp:Label>
    <br />
  </p>
  <p>
    <asp:Label
      ID="LblName"
      runat="server"
      Text="Category name:"
      ForeColor="Blue"
    ></asp:Label>
    <asp:RequiredFieldValidator
      ID="ReqValName"
      runat="server"
      ControlToValidate="TxtCategoryType"
      ErrorMessage="Category name Required!"
      ForeColor="Red" ValidationGroup="addCategory"
      >*</asp:RequiredFieldValidator
    >
    &nbsp;&nbsp;
    <asp:TextBox
      ID="TxtCategoryType"
      runat="server"
      BorderColor="Black"
      BorderStyle="Solid"
      Font-Size="Medium"
    ></asp:TextBox>
  </p>
  <p>
    <asp:RegularExpressionValidator
      ID="RegExpValCtgName"
      runat="server"
      ControlToValidate="TxtCategoryType"
      ErrorMessage="Category name must be 2-25 characters long."
      ForeColor="Red"
      ValidationExpression="^([A-Za-z0-9]\s*){2,16}$" ValidationGroup="addCategory"
    ></asp:RegularExpressionValidator>
  </p>
  <asp:ValidationSummary
    ID="ValidationSummary1"
    runat="server"
    DisplayMode="List"
    ForeColor="Red" ValidationGroup="AddCategory"
  />
  <p>
    <asp:Label ID="LblError" runat="server" ForeColor="Red"></asp:Label>
  </p>
  <p>
    <asp:Button
      ID="BtnAdd"
      runat="server"
      OnClick="BtnCategory_Click"
      Text="Add "
      BorderColor="#000099"
      BorderStyle="Solid"
      Font-Size="Medium"
      ForeColor="White"
      BackColor="#000099"
      Width="65px" ValidationGroup="AddCategory"
    />
  </p>
  <p>
    <asp:Label ID="LblMessage" runat="server" ForeColor="#00CC00"></asp:Label>
  </p>
  <p>&nbsp;</p>
  <p>
    <asp:GridView
      ID="GridViewCategories"
      runat="server"
      AutoGenerateColumns="False"
      DataKeyNames="Id"
      DataSourceID="SqlDataCategory"
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
          DataField="CategoryType"
          HeaderText="CategoryType"
          SortExpression="CategoryType"
        />
          <asp:CommandField ShowEditButton="True" />
          <asp:CommandField ShowDeleteButton="True" />
      </Columns>
    </asp:GridView>
    <asp:SqlDataSource
      ID="SqlDataCategory"
      runat="server"
      ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
      SelectCommand="SELECT [Id], [CategoryType] FROM [Category]
                     where UserProfileId = @Id and IsDeleted = 0"
      UpdateCommand ="Update Category set CategoryType = @CategoryType where Id = @Id "
      DeleteCommand ="Update Category set IsDeleted = 1 where Id = @Id"
      >
        <SelectParameters>
            <asp:SessionParameter Name="Id" SessionField="Id" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name ="CategoryType" Type ="String" />
            <asp:Parameter Name ="Id" Type ="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name ="Id" Type ="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
  </p>
  <p></p>
</asp:Content>
