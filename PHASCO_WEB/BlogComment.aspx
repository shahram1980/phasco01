<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlogComment.aspx.cs" Inherits="phasco_webproject.BlogComment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>..:: Web Log Comment ::.. </title>
  <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="~/theme/css/fullwidth.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/settings.css" media="screen" />

    <link rel="stylesheet" type="text/css" href="~/theme/css/magnific-popup.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/owl.carousel.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/owl.theme.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/jquery.bxslider.css" media="screen" />

    <link href="../Theme/css/font-awesome-4.7.0/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/style.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="~/theme/css/responsive.css" media="screen" />

    <script type="text/javascript" src="../theme/js/jquery.min.js"></script>
    <script type="text/javascript" src="../theme/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>
</head>
<body style="background-color:transparent;height:100%;" >

    <form id="form1" runat="server" dir="rtl" style="background-color:transparent">

        <h3>
         <asp:Label ID="Label_Title" runat="server" Font-Bold="True"></asp:Label>

        </h3>
        <div class="col-md-12  margin-top-5">
                                <div class="shop-widget text-right">
                                    <h4>نظرات</h4>
                                    <ul class="widget-item faq article with-img">

                                        <asp:Repeater ID="GridView_Comment" runat="server">
                                            <ItemTemplate>

                                                <li class="text-left">
                                                    <a href='UserProfile.aspx?id=<%# Eval("uid")%>'>
                                                        <img src='http://phasco.com/phascoupfile/Userphoto/<%# Eval("uid")%>.jpg' />

                                                    </a>
                                                    <p>
                                                        <%# Eval("Comment") %>
                                                    </p>

                                                    <p>
                                                        <i class="fa fa-calendar"></i><i class="date-wrapper"><%# persian_Date(Eval("DateSend").ToString())%></i>

                                                        <i class="seprator margin-left-5 margin-right-5 pull-right">| </i><i class="fa fa-user"></i><a class="pull-right" href='UserProfile.aspx?id=<%# Eval("uid")%>'>
                                                            <%#GetUserTitle(Convert.ToInt32( Eval("uid")))%>
                                                        </a>
                                                    </p>


                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
    <table  class="table no-border rtl-text"  style="width:100%;">
                            <tr>
                                <td align="left" dir="rtl" style="width: 20%" valign="top"></td>
                                <td align="right" dir="rtl" style="width: 80%">
                                    <asp:Label ID="Label_Alarm" runat="server" Font-Names="Tahoma" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 20%" valign="top" dir="rtl">
                                    <asp:Label ID="Label1" Text="<%$ Resources:Resource, Comment %>" runat="server"></asp:Label>
                                    :</td>
                                <td align="right" style="width: 80%" dir="rtl">
                                    <asp:TextBox ID="TextBox_Comment" runat="server" Height="100px" TextMode="MultiLine"
                                        Width="80%" Font-Names="Tahoma" Font-Size="XX-Small"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td align="left" dir="rtl" style="width: 20%" valign="top"></td>
                                <td align="right" dir="rtl" class="contact-form" style="width: 80%" >
                                    <asp:Button ID="Button_Insert" runat="server" Text="<%$ Resources:Resource, R_Submit %>"
                                        OnClick="Button_Insert_Click" /></td>
                            </tr>
                        </table>
        <asp:HiddenField ID="HiddenField_Id" runat="server" />
    </form>
</body>
</html>
