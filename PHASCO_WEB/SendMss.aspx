<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true" CodeBehind="SendMss.aspx.cs" Inherits="PHASCO_WEB.SendMss" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="right" dir="rtl" style="width: 100%" valign="top">
                <asp:Label ID="LBL_Alarm" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="width: 100%" valign="top">

                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                                                <div class="alert alert-warning">
                            <p>
                                کاربر گرامی :<br />
                                جهت ارسال پیام به مدیریت وب سایت در باکس گیرنده کلمه [admin] را وارد کنید و در غیر
                    اینصورت نام کاربری گیرنده پیام را وارد نمائید .<br />
                                تذکر : برای تائید صحت نام کاربری گیرنده پس از وارد کردن نام کاربری ،<span style="color: black">
                                </span><span style="color: maroon"><span style="color: black">برروی</span> بررسی نام</span><span
                                    style="color: maroon"> کاربر</span> کلیک نمائید.
                            </p>
                        </div>
                        <table class="table no-border table-sm form-group" dir="rtl" style="width: 100%">

                            <tr>
                                <td align="left" style="width: 20%" valign="top">موضوع :</td>
                                <td align="right" style="width: 40%" valign="top">
                                    <asp:TextBox ID="TextBox_Title" runat="server" CssClass="form-control"></asp:TextBox></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 20%" valign="top">فرستنده :</td>
                                <td align="right" style="width: 40%" valign="top">
                                    <asp:Label ID="Label_Sender_Name" runat="server"></asp:Label></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2" valign="top">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <table style="width: 100%" cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="width: 20%" align="left">گیرنده :</td>
                                                        <td style="width: 80%" align="right">
                                                            <table style="width: 100%" cellspacing="0" cellpadding="0" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="width: 40%">
                                                                            <asp:TextBox ID="TextBox_ReciverUId" runat="server" CssClass="form-control"></asp:TextBox></td>
                                                                        <td style="width: 60%">
                                                                            <div data-toggle="tooltip" data-placement="top" title="شما از اینجا می توانید بررسی کنید چنین کاربری وجود دارد یا خیر">
                                                                                <asp:LinkButton ID="LinkButton_CheckId" OnClick="LinkButton_CheckId_Click" runat="server">بررسی نام کاربر</asp:LinkButton>
                                                                            </div>
                                                                            <asp:Label ID="Label_Alarm" CssClass="text-danger" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 20%" align="left">نام گیرنده :</td>
                                                        <td style="width: 80%;" align="right">
                                                            <asp:TextBox ID="TextBox_Recivername" runat="server" CssClass="form-control rtl-text"></asp:TextBox></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                        <ProgressTemplate>
                                            لطفا منتظر بمانید ...
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 20%" valign="top">متن:</td>
                                <td align="right" colspan="2" style="width: 40%" valign="top">
                                    <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="350px"></FCKeditorV2:FCKeditor>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 20%" valign="top">پیوست :</td>
                                <td align="right" style="width: 40%" valign="top">
                                    <asp:FileUpload ID="FileUpload_Attach" runat="server" Font-Names="Tahoma" Font-Size="X-Small" />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2" valign="top">
                                    <asp:CheckBox ID="CheckBox_Outbox" runat="server" />نگهداری در صندوق پیام های ارسال
                    شده.</td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 20%" valign="top"></td>
                                <td align="right" style="width: 80%" valign="top">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary pull-left"
                                        Text="ارسال شود" OnClick="Button1_Click" /></td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                    </asp:View>
                </asp:MultiView></td>
        </tr>
    </table>
    &nbsp;<asp:HiddenField ID="HiddenField_Id" runat="server" />
</asp:Content>