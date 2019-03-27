<%@ Page Language="C#" MasterPageFile="~/Template/CompanyDeteil.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="BiztBiz.Home" %>

<%@ Register Src="UC/B-card.ascx" TagName="B" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <%--<table cellpadding="0" cellspacing="0" style="width: 1000px; height: 45px; margin: 10px">
        <tr>
            <td style="width: 12px; background: transparent url('images/pi-pro-fram-2-right.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
            <td style="background: transparent url('images/pi-pro-fram-2-mid.jpg') repeat-x scroll center top;
                text-align: right">
                <img alt="" height="26" src="<%= ImgSiteFolder %>br-ico-map.jpg" width="26" style="vertical-align: middle;" />
                <span style="color: #006699">شما اینجا هستید:</span> <span style="font-weight: normal;
                    color: #0099cc"><a style="color: #0099cc;" href="Default.aspx">ایران پروبیز </a>
                </span>
                <img alt="" height="16" src="<%= ImgSiteFolder %>br-ico-bul.jpg" width="11" style="vertical-align: middle;" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:LinkButton ID="lnkMainCat" ForeColor="#0099cc" runat="server"></asp:LinkButton></span>
                <img id="imglblSubCat" runat="server" alt="" height="16" src="~/images/site/br-ico-bul.jpg"
                    width="11" style="vertical-align: middle;" visible="false" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:LinkButton ID="lnkSubCat" ForeColor="#0099cc" runat="server" Visible="false"></asp:LinkButton></span>
                <img id="imglblSub2Cat" runat="server" alt="" height="16" src="~/images/site/br-ico-bul.jpg"
                    width="11" style="vertical-align: middle;" visible="false" />
                <span style="font-weight: normal; color: #0099cc">
                    <asp:LinkButton ID="lnkSub2Cat" ForeColor="#0099cc" runat="server" Visible="false"></asp:LinkButton></span>
            </td>
            <td style="width: 12px; background: transparent url('images/pi-pro-fram-2-left.jpg') no-repeat scroll center top;">
                &nbsp;
            </td>
        </tr>
    </table>--%>
    <table cellpadding="0" cellspacing="0" style="width: 1000px">
        <tr>
            <td>
                <table cellpadding="2" cellspacing="0" style="width: 100%">
                    <tr>
                        <td style="text-align: right; vertical-align: top">
                            <table class="h-news-user" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 103px; height: 26px;">
                                        <img alt="" height="26" src="<%= ImgSiteFolder %>scroll-news-right.jpg" width="103" />
                                    </td>
                                    <td class="h-news-bg-user">
                                        <span id="theTicker" style="color: #008ba2; font: 11px tahoma;"></span>
                                    </td>
                                    <td style="width: 5px; height: 26px;">
                                        <img alt="" height="26" src="<%= ImgSiteFolder %>scroll-news-left.jpg" width="5" />
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%">
                                <tr>
                                    <td colspan="2">
                                        <table class="style2" dir="rtl">
                                            <tr>
                                                <td style="width:90%">
                                                  <span style="font: 22px 'b koodak', arial; color: #007a9b; font-weight: bold">
                                            <asp:Label ID="Label_Company_Name" runat="server"></asp:Label>
                                        </span> </td>
                                               <td style="width:90%">
                                               <img src="images/GoldenUserCompany.jpg" runat="server" id="img_golden" /></td>
                                            </tr>
                                        </table>
                                       
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 300px; vertical-align: top;">
                                        <div>
                                            <div style="font: 11px tahoma; float: right; background: transparent url('images/pi-pro-def-pic-zoom.jpg') no-repeat scroll right top;
                                                width: 291px; height: 20px; padding-right: 10px; margin-top: 10px">
                                                جهت مشاهده تصویر بزرگتر بر روی تصویر زیر کلیک کنید</div>
                                            <div style="border: 1px silver solid; padding: 1px; margin: 2px; float: right">
                                                <asp:Image ID="image_Logo" runat="server" Height="212" Width="284" />
                                                <%--  <img alt="" height="212" src="images/pi-pro-def-pic.jpg" width="284" />--%>
                                            </div>
                                        </div>
                                    </td>
                                    <td style="vertical-align: top; line-height: 25px; font-size: 11px;">
                                        <div style="padding: 5px; float: right; text-align: justify">
                                            <b>درباره شرکت:</b><br />
                                            <asp:Label ID="Label_Company_Introduction" ForeColor="#007a9b" runat="server" /><br />
                                            <br />
                                            <b>خدمات شرکت: </b>
                                            <br />
                                            <asp:Label ID="lblServices" ForeColor="#007a9b" runat="server" /><br />
                                            <br />
                                            <b>نوع فعالیت: </b>
                                            <asp:Label ID="lblBusinessType" ForeColor="#007a9b" runat="server" /><br />
                                            <b>گروه کاربری : </b>
                                            <asp:Label ID="lblUsageType" runat="server" ForeColor="#007a9b" /><br />
                                            <br />
                                            <b>برند ها : </b>
                                            <br />
                                            <div style="float: right; padding-right: 12px;">
                                                <ul style="color: #007a9b; margin: 0; padding: 0;">
                                                    <asp:Literal ID="lblBrand" runat="server"></asp:Literal>
                                                </ul>
                                            </div>
                                            <br />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 225px;" valign="top" rowspan="2">
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; padding: 5px 0;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">اطلاعات فروشنده </span>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td id="tdUserInfo" runat="server" visible="false" style="background: #f9f9f9; color: #01799b;width: 170px;
                                        text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        <b>
                                            <asp:HyperLink ID="lnkRequestProfile" ForeColor="#000" runat="server"></asp:HyperLink>
                                        </b>
                                        <br />
                                        <asp:Label ID="lblRequestUserFullName" runat="server"></asp:Label>
                                        <br />
                                        پست الکترونیکی :
                                        <asp:Label ID="lblRequestEmail" runat="server"></asp:Label>
                                        <br />
                                        شماره تماس :
                                        <asp:Label ID="lblRequestTel" runat="server"></asp:Label>
                                        <br />
                                        استان/شهر :
                                        <asp:Label ID="lblRequestCity" runat="server"></asp:Label>
                                        <br />
                                    </td>
                                    <td id="tdNotUserInfo" runat="server" visible="false" style="background: #f9f9f9;
                                        color: #01799b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        برای نمایش اطلاعات فروشنده ابتدا باید <a href="register.aspx">عضو سایت</a> شوید.
                                        <%--  <br />
                                        <a href="register.aspx">عضویت در سایت</a>--%>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; padding: 5px 0;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">اطلاعات تماس </span>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td id="tdCompanyInfo" runat="server" visible="false" style="background: #f9f9f9; width: 170px;;
                                        color: #01799b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        <span style="color: #000">آدرس : </span>
                                        <br />
                                        <asp:Label ID="lblCompanyAdress" runat="server"></asp:Label>
                                        <br />
                                        <span style="color: #000">شماره تماس : </span>
                                        <br />
                                        <asp:Label ID="lblCompanyTel" runat="server"></asp:Label>
                                        <br />
                                        <span style="color: #000">وب سایت :</span>
                                        <br />
                                        <asp:Label ID="lblCompanySite" runat="server"></asp:Label>
                                        <br />
                                        <span style="color: #000">پست الکترونیک :</span><br />
                                        <asp:Label ID="lblCompanyEmail" runat="server"></asp:Label>
                                        <br />
                                        <div style="height: 24px; width: 123px; font-weight: bold; background: transparent url('images/pi-pro-b-bg.jpg') no-repeat scroll center top;
                                            text-align: center; padding: 5px; color: #fff; margin: 5px; float: left">
                                            <a class="contacts" runat="server" id="lnkContents">تماس بگیرید </a>
                                        </div>
                                    </td>
                                    <td id="tdNotCompanyInfo" runat="server" visible="false" style="background: #f9f9f9;
                                        color: #01799b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                                        برای نمایش اطلاعات تماس ابتدا باید <a href="register.aspx">عضو سایت</a> شوید.
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" style="width: 220px; float: left; padding: 5px 0;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">سایر شعبات شرکت </span>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #000; text-align: right; padding-bottom: 5px;
                                        border-bottom: 2px #ccc solid">
                                        <asp:Repeater ID="repCompanyBranch" runat="server">
                                            <ItemTemplate>
                                                <div style="float: right; width: 170px; border-bottom: 1px solid #e3e3e3; padding: 5px 0;
                                                    line-height: 18px;">
                                                    <b>
                                                        <%#Eval("BranchName")%></b>
                                                    <br />
                                                    آدرس :
                                                    <br />
                                                    <span style="color: #007a9b;">
                                                        <%#Eval("BranchAdress")%>
                                                    </span>
                                                    <br />
                                                    شماره تماس :
                                                    <br />
                                                    <span style="color: #007a9b;">
                                                        <%#Eval("BranchTel")%>
                                                    </span>
                                                    <br />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table cellpadding="0" cellspacing="0" style="width: 100%; float: left;">
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right; padding-right: 5px">
                                        <span class="frame-title">محصولات </span>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="images/new-fame-2-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #3333ff; text-align: right; border-bottom: 2px #ccc solid">
                                        <asp:Repeater ID="repProduct" runat="server">
                                            <ItemTemplate>
                                                <div style="float: right; width: 230px; height: 70px; margin: 3px;">
                                                    <div style="float: right; width: 80px; height: 60px; border: 1px solid #b1d3dd; padding: 2px 0;">
                                                        <asp:Image ID="imgProduct" runat="server" Height="60px" Width="80px" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' />
                                                    </div>
                                                    <div style="float: right; height: 60px; width: 85px; padding-right: 2px; padding-top: 5px;">
                                                        <a style="color: #007b94;" href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'
                                                            title='<%# Eval("Produc_Name")%>'>
                                                            <%# Eval("Produc_Name")%>
                                                        </a>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                    <td style="background: transparent url('images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%-- <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1">
                <tr>
                    <td>
                      
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <uc1:B ID="B1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Literal ID="Literal_Information_not_entered" runat="server" Text="<%$ Resources:Resource, Information_not_entered %>" />
        </asp:View>
    </asp:MultiView>--%>
    <script type="text/javascript">
    var theSummaries = new Array();
    var theSiteLinks = new Array();

    <%=GetTopNews()%>
    </script>
    <script type="text/javascript">
        var theCharacterTimeout = 50;
        var theStoryTimeout = 5000;
        var theWidgetOne = "_";
        var theWidgetTwo = "-";
        var theWidgetNone = "";
        var theItemCount = theSummaries.length;
        var NS6 = (document.getElementById && !document.all) ? true : false;
        function startTicker() {
            theCurrentStory = -1;
            theCurrentLength = 0;
            if (document.getElementById) {
                runTheTicker();
            }
            else {
                document.write("<style>.ticki{display:none;}.ticko{border:0px; padding:0px;}</style>");
                return true;
            }
        }
        function runTheTicker() {
            var myTimeout;
            if (theCurrentLength == 0) {
                theCurrentStory++;
                theCurrentStory = theCurrentStory % theItemCount;
                theStorySummary = theSummaries[theCurrentStory];
                theTargetLink = theSiteLinks[theCurrentStory];
            }
            if (theStorySummary != null) {
                var textTitle = theStorySummary.substring(0, theCurrentLength) + whatWidget();
                if (theTargetLink) {
                    if (NS6) {
                        document.getElementById("theTicker").innerHTML = '<a style="color: #008ba2;" target="_blank" href=' + theTargetLink + '>' + textTitle + '</a>';
                    }
                    else {
                        document.all.theTicker.innerHTML = '<a style="color: #008ba2;" target="_blank" href=' + theTargetLink + '>' + '<font face="Tahoma" style="font-size: 8pt"><span style="text-decoration: none">' + textTitle + '</span></font>' + '</a>';
                    }
                }
                else {
                    if (NS6) {
                        document.getElementById("theTicker").innerHTML = '<a style="color: #008ba2;" target="_blank" href=' + theTargetLink + '>' + '<span class="tickertext">' + textTitle + '</span>' + '</a>';
                    }
                    else {
                        document.all.theTicker.innerHTML = '<a style="color: #008ba2;" target="_blank" href=' + theTargetLink + '>' + '<span class="tickertext">' + textTitle + '</span>' + '</a>';

                    }
                }
                if (theCurrentLength != theStorySummary.length) {
                    theCurrentLength++;
                    myTimeout = theCharacterTimeout;
                }
                else {
                    theCurrentLength = 0;
                    myTimeout = theStoryTimeout;
                }
            }
            setTimeout("runTheTicker()", myTimeout);
        }
        function whatWidget() {
            if (theCurrentLength == theStorySummary.length) {
                return theWidgetNone;
            }
            if ((theCurrentLength % 2) == 1) {
                return theWidgetOne;
            }
            else {
                return theWidgetTwo;
            }
        }
        startTicker();
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>

