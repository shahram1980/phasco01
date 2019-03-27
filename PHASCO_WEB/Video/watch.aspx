<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="watch.aspx.cs" Inherits="PHASCO_WEB.Video.watch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
    <style type="text/css">
        .tableWidth {
            width: 100%;
            direction: rtl;
        }

        .video-search-input-bg {
            background: no-repeat transparent url('/images/videobgsearchtextbox.jpg') scroll right top;
            height: 32px;
            width: 300px;
            float: right;
            padding-top: 8px;
            padding-right: 10px;
        }

        .video-search-input-b {
            float: right;
        }

        .VideoName {
            color: #333333;
            font-size: 24px;
            font-weight: bold;
        }

        .video-search-input-item-h {
            border: 0px;
            background: transparent;
            width: 280px;
            height: 13px;
            font: 12px tahoma;
        }

        .style18 {
            width: 100%;
        }

        .style19 {
            color: #0066FF;
        }

        .VideoListHomePage_right {
            text-align: right;
            vertical-align: top;
            width: 70%;
        }

        .video-js-responsive-container.vjs-hd {
            padding-top: 56.25%;
        }

        .video-js-responsive-container.vjs-sd {
            padding-top: 75%;
        }

        .video-js-responsive-container {
            width: 100%;
            position: relative;
        }

            .video-js-responsive-container .video-js {
                height: 100% !important;
                width: 100% !important;
                position: absolute;
                top: 0;
                left: 0;
            }
    </style>

    <script src="//player2.h-cdn.com/hola_player.js?customer=hc_ebbdc3d8"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Plc_Mid" runat="server">

    <div class="row">

        <div class="col-md-3">
            <div class="shop-widget">
                <h4>لیست ویدئو ها</h4>
                <ul class="widget-item article">
                    <asp:Repeater ID="DataList_Video" runat="server">

                        <ItemTemplate>

                            <li>
                            <a title="<%# Eval("VideoName")%>" href="watch.aspx?Vid=<%# Eval("Videoid")%>">

                                <img class="img-thumbnail" alt="<%# Eval("VideoPhotoname")%>" title="<%# Eval("VideoPhotoname")%>" src="http://phasco.com/phascoupfile/Video/thumbnail/Small/<%# Eval("VideoPhotoname")%>">
                            </a>

                                <h6 class="text-right">
                                    <a target="_parent" href="watch.aspx?Vid=<%# Eval("Videoid")%>" title="<%# Eval("VideoName")%>" rel="watch.aspx?Vid=<%# Eval("Videoid")%>">
                                        <i class="fa fa-fa-camera pull-right head-icon"></i><%# Eval("VideoName")%>
                                    </a></h6>
                                <p>
                                    <i class="fa fa-user"></i>
                                    <i class="pull-right"><%# Eval("Uid")%></i>
                                </p>
                                <p>
                                    <i class="fa fa-star"></i>
                                    <i class="pull-right"><%# Eval("UserPoint")%></i>
                                    <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                    <i class="fa fa-eye"></i>
                                    <i class="pull-right"><%# Eval("VideoVisit")%></i>
                                </p>
                                <span class="button-wrapper">
                                    <a class="read-more" title="<%# Eval("VideoName")%>" href="watch.aspx?Vid=<%# Eval("Videoid")%>"><i class="fa fa-video-camera"></i>مشاهده</a>
                                </span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>

        <div class="col-md-9 blog-side">

            <div class="row">
                <div class="col-md-7 col-sm-7">
                    <div class="search-widget widget">

                        <asp:Panel runat="server" ID="Panel1">
                            <asp:TextBox ID="txtSearch" runat="server" class="search" placeholder="... جستجو "></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSearch"
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
                <div class="clearfix"></div>
                <div class="col-md-12 rtl-text margin-top-5">
                    <p class="alert alert-warning">
                        <span>در صورت عدم نمایش ویدیو در مرورگرهایی چون Firefox-Safari-Opera
                                بر روی <b><a href="http://www.phasco.com/software/Flash%20Player%2010.0.45.2%20for%20Firefox-Safari-Opera.exe"
                                    target="_blank">لينك دانلود</a></b></span> <span class="style20">کلیک کرده و برنامه
                                        دانلود شده را نصب کنید و برای مرورگرهایی چون Internet Explorer و AOL از این <b><a
                                            href="http://www.phasco.com/software/Adobe.Flash.PlayerAol_internet.exe">لینک</a></b>
                                        استفاده نمایید.<br />
                                        ( در هنگام نصب باید مرورگرهای شما بسته باشد. )</span><span class="style2"><br />
                                        </span>
                    </p>
                </div>
            </div>
            <div>
                <div class="single-post-content">
                    <img alt="" src="upload/single-post.jpg">
                    <h2>
                        <asp:Label runat="server" ID="lbl_VideoName" CssClass="VideoName" /></h2>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
                    <script>
                        window.hola_player();
                    </script>
                    <div>
                        <div class="reaction">

                            <button id="ImageButton_LikeVideo" runat="server" title="پسندیدم" onclick="ImageButton_LikeVideo_Click" class="btn text-green pull-left">
                                <i class="fa fa-thumbs-up"></i>
                                <asp:Label runat="server" ID="lbl_like" /></button>
                            <button class="btn text-red pull-left" runat="server" title="نپسندیدم" id="ImageButton_UnlikeVideo" onclick="ImageButton_UnlikeVideo_Click">
                                <i class="fa fa-thumbs-down"></i>
                                <asp:Label runat="server" ID="lbl_Unlike" /></button>
                            <span class="btn text-warning pull-left"><i class="fa fa-star"></i>
                                <asp:Label runat="server" ID="lblUserPoint" /></span>

                            <p class="rtl-text overflow-hidden">
                                <i class="fa fa-calendar pull-right"></i>
                                <i class="date-wrapper pull-right">
                                    <asp:Literal runat="server"  ID="lbldatesend" /></i>
                                <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                <i class="fa fa-eye pull-right"></i>
                                <i class="pull-right">
                                    <asp:Literal runat="server"  ID="lblVisitcount" /></i>
                                <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                <i class="fa fa-user pull-right"></i>
                                <asp:Literal runat="server" ID="lblUser" />
                                <asp:HiddenField ID="HiddenField_UID" runat="server" />
                            </p>
                        </div>
                        <div class="clearfix"></div>
                        <p>
                            <asp:Label runat="server" ID="lblVideoDescription" />
                        </p>

                        <asp:Label runat="server" ID="Lbl_VideoTag"></asp:Label>
                        <div class="leave-comment">
                            <h3>گذاشتن نظر</h3>
                            <div class="row comment-form">
                                <div class="col-md-12">
                                    <asp:TextBox runat="server" placeholder="متن نظر" ID="TextBox_Comment" TextMode="MultiLine" Width="450"
                                        Height="100" />

                                    <p class="alert alert-warning">
                                        <asp:Label runat="server" ID="lbl_NotUserLogin" />
                                    </p>

                                    <input type="submit" runat="server" id="imgBtt_Submit" onclick="imgBtt_Submit_Click" value="ارسال">
                                </div>
                            </div>
                        </div>

                        <div class="comment-section">

                            <ul class="comment-tree">

                                <asp:Repeater ID="RPT_Comment" runat="server" OnItemCommand="MyRepeater_ItemCommand">
                                    <ItemTemplate>
                                        <li>
                                            <div class="comment-box">

                                                <div class="comment-content">
                                                    <h6><a href="/UserProfile.aspx?id=<%# Eval("Uid_")%>">
                                                        <%# Eval("Uid")%>
                                                    </a>
                                                        </span> <span><%# BusinessAccessLayer.PHASCOUtility.GetShamsiDate(Eval("dateins").ToString())%></span></h6>
                                                    <p><%# Eval("Comment")%></p>
                                                    <span class="button-wrapper small-btn">
                                                        <asp:LinkButton ID="ImageButton2" CssClass="read-more like-color" runat="server"
                                                            CommandName="addScore" ToolTip="جالب بود"><i class="fa fa-thumbs-up"></i>جالب بود</asp:LinkButton>

                                                        <asp:LinkButton ID="ImageButton1" CssClass="read-more dislike-color" runat="server"
                                                            CommandName="minusScore" ToolTip="جالب نبود"><i class="fa fa-thumbs-down"></i>جالب نبود</asp:LinkButton>

                                                        <a class="read-more score-color" title="امتیاز"><i class="fa fa-star"></i><%# Eval("UserScore")%></a>
                                                    </span>
                                                </div>
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
    </div>
</asp:Content>
