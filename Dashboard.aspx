<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master"
AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs"
Inherits="ExpenseTracker.Dashboard" %>

<asp:Content
  ID="Content1"
  ContentPlaceHolderID="MainContentPlaceHolder1"
  runat="server"
>
    <div style="text-align: center">
    <p>
      <br />
      <asp:Label
        ID="LblCurrentMExpense"
        runat="server"
        ForeColor="Blue"
        Text="Current Month Expenses"
        Font-Size="Large"
      ></asp:Label>
    </p>
    <p>
      <asp:GridView
        ID="GridView1"
        runat="server"
        DataSourceID="CurrentMonthData"
        AutoGenerateColumns="False"
        HorizontalAlign="Center"
        OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
        Height="39px"
        Width="206px"
      >
        <columns>
          <asp:BoundField
            DataField="CategoryType"
            HeaderText="CategoryType"
            SortExpression="CategoryType"
          />
          <asp:BoundField
            DataField="Total_Amt"
            HeaderText="Total_Amt"
            SortExpression="Total_Amt"
            ReadOnly="True"
          />
            <asp:CheckBoxField DataField="IsCredit" HeaderText="IsCredit" SortExpression="IsCredit" />
        </columns>
        <rowstyle horizontalalign="Center" />
      </asp:GridView>

      <asp:Chart
        ID="ChartCMC"
        runat="server"
        DataSourceID="CurrentMonthCredit"
        BorderlineColor="Transparent"
        HorizontalAlign="left"
        Height="250px"
      >
       <Titles>
        <asp:Title Font="Times New Roman, 12pt, style=Bold, Italic" Name="Title1" 
            Text="Credit" >
        </asp:Title>
      </Titles>
        <series>
          <asp:Series
            ChartType="Pie"
            Name="Series1"
            Legend="Legend1"
            ChartArea="ChartArea1"
            XValueMember="CategoryType"
            YValueMembers="Total_Amt"
          >
          </asp:Series>
        </series>
        <chartareas>
          <asp:ChartArea Name="ChartArea1"> </asp:ChartArea>
        </chartareas>
        <legends>
          <asp:Legend
            Alignment="Center"
            Docking="Bottom"
            LegendStyle="Row"
            Name="Legend1"
          >
          </asp:Legend>
        </legends>
      </asp:Chart>

      &nbsp;<asp:Chart
        ID="ChartCMD"
        runat="server"
        DataSourceID="CurrentMonthDebit"
        BorderlineColor="Transparent"
        HorizontalAlign="right"
        Height="250px"
      >
          <Titles>
        <asp:Title Font="Times New Roman, 12pt, style=Bold, Italic" Name="Title1" 
            Text="Debit" >
        </asp:Title>
      </Titles>
        <series>
          <asp:Series
            ChartType="Pie"
            Name="Series1"
            Legend="Legend1"
            ChartArea="ChartArea1"
            XValueMember="CategoryType"
            YValueMembers="Total_Amt"
          >
          </asp:Series>
        </series>
        <chartareas>
          <asp:ChartArea Name="ChartArea1"> </asp:ChartArea>
        </chartareas>
        <legends>
          <asp:Legend
            Alignment="Center"
            Docking="Bottom"
            LegendStyle="Row"
            Name="Legend1"
          >
          </asp:Legend>
        </legends>
      </asp:Chart>

      <asp:SqlDataSource
        ID="CurrentMonthData"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
        SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt,
                p.IsCredit
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @id AND month(TransactionDate) = month(GETDATE()) 
GROUP BY CategoryType, IsCredit
ORDER BY Total_Amt desc"
      >
        <selectparameters>
          <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
        </selectparameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource
        ID="CurrentMonthCredit"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
        SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt
				
               
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @Id and iscredit = 'true'  AND month(TransactionDate) = month(GETDATE()) 
GROUP BY CategoryType
ORDER BY Total_Amt desc"
      >
        <SelectParameters>
          <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
        </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource
        ID="CurrentMonthDebit"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
        SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt
				
               
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @Id and iscredit = 'false'  AND month(TransactionDate) = month(GETDATE()) 
GROUP BY CategoryType
ORDER BY Total_Amt desc"
      >
        <SelectParameters>
          <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
        </SelectParameters>
      </asp:SqlDataSource>
    </p>
    <p>
      <asp:Label
        ID="LblPrevMonthExps"
        runat="server"
        ForeColor="Blue"
        Text="Previous Month Expenses"
        Font-Size="Large"
      ></asp:Label>
    </p>
    <asp:GridView
      ID="GridView4"
      runat="server"
      DataSourceID="PreviousMonthData"
      AutoGenerateColumns="False"
      HorizontalAlign="Center"
      OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
      Height="39px"
      Width="206px"
    >
      <columns>
        <asp:BoundField
          DataField="CategoryType"
          HeaderText="CategoryType"
          SortExpression="CategoryType"
        />
        <asp:BoundField
          DataField="Total_Amt"
          HeaderText="Total_Amt"
          ReadOnly="True"
          SortExpression="Total_Amt"
        />
          <asp:CheckBoxField DataField="IsCredit" HeaderText="IsCredit" SortExpression="IsCredit" />
      </columns>
      <rowstyle horizontalalign="Center" />
    </asp:GridView>

    <asp:Chart
      ID="ChartPMC"
      runat="server"
      DataSourceID="PreviousMonthCredit"
      BorderlineColor="Transparent"
      HorizontalAlign="left"
      Height="250px"
    >
        <Titles>
        <asp:Title Font="Times New Roman, 12pt, style=Bold, Italic" Name="Title1" 
            Text="Credit" >
        </asp:Title>
      </Titles>
      <series>
        <asp:Series
          ChartType="Pie"
          Name="Series1"
          Legend="Legend1"
          ChartArea="ChartArea1"
          XValueMember="CategoryType"
          YValueMembers="Total_Amt"
        >
        </asp:Series>
      </series>
      <chartareas>
        <asp:ChartArea Name="ChartArea1"> </asp:ChartArea>
      </chartareas>
      <legends>
        <asp:Legend
          Alignment="Center"
          Docking="Bottom"
          LegendStyle="Row"
          Name="Legend1"
        >
        </asp:Legend>
      </legends>
    </asp:Chart>

    <asp:Chart
      ID="ChartPMD"
      runat="server"
      DataSourceID="PreviousMonthDebit"
      BorderlineColor="Transparent"
      HorizontalAlign="right"
      Height="250px"
    >
        <Titles>
        <asp:Title Font="Times New Roman, 12pt, style=Bold, Italic" Name="Title1" 
            Text="Debit" >
        </asp:Title>
      </Titles>
      <series>
        <asp:Series
          ChartType="Pie"
          Name="Series1"
          Legend="Legend1"
          ChartArea="ChartArea1"
          XValueMember="CategoryType"
          YValueMembers="Total_Amt"
        >
        </asp:Series>
      </series>
      <chartareas>
        <asp:ChartArea Name="ChartArea1"> </asp:ChartArea>
      </chartareas>
      <legends>
        <asp:Legend
          Alignment="Center"
          Docking="Bottom"
          LegendStyle="Row"
          Name="Legend1"
        >
        </asp:Legend>
      </legends>
    </asp:Chart>

    <asp:SqlDataSource
      ID="PreviousMonthData"
      runat="server"
      ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
      SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt,
                p.IsCredit
				
               
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @Id AND month(TransactionDate) = month(GETDATE())-1 
GROUP BY CategoryType, IsCredit
ORDER BY Total_Amt desc"
    >
      <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
      </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource
      ID="PreviousMonthCredit"
      runat="server"
      ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
      SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt
				
               
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @Id and iscredit = 'true'  AND month(TransactionDate) = month(GETDATE())-1 
GROUP BY CategoryType
ORDER BY Total_Amt desc"
    >
      <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
      </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource
      ID="PreviousMonthDebit"
      runat="server"
      ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
      SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt
				
               
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @Id and iscredit = 'false'  AND month(TransactionDate) = month(GETDATE())-1 
GROUP BY CategoryType
ORDER BY Total_Amt desc"
    >
      <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
      </SelectParameters>
    </asp:SqlDataSource>

    <p>
      <asp:Label
        ID="LblCurYearExpenses"
        runat="server"
        ForeColor="Blue"
        Text="Current Year Expenses"
        Font-Size="Large"
      ></asp:Label>
    </p>
    <asp:GridView
      ID="GridView5"
      runat="server"
      DataSourceID="CurrentYearData"
      AutoGenerateColumns="False"
      HorizontalAlign="Center"
      OnSelectedIndexChanged="GridView1_SelectedIndexChanged"
      Height="39px"
      Width="206px"
    >
      <columns>
        <asp:BoundField
          DataField="CategoryType"
          HeaderText="CategoryType"
          SortExpression="CategoryType"
        />
        <asp:BoundField
          DataField="Total_Amt"
          HeaderText="Total_Amt"
          ReadOnly="True"
          SortExpression="Total_Amt"
        />
          <asp:CheckBoxField DataField="IsCredit" HeaderText="IsCredit" SortExpression="IsCredit" />
      </columns>
      <rowstyle horizontalalign="Center" />
    </asp:GridView>

    <asp:Chart
      ID="ChartCYC"
      runat="server"
      DataSourceID="CurrentYearCredit"
      BorderlineColor="Transparent"
      HorizontalAlign="left"
      Height="250px"
    >
        <Titles>
        <asp:Title Font="Times New Roman, 12pt, style=Bold, Italic" Name="Title1" 
            Text="Credit" >
        </asp:Title>
      </Titles>
      <series>
        <asp:Series
          ChartType="Pie"
          Name="Series1"
          Legend="Legend1"
          ChartArea="ChartArea1"
          XValueMember="CategoryType"
          YValueMembers="Total_Amt"
        >
        </asp:Series>
      </series>
      <chartareas>
        <asp:ChartArea Name="ChartArea1"> </asp:ChartArea>
      </chartareas>
      <legends>
        <asp:Legend
          Alignment="Center"
          Docking="Bottom"
          LegendStyle="Row"
          Name="Legend1"
        >
        </asp:Legend>
      </legends>
    </asp:Chart>

    <asp:Chart
      ID="ChartCYD"
      runat="server"
      DataSourceID="CurrentYearDebit"
      BorderlineColor="Transparent"
      HorizontalAlign="right"
      Height="250px"
    >
        <Titles>
        <asp:Title Font="Times New Roman, 12pt, style=Bold, Italic" Name="Title1" 
            Text="Debit" >
        </asp:Title>
      </Titles>
      <series>
        <asp:Series
          ChartType="Pie"
          Name="Series1"
          Legend="Legend1"
          ChartArea="ChartArea1"
          XValueMember="CategoryType"
          YValueMembers="Total_Amt"
        >
        </asp:Series>
      </series>
      <chartareas>
        <asp:ChartArea Name="ChartArea1"> </asp:ChartArea>
      </chartareas>
      <legends>
        <asp:Legend
          Alignment="Center"
          Docking="Bottom"
          LegendStyle="Row"
          Name="Legend1"
        >
        </asp:Legend>
      </legends>
    </asp:Chart>

    <asp:SqlDataSource
      ID="CurrentYearData"
      runat="server"
      ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
      SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt,
                p.IsCredit
				
               
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @Id AND year(TransactionDate) = year(GETDATE()) 
GROUP BY CategoryType, IsCredit
ORDER BY Total_Amt desc"
    >
      <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
      </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource
      ID="CurrentYearCredit"
      runat="server"
      ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
      SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt
				
               
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @Id and iscredit = 'true'  AND year(TransactionDate) = year(GETDATE()) 
GROUP BY CategoryType
ORDER BY Total_Amt desc"
    >
      <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
      </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource
      ID="CurrentYearDebit"
      runat="server"
      ConnectionString="<%$ ConnectionStrings:ExpenseTrackerConnectionString %>"
      SelectCommand="select 
		        ct.CategoryType,
		        SUM(p.Amount) as Total_Amt
				
               
from Payment as p 
join Category as ct on p.CategoryId = ct.Id
where p.UserProfileId = @Id and iscredit = 'false'  AND year(TransactionDate) = year(GETDATE()) 
GROUP BY CategoryType
ORDER BY Total_Amt desc"
    >
      <SelectParameters>
        <asp:SessionParameter Name="Id" SessionField="Id" Type="String" />
      </SelectParameters>
    </asp:SqlDataSource>

    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </div>
</asp:Content>
