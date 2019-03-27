<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="ProfileSetting.aspx.cs" Inherits="BiztBiz.MyBiztBiz.ProfileSetting" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
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

                <a href="News.aspx?statue=edit" class="list-group-item idp-group-item text-center">
                    <strong>اخبار</strong></a>
                <a href="ProfileSetting.aspx" class="list-group-item idp-group-item text-center active">
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
                    <div id="divMessage" runat="server" visible="false" class="alert alert-info">
                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                    </div>

                    <div class="form-horizontal">

                        <div class="form-group">
                            <span class="control-label col-sm-2 col-xs-12 text-right">نوع عضویت :</span>
                            <asp:RadioButtonList ID="rdbListUserTypes" runat="server" RepeatColumns="1" RepeatDirection="Vertical"
                                ForeColor="Gray" Font-Bold="true" CssClass="defaultP">
                                <asp:ListItem Text="فروشنده" Value="1"></asp:ListItem>
                                <asp:ListItem Text="خریدار" Value="2"></asp:ListItem>
                                <asp:ListItem Text="هردو" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div class="form-group">
                            <span class="control-label col-sm-2 col-xs-12 text-right">ایمیل تجاری:</span>
                            <div class="col-sm-10 col-xs-12">
                                <asp:TextBox ID="TextBox_Email" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group required">
                            <span class="control-label col-sm-2 col-xs-12 text-right">نام : </span>
                            <div class="col-sm-10 col-xs-12">
                                <asp:TextBox ID="TextBox_Name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div style="float: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox_Name"
                                    ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group required">
                            <span class="control-label col-sm-2 col-xs-12 text-right">نام خانوادگی : </span>
                            <div class="col-sm-10 col-xs-12">
                                <asp:TextBox ID="TextBox_Family" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div style="float: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox_Family"
                                    ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="control-label col-sm-2 col-xs-12 text-right">شهر : </span>

                            <div class="col-sm-5 col-xs-12">
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control dropdown-form">
                                </asp:DropDownList>
                                <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                    Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/bazar/Services/BiztBizServices.asmx"
                                    ServiceMethod="GetState" />



                            </div>

                            <div class="col-sm-5 col-xs-12">
                                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control dropdown-form">
                                </asp:DropDownList>
                                <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                                    ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                                    ServicePath="~/bazar/Services/BiztBizServices.asmx" Category="City" />

                            </div>
                        </div>
                        <div class="form-group required">
                            <span class="control-label col-sm-2 col-xs-12 text-right">زمینه اصلی فعالیت: </span>
                            <div class="col-sm-10 col-xs-12">
                                <asp:DropDownList ID="DropDownList_Indus" runat="server" CssClass="form-control dropdown-form">
                                </asp:DropDownList>

                            </div>
                        </div>
                        <div class="form-group required">
                            <span class="control-label col-sm-2 col-xs-12 text-right">تلفن : </span>
                            <div class="col-sm-10 col-xs-12">
                                <asp:TextBox ID="TextBox_Tel_A_Number" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div style="float: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox_Tel_A_Number"
                                    ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>





                        <div class="form-group required">
                            <span class="control-label col-sm-2 col-xs-12 text-right">فکس : </span>
                            <div class="col-sm-10 col-xs-12">
                                <asp:TextBox ID="TextBox_fax" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                            <div style="float: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_fax"
                                    ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>


                        <div class="form-group required">
                            <span class="control-label col-sm-2 col-xs-12 text-right">تلفن همراه : </span>
                            <div class="col-sm-10 col-xs-12">
                                <asp:TextBox ID="TextBox_Mobile" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                        </div>
                        <asp:Button  CssClass="btn btn-success pull-left margin-bottom-15" runat="server" ID="BtnConfirm" OnClick="BtnConfirm_Click"
                            ValidationGroup="register" Text="ثبت اطلاعات" />
                    </div>

                </div>


            </div>
        </div>
    </div>

</asp:Content>
