<%@ Page Title="" Language="C#" MasterPageFile="~/admin/DefaultPageSite.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="LoanWebApplication4.admin.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.cookie.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.jscrollpane.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.jscrollpane.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.mousewheel.js" type="text/javascript"></script>
    <link href="../Styles/jquery.jscrollpane.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/blue.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        $(document).ready(function ($) {
            var sectionHeights = ($(window).height() - 170) / 2;
            var sectionWidths = ($(document).width() - 60) / 2;
            $('#firstSection').height(sectionHeights); /* */
            $('#secondSection').height(sectionHeights); /* */
            $('#thirdSection').height(sectionHeights); /* */
            $('#fourthSection').height(sectionHeights); /* */

            $('#firstSection').width(sectionWidths); /* */
            $('#secondSection').width(sectionWidths); /* */
            $('#thirdSection').width(sectionWidths); /* */
            $('#fourthSection').width(sectionWidths); /* */
        });

        $(function () {
            $('#firstSection').each(
        		function () {
        		    $(this).jScrollPane(
        				{
        				    showArrows: $(this).is('.arrow')
        				}
        			);

        		    var api = $(this).data('jsp');
        		    var throttleTimeout;
        		    $(window).bind(
        				'resize',
        				function () {

        				    if ($.browser.msie) {


        				        // IE fires multiple resize events while you are dragging the browser window which
        				        // causes it to crash if you try to update the scrollpane on every one. So we need
        				        // to throttle it to fire a maximum of once every 50 milliseconds...
        				        if (!throttleTimeout) {
        				            throttleTimeout = setTimeout(
        								function () {
        								    api.reinitialise();
        								    throttleTimeout = null;
        								},
        								50
        							);
        				        }
        				    } else {
        				        api.reinitialise();
        				    }
        				}
        			);
        		}
        )
        });


        $(function () {
            $('#secondSection').each(
        		function () {
        		    $(this).jScrollPane(
        				{
        				    showArrows: $(this).is('.arrow')
        				}
        			);

        		    var api = $(this).data('jsp');
        		    var throttleTimeout;
        		    $(window).bind(
        				'resize',
        				function () {

        				    if ($.browser.msie) {


        				        // IE fires multiple resize events while you are dragging the browser window which
        				        // causes it to crash if you try to update the scrollpane on every one. So we need
        				        // to throttle it to fire a maximum of once every 50 milliseconds...
        				        if (!throttleTimeout) {
        				            throttleTimeout = setTimeout(
        								function () {
        								    api.reinitialise();
        								    throttleTimeout = null;
        								},
        								50
        							);
        				        }
        				    } else {
        				        api.reinitialise();
        				    }
        				}
        			);
        		}
        )
    });





    $(function () {
        $('#thirdSection').each(
        		function () {
        		    $(this).jScrollPane(
        				{
        				    showArrows: $(this).is('.arrow')
        				}
        			);

        		    var api = $(this).data('jsp');
        		    var throttleTimeout;
        		    $(window).bind(
        				'resize',
        				function () {

        				    if ($.browser.msie) {


        				        // IE fires multiple resize events while you are dragging the browser window which
        				        // causes it to crash if you try to update the scrollpane on every one. So we need
        				        // to throttle it to fire a maximum of once every 50 milliseconds...
        				        if (!throttleTimeout) {
        				            throttleTimeout = setTimeout(
        								function () {
        								    api.reinitialise();
        								    throttleTimeout = null;
        								},
        								50
        							);
        				        }
        				    } else {
        				        api.reinitialise();
        				    }
        				}
        			);
        		}
        )
    });


    $(function () {
        $('#fourthSection').each(
        		function () {
        		    $(this).jScrollPane(
        				{
        				    showArrows: $(this).is('.arrow')
        				}
        			);

        		    var api = $(this).data('jsp');
        		    var throttleTimeout;
        		    $(window).bind(
        				'resize',
        				function () {

        				    if ($.browser.msie) {


        				        // IE fires multiple resize events while you are dragging the browser window which
        				        // causes it to crash if you try to update the scrollpane on every one. So we need
        				        // to throttle it to fire a maximum of once every 50 milliseconds...
        				        if (!throttleTimeout) {
        				            throttleTimeout = setTimeout(
        								function () {
        								    api.reinitialise();
        								    throttleTimeout = null;
        								},
        								50
        							);
        				        }
        				    } else {
        				        api.reinitialise();
        				    }
        				}
        			);
        		}
        )
    });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 100%;z-index:0;overflow:hidden">
        <div style="float: left;z-index:8 " id="firstSection">
            <h3 style="float: left">
                Deposits Today</h3>
            <div style="float: right; font-weight: 700;">
                <asp:Literal ID="litDepositsTotal" runat="server"></asp:Literal></div>
            <br style="clear: both" />
            <div style="height: 2px; border-bottom: 1px solid gray">
            </div>
            <br />
            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="mainLink">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td>
                                    <img alt="Deposit" src="../images/status_blue.png" />
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" style="margin-left: 10px; width: 100%">
                                        <tr>
                                            <td>
                                                <b>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("MemberName")  %>' /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# "Amount: " + Eval("ContributionAmount") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:HyperLink><br /></ItemTemplate></asp:Repeater></div><div style="float: right; " id="secondSection">
            <h3 style="float: left">
                Withdrawals Today</h3><div style="float: right; font-weight: 700;">
                <asp:Literal ID="litTotalWithDrawalTotal" runat="server"></asp:Literal></div><br style="clear: both" />
            <div style="height: 2px; border-bottom: 1px solid gray">
            </div>
            <br />
            <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater3_ItemDataBound">
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="mainLink">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td>
                                    <img src="../images/status_yellow.png" />
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" style="margin-left: 10px; width: 100%">
                                        <tr>
                                            <td>
                                                <b>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("MemberName")  %>' /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# "Amount: " + Eval("WithdrawalAmount") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:HyperLink><br /></ItemTemplate></asp:Repeater></div></div><br style="clear: both" />
    <div style="width: 100%;margin-top:15px;">
        <div style="float: left; " id="thirdSection">
            <h3 style="float: left">
                Loans Today</h3><div style="float: right; font-weight: 700;">
                <asp:Literal ID="litTodayLoansTotal" runat="server"></asp:Literal></div><br style="clear: both" />
            <div style="height: 1px; border-bottom: 1px solid gray">
            </div>
            <br />
            <asp:Repeater ID="Repeater3" runat="server" OnItemDataBound="Repeater4_ItemDataBound">
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="mainLink">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td>
                                    <img src="../images/notes.gif" />
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" style="margin-left: 10px; width: 100%">
                                        <tr>
                                            <td>
                                                <b>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("MemberName")  %>' /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# "Amount: " + Eval("Amount") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text='<%# "Principal: " + Eval("Principal") %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:HyperLink><br /></ItemTemplate></asp:Repeater></div><div style="float: right; " id="fourthSection">
            <h3 style="float: left">
                Loan Defaults Today</h3><div style="float: right; font-weight: 700;">
                <asp:Literal ID="litLoanDefaults" runat="server"></asp:Literal></div><br style="clear: both" />
            <div style="height: 2px; border-bottom: 1px solid gray">
            </div>
            <br />
            <asp:Repeater ID="Repeater5" runat="server" OnItemDataBound="Repeater5_ItemDataBound">
                <ItemTemplate>
                    <asp:HyperLink runat="server" ID="mainLink">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td>
                                    <img src="../images/status_Red.png" />
                                </td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" style="margin-left: 10px; width: 100%">
                                        <tr>
                                            <td>
                                                <b>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("MemberName")  %>' /></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="Label1" runat="server" Text='<%# "Balance: " + ((Convert.ToDecimal(Eval("Amount"))) - (Convert.ToDecimal(Eval("TotalRepayment"))))  %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:HyperLink><br /></ItemTemplate></asp:Repeater></div></div></asp:Content>