<%@ Page Language="C#" MasterPageFile="~/Template/Article_M.Master" AutoEventWireup="true"
    CodeBehind="Article.aspx.cs" Inherits="phasco_webproject.Article" %>

<%@ Register Src="UI/EmailtoFriends.ascx" TagName="EmailtoFriends" TagPrefix="uc1" %>
<asp:Content ContentPlaceHolderID="plchead" runat="server">
</asp:Content>



<asp:Content ContentPlaceHolderID="pagebanner" runat="server">
    <div class="page-banner">
        <div class="container">
            <h2><span id="article_heading">مقالات</span></h2>
            <ul class="page-tree rtl-text">
                <li><a href="/Default.aspx">صفحه اصلی</a></li>
                <li id="page_link_wrapper"><a id="page_link" href='/Article.aspx'>مقالات</a></li>




            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <script language="C#" runat="server">

        public string Mss_Date(string date)
        {
            if (!string.IsNullOrEmpty(date))
            {
                DateTime dtm = new DateTime();
                dtm = Convert.ToDateTime(date);
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

                return sunDate.Weekday.ToString();
            }
            return date;

        }
        public string Set_Image(int image, int id)
        {
            if (image == 1) return "http://phasco.com/phascoupfile/Userphoto/" + id + ".jpg";
            else if (image == 0) return "phascoupfile/Userphoto/Nopic.jpg";

            return "phascoupfile/Userphoto/Nopic.jpg";
        }

        public bool ISCurrent(string value)
        {
            try
            {
                if (value == ViewState["drpPagingIndex"].ToString()) return true;
                else return false;
            }
            catch (Exception)
            {
                if (value == "0") return true;
                else return false;
            }


        }

        public string Set_UserToolTip(string uid, string ArticleNo, string name, string famil, string RegisterDate, string LastLoginDate, string Point, string Image, string id)
        {
            string res_ = "";


            string Body_Html = "<table class=&quot;table table-responsive table-striped table-bordered table-sm ltr-text&quot; style=&quot;width:250px;&quot;>";

            Body_Html = Body_Html + "<tr><td width=&quot;65%&quot; valign=&quot;top&quot; dir=&quot;rtl&quot; align=right>" + name + " " + famil + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>نام و نام خانوادگی : </td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=&quot;rtl&quot; align=right>" + uid + " </td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1606;&#1575;&#1605; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740; :</td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=&quot;&quot;rtl&quot; &quot; align=&quot;right&quot; class=&quot;date-wrapper-no&quot;>" + Mss_Date(RegisterDate) + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1593;&#1590;&#1608;&#1740;&#1578; : </td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=&quot;rtl&quot; align=&quot;right&quot; class=&quot;date-wrapper-no&quot;>" + Mss_Date(LastLoginDate) + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1570;&#1582;&#1585;&#1740;&#1606; &#1605;&#1585;&#1575;&#1580;&#1593;&#1607;: </td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=&quot;rtl&quot; align=&quot;right&quot;>" + Point + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1575;&#1605;&#1578;&#1740;&#1575;&#1586; :</td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=&quot;rtl&quot; align=&quot;right&quot;>" + ArticleNo + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1605;&#1602;&#1575;&#1604;&#1575;&#1578; :</td></tr></table>";

            return Body_Html;
        }
        public string clean_text(string text)
        {
            return text.ToString().Replace(".", "").Replace("-", "");
        }
    </script>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View0" runat="server">


            <div class="main-box">
                <div class="container">
                    <div class="shop-widget">
                        <h4>مقالات روز</h4>
                        <ul class="widget-item article">

                            <asp:Repeater ID="RTP_RND" runat="server">
                                <ItemTemplate>

                                    <li>

                                        <h6 class="text-right">
                                            <a target="_parent" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" rel="Site/Article/ShortView.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                                <i class="fa fa-pencil-square pull-right head-icon"></i><%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                            </a></h6>
                                        <p class="rtl-text">
                                            <i class="fa fa-calendar"></i>
                                            <i class="date-wrapper"><%# Mss_Date(DataBinder.Eval(Container.DataItem, "DateIns").ToString())%></i>
                                            <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                            <i class="fa fa-eye"></i><i class="pull-right"><%# Eval("ClickNumber")%></i>
                                            <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                            <i class="fa fa-user"></i>
                                            <%# Set_User(int.Parse(Eval("UID_ID").ToString()))%>
                                            <%--<a class="pull-right" href="UserProfile.aspx?id=<%# Eval("UID_ID")%>"><%# Eval("UserName")%></a>--%>
                                        </p>
                                        <span class="button-wrapper">
                                            <a class="read-more" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>"><i class="fa fa-arrow-left"></i>جزئیات</a>
                                        </span>
                                        <p>
                                        </p>
                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>

                </div>
            </div>
            <div class="about-box">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 ">
                            <div class="shop-widget">
                                <h4>جدیدترین مقالات</h4>
                                <ul class="widget-item article">
                                    <asp:Repeater ID="RPT_Last" runat="server">
                                        <ItemTemplate>

                                            <li>

                                                <h6 class="text-right">
                                                    <a target="_parent" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" rel="Site/Article/ShortView.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                                        <i class="fa fa-pencil-square pull-right head-icon"></i><%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                                    </a></h6>
                                                <p>
                                                    <i class="fa fa-calendar"></i><i class="date-wrapper"><%# Mss_Date(DataBinder.Eval(Container.DataItem, "DateIns").ToString())%> </i>
                                                    <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                                    <i class="fa fa-eye"></i><i class="pull-right"><%# Eval("ClickNumber")%></i>
                                                    <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                                    <i class="fa fa-user"></i>
                                                    <%# Set_User(int.Parse(Eval("UID_ID").ToString()))%>
                                                    <%--<a class="pull-right" href="UserProfile.aspx?id=<%# Eval("UID_ID")%>"><%# Eval("UserName")%></a>--%>
                                                </p>

                                            </li>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </ul>
                            </div>

                        </div>

                        <div class="col-md-6">
                            <div class="shop-widget">
                                <h4>پربازدید ترین مقالات</h4>
                                <ul class="widget-item article">
                                    <asp:Repeater ID="RPT_Best" runat="server">
                                        <ItemTemplate>
                                            <li>

                                                <h6 class="text-right">
                                                    <a target="_parent" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" rel="Site/Article/ShortView.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                                        <i class="fa fa-pencil-square pull-right head-icon"></i><%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                                    </a></h6>
                                                <p>
                                                    <i class="fa fa-calendar"></i><i class="date-wrapper"><%# Mss_Date(DataBinder.Eval(Container.DataItem, "DateIns").ToString())%> </i>
                                                    <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                                    <i class="fa fa-eye"></i><i class="pull-right"><%# Eval("ClickNumber")%></i>
                                                    <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                                    <i class="fa fa-user"></i>
                                                    <%# Set_User(int.Parse(Eval("UID_ID").ToString()))%>

                                                    <%--<a class="pull-right" href="UserProfile.aspx?id=<%# Eval("UID_ID")%>"><%# Eval("UserName")%></a>--%>
                                                </p>

                                            </li>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </ul>
                            </div>

                        </div>

                        <div class="col-md-6 pull-right">

                            <div class="shop-widget">
                                <h4>برترین کاربران</h4>
                                <ul class="popular-product">
                                    <asp:Repeater ID="DataList_TopUser" runat="server">
                                        <ItemTemplate>
                                            <li>
                                                <img alt="" src="<%#Set_Image( int.Parse(Eval("Image").ToString()), int.Parse(Eval("id").ToString())  ) %>">
                                                <div>
                                                    <h6><a href="userProfile.aspx?id=<%# Eval("id").ToString()%>" data-toggle="popover" data-html="true" data-trigger="hover" data-content="<%#Set_UserToolTip(Eval("Uid").ToString(), Eval("ArticleNo").ToString(), Eval("name").ToString(), Eval("famil").ToString(), Eval("RegisterDate").ToString(), Eval("LastLoginDate").ToString(), Eval("point").ToString(), Eval("Image").ToString(), Eval("id").ToString())%>"><%#DataBinder.Eval(Container.DataItem, "Name")%> <%#DataBinder.Eval(Container.DataItem, "Famil")%> [<%#DataBinder.Eval(Container.DataItem, "Uid")%>]</a></h6>
                                                    <span class="text-green"><%#DataBinder.Eval(Container.DataItem, "ArticleNo")%> مقاله</span>
                                                </div>
                                            </li>


                                        </ItemTemplate>

                                    </asp:Repeater>
                                </ul>
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <script>
                $('[data-toggle="popover"]').popover();
            </script>
            <table align="center" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td class="art-big-ads">
                        <a href="http://www.mahak-charity.org/main/" title="محک ، خیریه، سرطان کودکان" target="_blank">
                            <img alt="" height="102" src="images/ADV/adv-Mahak.jpg" title="محک ، خیریه، سرطان کودکان" width="775" />
                        </a>
                    </td>
                </tr>
            </table>

        </asp:View>
        <asp:View ID="View1" runat="server">
            <script>
                $("#page_link_wrapper").after("<li><a href='#'><%= category%></a></li>");

            </script>

            <div class="container">
                <div class="shop-widget">
                    <h4>لیست مقالات</h4>
                    <ul class="widget-item article">
                        <asp:Repeater ID="RPT_Article" runat="server">
                            <ItemTemplate>

                                <li>

                                    <h6 class="text-right">
                                        <a target="_parent" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" rel="Site/Article/ShortView.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                            <i class="fa fa-pencil-square pull-right head-icon"></i><%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                        </a></h6>
                                    <p>


                                        <i class="fa fa-calendar"></i><i class="date-wrapper"><%# Mss_Date(DataBinder.Eval(Container.DataItem, "DateIns").ToString())%> </i>
                                        <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                        <i class="fa fa-eye"></i><i class="pull-right"><%# Eval("ClickNumber")%></i>
                                        <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                        <i class="fa fa-user"></i>
										
										<%--<a class="pull-right" href="UserProfile.aspx?id=<%# Eval("UID_ID")%>"><%# Eval("UserName")%></a>--%>



                                    </p>
                                    <span class="button-wrapper">
                                        <a class="read-more" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>"><i class="fa fa-arrow-left"></i>جزئیات</a>
                                    </span>
                                </li>

                            </ItemTemplate>
                        </asp:Repeater>





                    </ul>
                </div>

            </div>
            <table align="right" cellpadding="0" cellspacing="0" dir="rtl" style="height: 20px">
                <tr>
                    <td style="height: 19px">
                        <asp:DropDownList ID="drpPaging" runat="server" AutoPostBack="true" Font-Names="Tahoma"
                            Font-Size="11px" OnSelectedIndexChanged="drpPaging_SelectedIndexChanged" Visible="False">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td style="height: 14px">برو به صفحه :<asp:Repeater ID="Repeater_Article_List" runat="server">
                        <ItemTemplate>
                            <asp:LinkButton ID="Linkbutton_Panging" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.value","{0}") %>'
                                OnCommand="Linkbutton_Panging_Command" Text='<%# Eval("item")%>' Font-Bold='<%# ISCurrent(Eval("value").ToString()) %>' />
                        </ItemTemplate>
                    </asp:Repeater>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">

            <script>
                $("#page_link_wrapper").after("<li><a href='Article.aspx?articleid=<%= categoryId%>'><%= category%></a></li>");

            </script>
            <div class="single-post-content text-justify">
                <h3>
                    <asp:Label ID="SubJect" runat="server"></asp:Label>

                </h3>

                <div class="post-share">
                    <ul class="list-inline">
                        <li><a title="نسخه قابل چاپ" onclick="javascript:window.open('Article_Print.aspx?id=<%Response.Write(Request.QueryString["Detailsid"].ToString()); %>','چاپ','location=no ,  menubar=no , width=600 , height = 650 , toolbar=no');"
                            href="#"><i class="fa fa-print"></i></a>
                        </li>

                        <li>
                            <asp:Label ID="Label_FAV" runat="server" Text=""></asp:Label>
                        </li>
                        <li>
                            <uc1:EmailtoFriends ID="EmailtoFriends1" runat="server" />
                        </li>
                    </ul>
                </div>
                <p>
                </p>

            </div>
            <div class="footer-widgets">
                <p class="work-time">
                    <span>ارسال کننده</span> :
                    <asp:Label ID="LBL_UserSender" runat="server" CssClass="TXTClass"></asp:Label>
                </p>
                <p class="work-time">
                    <span>نویسنده / نويسندگان</span> :
                    <asp:Label ID="Writer" runat="server" CssClass="TXTClass"></asp:Label>
                </p>
                <p class="work-time">
                    <span>مترجم</span> :
                    <asp:Label ID="Translator" runat="server" CssClass="TXTClass"></asp:Label>
                </p>
                <p class="work-time">
                    <span>کلید واژه</span> :
                    <asp:Label ID="keyWork" runat="server" CssClass="TXTClass"></asp:Label>
                </p>
                <p class="work-time">
                    <span>منابع</span> :
                    <asp:Label ID="Ref" runat="server" CssClass="TXTClass"></asp:Label>
                </p>

            </div>
            <div class="sidebar-widgets">
                <div class="text-widget widget">

                    <blockquote>
                        <p>
                            <asp:Literal ID="ShortText" runat="server"></asp:Literal>

                        </p>

                    </blockquote>

                </div>

            </div>
            <div class="content-text">
                <p>
                    <asp:Label ID="Text" Width="100%" runat="server"></asp:Label>
                </p>
            </div>
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style margin-top-5">
                <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4d04e1941d9ddce0" class="addthis_button_compact">اشتراک گذاری این صفحه</a>
                <span class="addthis_separator">|</span>
                <a class="addthis_button_preferred_1"></a>
                <a class="addthis_button_preferred_2"></a>
                <a class="addthis_button_preferred_3"></a>
                <a class="addthis_button_preferred_4"></a>

            </div>
            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4d04e1941d9ddce0"></script>
            <!-- AddThis Button END -->

        </asp:View>
        <asp:View ID="View3" runat="server">
            <br />
            خطا در خواندن اطلاعات
            <br />
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" style="width: 100%">
                        <asp:LinkButton ID="LinkButton_Back" runat="server" OnClick="LinkButton_Back_Click">برگشت</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%" align="center">
                        <asp:DataList ID="DataList_Slid" runat="server" RepeatColumns="5" CellPadding="5">
                            <ItemTemplate>
                                <table border="2" onmouseout="this.style.backgroundColor='#f3e5ca';" onmouseover="this.style.backgroundColor='#CCC1A7';"
                                    id="table2" style="border-collapse: collapse; height: 250; width: 100px;" bordercolor="#CCC1A7">
                                    <tr>
                                        <td>
                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 60px;">
                                                <tr>
                                                    <td style="width: 100%">
                                                        <div style="float: left" onmouseover="zoom_on(event,87,60,'phascoupfile/Slides/b_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg');"
                                                            onmousemove="zoom_move(event);" onmouseout="zoom_off();">
                                                            <img src="phascoupfile/Slides/s_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg"
                                                                alt="tjpzoom picture title" style="padding: 0; margin: 0; border: 0; width: 87; height: 60;" />
                                                        </div>
                                                        <div style="clear: both;">
                                                        </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100%" valign="bottom">
                                                        <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100%" valign="bottom">
                                                        <a href="#" onclick="javascript:window.open ('SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "id")%>','mywindow','location=0,status=0,scrollbars=0,width=600,height=600');">بزرگنمایی </a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 100%">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 600px; height: 20px">
                            <tr>
                                <td align="center" style="background-image: url(images/paging-bg.gif); width: 100%">
                                    <asp:Repeater ID="Repeater_Slide_Paging" runat="server">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="Linkbutton_Panging_Slide" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.value","{0}") %>'
                                                Font-Bold='<%# ISCurrent(Eval("value").ToString()) %>' OnCommand="Linkbutton_Panging_Slide_Command"
                                                Text='<%# Eval("item")%>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
