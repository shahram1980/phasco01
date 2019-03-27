<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="BiztBiz.MyBiztBiz.News" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            if (jQuery.url.param("statue") == "new" || jQuery.url.param("statue") == "editapp") {
                $('#divNewNews').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("statue") == "edit") {
                $('#divNewsList').addClass("cp-tab-bg-active");
            }
        });
    </script>


    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </ajaxToolkit:ToolkitScriptManager>
    <div class="col-md-12 bhoechie-tab-container">
        <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 bhoechie-tab-menu pull-right">
            <div class="list-group">
                <a href="default.aspx" class="list-group-item idp-group-item text-center">
                    <strong>پنل کاربری</strong>
                </a>
                <a href="Products.aspx?5061676556696577=30&537461747573=31" class="list-group-item idp-group-item text-center">
                    <strong>مدیریت محصولات</strong>
                </a>
                <a href="Requests.aspx?5061676556696577=30&537461747573=31" class="list-group-item idp-group-item text-center">
                    <strong>مدیریت درخواست های خرید</strong>
                </a>

                <a href="company_profile.aspx" class="list-group-item idp-group-item text-center">
                    <strong>پروفایل شرکت</strong>
                </a>

                <asp:HyperLink ID="lnkProfileView" runat="server" CssClass="list-group-item idp-group-item text-center" Text="<strong>مشاهده پروفایل </strong>"><strong>مشاهده پروفایل </strong></asp:HyperLink>

                <a href="News.aspx?statue=edit" class="list-group-item idp-group-item text-center active">
                    <strong>اخبار</strong></a>
                <a href="ProfileSetting.aspx" class="list-group-item idp-group-item text-center">
                    <strong>ویرایش مشخصات فردی</strong></a>

                <a href="inquiry_List.aspx" class="list-group-item idp-group-item text-center">
                    <strong>درخواست ها / پیام ها</strong></a>

                <asp:HyperLink ID="lnkLogout" class="list-group-item idp-group-item text-center" runat="server" OnClick="lnkLogout_Click" Text="خروج"><strong>خروج </strong></asp:HyperLink>

            </div>
        </div>
        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 bhoechie-tab pull-right">
            <!-- flight section -->

            <div class="bhoechie-tab-content active text-center rtl-text">
                <div>
                    <div id="divNewProducts" class="margin-bottom-15">
                        <asp:HyperLink ID="lnkNewNews" runat="server" Text="ارسال خبر جدید" CssClass="btn btn-info margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/News.aspx?statue=new"></asp:HyperLink>
                        <asp:HyperLink ID="lnkNewsList" runat="server" Text="خبرهای ارسال شده" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/News.aspx?statue=edit"></asp:HyperLink>

                    </div>


                </div>
                <style>
                    .btn-sm-custom {
                        padding: 5px 10px !important;
                        font-size: 12px !important;
                        line-height: 1.5;
                        border-radius: 3px;
                    }
                </style>
                <div id="divNewNews" class="cp-tab-bg">
                </div>
                <div id="divNewsList" class="cp-tab-bg">
                </div>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div>
                            <div>
                                <div class="form-group">
                                    <label class="col-md-2 pull-right text-right">عنوان خبر : </label>
                                    <asp:TextBox ID="Title" runat="server" CssClass="form-control pull-right" Width="90%"></asp:TextBox>

                                    <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                        *
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                        ControlToValidate="Title" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 pull-right text-right">متن خبر : </label>
                                    

                                </div>
                                <div class="pull-right" style="width: 90%;">
                                        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="350px" Width="100%">
                                        </FCKeditorV2:FCKeditor>
                                    </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *
                                </div>

                               
                                <div class="form-group col-md-12 overflow-hidden">
                                    <label class="col-md-2 pull-right text-right" >وضعیت : </label>
                                    <div>
                                        <asp:RadioButtonList ID="rdbListIsActive" runat="server" RepeatColumns="1" RepeatDirection="Vertical"
                                            CssClass="defaultP">
                                            <asp:ListItem Text="فعال" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text=" غیر فعال" Value="0"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group  col-md-12  overflow-hidden">
                                    <label class="col-md-2 pull-right text-right" >نوع خبر : </label>
                                    <div>
                                        <asp:RadioButtonList ID="rdbListStatus" runat="server" RepeatColumns="1" RepeatDirection="Vertical"
                                            CssClass="defaultP">
                                            <asp:ListItem Text="عادی" Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="خبر داغ" Value="2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div style="float: left; margin: 20px">
                                    <asp:ImageButton ID="Button_News_insert" runat="server" OnClick="Button_News_insert_Click"
                                        Height="34px" ImageUrl="~/bazar/images/cp-b-send-news.jpg" Width="123px" />
                                </div>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped table-hover">
                                <tr>
                                    <th>ردیف</th>
                                    <th>عنوان خبر</th>
                                    <th>تاریخ ارسال</th>
                                    <th>نوع خبر </th>
                                    <th>وضعیت</th>
                                    <th>عملیات</th>
                                </tr>


                                <asp:Repeater ID="repNews" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></td>
                                            <td>
                                                <%# GetNewsTilte(Eval("title").ToString())%></td>
                                            <td>
                                                <%#GetShamsiDate(Eval("datesend").ToString())%></td>
                                            <td>
                                                <%# GetStatus(Eval("Status").ToString())%>
                                            </td>
                                            <td>
                                                <%#GetIsActive(Eval("IsActive").ToString())%></td>
                                            <td><a href="News.aspx?statue=editapp&id=<%# Eval("id")%>">
                                                <img alt="" height="16" src="../images/cp-ico-edit.jpg" width="15" />
                                            </a><a href="News.aspx?statue=delete&id=<%# Eval("id")%>" onclick="return confirm('برای حذف آیتم مورد نظر مطمئنید؟ ');">
                                                <img alt="" height="16" src="../images/cp-ico-del.jpg" width="15" />
                                            </a></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="vwmessage" runat="server">
                        <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top; width: 611px; float: right; color: #000;">
                            <div style="width: 400px; height: 20px; padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c; background-color: Green;">
                                <asp:Label ID="Lbl_ALARM" runat="server"></asp:Label>
                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>

            </div>
        </div>
    </div>


    <%-- <asp:HiddenField ID="HiddenField_Nazar_Id" runat="server" />
    <asp:HiddenField ID="HiddenField_Edit_Id" runat="server" />--%>
</asp:Content>
