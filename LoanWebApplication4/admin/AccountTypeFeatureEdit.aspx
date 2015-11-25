<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Site.Master" AutoEventWireup="true" CodeBehind="AccountTypeFeatureEdit.aspx.cs" Inherits="LoanWebApplication4.admin.AccountTypeFeatureEdit" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
            width: 444px;
        }
        .style3
        {
            width: 182px;
        }
        .style4
        {
            color: #F17B1B;
        }
        .style6
        {
            width: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
    <asp:Label ID="lblActionType" runat="server" ></asp:Label> 
    &nbsp;Account Type Feature - 
    <asp:Label ID="lblAccountTypeName" runat="server" ></asp:Label>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</h1>
<hr />

<br />
<div class="DataSection">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table style="width:100%;">
        <tr>
            <td class="style3">
                Feature Description:</td>
            <td class="style2">
                <asp:TextBox ID="txtFeatureDescription" runat="server" 
                    style="margin-bottom: 0px" Width="300px"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
            <tr>
                <td class="style3">
                    Calculation Type:</td>
                <td class="style2">
                    <asp:RadioButton ID="rbtnIsDeduction" runat="server" GroupName="calcType" 
                        Text="Deducation" />
                    &nbsp;<asp:RadioButton ID="rbtnAddition" runat="server" GroupName="calcType" 
                        Text="Interest" />
                </td>
                <td class="style6">
                    &nbsp;</td>
                <td>
                    <asp:CheckBox ID="chkRunByEndOfDay" runat="server" Text="Run by end of day" />
                </td>
            </tr>
        <tr>
            <td class="style3" valign="top">
                Percentage/Fixed:</td>
            <td class="style2">
                <asp:RadioButtonList ID="rbtnListPercentageOrFixed" runat="server" 
                    onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                    AutoPostBack="True">
                    <asp:ListItem>Percentage</asp:ListItem>
                    <asp:ListItem>Fixed</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" ></asp:Label>
&nbsp;Value:</td>
            <td class="style2">
                <asp:TextBox ID="txtValueToApply" runat="server" Width="300px"></asp:TextBox>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr  runat="server" id="calculateOnRow" >
            <td class="style3" valign="top">
                Calculate On:</td>
            <td class="style2">
                <asp:DropDownList ID="cboCalculateOn" runat="server" 
                    DataSourceID="CalculateOnSqlDataSource" DataTextField="Description" 
                    DataValueField="AccountTypeFeaturesCalculateOnID" Width="300px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="CalculateOnSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                    SelectCommand="SELECT * FROM [AccountTypeFeaturesCalculateOn] ORDER BY [Description]">
                </asp:SqlDataSource>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Calculation Frequency:</td>
            <td class="style2">
                <asp:DropDownList ID="cboCalulationFreq" runat="server" 
                    DataSourceID="FeatureCalculationFreqSqlDataSource" DataTextField="Description" 
                    DataValueField="AccountFeatureFreqOfCalculationID" Width="300px" 
                    AutoPostBack="True" 
                    onselectedindexchanged="cboCalulationFreq_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="FeatureCalculationFreqSqlDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:FinanceManagerConnectionString %>" 
                    SelectCommand="SELECT * FROM [AccountFeatureFreqOfCalculation] ORDER BY [AccountFeatureFreqOfCalculationID]">
                </asp:SqlDataSource>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1" colspan="2" valign="top">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="CustomFreqView" runat="server">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="style3">Custom Interval <span class="style4">(In days) </span>:
                                </td>
                                 <td>
                                     &nbsp;<asp:TextBox ID="txtCustomInterval" runat="server" Width="300px"></asp:TextBox>
                                     <%-- <asp:NumericUpDownExtender ID="ctl82_NumericUpDownExtender" runat="server" 
                                         Enabled="True" Maximum="1.7976931348623157E+308" 
                                         Minimum="-1.7976931348623157E+308" RefValues="" ServiceDownMethod="" 
                                         ServiceDownPath="" ServiceUpMethod="" Tag="" TargetButtonDownID="" 
                                         TargetButtonUpID="" TargetControlID="txtCustomInterval" Width="0">
                                     </asp:NumericUpDownExtender>--%>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="AnnualFreqView" runat="server">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="style3">
                                    Month:</td><td>
                                    &nbsp;<asp:DropDownList ID="cboAnnualMonth" runat="server" Width="300px" 
                                        AutoPostBack="True" 
                                        onselectedindexchanged="cboAnnualMonth_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Day Of Month:</td>
                                <td>
                                    &nbsp;<asp:DropDownList ID="cboAnnualDayOfMonth" runat="server" Width="300px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="MonthlyFreqView" runat="server">
                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="style3">
                                    Day Of Month:</td>
                                <td>
                                    &nbsp;<asp:DropDownList ID="cboDayOfMonth" runat="server" AppendDataBoundItems="True" 
                                        Width="300px">
                                        <asp:ListItem Value="1000">Last Day of Month</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>26</asp:ListItem>
                                        <asp:ListItem>27</asp:ListItem>
                                        <asp:ListItem>28</asp:ListItem>
                                        <asp:ListItem>29</asp:ListItem>
                                        <asp:ListItem>30</asp:ListItem>
                                        <asp:ListItem>31</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
            <tr>
                <td class="style1"  valign="top">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Save" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                </td><td class="style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
    </table>

    </ContentTemplate>
    </asp:UpdatePanel>

</div>
    </asp:Content>
