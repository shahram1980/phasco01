<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="BiztBiz.Home" %>
<%@ Register Src="~/Bazar/UC/uscAdvanceSearch.ascx" TagName="uscAdvanceSearch" TagPrefix="uc3" %>

<%@ Register Src="UC/B-card.ascx" TagName="B" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">



    <div class="col-md-9 blog-side">

         <uc3:uscAdvanceSearch ID="uscAdvanceSearch1" runat="server" />
        <div class="">
            <div class="shop-widget padding-5 rtl-text">
                <h4>اخبار شرکت</h4>

                <span id="theTicker"></span>
            </div>

        </div>

        <table class="table no-border rtl-text">
            <tr>
                <td colspan="2">
                    <table dir="rtl">
                        <tr>
                            <td style="width: 90%">
                                <span style="font: 22px tahoma; color: #007a9b; font-weight: bold">
                                    <asp:Label ID="Label_Company_Name" runat="server"></asp:Label>
                                </span></td>
                            <td style="width: 90%">
                                <img src="images/GoldenUserCompany.jpg" runat="server" id="img_golden" /></td>
                        </tr>
                    </table>

                </td>
            </tr>
            <tr>
                <td style="width: 300px; vertical-align: top;">
                    <div>
                        <%--                   <div style="font: 11px tahoma; float: right; background: transparent url('images/pi-pro-def-pic-zoom.jpg') no-repeat scroll right top;
                                                width: 291px; height: 20px; padding-right: 10px; margin-top: 10px">
                                                جهت مشاهده تصویر بزرگتر بر روی تصویر زیر کلیک کنید</div>--%>
                        <div style="border: 1px silver solid; padding: 1px; margin: 2px; float: right">
                            <asp:Image ID="image_Logo" runat="server" Width="284" />
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
        <div class="row">
            <div class="shop-widget">
                <h4>محصولات</h4>
                <asp:Repeater ID="repProduct" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4 col-sm-6 padding-5">
                            <div style="float: right; width: 80px; height: 60px; border: 1px solid #b1d3dd; padding: 2px 0;">
                                <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'
                                    title='<%# Eval("Produc_Name")%>'>
                                    <asp:Image ID="imgProduct" runat="server" Height="60px" Width="80px" ImageUrl='<%# GetProductImage(Eval("image").ToString(),Eval("image_name").ToString()) %>' />
                                </a>
                            </div>
                            <div style="" class="rtl-text product-name">
                                <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'
                                    title='<%# Eval("Produc_Name")%>'>
                                    <%# Eval("Produc_Name")%>
                                </a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

        </div>
    </div>

    <div class="col-md-3">
        <div class="sidebar-widgets">
            <div class="shop-widget">
                <h4>اطلاعات فروشنده</h4>
                <table class="table no-border">

                    <tr>

                        <td id="tdUserInfo" runat="server" visible="false">
                            <b>
                                <asp:HyperLink ID="lnkRequestProfile" ForeColor="#000" runat="server"></asp:HyperLink>
                            </b>
                            <br />
                            <asp:Label ID="lblRequestUserFullName" runat="server"></asp:Label>
                            <br />
                            پست الکترونیک :
                                        <asp:Label ID="lblRequestEmail" runat="server"></asp:Label>
                            <br />
                            تلفن :
                                       <div style="direction: ltr;">
                                           <asp:Label ID="lblRequestTel" runat="server"></asp:Label>
                                       </div>

                            فکس :
                                       <div style="direction: ltr;">
                                           <asp:Label ID="lblfax" runat="server"></asp:Label>
                                       </div>

                            استان/شهر :
                                           <div style="direction: rtl;">
                                               <asp:Label ID="lblRequestCity" runat="server"></asp:Label>
                                           </div>
                            <br />
                        </td>
                        <td id="tdNotUserInfo" runat="server" visible="false">برای نمایش اطلاعات فروشنده ابتدا باید <a role="button" href="#" data-toggle="modal" data-keyboard="true" data-target="#membership-modal" style="color: red;">عضو سایت</a> شوید.
                                        <%--  <br />
                                        <a href="register.aspx">عضویت در سایت</a>--%>
                        </td>

                    </tr>
                </table>
            </div>

            <div class="shop-widget">
                <h4>اطلاعات تماس</h4>

                <table class="table no-border rtl-text">
                    <tr>

                        <td id="tdCompanyInfo" runat="server" visible="false" style="background: #f9f9f9; width: 170px; color: #01799b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">
                            <span style="color: #000">آدرس : </span>
                            <br />
                            <asp:Label ID="lblCompanyAdress" runat="server"></asp:Label>
                            <br />
                            <span style="color: #000"> : تلفن  </span>
                            <br />
                            <asp:Label ID="lblCompanyTel" runat="server"></asp:Label>
                            <br />
                            <span style="color: #000">: موبایل  </span>
                            <br />
                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                            <br />

                            <span style="color: #000"> : پست الکترونیک </span><br />
                            <asp:Label ID="lblCompanyEmail" runat="server"></asp:Label>


                            <br />

                            <span style="color: #000"> : وب سایت </span>
                            <br />
                            <asp:Label ID="lblCompanySite" runat="server"></asp:Label>

                            <br />
                            <div style="height: 24px; width: 123px; font-weight: bold; background: transparent url('images/pi-pro-b-bg.jpg') no-repeat scroll center top; text-align: center; padding: 5px; color: #fff; margin: 5px; float: left">
                                <a class="contacts" runat="server" id="lnkContents">تماس بگیرید </a>
                            </div>
                        </td>
                        <td id="tdNotCompanyInfo" runat="server" visible="false" style="background: #f9f9f9; color: #01799b; text-align: right; padding: 5px; line-height: 18px; border-bottom: 2px #ccc solid">برای نمایش اطلاعات تماس ابتدا باید <a href="#" role="button" href="#" data-toggle="modal" data-keyboard="true" data-target="#membership-modal" style="color: red;">عضو سایت</a> شوید.
                        </td>

                    </tr>
                </table>

            </div>


            <div class="shop-widget">
                <h4>سایر شعب شرکت	</h4>

                <table class="table table-stripped">
                    <tr>

                        <td>
                            <asp:Repeater ID="repCompanyBranch" runat="server">
                                <ItemTemplate>
                                    <div style="float: right; width: 170px; border-bottom: 1px solid #e3e3e3; padding: 5px 0; line-height: 18px;">
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
                    </tr>
                </table>
            </div>
        </div>

    </div>

    <table>

        <tr>
        </tr>
    </table>

  
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

