<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="Requests.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Requests" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            if (jQuery.url.param("5061676556696577") == "31") {
                $('#divNewRequest').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("5061676556696577") == "30" && jQuery.url.param("537461747573") == "30") {
                $('#divWaitRequest').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("5061676556696577") == "30" && jQuery.url.param("537461747573") == "31") {
                $('#divConfirmRequest').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("5061676556696577") == "30" && jQuery.url.param("537461747573") == "32") {
                $('#divNotConfirmRequest').addClass("cp-tab-bg-active");
            }
        });
    </script>


    <div>

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
                    <a href="Requests.aspx?5061676556696577=30&537461747573=31" class="list-group-item idp-group-item text-center active">
                        <strong>مدیریت درخواست های خرید</strong>
                    </a>

                    <a href="company_profile.aspx" class="list-group-item idp-group-item text-center">
                        <strong>پروفایل شرکت</strong>
                    </a>
                    <%--<a href="lnkProfileView" class="list-group-item idp-group-item text-center" runat="server" >
                        <strong>مشاهده پروفایل</strong>

                    </a>--%>
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

                <div class="bhoechie-tab-content active text-center rtl-text">

                    <div>
                        <div id="divNewProducts" class="margin-bottom-5">
                            <asp:HyperLink ID="lnkNewRequest" runat="server" Text="محصول جدید" CssClass="btn btn-success margin-top-5" NavigateUrl="~/Bazar/MyBiztBiz/Requests.aspx?5061676556696577=31"></asp:HyperLink>
                            <asp:HyperLink ID="lnkWaitProducts" runat="server" Text="در انتظار تایید" CssClass="btn btn-success margin-top-5" NavigateUrl="~/Bazar/MyBiztBiz/Requests.aspx?5061676556696577=30&537461747573=30"></asp:HyperLink>
                            <asp:HyperLink ID="lnkConfirmProducts" runat="server" Text="تایید شده ها" CssClass="btn btn-success margin-top-5" NavigateUrl="~/Bazar/MyBiztBiz/Requests.aspx?5061676556696577=30&537461747573=31"></asp:HyperLink>
                            <asp:HyperLink ID="lnkNotConfirmProducts" runat="server" Text="رد شده ها" CssClass="btn btn-success margin-top-5" NavigateUrl="~/Bazar/MyBiztBiz/Requests.aspx?5061676556696577=30&537461747573=32"></asp:HyperLink>
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
                    <asp:MultiView ID="muvRequest" runat="server">
                        <asp:View ID="vwRequestList" runat="server">
                            <div class="table-responsive">
                                <table class="table table-hover table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>ردیف</th>
                                            <th>کالای درخواستی</th>
                                            <th>مدل</th>
                                            <th>تاریخ</th>
                                            <th>ارسال</th>
                                            <th>تعداد</th>
                                            <th>عملیات</th>
                                        </tr>
                                    </thead>
                                    <asp:Repeater ID="repRequest" runat="server">
                                        <ItemTemplate>
                                            <div style="height: 50px; clear: both;" class="RequestList">
                                                <td >
                                                    <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></td>
                                                <td>
                                                    <%#Eval("ProductName")%></td>
                                                <td>
                                                    <%#Eval("Model")%>
                                                </td>
                                                <td>
                                                    <%# Set_Date(Eval("RequestDate").ToString())%></td>
                                                <td>
                                                    <%#Eval("Count")%>
                                                </td>
                                                <td>
                                                   
                                                    <asp:LinkButton ID="lnkEdit" runat="server" ToolTip="ویرایش" CssClass="btn btn-success btn-sm-custom" CommandArgument='<%#Eval("RequestID") %>'
                                                    OnCommand="lnkEdit_Command"><i class="fa fa-edit"></i></asp:LinkButton>

                                                   
                                                      <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="حذف" CssClass="btn btn-danger btn-sm-custom" CommandArgument='<%#Eval("RequestID") %>'
                                                    OnCommand="lnkDelete_Command"><i class="fa fa-times"></i></asp:LinkButton>
                                                </td>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>


                            </div>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('.RequestList').mouseover(function () {
                                        $(this).toggleClass("repeaterover");
                                    }).mouseout(function () {
                                        $(this).toggleClass("repeaterover");
                                    });

                                });

                            </script>

                        </asp:View>
                        <asp:View ID="vwRequestDetails" runat="server">
                            <table class="table no-border">
                                    <tr>
                                        <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                            <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px; padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">نام کالای مورد نظر
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                                ControlToValidate="txtProductName" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">مدل
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="txtModel" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <%-- <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                    ControlToValidate="txtModel" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">جزئیات و مشخصات
                                        </td>
                                        <td class="td_register_de">
                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="txtDetailsAndFeatures" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="register"
                                                ControlToValidate="txtDetailsAndFeatures" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, Category %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                <ProgressTemplate>
                                                    <asp:Literal ID="Literal00102" runat="server" Text="<%$ Resources:Resource, Loading %>" />
                                                    ...
                                                </ProgressTemplate>
                                            </asp:UpdateProgress>
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="DropDownList_Cat1" runat="server" CssClass="form-control dropdown-form margin-top-5">
                                                </asp:DropDownList>
                                            </div>
                                            <ajaxToolkit:CascadingDropDown ID="ccdCat1" runat="server" TargetControlID="DropDownList_Cat1"
                                                Category="Category" PromptText="لطفاً انتخاب کنید" ServicePath="~/bazar/Services/BiztBizServices.asmx"
                                                ServiceMethod="GetCategory" />
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="DropDownList_Cat2" runat="server" CssClass="form-control dropdown-form margin-top-5">
                                                </asp:DropDownList>
                                            </div>
                                            <ajaxToolkit:CascadingDropDown ID="ccdCat2" runat="server" TargetControlID="DropDownList_Cat2"
                                                ParentControlID="DropDownList_Cat1" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSubCategory"
                                                ServicePath="~/bazar/Services/BiztBizServices.asmx" Category="SubCategory" />
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="DropDownList_Cat3" runat="server" CssClass="form-control dropdown-form margin-top-5">
                                                </asp:DropDownList>
                                            </div>
                                            <ajaxToolkit:CascadingDropDown ID="ccdCat3" runat="server" TargetControlID="DropDownList_Cat3"
                                                ParentControlID="DropDownList_Cat2" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSub2Category"
                                                ServicePath="~/bazar/Services/BiztBizServices.asmx" Category="Sub2Category" />
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">تعداد
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="txtCount" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">استان / شهر
                                        </td>
                                        <td class="td_register_de">
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control dropdown-form margin-top-5">
                                                </asp:DropDownList>
                                            </div>
                                            <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                                Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/bazar/Services/BiztBizServices.asmx"
                                                ServiceMethod="GetState" />
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control dropdown-form margin-top-5">
                                                </asp:DropDownList>
                                            </div>
                                            <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                                                ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                                                ServicePath="~/bazar/Services/BiztBizServices.asmx" Category="City" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">حدود قیمت
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">توضیحات
                                        </td>
                                        <td class="td_register_de">
                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">زمان فعال بودن
                                        </td>
                                        <td class="td_register_de">
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="ddlExpireSchedule" runat="server" CssClass="form-control dropdown-form">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register"></td>
                                        <td class="td_register_de">
                                            <%--<a href="Requests.aspx?Status=<%=StatusID %>">[بازگشت به لیست]</a>--%>
                                            <asp:Button ID="ImageButton_Create" runat="server" CssClass="btn btn-primary" SkinID="btnNormal" OnClick="ImageButton_Create_Click"
                                                Text="ثبت درخواست" ValidationGroup="register" />
                                        </td>
                                    </tr>
                                </table>
                        </asp:View>
                    </asp:MultiView>
                </div>
            </div>
        </div>


    </div>
</asp:Content>
