<%@ Page Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="company_profile.aspx.cs" Inherits="BiztBiz.MyBiztBiz.company_profile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            var getUrlParameter = function getUrlParameter(sParam) {
                var sPageURL = decodeURIComponent(window.location.search.substring(1)),
                    sURLVariables = sPageURL.split('&'),
                    sParameterName,
                    i;

                for (i = 0; i < sURLVariables.length; i++) {
                    sParameterName = sURLVariables[i].split('=');

                    if (sParameterName[0] === sParam) {
                        return sParameterName[1] === undefined ? true : sParameterName[1];
                    }
                }
            };
            if (jQuery.url.attr("file") == "company_profile.aspx") {
                $('#<%=lnkCompany.ClientID%>').removeClass("btn-success").addClass("btn-info");
            }

            if (jQuery.url.attr("file") == "Company_Branch.aspx" && getUrlParameter("PageView") == "0") {
                $('#<%=lnkCompanyBranch.ClientID%>').removeClass("btn-success").addClass("btn-info");
            }

            if (jQuery.url.attr("file") == "Company_Branch.aspx" && getUrlParameter("PageView") == "1") {
                $('#<%=lnkNewBranch.ClientID%>').removeClass("btn-success").addClass("btn-info");
            }

            //            if (jQuery.url.attr("file") == "company_profile.aspx" && jQuery.url.param("CompanyProfileNotComplate") == "1") {
            //                $('#companyProfileComplate').css("display", "block");
            //            }
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

            <div class="active text-center rtl-text">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div >

                            <div id="divNewProducts" class="margin-bottom-5">
                                <asp:HyperLink ID="lnkCompany" runat="server" Text="پروفایل شرکت" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/company_profile.aspx"></asp:HyperLink>
                                <asp:HyperLink ID="lnkCompanyBranch" runat="server" Text="شعب شرکت" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/Company_Branch.aspx?PageView=0"></asp:HyperLink>
                                <asp:HyperLink ID="lnkNewBranch" runat="server" Text="شعب جدید" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/Company_Branch.aspx?PageView=1"></asp:HyperLink>
                            </div>
                            <table class="table no-border">
                                <tr>
                                    <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                        <div id="companyProfileComplate" runat="server" class="alert alert-info text-center">
                                            برای ارسال محصول ابتدا باید اطلاعات مربوط به شرکت را کامل نمایید.
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                        <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px; padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">
                                        <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, Company_Name %>" />
                                    </td>
                                    <td class="td_register_de">
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="TextBox_Company_Name" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="register"
                                            ControlToValidate="TextBox_Company_Name" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">
                                        <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:Resource, Company_Logo %>" />
                                    </td>
                                    <td class="td_register_de">
                                        <div class="fileupload-bg-normal">
                                            <asp:FileUpload ID="FileUpload_Logo" runat="server" CssClass="fileupload-item" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">&nbsp;
                                    </td>
                                    <td class="td_register_de">
                                        <asp:Image ID="Image_Logo" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, CompanyCompany_Address_Name %>" />
                                    </td>
                                    <td class="td_register_de">
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="TextBox_Company_Address" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                            ControlToValidate="TextBox_Company_Address" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
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
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">
                                        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Zip_Postal_Code %>" />
                                    </td>
                                    <td class="td_register_de">
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="TextBox_Zip" runat="server" CssClass="form-control" MaxLength="11"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                            ControlToValidate="TextBox_Zip" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="td_register">
                                        <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource, Website	 %>" />
                                    </td>
                                    <td class="td_register_de">
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="TextBox_Company_Website" runat="server" CssClass="form-control">http://</asp:TextBox>
                                        </div>
                                    </td>
                                </tr>



                                <tr>
                                    <td class="td_register">

                                        <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource, Category %>" />
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
                                            <asp:DropDownList EnableViewState="false" ID="DropDownList_Cat3" runat="server"
                                                CssClass="form-control dropdown-form margin-top-5">
                                            </asp:DropDownList>
                                        </div>
                                        <ajaxToolkit:CascadingDropDown ID="ccdCat3" runat="server" TargetControlID="DropDownList_Cat3"
                                            ParentControlID="DropDownList_Cat2" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSub2Category"
                                            ServicePath="~/bazar/Services/BiztBizServices.asmx" Category="Sub2Category" />

                                        <asp:Button CssClass="btn btn-success pull-left margin-top-5" runat="server" ID="Button_AddGroup" Text="  اضافه شود  " OnClick="Button_AddGroup_Click" />

                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">دسته بندی های انتخاب شده



 
 
                                    </td>
                                    <td class="td_register_de">
                                        <div class="listbox-bg-normal">
                                            <asp:ListBox ID="lstGroup" runat="server" SelectionMode="Multiple" CssClass="form-control"></asp:ListBox>
                                        </div>

                                        <asp:Button runat="server" ID="button_Delete_Group" Text="حذف" CssClass="btn btn-danger pull-left margin-top-5"
                                            OnClick="button_Delete_Group_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Label runat="server" ID="lbl_Alarm_Countgroup" Visible="False"
                                            ForeColor="#CC0000" />
                                    </td>
                                </tr>

                                <tr>
                                    <td class="td_register">
                                        <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource, Services	 %>" />
                                    </td>
                                    <td class="td_register_de">
                                        <div class="multiinput-bg-normal">
                                            <asp:TextBox ID="TextBox_Services" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="register"
                                            ControlToValidate="TextBox_Services" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">
                                        <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Company_Introduction	 %>" />
                                    </td>
                                    <td class="td_register_de">
                                        <div class="multiinput-bg-normal">
                                            <asp:TextBox ID="TextBox_Company_Introduction" runat="server" TextMode="MultiLine"
                                                CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="register"
                                            ControlToValidate="TextBox_Company_Introduction" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="td_register">نوع فعالیت
                                    </td>
                                    <td class="td_register_de">
                                        <div style="float: right">
                                            <asp:CheckBoxList ID="chkBusinessType" runat="server" RepeatColumns="1" RepeatDirection="Vertical"
                                                CssClass="defaultP">
                                            </asp:CheckBoxList>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">رسته کاربری
                                    </td>
                                    <td class="td_register_de">
                                        <div style="float: right">
                                            <asp:CheckBoxList ID="chkUsageType" runat="server" RepeatColumns="1" RepeatDirection="Vertical"
                                                CssClass="defaultP">
                                            </asp:CheckBoxList>
                                        </div>
                                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                            *
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register_de" colspan="2">برند هایی که شرکت در آنها فعالیت می کند
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register"></td>
                                    <td class="td_register_de">
                                        <table>
                                            <tr>
                                                <td>نوع برند
                                                </td>
                                                <td class="td_register_de">نام شرکت
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_register">
                                                    <div class="input-bg-normal">
                                                        <asp:TextBox ID="txtBrandTypeOne" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td class="td_register_de">
                                                    <div class="input-bg-normal">
                                                        <asp:TextBox ID="txtBrandNameOne" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_register">
                                                    <div class="input-bg-normal">
                                                        <asp:TextBox ID="txtBrandTypeTwo" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td class="td_register_de">
                                                    <div class="input-bg-normal">
                                                        <asp:TextBox ID="txtBrandNameTwo" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="td_register">
                                                    <div class="input-bg-normal">
                                                        <asp:TextBox ID="txtBrandTypeThree" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                                <td class="td_register_de">
                                                    <div class="input-bg-normal">
                                                        <asp:TextBox ID="txtBrandNameThree" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">&nbsp;
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_register">&nbsp;
                                    </td>
                                    <td>
                                        <asp:Button ID="ImageButton_Create" runat="server" SkinID="btnNormal" CssClass="btn btn-primary" OnClientClick="SelectFromList();"
                                            OnClick="ImageButton_Create_Click" Text="ثبت اطلاعات" ValidationGroup="register" />
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">

                        <div id="companyProfileComplate0" runat="server" class="alert alert-success">
                            اطلاعات شرکت با موفقیت ثبت شد
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>
        </div>
    </div>





</asp:Content>
