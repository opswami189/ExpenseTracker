<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewPayments.aspx.cs" MasterPageFile="~/Site1.Master" Inherits="ExpenseTracker.ViewPayments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder1" runat="server">

    <div style="text-align: center">
        &nbsp;Payment Details<br />
        &nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" BorderStyle="Solid" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Height="228px"  HorizontalAlign="Center"> 
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" SortExpression="TransactionDate" />
                <asp:BoundField DataField="Month Name" HeaderText="Month Name" ReadOnly="True" SortExpression="Month Name" />
                <asp:BoundField DataField="Mode" HeaderText="Mode" SortExpression="Mode" />
                <asp:BoundField DataField="CategoryType" HeaderText="CategoryType" SortExpression="CategoryType" />
                <asp:CheckBoxField DataField="IsCredit" HeaderText="IsCredit" SortExpression="IsCredit" />
                <asp:BoundField DataField="PaymentDetails" HeaderText="PaymentDetails" SortExpression="PaymentDetails" />
                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                <asp:BoundField DataField="BeneficiaryName" HeaderText="BeneficiaryName" SortExpression="BeneficiaryName" />
                <asp:BoundField DataField="MobileNo" HeaderText="MobileNo" SortExpression="MobileNo" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>" SelectCommand=
        "select p.Id,
                p.TransactionDate,
		        DATENAME(month,p.TransactionDate) AS 'Month Name',
		        pm.Mode,
		        ct.CategoryType,
		        p.IsCredit,
		        p.PaymentDetails,
		        p.Amount,
                b.name as BeneficiaryName,
                b.MobileNo
          from Payment as p 
          join PaymentMode as pm on p.PaymentModeId = pm.Id
          join Category as ct on p.CategoryId = ct.Id
          left join beneficiary as b on p.beneficiaryid = b.id
          where p.userprofileid = @userId ">
          
          <SelectParameters>
             <asp:SessionParameter Name="userId" SessionField="id" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>

        <br />
    </div>

</asp:Content>

