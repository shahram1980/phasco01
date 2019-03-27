<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="PHASCO_WEB.Video.Default" %>



<asp:Content ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">

    <div class="row">
        <div class="col-md-3">


            <div class="shop-widget">
                <h4>موضوعات</h4>
                <ul class="widget-item">
                    <li>
                        <h6>
                            <i class="fa fa-heart margin-left-5"></i>
                            <a href="?s=MostPopular" title="محبوب ترین ها">محبوب ترین ها </a>

                        </h6>
                    </li>

                    <li>
                        <h6>
                            <i class="fa fa-eye margin-left-5"></i>
                            <a href="?s=topvisit" title="پربازدید ترین ها">پربازدید ترین ها </a>

                        </h6>
                    </li>
                    <asp:Repeater ID="Repeater_CAT" runat="server">
                        <ItemTemplate>

                            <li>
                                <h6>
                                    <i class="fa fa-chevron-left margin-left-5"></i>
                                    <a href="?CATID=<%#Eval("ID") %>" title="<%#Eval("Categorie_Name")%>"><%#Eval("Categorie_Name")%>  (<%#Eval("VideoCount")%>)</a>
                                </h6>
                            </li>

                        </ItemTemplate>
                    </asp:Repeater>
                </ul>





            </div>
        </div>
        <div class="col-md-9 blog-side">

            <div class="create-post">
                <div class="row">
                    <div class="col-md-7 col-sm-7">
                        <div class="search-widget widget">

                            <asp:Panel runat="server" ID="Panel_Video_Search">
                                <asp:TextBox ID="txtSearch" runat="server" class="search" placeholder="... جستجو "></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearch"
                                    ValidationGroup="SearchAdvance" Display="Dynamic"></asp:RequiredFieldValidator>


                                <button runat="server" id="btnSearch" onserverclick="btnSearch_Click" validationgroup="SearchAdvance">

                                    <i class="fa fa-search"></i>
                                </button>

                            </asp:Panel>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-5">
                        <div class="tools">
                            <p>
                                <span>کل ویدیو های موجود <span style="color: #800000;">
                                    <asp:Label runat="server" ID="lblCount" />
                                </span>عدد می باشد </span>
                            </p>

                            <p>
                                <a href="UploadVideo.aspx" class="btn btn-primary pull-right">آپلود ویدیو
                                </a>
                            </p>

                        </div>
                    </div>
                </div>
            </div>
            <div class="blog-box with-one-col">
                <asp:Repeater ID="DataList_Video" runat="server">
                    <ItemTemplate>

                        <div class="item news-item">
                            <div class="inner-item">
                                <a href="watch.aspx?Vid=<%# Eval("Videoid")%>" title=" <%# Eval("VideoName")%>">

                                    <img alt="<%# Eval("VideoPhotoname")%>" title="<%# Eval("VideoName")%>" src="http://phasco.com/phascoupfile/Video/thumbnail/Small/<%# Eval("VideoPhotoname")%>">
                                </a>
                                <div class="hover-item">
                                    <ul>
                                        <li><a class="autor" href="/UserProfile.aspx?id=<%# Eval("UserID") %>"><i class="fa fa-user"></i><%# Eval("Uid")%></a></li>
                                        <li><a class="date" href="#"><i class="fa fa-eye"></i><%# Eval("VideoVisit")%></a></li>
                                        <li><a class="comment-numb" href="#"><i class="fa fa-star"></i><%# Eval("UserPoint")%></a></li>
                                    </ul>
                                </div>
                            </div>
                            <a href="watch.aspx?Vid=<%# Eval("Videoid")%>" title=" <%# Eval("VideoName")%>">

                            <h5><%# Eval("VideoName")%></h5>
                            </a>
                            <p><%# Eval("VideoDescription")%></p>
                            <ul class="tag-widget-list">
                                <%# KeywordSpliter(Eval("VideoTag").ToString(),Eval("Videoid"),Eval("VideoName"))%>
                            </ul>
                            <span class="button-wrapper">
                                <a class="read-more" href="watch.aspx?Vid=<%# Eval("Videoid")%>" title=" <%# Eval("VideoName")%>">مشاهده <i class="fa fa-video-camera"></i></a>
                            </span>

                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <ul class="pagination-list rtl-text">
                <asp:Repeater ID="DataList_Pager" runat="server">

                    <ItemTemplate>

                        <%# createpagingUrl(Eval("Pager").ToString()) %>
                    </ItemTemplate>

                </asp:Repeater>
            </ul>

        </div>

    </div>

</asp:Content>
