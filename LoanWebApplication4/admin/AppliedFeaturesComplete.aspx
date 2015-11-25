<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="AppliedFeaturesComplete.aspx.cs" Inherits="LoanWebApplication4.admin.AppliedFeaturesComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Applied Account Type Features</h1>
    <hr />

    Apply Account Type Features completed successfully. The following were skipped
   (<asp:Label ID="lblFailCount" runat="server" Text="0"></asp:Label>)
    <br /><br />

    <asp:Panel runat="server" id="panelFailMessages">

   
    <asp:DataList ID="DataList1" Width="100%" runat="server" 
            DataKeyField="FailMessageId" DataSourceID="FailMessagesSqlDataSource" 
            onitemdatabound="DataList1_ItemDataBound">
        <ItemTemplate>
        <div class="errorDiv">
            Message:
            <asp:Label ID="MessageLabel" runat="server" Text='<%# Eval("Message") %>' />
            <br />
          </div>
        </ItemTemplate>
    </asp:DataList>
   <br />
        <asp:LinkButton  CssClass="button" Text="View Report" runat="server" 
            onclick="Unnamed1_Click" />
        <asp:SqlDataSource ID="FailMessagesSqlDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
            SelectCommand="SELECT * FROM [FailMessages]" 
            onselected="FailMessagesSqlDataSource_Selected"></asp:SqlDataSource>
     </asp:Panel>
</asp:Content>
