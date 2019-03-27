<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="Requests.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
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
    <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px; font-weight: bold">
            <div id="divNewRequest" class="cp-tab-bg">
                <asp:HyperLink ID="lnkNewRequest" runat="server" Text="درخواست جدید" NavigateUrl="~/MyBiztBiz/Requests.aspx?5061676556696577=31"></asp:HyperLink>
            </div>
            <div id="divWaitRequest" class="cp-tab-bg">
                <asp:HyperLink ID="lnkWaitRequest" runat="server" Text="در انتظار تایید" NavigateUrl="~/MyBiztBiz/Requests.aspx?5061676556696577=30&537461747573=30"></asp:HyperLink>
            </div>
            <div id="divConfirmRequest" class="cp-tab-bg">
                <asp:HyperLink ID="lnkConfirmRequest" runat="server" Text="تایید شده ها" NavigateUrl="~/MyBiztBiz/Requests.aspx?5061676556696577=30&537461747573=31"></asp:HyperLink>
            </div>
            <div id="divNotConfirmRequest" class="cp-tab-bg">
                <asp:HyperLink ID="lnkNotConfirmRequest" runat="server" Text="رد شده ها" NavigateUrl="~/MyBiztBiz/Requests.aspx?5061676556696577=30&537461747573=32"></asp:HyperLink>
            </div>
        </div>
        <asp:MultiView ID="muvRequest" runat="server">
            <asp:View ID="vwRequestList" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <div style="height: 41px; background: transparent url('../images/cp-bg-title-news.jpg') repeat-x scroll center top;
                        border: 1px #9999ff solid; clear: both; margin: 10px 10px 0 10px; color: #666699;">
                        <span style="margin: 10px 5px; float: right; width: 40px">ردیف</span> <span style="margin: 10px;
                            float: right; width: 150px">کالای درخواستی</span> <span style="margin: 10px; float: right;
                                width: 100px">مدل </span><span style="margin: 10px; float: right; width: 70px">تاریخ
                                    ارسال</span> <span style="margin: 10px; float: right; width: 50px">تعداد</span>
                        <span style="margin: 10px; float: right; width: 65px">عملیات</span>
                    </div>
                    <div style="float: right; background: #fff; margin-right: 10px;">
                        <asp:Repeater ID="repRequest" runat="server">
                            <ItemTemplate>
                                <div style="height: 50px; clear: both;" class="RequestList">
                                    <span style="margin: 10px 15px 10px 0; float: right; width: 40px">
                                        <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></span> <span style="margin: 10px;
                                            float: right; width: 150px">
                                            <%#Eval("ProductName")%></span> <span style="margin: 10px; float: right; width: 100px">
                                                <%#Eval("Model")%>
                                            </span><span style="margin: 10px; float: right; width: 70px">
                                                <%# Set_Date(Eval("RequestDate").ToString())%></span><span style="margin: 10px; float: right;
                                                    width: 50px">
                                                    <%#Eval("Count")%>
                                                </span><span style="margin: 10px; float: right; width: 65px">
                                                    <asp:ImageButton ID="lnkEdit" runat="server" SkinID="btnEdit" CommandArgument='<%#Eval("RequestID") %>'
                                                        OnCommand="lnkEdit_Command"></asp:ImageButton>
                                                    <asp:ImageButton ID="lnkDelete" runat="server" SkinID="btnDelete" CommandArgument='<%#Eval("RequestID") %>'
                                                        OnCommand="lnkDelete_Command"></asp:ImageButton>
                                                </span>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
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
                <%--  <table width="90%" style="text-align: right;">
                    <tr>
                        <td style="padding: 10px;">
                            <asp:LinkButton ID="lnkNewRequest" OnClick="lnkNewRequest_Click" runat="server" Text="[ایجاد درخواست جدید]"></asp:LinkButton>
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
                           <asp:GridView ID="grdRequest" runat="server" AutoGenerateColumns="false" Width="500px"
                            OnRowDataBound="grdRequest_RowDataBound" OnPageIndexChanging="grdRequest_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="ProductName" HeaderText="نام کالای درخواستی" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Model" HeaderText="مدل" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Count" HeaderText="تعداد" HeaderStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="Price" HeaderText="حدود قیمت" HeaderStyle-HorizontalAlign="Center" />
                                <asp:TemplateField HeaderText="عملیات" HeaderStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" runat="server" Text="ویرایش" CommandArgument='<%#Eval("RequestID") %>'
                                            OnCommand="lnkEdit_Command"></asp:LinkButton>
                                        <asp:LinkButton ID="lnkDelete" runat="server" Text="حذف" CommandArgument='<%#Eval("RequestID") %>'
                                            OnCommand="lnkDelete_Command"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        </td>
                    </tr>
                </table>--%>
            </asp:View>
            <asp:View ID="vwRequestDetails" runat="server">
                <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                    width: 611px; float: right; color: #000;">
                    <table>
                        <tr>
                            <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px;
                                    padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                نام کالای مورد نظر
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="txtProductName" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                    ControlToValidate="txtProductName" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                مدل
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="txtModel" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                                <%-- <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                    ControlToValidate="txtModel" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                جزئیات و مشخصات
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="txtDetailsAndFeatures" runat="server" TextMode="MultiLine" CssClass="multiinput-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
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
                                تعداد
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="txtCount" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                استان / شهر
                            </td>
                            <td class="td_register_de">
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                    Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                                    ServiceMethod="GetState" />
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                                    ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                                    ServicePath="~/Services/BiztBizServices.asmx" Category="City" />
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                حدود قیمت
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="txtPrice" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                توضیحات
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="multiinput-item"></asp:TextBox>
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
                        <tr>
                            <td class="td_register">
                            </td>
                            <td class="td_register_de">
                                <%--<a href="Requests.aspx?Status=<%=StatusID %>">[بازگشت به لیست]</a>--%>
                                <asp:Button ID="ImageButton_Create" runat="server" SkinID="btnNormal" OnClick="ImageButton_Create_Click"
                                    Text="ثبت درخواست" ValidationGroup="register" />
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
