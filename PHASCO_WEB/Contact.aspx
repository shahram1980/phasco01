<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="PHASCO_WEB.Contact" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
    -
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <table  class="table table-responsive no-border rtl-text" >
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="right" style="width: 50%" valign="top">
                                <br />
                                پست الکترونیکی : <a href="mailto:info@phasco.com">info@phasco.com</a><br />
                                <br />
                                وب سایت : <a href="http://www.phasco.com">www.phasco.com</a><br />
                            </td>
                            <td align="center" style="width: 50%" valign="top">
                                &nbsp;</td>
                        </tr>
                    </table>
                </p>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="left" dir="rtl" style="width: 20%; height: 20px;" valign="top">
                            عنوان&nbsp; :
                        </td>
                        <td align="right" dir="ltr" style="width: 80%; height: 20px;" valign="top">
                            <asp:TextBox ID="TextBox_title" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" dir="rtl" style="width: 20%; height: 20px" valign="top">
                            نام :
                        </td>
                        <td align="right" dir="ltr" style="width: 80%; height: 20px" valign="top">
                            <asp:TextBox ID="TextBox_Name" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" dir="rtl" style="width: 20%; height: 20px" valign="top">
                            ایمیل :
                        </td>
                        <td align="right" dir="ltr" style="width: 80%; height: 20px" valign="top">
                            <asp:TextBox ID="TextBox_Email" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" dir="rtl" style="width: 20%" valign="top">
                            متن&nbsp; :
                        </td>
                        <td align="right" dir="ltr" style="width: 80%" valign="top">
                            <asp:TextBox ID="TextBox_Text" CssClass="form-control" runat="server" Height="80px" TextMode="MultiLine"
                                Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" dir="rtl" style="width: 30%; height: 19px;" valign="top">
                        </td>
                        <td align="right" dir="ltr" style="width: 70%; height: 19px;" valign="top">
                            <asp:Button CssClass="btn btn-primary" ID="Button_Send" runat="server" Text="ارسال شود" OnClick="Button_Send_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
