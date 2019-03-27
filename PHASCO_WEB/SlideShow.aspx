<%@ Page Language="C#" MasterPageFile="~/Template/Atlas_M.Master" AutoEventWireup="true" CodeBehind="SlideShow.aspx.cs" Inherits="PHASCO_WEB.SlideShow" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ContentPlaceHolderID="pagebanner" runat="server">
    <div class="page-banner">
        <div class="container">

            <ul class="page-tree rtl-text">
                <li><a href="/Default.aspx">صفحه اصلی</a></li>
                <li id="page_link_wrapper"><a id="page_link" href='/atlas.aspx'>اطلس ها</a></li>
                <li><a href='atlas.aspx?slideid=<%= categoryId%>'><%= category%></a></li>
                <li><a>
                    <asp:Literal ID="Literal_Title" runat="server"></asp:Literal></a></li>




            </ul>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <%--<script>
        $("#article_heading").html("اطلس ها");
        $("#page_link").html("اطلس ها");
        $("#page_link").attr("href", "/atlas.aspx");
        $("#page_link_wrapper").before("<li><a href='atlas.aspx?slideid=<%= categoryId%>'><%= category%></a></li>");
    </script>--%>

    <div class="single-post-content">
        <h2 class="ltr-text text-center">
            <asp:Label ID="Label_Title" runat="server" Font-Bold="True"></asp:Label></h2>
        <asp:Image ID="Image_SHow" runat="server" />

        <p class="ltr-text atlas-comment">
            <asp:Label ID="Label_Comment" runat="server"></asp:Label>
        </p>
        <asp:Literal runat="server" ID="Lit_Keyword" />
    </div>

    <div class="comment-section">
        <h3>نظرات تفسیری کاربران</h3>
        <ul class="comment-tree">
            <asp:Repeater ID="RPT_Comment" runat="server" OnItemCommand="MyRepeater_ItemCommand">

                <ItemTemplate>
                    <li>
                        <div class="comment-box">
                            <%--<img alt="" src="http://phasco.com/phascoupfile/Slides/b_<%# Eval("img")%>">--%>
                            <div class="comment-content">
                                <p><%#  Eval("Comment").ToString()%></p>
                                <div class="clearfix"></div>

                                <p class="rtl-text pull-right">
                                    <i class="fa fa-calendar pull-right"></i>
                                    <i class="date-wrapper pull-right"><%# BusinessAccessLayer.PHASCOUtility.GetShamsiDate(Eval("dateins").ToString())%></i>
                                    <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                    <i class="fa fa-user pull-right"></i>
                                    <a class="pull-right" href="UserProfile.aspx?id=<%# Eval("Uid_")%>"><%# Eval("Uid")%></a>

                                </p>
                                <p class="text-left pull-left">
                                    <span class="button-wrapper small-btn">
                                        <a class="read-more dislike-color" id="ImageButton2" title="موافق نیستم" runat="server" commandargument='<%# Eval("id") %>' commandname="minusScore">
                                            <i class="fa fa-thumbs-down"></i></a>
                                        <a class="read-more like-color" id="ImageButton1" title="موافقم" runat="server" commandargument='<%# Eval("id") %>' commandname="PlusScore">
                                            <i class="fa fa-thumbs-up"></i></a>
                                        <a class="read-more score-color" title="امتیاز این تفسیر" id="A1">
                                            <i class="fa fa-star text-warning"></i><%# Eval("UserScore")%></a>

                                    </span>

                                </p>
                            </div>
                        </div>
                    </li>

                </ItemTemplate>

            </asp:Repeater>
        </ul>

    </div>

    <div class="leave-comment">
        <h3>گذاشتن نظر</h3>
        <div class="row">



            <div class="col-md-12">

                <FCKeditorV2:FCKeditor ID="FCKeditor_Comment" runat="server" Height="100px"
                    Width="100%" ToolbarSet="Basic">
                </FCKeditorV2:FCKeditor>

                <asp:Button ID="Button_Insert" runat="server" Text="ثبت شود"
                    OnClick="Button_Insert_Click" />
                <div class="alert alert-warning">
                    <p>
                        <asp:Label runat="server" ID="lbl_NotUserLogin" />
                    </p>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
