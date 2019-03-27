<%@ Page Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="News.aspx.cs" Inherits="BiztBiz.MyBiztBiz.News" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
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
    <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px; font-weight: bold">
            <div id="divNewNews" class="cp-tab-bg">
                <asp:HyperLink ID="lnkNewNews" runat="server" Text="ارسال خبر جدید" NavigateUrl="~/MyBiztBiz/News.aspx?statue=new"></asp:HyperLink>
            </div>
            <div id="divNewsList" class="cp-tab-bg">
                <asp:HyperLink ID="lnkNewsList" runat="server" Text="خبرهای ارسال شده" NavigateUrl="~/MyBiztBiz/News.aspx?statue=edit"></asp:HyperLink>
            </div>
        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <div style="width: 450px; padding: 15px; float: right">
                        <div style="float: right; width: 350px; vertical-align: top">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 5px 15px;
                                font-weight: bold; width: 70px; vertical-align: top">عنوان خبر : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="Title" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                ControlToValidate="Title" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div style="float: right; width: 350px; vertical-align: top">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 70px; vertical-align: top">متن خبر : </span>
                        </div>
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="350px" Width="550px">
                        </FCKeditorV2:FCKeditor>
                        <br />
                        <div style="float: right; width: 350px; vertical-align: top">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 70px; vertical-align: top">وضعیت : </span>
                            <div style="float: right; height: 26px; width: 190px; padding: 2px 5px">
                                <asp:RadioButtonList ID="rdbListIsActive" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                                    CssClass="defaultP">
                                    <asp:ListItem Text="فعال" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text=" غیر فعال" Value="0"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div style="float: right; width: 350px; vertical-align: top">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 70px; vertical-align: top">نوع خبر : </span>
                            <div style="float: right; height: 26px; width: 190px; padding: 2px 5px">
                                <asp:RadioButtonList ID="rdbListStatus" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                                    CssClass="defaultP">
                                    <asp:ListItem Text="عادی" Value="1" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="خبر داغ" Value="2"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div style="float: left; margin: 20px">
                            <asp:ImageButton ID="Button_News_insert" runat="server" OnClick="Button_News_insert_Click"
                                Height="34px" ImageUrl="~/images/cp-b-send-news.jpg" Width="123px" />
                        </div>
                    </div>
                </div>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <div style="height: 41px; background: transparent url('../images/cp-bg-title-pro.jpg') repeat-x scroll center top;
                        border: 1px #ff9966 solid; clear: both; margin: 10px 10px 0 10px; color: #666699;">
                        <span style="margin: 10px 15px 10px 0; float: right; width: 40px">ردیف</span> <span
                            style="margin: 10px; float: right; width: 160px">عنوان خبر</span> <span style="margin: 10px;
                                float: right; width: 80px">تاریخ ارسال</span> <span style="margin: 10px; float: right;
                                    width: 70px">نوع خبر </span><span style="margin: 10px; float: right; width: 50px">وضعیت</span>
                        <span style="margin: 10px; float: right; width: 70px">عملیات</span>
                    </div>
                    <div style="float: right; background: #fff; margin-right: 10px;">
                        <asp:Repeater ID="repNews" runat="server">
                            <ItemTemplate>
                                <div style="height: 40px; clear: both; color: #000;" class="newsList">
                                    <span style="margin: 10px 20px 10px 0; float: right; width: 40px">
                                        <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></span> <span style="margin: 10px;
                                            float: right; width: 160px">
                                            <%# GetNewsTilte(Eval("title").ToString())%></span> <span style="margin: 10px; float: right;
                                                width: 80px">
                                                <%#GetShamsiDate(Eval("datesend").ToString())%></span> <span style="margin: 10px;
                                                    float: right; width: 70px">
                                                    <%# GetStatus(Eval("Status").ToString())%>
                                                </span><span style="margin: 10px; float: right; width: 50px">
                                                    <%#GetIsActive(Eval("IsActive").ToString())%></span> <span style="margin: 10px; float: right;
                                                        width: 70px"><a href="News.aspx?statue=editapp&id=<%# Eval("id")%>">
                                                            <img alt="" height="16" src="../images/cp-ico-edit.jpg" width="15" />
                                                        </a>&nbsp; <a href="News.aspx?statue=delete&id=<%# Eval("id")%>" onclick="return confirm('برای حذف آیتم مورد نظر مطمئنید؟ ');">
                                                            <img alt="" height="16" src="../images/cp-ico-del.jpg" width="15" />
                                                        </a></span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('.newsList').mouseover(function () {
                                $(this).toggleClass("repeaterover");
                            }).mouseout(function () {
                                $(this).toggleClass("repeaterover");
                            });

                        });
                    
                    </script>
                </div>
            </asp:View>
            <asp:View ID="vwmessage" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <div style="width: 400px; height: 20px; padding: 7px; margin: 5px 15px; font: bold 11px tahoma;
                        float: right; border: 1px solid #3c3c3c; background-color: Green;">
                        <asp:Label ID="Lbl_ALARM" runat="server"></asp:Label>
                    </div>
                </div>
            </asp:View>
        </asp:MultiView>
        <div>
            <img alt="" height="22" src="../images/cp-frame2-down.jpg" width="611" /></div>
    </div>
    <%-- <asp:HiddenField ID="HiddenField_Nazar_Id" runat="server" />
    <asp:HiddenField ID="HiddenField_Edit_Id" runat="server" />--%>
</asp:Content>
