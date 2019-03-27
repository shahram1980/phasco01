<%@ Page Title="Submit Products" Language="C#" MasterPageFile="~/Template/admin.Master"
    EnableEventValidation="false" AutoEventWireup="true" CodeBehind="SubmitProducts.aspx.cs"
    Inherits="BiztBiz.bizpanel.SubmitProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%; direction: rtl;">
        <table width="90%" style="text-align: right;">
            <tr>
                <td align="center" style="width: 100%" width="50%">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="padding: 1px;" colspan="2">
                    <%-- <asp:LinkButton ID="lnkNewRequest" OnClick="lnkNewRequest_Click" runat="server" Text="[ایجاد درخواست جدید]"></asp:LinkButton>--%>
                    <asp:LinkButton ID="lnkWaitProduct" OnClick="lnkWaitProduct_Click" runat="server"
                        Text="محصولات در انتظار تایید"></asp:LinkButton>
                    |
                    <asp:LinkButton ID="lnkNotConfirmProduct" OnClick="lnkNotConfirmProduct_Click" runat="server"
                        Text="محصولات تایید نشده"></asp:LinkButton>
                    |
                    <asp:LinkButton ID="lnkConfirmProduct" OnClick="lnkConfirmProduct_Click" runat="server"
                        Text="محصولات تایید شده"></asp:LinkButton>
                    |
                    <asp:LinkButton ID="lnkExpireProduct" OnClick="lnkExpireProduct_Click" runat="server"
                        Text="محصولات تاریخ گذشته"></asp:LinkButton>
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
        <asp:MultiView ID="muvProducts" runat="server">
            <asp:View ID="vwProductList" runat="server">
                <table width="90%" style="text-align: right;">
                    <tr>
                        <td>
                            <asp:GridView ID="grdProduct" runat="server" AutoGenerateColumns="false" Width="500px"
                                OnRowDataBound="grdProduct_RowDataBound" OnPageIndexChanging="grdProduct_PageIndexChanging">
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
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
                                    <asp:TemplateField HeaderText="عملیات" HeaderStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" Text="ویرایش" CommandArgument='<%#Eval("id") %>'
                                                OnCommand="lnkEdit_Command"></asp:LinkButton>
                                            <asp:LinkButton ID="lnkDelete" runat="server" Text="حذف" CommandArgument='<%#Eval("id") %>'
                                                OnCommand="lnkDelete_Command"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="vwProductDetails" runat="server">
                <table dir='<asp:Literal ID="Literal15005" runat="server" Text="<%$ Resources:Resource, Dir %>" />'>
                    <tr>
                        <td class="td_register_de" colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                            &nbsp;
                        </td>
                    </tr>
                   <%-- <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal154" runat="server" Text="<%$ Resources:Resource, language %>" />
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
                            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource, Product_Name %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Produc_Name" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource, Product_Keywords %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Product_Keywords" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal103" runat="server" Text="<%$ Resources:Resource, Photo %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:FileUpload ID="FileUpload_Photo" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            <asp:Image ID="Image_Photo" runat="server" Visible="true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Category %>" />
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
                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Resource, Specialty_of_Product %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Specialty_Product" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
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
                        <td class="td_register">
                            <asp:Literal ID="Literal155" runat="server" Text="<%$ Resources:Resource, Specifications %>" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:Resource, Place_of_Origin %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Place_Origin" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:Resource,  Product_Brand %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Product_Brand" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal18" runat="server" Text="<%$ Resources:Resource,  Model_Number %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Model_Number" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:Resource,  User_Defined_Attributes %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Defined_Attributes" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:Resource,  Description %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Description" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" colspan="2">
                            <h3>
                                اطلاعات محصولات تجاری
                            </h3>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal21" runat="server" Text="<%$ Resources:Resource,  Terms_of_Payment %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:CheckBoxList ID="CheckBoxList_Terms_Payment" runat="server" RepeatDirection="Horizontal"
                                RepeatColumns="4">
                            </asp:CheckBoxList>
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
                    <tr>
                        <td class="td_register">
                            نحوه ارسال
                        </td>
                        <td class="td_register_de">
                            <asp:CheckBoxList ID="CheckBoxList_SendMode" runat="server" RepeatDirection="Horizontal"
                                RepeatColumns="4">
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal22" runat="server" Text="<%$ Resources:Resource,  Minimum_Order %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="TextBox_Minimum_Order" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            قیمت
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            تعداد در هر بسته
                        </td>
                        <td class="td_register_de">
                            <asp:TextBox ID="txtProductCountInPakage" runat="server"></asp:TextBox>
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
                            <a href="SubmitProducts.aspx">[بازگشت به لیست]</a>
                            <asp:LinkButton ID="lnkConfirm" runat="server" OnClick="lnkConfirm_Click" Text="تایید"></asp:LinkButton>
                            <asp:LinkButton ID="lnkNotConfirm" runat="server" OnClick="lnkNotConfirm_Click" Text="عدم تایید"></asp:LinkButton>
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
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
