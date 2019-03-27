<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="news.aspx.cs" Inherits="phasco_webproject.news" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <script language="C#" runat="server">
        public string set_Image(string Image, int id)
        {
            if (Image == "none.jpg") return "";
            if (Image != "none.jpg") return "http://phasco.com/phascoupfile/NewsImages/" + Image;
            return "تصویر ناشناخته";
        }
        public string clean_text(string text)
        {
            return text.ToString().Replace(".", "").Replace("-", "");
        }
    </script>

    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View_list" runat="server">

                <div class="row">
                    <div class="col-md-4">

                        <div class="shop-widget">
                            <h4></h4>

                            <ul class="widget-item">
                                <li>
                                    <object data="http://cdn.tabnak.ir/files/adv/4439_459.swf" type="application/x-shockwave-flash"
                                        width="100%">
                                        <param name="movie" value="http://cdn.tabnak.ir/files/adv/4439_459.swf">
                                        <param name="menu" value="false">
                                    </object>
                                </li>
                                <li>
                                    <object data="http://cdn.tabnak.ir/files/adv/4824_637.swf" type="application/x-shockwave-flash"
                                        width="100%">
                                        <param name="movie" value="http://cdn.tabnak.ir/files/adv/4824_637.swf">
                                        <param name="menu" value="false">
                                    </object>
                                </li>

                            </ul>

                        </div>
                        <div class="shop-widget">
                            <h4>محبوب ترین اخبار</h4>
                            <ul class="widget-item">


                                <asp:Repeater ID="Repeater_popular" runat="server">
                                    <ItemTemplate>

                                        <li>
                                            <h6>
                                                <i class="fa fa-chevron-left margin-left-5"></i>
                                                <a href="/News.aspx?News_Id=<%#Eval("id") %>&t=<%# clean_text(Eval("Title").ToString()) %>">
                                                    <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                                </a>
                                            </h6>
                                        </li>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>

                        <div class="shop-widget">
                            <h4>جدید ترین اخبار</h4>
                            <ul class="widget-item">
                                <asp:Repeater ID="Repeater_LastNews" runat="server">
                                    <ItemTemplate>

                                        <li>
                                            <h6>
                                                <i class="fa fa-chevron-left margin-left-5"></i>
                                                <a href="/News.aspx?News_Id=<%#Eval("id") %>&t=<%# clean_text(Eval("Title").ToString()) %>">
                                                    <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                                </a>
                                            </h6>
                                        </li>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>


                        <div class="shop-widget">
                            <h4>مصاحبه ها</h4>
                            <ul class="widget-item">
                                <asp:Repeater ID="Repeater_Mosahebe" runat="server">
                                    <ItemTemplate>

                                        <li>
                                            <h6>
                                                <i class="fa fa-chevron-left margin-left-5"></i>
                                                <a href="/News.aspx?News_Id=<%#Eval("id") %>&t=<%# clean_text(Eval("Title").ToString()) %>">
                                                    <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                                </a>
                                            </h6>
                                        </li>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>

                    </div>
                    <div class="col-md-8">


                        <div class="blog-box with-one-col">
                            <asp:Repeater ID="Repeater_Spenews" runat="server">
                                <ItemTemplate>

                                    <div class="item news-item">
                                        <div class="inner-item">
                                            <img alt="<%# DataBinder.Eval(Container.DataItem, "Title") %>" title="<%# DataBinder.Eval(Container.DataItem, "Title") %>" src="http://phasco.com//phascoupfile/NewsImages/<%# Eval("Image")%>">
                                        </div>
                                        <h5><%# DataBinder.Eval(Container.DataItem, "Title") %></h5>
                                        <p class="date-wrapper"><i class="fa fa-calendar pull-right margin-left-5 fa-icon"></i><%# shamsi_Date(Eval("Date_Ins").ToString())%></p>
                                        <p><%# Eval("news") %></p>


                                        <a class="read-more" href="/News.aspx?News_Id=<%#Eval("id") %>&t=<%# clean_text(Eval("Title").ToString()) %>" title=" <%# DataBinder.Eval(Container.DataItem, "Title") %>">خواندن  <i class="fa fa-arrow-left"></i></a>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
                <table>
                    <tr>
                    </tr>
                </table>

            </asp:View>
            <asp:View ID="View_Detail" runat="server">
                <div class="page-banner">
                    <div class="container">
                        <h2>اخبار</h2>
                        <ul class="page-tree">

                            <li><a href="/news.aspx">بازگشت</a></li>

                        </ul>
                    </div>
                </div>
                <div class="single-post-content">
                    <asp:Image ID="Image_View" runat="server" />
                    <h3>
                        <asp:Label ID="short_News" runat="server"></asp:Label></h3>

                    <div>
                        <div class="reaction clearfix">


                            <p class="pull-right">
                                <i class="fa fa-calendar pull-right"></i>
                                <asp:Label CssClass="date-wrapper rtl-text pull-right" ID="Label_date" runat="server"></asp:Label>
                            </p>


                        </div>
                        <div class="clearfix"></div>
                        <blockquote>
                            <p>
                                <asp:Label ID="news_view" runat="server"></asp:Label>
                            </p>
                        </blockquote>

                        <asp:Label ID="labelnews_keywords" runat="server"></asp:Label>
                        <div class="leave-comment">
                            <h3>گذاشتن نظر</h3>
                            <div class="row comment-form">
                                <div class="col-md-12">

                                    <asp:TextBox ID="Comment" runat="server" placeholder="متن نظر" TextMode="MultiLine" Height="100" Width="450">
                                    </asp:TextBox>


                                    <asp:Button ID="Button1" runat="server" EnableTheming="False" OnClick="Button1_Click" Text="ارسال شود" />
                                    <div class="clearfix"></div>
                                    <p class="alert alert-success margin-top-15" id="successLabel" runat="server" visible="false">
                                        <asp:Label ID="Label2" runat="server"
                                            Text="با موفقیت ارسال شد" Visible="False"></asp:Label>
                                    </p>

                                </div>

                            </div>
                        </div>



                        <div class="comment-section">

                            <ul class="comment-tree">

                                <asp:Repeater ID="Grd_Comm" runat="server">
                                    <ItemTemplate>
                                        <li>
                                            <div class="comment-box">

                                                <div class="comment-content">
                                                    <p><%# Eval("Comment")%></p>
                                                </div>
                                            </div>
                                        </li>

                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>
                        <div class="row">
                            <!-- AddThis Button BEGIN -->

                            <div class="addthis_toolbox addthis_default_style col-md-12">
                                <p>
                                    <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4d04e1941d9ddce0"
                                        class="addthis_button_compact">اشتراک گذاری این صفحه</a> <span class="addthis_separator">|</span> <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2"></a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4"></a>
                                </p>
                            </div>
                            <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4d04e1941d9ddce0"></script>
                            <!-- AddThis Button END -->
                        </div>
                    </div>
                </div>

            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
