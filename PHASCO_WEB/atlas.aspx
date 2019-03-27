<%@ Page Language="C#" MasterPageFile="~/Template/Atlas_M.Master" AutoEventWireup="true" CodeBehind="atlas.aspx.cs" Inherits="PHASCO_WEB.atlas" %>



<asp:Content ContentPlaceHolderID="pagebanner" runat="server">
    <div class="page-banner">
        <div class="container">
            <h2><span id="article_heading">اطلس ها</span></h2>
            <ul class="page-tree rtl-text">

                <li><a href="/Default.aspx">صفحه اصلی</a></li>
                <li id="page_link_wrapper"><a id="page_link" href='/atlas.aspx'>اطلس ها</a></li>


            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <script language="C#" runat="server">

        public string Mss_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            return sunDate.Weekday.ToString();
        }
        public string Set_Image(int image)
        {
            if (image == 1) return "http://phasco.com/phascoupfile/Userphoto/" + image + ".jpg";
            else if (image == 0) return "http://phasco.com/phascoupfile/Userphoto/Nopic.jpg";

            return "http://phasco.com/phascoupfile/Userphoto/Nopic.jpg";
        }

        public string ISCurrent(string value)
        {
            try
            {
                if (value == ViewState["drpPagingIndex"].ToString()) return "active";
                else return "";
            }
            catch (Exception)
            {
                if (value == "0") return "active";
                else return "";
            }

        }




    </script>
    <div class="row">


        <div class="col-md-12">
            <asp:MultiView ID="MultiView1" runat="server">


                <asp:View ID="View1" runat="server">

                    <div class="row">

                        <div class="col-md-8 col-md-push-4">
                            <div class="shop-widget">
                                <h4>آخرین تفاسیر کاربران</h4>
                                <ul class="widget-item article faq">

                                    <asp:Repeater ID="RPT_Comment" runat="server">
                                        <ItemTemplate>

                                            <li>
                                                <%--<%# SetUserImageView(BusinessAccessLayer.PHASCOUtility.ConverToNullableInt(Eval("Uid_")))%>--%>
                                                <a target="_parent" title="<%# Eval("Title")%>" href="SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "AtlasID")%>">

                                                    <img src="http://phasco.com/phascoupfile/Slides/s_<%#DataBinder.Eval(Container.DataItem, "AtlasID")%>.jpg" />

                                                </a>
                                                <h6 class="text-right">
                                                    <a title="<%# Eval("Title")%>" target="_parent" href="SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "AtlasID")%>">
                                                        <%# Eval("Title")%>
                                                    </a></h6>

                                                <%--<p class="comment-wrapper"><span><%# Eval("Comment")%></span></p>--%>
                                                <p>
                                                    <i class="fa fa-calendar pull-right"></i>
                                                    <i class="date-wrapper pull-right">
                                                        <%# BusinessAccessLayer.PHASCOUtility.Mss_Date(Eval("dateins").ToString())%></i> <i class="seprator pull-right">| </i>
                                                    <i class="fa fa-star pull-right"></i>
                                                    <i class="pull-right"><%# Eval("UserScore")%> | </i>
                                                    <i class="fa fa-user pull-right"></i>
                                                    <i class="pull-right"><a href="/UserProfile.aspx?id=<%# Eval("Uid_")%>"></i>

                                                    <%# Eval("Uid")%>
                                                </a>
                                                </p>
                                                <span class="button-wrapper text-center">
                                                    <a class="read-more" title=" <%# Eval("Title")%>" href="SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "AtlasID")%>"><i class="fa fa-arrow-left"></i>جزئیات</a>
                                                </span>
                                            </li>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </ul>
                            </div>

                        </div>
                        <div class="col-md-4 col-md-pull-8">


                            <div class="shop-widget">
                                <h4>برخی از اسلایدها</h4>
                                <ul class="popular-product">


                                    <asp:Repeater ID="DataList_Rand" runat="server">
                                        <ItemTemplate>

                                            <li>
                                                <a title="<%# Eval("Title")%>" href='SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "id")%>'>
                                                    <img alt="tjpzoom picture title" src='http://phasco.com/phascoupfile/Slides/s_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg' />
                                                </a>


                                                <div>
                                                    <a title="<%# Eval("Title")%>" href='SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "id")%>'>

                                                        <h6><%#DataBinder.Eval(Container.DataItem, "Title")%></h6>
                                                    </a>
                                                    <p class="comment-wrapper"><span><%#DataBinder.Eval(Container.DataItem, "Comment")%></span></p>
                                                </div>
                                            </li>

                                        </ItemTemplate>
                                    </asp:Repeater>



                                </ul>
                            </div>
                        </div>

                    </div>

                </asp:View>
                <asp:View ID="View2" runat="server">
                    <script>
                        $("#page_link_wrapper").after("<li><a href='Article.aspx?articleid=<%= categoryId%>'><%= category%></a></li>");

                    </script>
                    <div class="row">
                        <div class="col-md-12">
                            <h3>
                                <asp:Label ID="Label_Current_Title" runat="server"></asp:Label></h3>
                            <asp:Repeater ID="DataList_Slid" runat="server">
                                <ItemTemplate>

                                    <div class="col-md-4">
                                        <div class="product-post">
                                            <div class="product-post-gal">
                                                <a href='SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "id")%>' title="<%#DataBinder.Eval(Container.DataItem, "Title")%>">
                                                    <img alt="<%#DataBinder.Eval(Container.DataItem, "Title")%>" src="http://phasco.com/phascoupfile/Slides/b_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg">
                                                </a>
                                            </div>
                                            <div class="product-post-content">
                                                <a  href='SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "id")%>' title="<%#DataBinder.Eval(Container.DataItem, "Title")%>">

                                                <h5 class="atlas-comment"><%#DataBinder.Eval(Container.DataItem, "Title")%></h5>
                                                </a>
                                                <span class="">
                                                    <a class="read-more margin-top-5" href='SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "id")%>'>مشاهده  <i class="fa fa-arrow-right"></i></a>


                                                </span>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>

                            </asp:Repeater>
                        </div>
                    </div>
                    <ul class="pagination-list rtl-text">

                        <asp:Repeater ID="Repeater_Slide_Paging" runat="server">
                            <ItemTemplate>

                                <li>
                                    <asp:LinkButton ID="Linkbutton_Panging_Slide" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.value","{0}") %>'
                                        CssClass='<%# ISCurrent(Eval("value").ToString()) %>' OnCommand="Linkbutton_Panging_Slide_Command"
                                        Text='<%# Eval("item")%>'></asp:LinkButton></li>
                            </ItemTemplate>
                        </asp:Repeater>

                    </ul>


                </asp:View>
            </asp:MultiView>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="plchead">
</asp:Content>
