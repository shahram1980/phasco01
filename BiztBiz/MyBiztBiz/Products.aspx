<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="Products.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            if (jQuery.url.param("5061676556696577") == "31") {
                $('#divNewProducts').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("5061676556696577") == "30" && jQuery.url.param("537461747573") == "30") {
                $('#divWaitProducts').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("5061676556696577") == "30" && jQuery.url.param("537461747573") == "31") {
                $('#divConfirmProducts').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.param("5061676556696577") == "30" && jQuery.url.param("537461747573") == "32") {
                $('#divNotConfirmProducts').addClass("cp-tab-bg-active");
            }
        });
    </script>
    <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px;">
            <div id="divNewProducts" class="cp-tab-bg">
                <asp:HyperLink ID="lnkNewProducts" runat="server" Text="محصول جدید" NavigateUrl="~/MyBiztBiz/Products.aspx?5061676556696577=31"></asp:HyperLink>
            </div>
            <div id="divWaitProducts" class="cp-tab-bg">
                <asp:HyperLink ID="lnkWaitProducts" runat="server" Text="در انتظار تایید" NavigateUrl="~/MyBiztBiz/Products.aspx?5061676556696577=30&537461747573=30"></asp:HyperLink>
            </div>
            <div id="divConfirmProducts" class="cp-tab-bg">
                <asp:HyperLink ID="lnkConfirmProducts" runat="server" Text="تایید شده ها" NavigateUrl="~/MyBiztBiz/Products.aspx?5061676556696577=30&537461747573=31"></asp:HyperLink>
            </div>
            <div id="divNotConfirmProducts" class="cp-tab-bg">
                <asp:HyperLink ID="lnkNotConfirmProducts" runat="server" Text="رد شده ها" NavigateUrl="~/MyBiztBiz/Products.aspx?5061676556696577=30&537461747573=32"></asp:HyperLink>
            </div>
        </div>
        <asp:MultiView ID="muvProducts" runat="server">
            <asp:View ID="vwProductList" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <div style="height: 41px; background: transparent url('../images/cp-bg-title-news.jpg') repeat-x scroll center top;
                        border: 1px #9999ff solid; clear: both; margin: 10px 10px 0 10px; color: #666699;">
                        <span style="margin: 10px 10px 10px 0; float: right; width: 40px">ردیف</span> <span
                            style="margin: 10px; float: right; width: 50px">تصویر</span> <span style="margin: 10px;
                                float: right; width: 159px">نام محصول</span> <span style="margin: 10px; float: right;
                                    width: 100px">مدل </span><span style="margin: 10px; float: right; width: 70px">تاریخ
                                        ارسال</span> <span style="margin: 10px 10px 10px 0; float: right; width: 70px">عملیات</span>
                    </div>
                    <div style="float: right; background: #fff; margin-right: 10px;">
                        <asp:Repeater ID="repProducts" runat="server">
                            <ItemTemplate>
                                <div style="height: 70px; clear: both;" class="ProductList">
                                    <span style="margin: 10px 10px 10px 0; float: right; width: 40px">
                                        <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></span> <span style="margin: 10px;
                                            float: right; width: 50px">
                                            <%# image_view(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%></span>
                                    <span style="margin: 10px; float: right; width: 159px">
                                        <%#Eval("Produc_Name")%></span> <span style="margin: 10px; float: right; width: 100px">
                                            <%#Eval("Model_Number")%>
                                        </span><span style="margin: 10px; float: right; width: 70px">
                                            <%# Set_Date(Eval("Send_Date").ToString())%></span> <span style="margin: 10px 10px 10px 0;
                                                float: right; width: 70px">
                                                <asp:ImageButton ID="lnkEdit" runat="server" SkinID="btnEdit" CommandArgument='<%#Eval("id") %>'
                                                    OnCommand="lnkEdit_Command"></asp:ImageButton>
                                                <asp:ImageButton ID="lnkDelete" runat="server" SkinID="btnDelete" CommandArgument='<%#Eval("id") %>'
                                                    OnCommand="lnkDelete_Command"></asp:ImageButton>
                                                <asp:ImageButton ID="lnkPicture" runat="server" SkinID="btnList" CommandArgument='<%#Eval("id") %>'
                                                    OnCommand="lnkPicture_Command"></asp:ImageButton>
                                            </span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('.ProductList').mouseover(function () {
                            $(this).toggleClass("repeaterover");
                        }).mouseout(function () {
                            $(this).toggleClass("repeaterover");
                        });

                    });
                    
                </script>
                <%--    <table width="90%" style="text-align: right;">
                    <tr>
                        <td style="padding: 10px;">
                            <asp:LinkButton ID="lnkNewProduct" OnClick="lnkNewProduct_Click" runat="server" Text="[محصول جدید]"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                           <asp:GridView ID="grdProduct1" runat="server" AutoGenerateColumns="false" Width="500px"
                            OnRowDataBound="grdProduct_RowDataBound" OnPageIndexChanging="grdProduct_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="Produc_Name" HeaderText="نام محصول" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Model_Number" HeaderText="مدل" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Minimum_Order" HeaderText="حداقل سفارش" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Price" HeaderText="قیمت" HeaderStyle-HorizontalAlign="Center" />
                                <asp:TemplateField HeaderText="تاریخ ارسال">
                                    <ItemTemplate>
                                        <%# Set_Date(Eval("Send_Date").ToString())%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="تصویر">
                                    <ItemTemplate>
                                        <%# image_view(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="عملیات" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="ویرایش" CommandArgument='<%#Eval("id") %>'
                                            OnCommand="lnkEdit_Command"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkDelete" runat="server" Text="حذف" CommandArgument='<%#Eval("id") %>'
                                            OnCommand="lnkDelete_Command"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkPicture" runat="server" Text="تصاویر" CommandArgument='<%#Eval("id") %>'
                                            OnCommand="lnkPicture_Command"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </td>
                    </tr>
                </table>--%>
            </asp:View>
            <asp:View ID="vwProductDetails" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <table style="margin: 5px;">
                        <tr>
                            <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px;
                                    padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <%--  <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:Resource, language %>" />
                    </td>
                    <td class="td_register_de">
                        <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                            <asp:ListItem Value="Persian (Iran)">فارسی</asp:ListItem>
                            <asp:ListItem Value="English (United States)">English</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>--%>
                        <tr>
                            <td class="td_register">
                                نام محصول :
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="TextBox_Produc_Name" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                    ControlToValidate="TextBox_Produc_Name" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                مدل محصول :
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="TextBox_Model_Number" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                    ControlToValidate="TextBox_Model_Number" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                کلمات کلیدی :
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="TextBox_Product_Keywords" runat="server" CssClass="multiinput-item"
                                        TextMode="MultiLine"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="register"
                                    ControlToValidate="TextBox_Product_Keywords" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                تصویر محصول :
                            </td>
                            <td class="td_register_de">
                                <div class="fileupload-bg-normal">
                                    <asp:FileUpload ID="FileUpload_Photo" runat="server" CssClass="fileupload-item" />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td class="td_register_de">
                                <asp:Image ID="Image_Photo" runat="server" Visible="false" />
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
                                    <asp:DropDownList ID="DropDownList_Cat1" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <ajaxToolkit:CascadingDropDown ID="ccdCat1" runat="server" TargetControlID="DropDownList_Cat1"
                                    Category="Category" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                                    ServiceMethod="GetCategory" />
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="DropDownList_Cat2" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <ajaxToolkit:CascadingDropDown ID="ccdCat2" runat="server" TargetControlID="DropDownList_Cat2"
                                    ParentControlID="DropDownList_Cat1" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSubCategory"
                                    ServicePath="~/Services/BiztBizServices.asmx" Category="SubCategory" />
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="DropDownList_Cat3" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <ajaxToolkit:CascadingDropDown ID="ccdCat3" runat="server" TargetControlID="DropDownList_Cat3"
                                    ParentControlID="DropDownList_Cat2" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSub2Category"
                                    ServicePath="~/Services/BiztBizServices.asmx" Category="Sub2Category" />
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Specialty_of_Product %>" />
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="TextBox_Specialty_Product" runat="server" CssClass="multiinput-item"
                                        TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <%-- <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Resource, Specifications %>" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>--%>
                        <%--  <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Place_of_Origin %>" />
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="TextBox_Place_Origin" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource,  Product_Brand %>" />
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="TextBox_Product_Brand" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Resource,  User_Defined_Attributes %>" />
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="TextBox_Defined_Attributes" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>--%>
                        <tr>
                            <td class="td_register">
                                توضیحات
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="TextBox_Description" runat="server" CssClass="multiinput-item" TextMode="MultiLine"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <%--<tr>
                    <td style="text-align: right" colspan="2">
                        <h3>
                            اطلاعات محصولات تجاری
                        </h3>
                    </td>
                </tr>--%>
                        <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource,  Terms_of_Payment %>" />
                            </td>
                            <td class="td_register_de">
                                <div style="float: right;">
                                    <asp:CheckBoxList ID="CheckBoxList_Terms_Payment" runat="server" RepeatDirection="Horizontal"
                                        CssClass="defaultP" RepeatColumns="4">
                                    </asp:CheckBoxList>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <%--  <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td width="50%">
                            <asp:CheckBoxList ID="CheckBoxList_Terms_Payment" runat="server" RepeatDirection="Horizontal"
                                RepeatColumns="4">
                            </asp:CheckBoxList>
                        </td>
                        <td width="50%">
                            <asp:TextBox ID="TextBox_Terms_Payment" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>--%>
                            </td>
                        </tr>
                        <%-- <tr>
                    <td class="td_register">
                        شرایط دیگر پرداخت :
                    </td>
                    <td class="td_register_de">
                     <div class="input-bg-normal">
                        <asp:TextBox ID="TextBox_Terms_Payment" runat="server"></asp:TextBox>
                        </div>
                    </td>
                </tr>--%>
                        <tr>
                            <td class="td_register">
                                نحوه ارسال
                            </td>
                            <td class="td_register_de">
                                <div style="float: right;">
                                    <asp:CheckBoxList ID="CheckBoxList_SendMode" runat="server" RepeatDirection="Horizontal"
                                        CssClass="defaultP" RepeatColumns="4">
                                    </asp:CheckBoxList>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource,  Minimum_Order %>" />
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="TextBox_Minimum_Order" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                قیمت
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                تعداد در هر بسته
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="txtProductCountInPakage" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                زمان فعال بودن
                            </td>
                            <td class="td_register_de">
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="ddlExpireSchedule" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <%-- <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource,  Supply_Ability %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Supply_Ability" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource,  Delivery_Time %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Delivery_Time" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Resource,  Packaging %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Packaging" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>--%>
                        <tr>
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td class="td_register_de">
                                <%--<a href="Products.aspx?Status=<%=StatusID %>">[بازگشت به لیست]</a>--%>
                                <asp:Button ID="ImageButton_Insert" SkinID="btnNormal" runat="server" OnClick="ImageButton1_Click"
                                    Text="ثبت محصول" ValidationGroup="register" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                &nbsp;
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
        </asp:MultiView>
        <div style="float: right">
            <img alt="" height="22" src="../images/cp-frame2-down.jpg" width="611" />
        </div>
    </div>
</asp:Content>
