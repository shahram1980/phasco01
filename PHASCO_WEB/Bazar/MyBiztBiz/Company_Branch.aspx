<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    CodeBehind="Company_Branch.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Company_Branch" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            if (jQuery.url.attr("file") == "company_profile.aspx") {
                $('#divCompany').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.attr("file") == "Company_Branch.aspx" && jQuery.url.param("PageView") == "0") {
                $('#divBranch').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.attr("file") == "Company_Branch.aspx" && jQuery.url.param("PageView") == "1") {
                $('#divNewBranch').addClass("cp-tab-bg-active");
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

                <a href="company_profile.aspx" class="list-group-item idp-group-item text-center active">
                    <strong>پروفایل شرکت</strong>
                </a>

                <asp:HyperLink ID="lnkProfileView" runat="server" CssClass="list-group-item idp-group-item text-center" Text="<strong>مشاهده پروفایل </strong>"><strong>مشاهده پروفایل </strong></asp:HyperLink>

                <a href="News.aspx?statue=edit" class="list-group-item idp-group-item text-center">
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
                    <div>
                        <div id="divNewProducts" class="margin-bottom-5">
                            <asp:HyperLink ID="lnkCompany" runat="server" Text="پروفایل شرکت" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/company_profile.aspx"></asp:HyperLink>
                            <asp:HyperLink ID="lnkNewBranch" runat="server" Text="شعب جدید" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/Company_Branch.aspx?PageView=1"></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink1" runat="server" Text="شعب شرکت" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/Company_Branch.aspx?PageView=0"></asp:HyperLink>
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
                    <div>
                        <asp:MultiView ID="muvCompanyBranch" runat="server" >
                            <asp:View ID="vwBranchList" runat="server">
                                <div class="table-responsive">

                                <table class="table table-hover table-striped table-bordered">
                                    <tr>
                                        <th>ردیف</th>
                                        <th>نام شعبه</th>
                                        <th>آدرس شعبه</th>
                                        <th>عملیات</th>
                                    </tr>
                                    <asp:Repeater ID="repCompanyBranch" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <th><%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></th>
                                                <th>
                                                    <%#Eval("BranchName")%></th>
                                                <th>
                                                    <%# Eval("BranchAdress")%></th>
                                                <th>

                                                    <asp:LinkButton ID="lnkEdit" runat="server" ToolTip="ویرایش" CssClass="btn btn-success btn-sm-custom" CommandArgument='<%#Eval("CompanyBranchID") %>'
                                                        OnCommand="lnkEdit_Command"><i class="fa fa-edit"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="حذف" CssClass="btn btn-danger btn-sm-custom" CommandArgument='<%#Eval("CompanyBranchID") %>'
                                                        OnCommand="lnkDelete_Command"><i class="fa fa-times"></i></asp:LinkButton>

                                                </th>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            $('.newsList').mouseover(function () {
                                                $(this).toggleClass("repeaterover");
                                            }).mouseout(function () {
                                                $(this).toggleClass("repeaterover");
                                            });

                                        });

                                    </script>
                                </table>
                                </div>
                            </asp:View>
                            <asp:View ID="vwBranchDetails" runat="server">
                                <table class="table rtl-text no-border">
                                    <tr>
                                        <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                            <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px; padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">نام شعبه
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="txtBranchName" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="register"
                                                ControlToValidate="txtBranchName" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                        <td class="td_register">آدرس شعبه
                                        </td>
                                        <td class="td_register_de">
                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="txtBranchAdress" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                                ControlToValidate="txtBranchAdress" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">شماره تلفن های شعبه
                                        </td>
                                        <td class="td_register_de">
                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="txtBranchTel" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="register"
                                                ControlToValidate="txtBranchTel" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">توضیح
                                        </td>
                                        <td class="td_register_de">
                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register"></td>
                                        <td class="td_register_de">
                                            <asp:Button ID="ImageButton_Create" runat="server" CssClass="btn btn-primary" OnClick="ImageButton_Create_Click"
                                                Text="ثبت اطلاعات" ValidationGroup="register" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                            <asp:View ID="vwShowAlert" runat="server">
                                <table>
                                    <tr>
                                        <td style="width: 400px; height: 100px; padding: 15px;">
                                            <asp:Label ID="lblAlert" runat="server" ForeColor="Red" Text="ابتدا اطلاعات مربوط به شرکت را از بخش پروفایل شرکت کامل کرده و سپس اطلاعات مربوط به شعب را وارد نمایید . "></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </asp:View>
                        </asp:MultiView>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>


</asp:Content>
