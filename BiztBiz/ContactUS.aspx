<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true" CodeBehind="ContactUS.aspx.cs" Inherits="BiztBiz.ContactUS" %>
<%@ Register Src="UC/MenuGallery.ascx" TagName="MenuGallery" TagPrefix="uc2" %>
<%@ Register Src="UC/MenuDownloads.ascx" TagName="MenuDownloads" TagPrefix="uc3" %>
<%@ Register Src="UC/uscTopProduct.ascx" TagName="uscTopProduct" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .frm_contact
        {
            width:1000px;
            padding: 5px;
        }
                .frm_contact_td
        {
            width:20%;
            text-align:right;
            vertical-align:top;
            padding: 5px;
        }
                        .frm_contact_td2
        {
            width:80%;
            text-align:right;
            vertical-align:top;
            padding: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<uc3:uscTopProduct ID="uscTopProduct1" runat="server" />
    <table style="width: 1000px;" dir='rtl'>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <a href="javascript: history.go(-1)" visible="false" runat="server" id="goback">برگشت
                </a>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <asp:Label ID="LBL_Title" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" dir="rtl" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <asp:Label ID="Label_Text" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <uc2:MenuGallery ID="MenuGallery1" runat="server"></uc2:MenuGallery>
            </td>
        </tr>
        <tr>
            <td style="width: 100%" align='<asp:Literal Text="<%$ Resources:Resource, align %>" runat="server" />'>
                <uc3:MenuDownloads ID="MenuDownloads1" runat="server"></uc3:MenuDownloads>
            </td>
        </tr>
    </table>

        <hr style="width:1000px;border:1px solid #ccc" />
                            می توانید از طریق فرم زیر سوالات، نظرها، انتقادها و پیشنهادهای خود را با ما در میان بگذارید:

                            <table class="frm_contact">
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        <asp:Label ID="LBL_Alarm" runat="server" ForeColor="Red"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="frm_contact_td">
                                        آدرس ایمیل شما :
                                    </td>
                                    <td  class="frm_contact_td2">
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="txtSenderEmail" runat="server" Width="215px" CssClass="log-login-input-item"></asp:TextBox>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="register"
                                            ControlToValidate="txtSenderEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSenderEmail"
                                            Display="Dynamic" ErrorMessage="ایمیل نامعتبر" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="frm_contact_td">
                                        نام :
                                    </td>
                                    <td class="frm_contact_td2">
                                        <div class="input-bg-normal">
                                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                        </div>
                                   
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                            ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="frm_contact_td">
                                         سوال وانتقادونظر و درخواست :
                                    </td>
                                    <td class="frm_contact_td2">
                               
                                            <asp:TextBox ID="txtTelNum" runat="server"  TextMode="MultiLine" Width="400px" Height="100px"></asp:TextBox>

                                        
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="register"
                                            ControlToValidate="txtTelNum" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                         &nbsp;</td>
                                    <td>
                                    <asp:Button runat="server" CssClass="pi-pro-b-bg" ID="btnSend" OnClick="btnSend_Click"
                                        Text="ارسال پیام" />
                                    </td>
                                </tr>
                            </table>
                    
</asp:Content>
