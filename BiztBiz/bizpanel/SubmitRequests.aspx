<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="SubmitRequests.aspx.cs" Inherits="BiztBiz.bizpanel.SubmitRequests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; direction: rtl;">
        <asp:MultiView ID="muvRequest" runat="server">
            <asp:View ID="vwRequestList" runat="server">
                <table width="90%" style="text-align: right;">
                    <tr>
                        <td style="padding: 1px;" colspan="2">
                            <%-- <asp:LinkButton ID="lnkNewRequest" OnClick="lnkNewRequest_Click" runat="server" Text="[ایجاد درخواست جدید]"></asp:LinkButton>--%>
                            <asp:LinkButton ID="lnkWaitRequest" OnClick="lnkWaitRequest_Click" runat="server"
                                Text="درخواست های در انتظار تایید"></asp:LinkButton>
                            |
                            <asp:LinkButton ID="lnkNotConfirmRequest" OnClick="lnkNotConfirmRequest_Click" runat="server"
                                Text="درخواست های تایید نشده"></asp:LinkButton>
                            |
                            <asp:LinkButton ID="lnkConfirmRequest" OnClick="lnkConfirmRequest_Click" runat="server"
                                Text="درخواست های تایید شده"></asp:LinkButton>
                            |
                            <asp:LinkButton ID="lnkExpireRequest" OnClick="lnkExpireRequest_Click" runat="server"
                                Text="درخواست های تاریخ گذشته"></asp:LinkButton>
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
                            <asp:GridView ID="grdRequest" runat="server" AutoGenerateColumns="false" Width="500px">
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
                </table>
            </asp:View>
            <asp:View ID="vwRequestDetails" runat="server">
                <table class="style1" dir="rtl">
                    <tr>
                        <td class="td_register_de" colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            نام کالای مورد نظر
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            مدل
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="txtModel" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            جزئیات و مشخصات
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="txtDetailsAndFeatures" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            دسته بندی
                        </td>
                        <td class="td_register_de">
                            <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
                                ScriptMode="Release">
                            </ajaxToolkit:ToolkitScriptManager>
                            <br />
                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <asp:Literal ID="Literal00102" runat="server" Text="<%$ Resources:Resource, Loading %>" />
                                    ...
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                            <br />
                            <asp:DropDownList ID="DropDownList_Cat1" runat="server" CssClass="txtjobsmall">
                            </asp:DropDownList>
                            <ajaxToolkit:CascadingDropDown ID="ccdCat1" runat="server" TargetControlID="DropDownList_Cat1"
                                Category="Category" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                                ServiceMethod="GetCategory" />
                            <asp:DropDownList ID="DropDownList_Cat2" runat="server" CssClass="txtjobsmall">
                            </asp:DropDownList>
                            <ajaxToolkit:CascadingDropDown ID="ccdCat2" runat="server" TargetControlID="DropDownList_Cat2"
                                ParentControlID="DropDownList_Cat1" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSubCategory"
                                ServicePath="~/Services/BiztBizServices.asmx" Category="SubCategory" />
                            <asp:DropDownList ID="DropDownList_Cat3" runat="server" CssClass="txtjobsmall">
                            </asp:DropDownList>
                            <ajaxToolkit:CascadingDropDown ID="ccdCat3" runat="server" TargetControlID="DropDownList_Cat3"
                                ParentControlID="DropDownList_Cat2" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSub2Category"
                                ServicePath="~/Services/BiztBizServices.asmx" Category="Sub2Category" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            تعداد
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="txtCount" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            استان / شهر
                        </td>
                        <td class="td_register_de">
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="txtjobsmall">
                            </asp:DropDownList>
                            <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                                ServiceMethod="GetState" />
                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="txtjobsmall">
                            </asp:DropDownList>
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
                            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            توضیحات
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            زمان فعال بودن
                        </td>
                        <td class="td_register_de">
                            <asp:DropDownList ID="ddlExpireSchedule" runat="server" CssClass="txtjobsmall">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                        </td>
                        <td class="td_register_de">
                            <a href="SubmitRequests.aspx">[بازگشت به لیست]</a>
                            <asp:LinkButton ID="lnkConfirm" runat="server" OnClick="lnkConfirm_Click" Text="تایید"></asp:LinkButton>
                            <asp:LinkButton ID="lnkNotConfirm" runat="server" OnClick="lnkNotConfirm_Click" Text="عدم تایید"></asp:LinkButton>
                            <%--<asp:ImageButton ID="ImageButton_Create" runat="server" ImageUrl="<%$ Resources:Resource, Submit_Img %>"
                            OnClick="ImageButton_Create_Click" />--%>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
