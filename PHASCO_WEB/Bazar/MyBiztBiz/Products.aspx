<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/Biztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="Products.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Products" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
           
            if (getUrlParameter("5061676556696577") == "31") {
                $('#divNewProducts').addClass("cp-tab-bg-active");
            }

            if (getUrlParameter("5061676556696577") == "30" && getUrlParameter("537461747573") == "30") {
                $('#divWaitProducts').addClass("cp-tab-bg-active");
            }

            if (getUrlParameter("5061676556696577") == "30" && getUrlParameter("537461747573") == "31") {

                $('#divConfirmProducts').addClass("cp-tab-bg-active");
            }

            if (getUrlParameter("5061676556696577") == "30" && getUrlParameter("537461747573") == "32") {
                $('#divNotConfirmProducts').addClass("cp-tab-bg-active");
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
                <a href="Products.aspx?5061676556696577=30&537461747573=31" class="list-group-item idp-group-item text-center active">
                    <strong>مدیریت محصولات</strong>
                </a>
                <a href="Requests.aspx?5061676556696577=30&537461747573=31" class="list-group-item idp-group-item text-center">
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
            <!-- flight section -->

            <div class="bhoechie-tab-content active text-center rtl-text">
                <div>

                  
                    <div>
                        <div id="divNewProducts" class="margin-bottom-5">
                            <asp:HyperLink ID="lnkNewProducts" runat="server" Text="محصول جدید" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/Products.aspx?5061676556696577=31"></asp:HyperLink>
                            <asp:HyperLink ID="lnkWaitProducts" runat="server" Text="در انتظار تایید" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/Products.aspx?5061676556696577=30&537461747573=30"></asp:HyperLink>
                            <asp:HyperLink ID="lnkConfirmProducts" runat="server" Text="تایید شده ها" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/Products.aspx?5061676556696577=30&537461747573=31"></asp:HyperLink>
                            <asp:HyperLink ID="lnkNotConfirmProducts" runat="server" Text="رد شده ها" CssClass="btn btn-success margin-top-5" NavigateUrl="~/bazar/MyBiztBiz/Products.aspx?5061676556696577=30&537461747573=32"></asp:HyperLink>
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
                    <asp:MultiView ID="muvProducts"  runat="server">
                        <asp:View ID="vwProductList"  runat="server">
                            <div class="table-responsive">
                                <table class="table table-hover table-striped rtl-text table-bordered">
                                <tr>
                                    <th style="width: 5%">ردیف</th>
                                    <th style="width: 10%">تصویر</th>
                                    <th style="width: 35%">نام محصول</th>
                                    <th style="width: 20%">مدل </th>
                                    <th style="width: 10%">تاریخ
                                        ارسال</th>
                                    <th style="width: 20%">عملیات</th>
                                </tr>

                                <asp:Repeater ID="repProducts" runat="server">
                                    <ItemTemplate>
                                        <tr class="ProductList">
                                            <td>
                                                <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></td>
                                            <td>
                                                <%# image_view(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%>

                                            </td>
                                            <td>
                                                <%#Eval("Produc_Name")%></td>
                                            <td>
                                                <%#Eval("Model_Number")%>
                                            </td>
                                            <td>
                                                <%# Set_Date(Eval("Send_Date").ToString())%>

                                            </td>
                                            <td>
                                                <asp:LinkButton ID="lnkEdit" runat="server" ToolTip="ویرایش" CssClass="btn btn-success btn-sm-custom" CommandArgument='<%#Eval("id") %>'
                                                    OnCommand="lnkEdit_Command"><i class="fa fa-edit"></i></asp:LinkButton>
                                                <asp:LinkButton ID="lnkDelete" runat="server" ToolTip="حذف" CssClass="btn btn-danger btn-sm-custom" CommandArgument='<%#Eval("id") %>'
                                                    OnCommand="lnkDelete_Command"><i class="fa fa-times"></i></asp:LinkButton>
                                                <asp:LinkButton ID="lnkPicture" runat="server" CssClass="btn btn-info btn-sm" CommandArgument='<%#Eval("id") %>'
                                                    OnCommand="lnkPicture_Command"><i class="fa fa-photo"></i></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </table>
                            </div>

                            

                        </asp:View>
                        <asp:View ID="vwProductDetails" runat="server">
                            <div>

                                <table class="table" runat="server" id="TblReject" visible="false">

                                    <tr>
                                        <td>

                                            <table dir="rtl" style="width: 100%">
                                                <tr>
                                                    <td style="width: 5%"></td>
                                                    <td style="width: 75%; font-weight: bold;">
                                                        <asp:Label ID="Label_reasonMessage" runat="server"></asp:Label>
                                                    </td>
                                                    <td style="width: 20%"></td>
                                                </tr>

                                            </table>

                                        </td>
                                    </tr>
                                </table>
                                <table class="table table-responsive no-border rtl-text" >
                                    <tr>
                                        <td class="td_register_de" colspan="2">
                                            <div id="divMessage" runat="server" class="alert alert-info" visible="false">
                                                <asp:Literal ID="lblMessage" runat="server"></asp:Literal>
                                            </div>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td class="td_register">نام محصول :
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="TextBox_Produc_Name" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                                ControlToValidate="TextBox_Produc_Name" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">مدل محصول :
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="TextBox_Model_Number" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                                ControlToValidate="TextBox_Model_Number" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">کلمات کلیدی :
                                        </td>
                                        <td class="td_register_de">
                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="TextBox_Product_Keywords" runat="server" CssClass="form-control"
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="register"
                                                ControlToValidate="TextBox_Product_Keywords" Display="Dynamic"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">تصویر محصول :
                                        </td>
                                        <td class="td_register_de">
                                            <div class="fileupload-bg-normal">
                                                <asp:FileUpload ID="FileUpload_Photo" runat="server" CssClass="fileupload-item" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td class="td_register_de">
                                            <asp:Image CssClass="img img-thumbnail" ID="Image_Photo" runat="server" Visible="false" />
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
                                                <asp:DropDownList ID="DropDownList_Cat1" runat="server" CssClass="form-control dropdown margin-bottom-5">
                                                </asp:DropDownList>
                                            </div>
                                            <ajaxToolkit:CascadingDropDown ID="ccdCat1" runat="server" TargetControlID="DropDownList_Cat1"
                                                Category="Category" PromptText="لطفاً انتخاب کنید" ServicePath="~/bazar/Services/BiztBizServices.asmx"
                                                ServiceMethod="GetCategory" />
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="DropDownList_Cat2" runat="server" CssClass="form-control dropdown margin-bottom-5">
                                                </asp:DropDownList>
                                            </div>
                                            <ajaxToolkit:CascadingDropDown ID="ccdCat2" runat="server" TargetControlID="DropDownList_Cat2"
                                                ParentControlID="DropDownList_Cat1" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSubCategory"
                                                ServicePath="~/bazar/Services/BiztBizServices.asmx" Category="SubCategory" />
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="DropDownList_Cat3" runat="server" CssClass="form-control dropdown margin-bottom-5">
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
                                        <td class="td_register">
                                            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Specialty_of_Product %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="TextBox_Specialty_Product" runat="server" CssClass="form-control"
                                                    TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td>&nbsp;
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                        <td class="td_register">توضیحات
                                        </td>
                                        <td class="td_register_de">
                                            <div class="multiinput-bg-normal">
                                                <asp:TextBox ID="TextBox_Description" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                 
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource,  Terms_of_Payment %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <div style="float: right;">
                                                <asp:CheckBoxList ID="CheckBoxList_Terms_Payment" runat="server" RepeatDirection="Vertical"
                                                    CssClass="table no-border rtl-text" RepeatColumns="1">
                                                </asp:CheckBoxList>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                           
                                    <tr>
                                        <td class="td_register">نحوه ارسال
                                        </td>
                                        <td class="td_register_de">
                                            <div style="float: right;">
                                                <asp:CheckBoxList ID="CheckBoxList_SendMode" runat="server"  RepeatDirection="Vertical"
                                                    CssClass="table no-border rtl-text" RepeatColumns="1">
                                                </asp:CheckBoxList>
                                            </div>
                                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                *
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">
                                            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource,  Minimum_Order %>" />
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="TextBox_Minimum_Order" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">قیمت
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">تعداد در هر بسته
                                        </td>
                                        <td class="td_register_de">
                                            <div class="input-bg-normal">
                                                <asp:TextBox ID="txtProductCountInPakage" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">زمان فعال بودن
                                        </td>
                                        <td class="td_register_de">
                                            <div class="ddl-bg-normal">
                                                <asp:DropDownList ID="ddlExpireSchedule" runat="server" CssClass="form-control drop-down">
                                                </asp:DropDownList>
                                            </div>
                                        </td>
                                    </tr>
                                   
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td class="td_register_de">
                                            <%--<a href="Products.aspx?Status=<%=StatusID %>">[بازگشت به لیست]</a>--%>
                                            <asp:Button ID="ImageButton_Insert" CssClass="btn btn-primary pull-left" runat="server" OnClick="ImageButton1_Click"
                                                Text="ثبت محصول" ValidationGroup="register" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_register">&nbsp;
                                        </td>
                                        <td>&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                   
                </div>
            </div>
        </div>
    </div>

</asp:Content>
