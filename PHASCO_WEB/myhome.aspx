<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Phasco_UserOnline.Master"
    CodeBehind="myhome.aspx.cs" Inherits="PHASCO_WEB.myhome" %>

<%@ Register Src="UI/Freindlist.ascx" TagName="Freindlist" TagPrefix="uc1" %>

<%@ Register Src="UI/UserVideos.ascx" TagName="UserVideos" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Theme/css/jquery.fancybox.min.css" rel="stylesheet" />
    <script src="Theme/js/jquery.fancybox.min.js"></script>
    <script language="JavaScript">
        function popUp(URL) {
            day = new Date();
            id = day.getTime();
            eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=0,width=300,height=100,left = 400,top = 487');");
        }
    </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="Plc" runat="server">

    <div class="tabs-widget widget">
        <ul class="menu-links">

            <li runat="server" id="SOL_DIV"><a runat="server" id="Sol_a">راه حل </a></li>
            <li runat="server" id="QU_DIV"><a runat="server" id="Qu">
                <asp:Literal runat="server" ID="Label_Qu_Name" />
            </a></li>
            <li><a runat="server" id="myvideo">ویدئوهای من </a></li>

            <li><a runat="server" id="myprofile">درباره من </a></li>

            <li><a runat="server" id="requestFreinds">
                <asp:Literal runat="server" ID="lbl_request_Count" />
                درخواستها </a></li>
            <li><a runat="server" id="allFreinds">دوستان </a></li>
            <li><a class="" runat="server" id="gallery">گالری</a></li>

            <li><a class="active" href="myhome.aspx">فاسکو من</a></li>
        </ul>
        <div class="tab-box">
            <div class="tab-content active" style="display: block;">
                <asp:Label ID="Lbl_Alarm" runat="server" Font-Bold="True" ForeColor="#C00000"></asp:Label>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">

                        <asp:DataList ID="DataList_Gallary" runat="server" CellPadding="3" RepeatColumns="4">

                            <ItemTemplate>


                                <a class="thumbnail" data-fancybox="gallery" data-caption="<%# Eval("comment")%>" href='http://phasco.com/phascoupfile/UserGallery/b<%# image_Check(Eval("id").ToString())%>'>
                                    <img <%--alt="Highslide JS"--%> src='http://phasco.com/phascoupfile/UserGallery/s<%# image_Check(Eval("id").ToString())%>'
                                        title="<%# Eval("comment")%>">
                                    <p class="text-center">
                                        <%# Eval("comment")%>
                                    </p>
                                </a>

                                <script>
                                    $('.fancybox').fancybox({
                                        beforeShow: function () {
                                            this.title = this.title + " - " + $(this.element).data("caption");
                                        }
                                    });
                                </script>

                            </ItemTemplate>
                        </asp:DataList>
                        <br />
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

                        <div class="shop-widget text-right">
                            <h4>لیست درخواست دوستان</h4>
                            <div class="widget-item">

                                <asp:Repeater ID="DataList_ReqUser" runat="server">

                                    <ItemTemplate>
                                        <div class='col-md-2'>
                                            <div class='staff-post'>
                                                <div class='staff-post-content'>
                                                    <h5><a class="menu" href='UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "User_Id")%>'>
                                                        <%#DataBinder.Eval(Container.DataItem, "Uid")%>
                                                    </a></h5>
                                                </div>
                                                <div class='staff-post-gal'>

                                                    <ul class='staf-social'>
                                                        <li>
                                                            <a class="like-color" href="myhome.aspx?id=<%#DataBinder.Eval(Container.DataItem, "User_Id")%>&mode=req&accfr=<%#DataBinder.Eval(Container.DataItem, "id")%>&accfruid=<%#DataBinder.Eval(Container.DataItem, "User_Id")%>"><i class="fa fa-check"></i></a>
                                                        </li>
                                                        <li>
                                                            <a class="dislike-color" onclick="return confirm('برای حذف اطمینان دارید')" href="myhome.aspx?id=<%#DataBinder.Eval(Container.DataItem, "User_Id")%>&mode=req&denifr=<%#DataBinder.Eval(Container.DataItem, "id")%>">حذف </a>
                                                        </li>
                                                    </ul>
                                                    <img src='<%# Images(int.Parse(Eval("Image").ToString()), int.Parse(Eval("User_Id").ToString()), int.Parse(Eval("sex").ToString()))%>' />
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>


                                <script>
                                    $(document).ready(function () {
                                        $('[data-toggle="popover"]').popover();
                                    });
                                </script>

                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <p class="alert alert-info" id="Label_alarm_Profile_wrapper" runat="server">

                            <asp:Label ID="Label_alarm_Profile" runat="server"></asp:Label>
                        </p>
                        <div class="shop-widget text-right">
                            <h4>مشخصات فردی</h4>
                            <div class="widget-item">
                                <div class="edit-block">

                                    <div class="row">
                                        <div class="form-group col-md-offset-6 col-md-6">
                                            <label>شهر</label>
                                            <asp:TextBox ID="TextBox_City" runat="server" CssClass="form-control input-group-lg" placeholder="شهر"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-offset-6 col-md-6">
                                            <label>رشته</label>
                                            <asp:TextBox ID="TextBox_Reshte" runat="server" CssClass="form-control input-group-lg" placeholder="رشته"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-md-offset-6 col-md-6">
                                            <label>مقطع تحصیلی</label>
                                            <asp:TextBox ID="TextBox_Maghata" runat="server" CssClass="form-control input-group-lg" placeholder="مقطع تحصیلی"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-offset-6 col-md-6">
                                            <label>تخصص</label>
                                            <asp:TextBox ID="TextBox_Takhasos" runat="server" CssClass="form-control input-group-lg" placeholder="تخصص"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-offset-6 col-md-6">
                                            <label>نام محل کار</label>
                                            <asp:TextBox ID="TextBox_OfficeName" runat="server" CssClass="form-control input-group-lg" placeholder="نام محل کار"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-offset-6 col-md-6">
                                            <label>عنوان شغلي</label>
                                            <asp:TextBox ID="TextBox_Job" runat="server" CssClass="form-control input-group-lg" placeholder="عنوان شغلي"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-offset-6 col-md-6">
                                            <label>پست الکترونیک</label>
                                            <asp:TextBox ID="TextBox_Email" runat="server" CssClass="form-control input-group-lg" placeholder="پست الکترونیک"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_Email"
                                                Display="Dynamic" ErrorMessage="پست الکترونیک معتبر نمی باشد" ForeColor="DarkRed"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <p class="custom-label"><strong>تاریخ تولد</strong></p>
                                        <div class="form-group col-sm-3 col-xs-6 col-md-push-9">
                                            <label for="month" class="sr-only"></label>
                                            <asp:DropDownList ID="cmbDay" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="01" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="02" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="03" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="04" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="05" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="06" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="07" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="08" Value="8"></asp:ListItem>
                                                <asp:ListItem Text="09" Value="9"></asp:ListItem>
                                                <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                                <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                                <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                                <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                                <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                                <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                                <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                                <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                                <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                                <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                                <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                                <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                                <asp:ListItem Text="26" Value="26"></asp:ListItem>
                                                <asp:ListItem Text="27" Value="27"></asp:ListItem>
                                                <asp:ListItem Text="28" Value="28"></asp:ListItem>
                                                <asp:ListItem Text="29" Value="29"></asp:ListItem>
                                                <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                                <asp:ListItem Text="31" Value="31"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-sm-3 col-xs-6 col-md-push-3">
                                            <label for="month" class="sr-only"></label>
                                            <asp:DropDownList CssClass="form-control" ID="cmbMonth" runat="server">
                                                <asp:ListItem Text="فروردين" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="ارديبهشت" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="خرداد" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="تير" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="مرداد" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="شهريور" Value="6"></asp:ListItem>
                                                <asp:ListItem Text="مهر" Value="7"></asp:ListItem>
                                                <asp:ListItem Text="آبان" Value="8"></asp:ListItem>
                                                <asp:ListItem Text="آذز" Value="9"></asp:ListItem>
                                                <asp:ListItem Text="دي" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="بهمن" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="اسفند" Value="12"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group col-sm-6 col-xs-12 col-md-pull-6">
                                            <label for="year" class="sr-only"></label>
                                            <asp:DropDownList CssClass="form-control" ID="cmbYear" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary pull-right"
                                        Text="ثبت شود" OnClick="Button1_Click" />


                                </div>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View5" runat="server">
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

                                            <asp:Repeater ID="Repeater_Wall" OnItemCommand="MyRepeater_ItemCommand" runat="server">
                                                <ItemTemplate>

                                                    <li class="text-left">
                                                        <a href='UserProfile.aspx?id=<%# Eval("uid_sender")%>'>
                                                            <img src='http://phasco.com/phascoupfile/Userphoto/<%# Eval("uid_sender")%>.jpg' />

                                                        </a>
                                                        <p>
                                                            <%# Eval("comment")%>
                                                        </p>

                                                        <p>
                                                            <i class="fa fa-calendar"></i><i class="date-wrapper"><%# persian_Date(Eval("datesend").ToString())%></i>

                                                            <i class="seprator margin-left-5 margin-right-5 pull-right">| </i><i class="fa fa-user"></i><a class="pull-right" href='UserProfile.aspx?id=<%# Eval("uid_sender")%>'>
                                                                <%# Eval("uid")%>
                                                            </a>
                                                        </p>

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

										--------------------------------------
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



                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:View>

                    <asp:View ID="View6" runat="server">

                        <div class="alert alert-success text-right">
                            <h4>راه حل شما چيست</h4>
                            <p>
                                <asp:Label ID="Label_Solu_Qu" runat="server"></asp:Label>
                            </p>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="comment-form">
                                        <asp:TextBox ID="TextBox_Ans" runat="server" placeholder="روی این صفحه بنویس" TextMode="MultiLine"></asp:TextBox>
                                        <asp:Button ID="Button_Insert" runat="server" CssClass="pull-left" OnClick="Button_Insert_Click" Text="ارسال پاسخ" />

                                        <asp:HiddenField ID="HiddenField_Id" runat="server"></asp:HiddenField>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="alert alert-warning text-right">
                            <p>
                                <asp:Label ID="Label_Alaram" runat="server" Text=""></asp:Label>
                            </p>
                        </div>
                    </asp:View>
                    <asp:View ID="View7" runat="server">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="right" dir="rtl" style="width: 100%">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr>
                                            <td style="width: 90%">
                                                <asp:Label ID="Label_QU_ALARM" runat="server"></asp:Label>
                                            </td>
                                            <td style="width: 10%">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 90%">
                                                <asp:Label ID="Label_Qu" runat="server"></asp:Label>
                                                <br />
                                                [امتیاز
                                                            <asp:Label ID="point" runat="server"></asp:Label>
                                                ]
                                            </td>
                                            <td style="width: 10%">
                                                <asp:Button ID="Button_Answer" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                    OnClick="Button_Answer_Click" Text="ارسال پاسخ" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="width: 100%" valign="top">
                                    <asp:RadioButtonList ID="RadioButtonList_QU" runat="server">
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                        </table>
                        <asp:HiddenField ID="HiddenField_Answer_Id" runat="server" />
                        <asp:HiddenField ID="HiddenField_QU_ID" runat="server" />
                    </asp:View>
                    <asp:View ID="View8" runat="server">
                        <div class="blog-box with-one-col">
                            <uc2:UserVideos ID="UserVideos1" runat="server" />

                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </div>
</asp:Content>
