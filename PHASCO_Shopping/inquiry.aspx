<%@ Page Language="C#" MasterPageFile="~/Template/MAin.Master" AutoEventWireup="true" CodeBehind="inquiry.aspx.cs" Inherits="PHASCO_Shopping.inquiry" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <style type="text/css" media="screen">
        *
        {
            margin: 0;
            padding: 0;
        }
        body
        {
            padding: 10px;
        }
        h1
        {
            margin: 14px 0;
            font-family: tahoma;
        }
        p
        {
            margin: 14px 0;
            font-family: tahoma;
        }
        .bubbleInfo
        {
            position: relative;
            top: 35px;
            left: 2px;
            width: 550px;
        }
        .trigger
        {
            position: absolute;
        }
        /* Bubble pop-up */.popup
        {
            position: absolute;
            display: none;
            z-index: 50;
            border-collapse: collapse;
        }
        .popup td.corner
        {
            height: 15px;
            width: 19px;
        }
        .popup td#topleft
        {
            background-image: url(java-inq/bubble-1.png);
        }
        .popup td.top
        {
            background-image: url(java-inq/bubble-2.png);
        }
        .popup td#topright
        {
            background-image: url(java-inq/bubble-3.png);
        }
        .popup td.left
        {
            background-image: url(java-inq/bubble-4.png);
        }
        .popup td.right
        {
            background-image: url(java-inq/bubble-5.png);
        }
        .popup td#bottomleft
        {
            background-image: url(java-inq/bubble-6.png);
        }
        .popup td.bottom
        {
            background-image: url(java-inq/bubble-7.png);
            text-align: center;
        }
        .popup td.bottom img
        {
            display: block;
            margin: 0 auto;
        }
        .popup td#bottomright
        {
            background-image: url(java-inq/bubble-8.png);
        }
        .popup table.popup-contents
        {
            font-size: 12px;
            line-height: 1.2em;
            background-color: #fff;
            color: #666;
            font-family: "Lucida Grande" , "Lucida Sans Unicode" , "Lucida Sans" , sans-serif;
        }
        table.popup-contents th
        {
            text-align: right;
            text-transform: lowercase;
        }
        table.popup-contents td
        {
            text-align: left;
        }
        tr#release-notes th
        {
            text-align: left;
            text-indent: -9999px;
            background: url(java-inq/starburst.gif) no-repeat top right;
            height: 17px;
        }
        tr#release-notes td a
        {
            color: #333;
        }
        -- ></style>
    <script src="java-inq/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
    <!--

        $(function () {
            $('.bubbleInfo').each(function () {
                var distance = 10;
                var time = 250;
                var hideDelay = 500;

                var hideDelayTimer = null;

                var beingShown = false;
                var shown = false;
                var trigger = $('.trigger', this);
                var info = $('.popup', this).css('opacity', 0);


                $([trigger.get(0), info.get(0)]).mouseover(function () {
                    if (hideDelayTimer) clearTimeout(hideDelayTimer);
                    if (beingShown || shown) {
                        return;
                    } else {
                        beingShown = true;

                        info.css({
                            top: 20,
                            left: 190,
                            display: 'block'
                        }).animate({
                            top: '-=' + distance + 'px',
                            opacity: 1
                        }, time, 'swing', function () {
                            beingShown = false;
                            shown = true;
                        });
                    }

                    return false;
                }).mouseout(function () {
                    if (hideDelayTimer) clearTimeout(hideDelayTimer);
                    hideDelayTimer = setTimeout(function () {
                        hideDelayTimer = null;
                        info.animate({
                            top: '-=' + distance + 'px',
                            opacity: 0
                        }, time, 'swing', function () {
                            shown = false;
                            info.css('display', 'none');
                        });

                    }, hideDelay);

                    return false;
                });
            });
        });
    
    //-->
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
    <asp:Label runat="server" ID="Label_Alarm" />
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table style="width: 875px; border-collapse: collapse;" class="direction">
                    <tr>
                        <td class="td_register">
                        </td>
                        <td class="td_register_de">
                            <div class="bubbleInfo">
                                <div>
                                    <a class="trigger" runat="server" id="link_Product" href="#">
                                        <asp:Label ID="Label_Detail" runat="server"></asp:Label>
                                    </a>
                                </div>
                                <table style="background: #ffffff; top: -110px; left: -33px; display: none; direction: ltr;"
                                    id="dpop" class="popup">
                                    <tr>
                                        <td id="topleft" class="corner">
                                        </td>
                                        <td class="top">
                                        </td>
                                        <td id="topright" class="corner">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="left">
                                        </td>
                                        <td>
                                            <table border="0" width="100%" id="table1" style="border-collapse: collapse">
                                                <tr>
                                                    <td class="td_register">
                                                        <img runat="server" id="product_img" />
                                                    </td>
                                                    <td class="td_register_de">
                                                        <asp:Label ID="Label_Product" runat="server" Text="Label" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td class="right">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="corner" id="bottomleft">
                                        </td>
                                        <td class="bottom">
                                        </td>
                                        <td id="bottomright" class="corner">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, Topic %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_topic" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Message %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Message" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:HiddenField ID="HiddenField_Id" runat="server" />
                        </td>
                        <td class="td_register_de">
                            <asp:Button ID="Button_Insert" runat="server" OnClick="Button_Insert_Click" Text="<%$ Resources:Resource, Submit %>" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource, inquiry_send_Mss %>" />
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource, inquiry_notUseronline_Mss %>" />
            </asp:View>
            <asp:View ID="View4" runat="server">
            </asp:View>
        </asp:MultiView>
    </center>
</asp:Content>
