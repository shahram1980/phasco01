<%@ Control Language="C#" AutoEventWireup="true" Codebehind="SendMss.ascx.cs" Inherits="phasco_webproject.UI.SendMss" %>
<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<link href="RadControls/Editor/Skins/Default/\Editor.css"
    rel="stylesheet" type="text/css" />
<link href="RadControls/Editor/Skins/Default/\Controls.css"
    rel="stylesheet" type="text/css" />
<link href="RadControls/Editor/Skins/Default/\Editor.css"
    rel="stylesheet" type="text/css" />
<link href="RadControls/Editor/Skins/Default/\Controls.css"
    rel="stylesheet" type="text/css" />
<link href="RadControls/Editor/Skins/Default/\Controls.css"
    rel="stylesheet" type="text/css" />
<link href="RadControls/Editor/Skins/Default/\Editor.css"
    rel="stylesheet" type="text/css" />
<link href="RadControls/Editor/Skins/Default/\Controls.css"
    rel="stylesheet" type="text/css" />
<link href="RadControls/Editor/Skins/Default/\Editor.css"
    rel="stylesheet" type="text/css" />
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
            <tr>
                <td align="left" style="width: 20%" valign="top">
                    موضوع :</td>
                <td align="right" style="width: 80%" valign="top">
                    <asp:TextBox ID="TextBox_Title" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                        Width="150px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%" valign="top">
                    فرستنده :</td>
                <td align="right" style="width: 80%" valign="top">
                    <asp:Label ID="Label_Sender_Name" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
            </tr>
            <tr>
                <td align="right" colspan="2" valign="top">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            &nbsp;&nbsp;
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td align="left" style="width: 20%">
                                        گیرنده :</td>
                                    <td align="right" style="width: 80%">
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td style="width: 20%">
                                                    <asp:TextBox ID="TextBox_ReciverUId" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                        Width="150px"></asp:TextBox></td>
                                                <td style="width: 80%">
                                                    <div onmouseover="ddrivetip('شما از اینجا می توانید بررسی کنید چنین کاربری وجود دارد یا خیر')"
                                                        onmouseout="hideddrivetip()">
                                                        <asp:LinkButton ID="LinkButton_CheckId" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                            OnClick="LinkButton_CheckId_Click">بررسی کاربر</asp:LinkButton></div>
                                                    <asp:Label ID="Label_Alarm" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                        ForeColor="#C00000"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" style="width: 20%">
                                        نام گیرنده :</td>
                                    <td align="right" style="width: 80%">
                                        <asp:TextBox ID="TextBox_Recivername" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                            Width="150px"></asp:TextBox></td>
                                </tr>
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
                <td align="left" style="width: 20%" valign="top">
                    متن:</td>
                <td align="right" style="width: 80%" valign="top">
                    <radE:RadEditor ID="RadEditor1" runat="server" DeleteDocumentsPaths="~/news_M/newsdoc/"
                        DeleteFlashPaths="~/news_M/newsdoc/" DeleteImagesPaths="~/news_M/newsdoc/" DeleteMediaPaths="~/news_M/newsdoc/"
                        DeleteTemplatePaths="~/news_M/newsdoc/" Editable="true" FlashPaths="~/news_M/newsdoc/"
                        Font-Names="tahoma" ImagesPaths="~/news_M/newsdoc/" MediaPaths="~/news_M/newsdoc/"
                        ToolsFile="~/RadControls/Editor/Admin_ToolsFile.xml" UploadFlashPaths="~/news_M/newsdoc/"
                        UploadImagesPaths="~/news_M/newsdoc/" UploadMediaPaths="~/news_M/newsdoc/" UploadTemplatePaths="~/news_M/newsdoc/"
                        EnableEnhancedEdit="True" Height="300px" ShowHtmlMode="False" ShowPreviewMode="False"
                        ShowSubmitCancelButtons="False" Width="400px">
                    </radE:RadEditor>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%" valign="top">
                    پیوست :</td>
                <td align="right" style="width: 80%" valign="top">
                    <asp:FileUpload ID="FileUpload_Attach" runat="server" Font-Names="Tahoma" Font-Size="X-Small" /></td>
            </tr>
            <tr>
                <td align="right" colspan="2" valign="top">
                    <asp:CheckBox ID="CheckBox_Outbox" runat="server" />نگهداری در صندوق پیام های ارسال
                    شده.</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%" valign="top">
                </td>
                <td align="right" style="width: 80%" valign="top">
                    <asp:Button ID="Button1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                        Text="ارسال شود" OnClick="Button1_Click" /></td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
    </asp:View>
</asp:MultiView>
<asp:HiddenField ID="HiddenField_Id" runat="server" />
