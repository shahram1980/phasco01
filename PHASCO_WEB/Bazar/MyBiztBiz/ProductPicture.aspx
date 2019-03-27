<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="ProductPicture.aspx.cs" Inherits="BiztBiz.MyBiztBiz.ProductPicture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px; font-weight: bold">
            <asp:Label runat="server" ID="lblProductname" /></div>
        <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000;">
            <table style="width: 100%; text-align: right; padding: 5px;">
                <tr>
                    <td colspan="2" style="padding: 10px;">
                        <asp:LinkButton ID="lnkNewPicture" runat="server" Text="[+ اضافه کردن تصویر جدید]"
                            OnClick="lnkNewPicture_Click"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%;">
                        نام تصویر :
                    </td>
                    <td style="width: 85%;">
                        <div class="input-bg-normal">
                            <asp:TextBox ID="txtImageName" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        انتخاب تصویر :
                    </td>
                    <td>
                        <div class="fileupload-bg-normal">
                            <asp:FileUpload ID="fluProductImage" runat="server" CssClass="fileupload-item" />
                        </div>
                        <div style="float: right; width: 70px; margin-right: 60px;">
                            <asp:Image ID="imgImageView" runat="server" Visible="false" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnConfirm" runat="server" Text="ثبت" OnClick="btnConfirm_Click"
                            SkinID="btnNormal" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel ID="pnlProductPicture" runat="server" GroupingText=" لیست تصاویر">
                            <asp:DataList ID="dtlProductPicture" runat="server" RepeatColumns="3" Width="100%"
                                OnItemDataBound="dtlProductPicture_ItemDataBound">
                                <ItemTemplate>
                                    <table style="border: 1px solid #f0f0f0; margin: 3px;">
                                        <tr>
                                            <td colspan="2" style="padding: 3px; border-bottom: 1px solid #f0f0f0;">
                                                <asp:Image ID="imgProductImage" runat="server" ImageUrl='<%# Eval("image_Address","~/bazar/images/Product/small/{0}") %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 3px;">
                                                <%# Eval("image_name")%>
                                            </td>
                                            <td style="padding: 3px;">
                                                <%-- <asp:ImageButton ID="lnkEdit" runat="server" SkinID="btnEdit" CommandArgument='<%#Eval("id") %>'
                                                    OnCommand="lnkEdit_Command"></asp:ImageButton>--%>
                                                <asp:ImageButton ID="lnkDelete" runat="server" SkinID="btnDelete" CommandArgument='<%#Eval("id") %>'
                                                    OnCommand="lnkDelete_Command" ToolTip="حذف" OnClientClick="return confirm('آیا برای حذف اطمینان دارید');"></asp:ImageButton>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right">
            <img alt="" height="22" src="../images/cp-frame2-down.jpg" width="611" />
            
        </div>
    </div>
</asp:Content>
