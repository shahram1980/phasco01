<%@ Page Language="C#" MasterPageFile="~/Template/phasco_UserProfile.Master" AutoEventWireup="true"
    CodeBehind="UserProfile.aspx.cs" Inherits="PHASCO_WEB.UserProfile" %>

<%@ Register Src="UI/Freindlist.ascx" TagName="Freindlist" TagPrefix="uc1" %>
<%@ Register Src="UI/UserVideos.ascx" TagName="UserVideos" TagPrefix="uc2" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function popUp(URL) {
            day = new Date();
            id = day.getTime();
            eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=300,height=100,left = 400,top = 487');");
        }


    </script>
    <link href="../Theme/css/jquery.fancybox.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../Theme/js/jquery.fancybox.min.js"></script>

</asp:Content>

<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <a runat="server" cssclass="btn btn-primary  margin-right-5" id="link_Addfrn">
        <i class="fa fa-plus "></i>
        افزودن به دوستان </a>
    <div class="tabs-widget widget">
        <ul class="menu-links width25">

            <li><a runat="server" id="gallery">گالری</a></li>
            <li><a runat="server" id="allFreinds">دوستان </a></li>
            <li><a runat="server" id="Videolist">ویدئو ها </a></li>

            <li><a runat="server" id="Myphasco">فاسکو من </a></li>

        </ul>

        <div class="tab-box">
            <div class="tab-content active" style="display: block;">

                <asp:Label ID="Lbl_Alarm" runat="server" Font-Bold="True" ForeColor="#C00000"></asp:Label>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <asp:DataList ID="DataList_Gallary" runat="server" CellPadding="3" RepeatColumns="5">
                            <ItemTemplate>


                                <a class="thumbnail" data-fancybox="gallery" data-caption="<%# Eval("comment")%>" href='http://phasco.com/phascoupfile/UserGallery/b<%# image_Check(Eval("id").ToString())%>'>
                                    <img alt="" <%--alt="Highslide JS"--%> src='http://phasco.com/phascoupfile/UserGallery/s<%# image_Check(Eval("id").ToString())%>'
                                        title="<%# Eval("comment")%>">
                                    <p class="text-center">
                                        <%# Eval("comment")%>
                                    </p>
                                </a>



                            </ItemTemplate>
                        </asp:DataList>
                        <script type="text/javascript">
                            $('.fancybox').fancybox({
                                beforeShow: function () {
                                    this.title = this.title + " - " + $(this.element).data("caption");
                                }
                            });
                        </script>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div class="col-md-12">
                            <h3>لیست دوستان </h3>
                            <div class="row">

                                <uc1:Freindlist ID="Freindlist1" runat="server" />
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <div id="middle"><b>در حال بارگزاری .. </b></div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">

                            <ContentTemplate>

                                <div class="row">
                                    <div class="comment-form">

                                        <div class="row">
                                            <div class="col-md-12">

                                                <asp:TextBox ID="TextBox_comment" runat="server" placeholder="روی این صفحه بنویس" TextMode="MultiLine"></asp:TextBox>
                                                <asp:Substitution ID="Substitution1" runat="server" />
                                                <asp:Button ID="Button_Comment" runat="server" CssClass="pull-left" OnClick="Button_Comment_Click" Text="بنویس" />
                                                <asp:Label ID="Label_Alaram_Comment" runat="server" ForeColor="#CC0000"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12  margin-top-5">
                                    <div class="shop-widget text-right">
                                        <h4>نوشته ها</h4>
                                        <ul class="widget-item faq article with-img">

                                            <asp:Repeater ID="Repeater_Wall" runat="server">
                                                <ItemTemplate>

                                                    <li class="text-left">
                                                        <a class="pull-right" href='UserProfile.aspx?id=<%# Eval("uid_sender")%>'>
                                                            <img src='http://phasco.com/phascoupfile/Userphoto/<%# Eval("uid_sender")%>.jpg' />

                                                        </a>

                                                        <p>
                                                            <%# Eval("comment")%>
                                                        </p>

                                                        <p>
                                                            <i class="fa fa-calendar"></i>
                                                            <i class="date-wrapper"><%# persian_Date(Eval("datesend").ToString())%></i>

                                                            <i class="seprator margin-left-5 margin-right-5 pull-right">| </i>
                                                            <i class="fa fa-user"></i>
                                                            <a class="pull-right" href='UserProfile.aspx?id=<%# Eval("uid_sender")%>'>
                                                                <%# Eval("uid")%>
                                                            </a>
                                                        </p>
                                                       <p></p>
                                                        <span class="button-wrapper small-btn text-center">

                                                                <%# CheckDeleteaccessForWallOwner(int.Parse(Eval("uid_owner").ToString()) ,int.Parse(Eval("id").ToString())  ) %>
                                                        
                                                            </span>

                                                        <div class="clearfix"></div>
                                                        <%# set_Sub_Wall(int.Parse(Eval("id").ToString())) %>
                                                        <div class="comment-form">
                                                            <asp:HiddenField ID="id_wall" runat="server" Value='<%# Eval("id") %>' />
                                                            <asp:TextBox ID="Text" runat="server" placeholder="پاسخ" Text="" Width="95%" TextMode="MultiLine" />
                                                            <asp:Button ID="SaveButton" CssClass="pull-left" runat="server" CommandArgument='<%# Eval("uid_owner") %>'
                                                                CommandName="Save" Text="بنویس" />
                                                        </div>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>


                                        </ul>
                                        <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        اخطار
                                                    </div>
                                                    <div class="modal-body modal-text">
                                                        آیا متن دیوار نویسی حذف شود ؟
                                                       
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">لغو</button>
                                                        <a class="btn btn-danger btn-ok">حذف</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <script type="text/javascript">
                                            $('#confirm-delete').on('show.bs.modal', function (e) {
                                                $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
                                            });
                                            //$(".delete-btn").click(function (e) {
                                            //    e.preventDefault();

                                            //    if (confirm('are you sure you want to delete ?')) {
                                            //           return true;
                                            //    }
                                            //    else {
                                            //           return false;
                                            //           }


                                            //});
                                        </script>

                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                    </asp:View>
                    <asp:View ID="View5" runat="server">
                        <div class="blog-box with-one-col">
                            <uc2:UserVideos ID="UserVideos1" runat="server" />
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </div>

</asp:Content>
