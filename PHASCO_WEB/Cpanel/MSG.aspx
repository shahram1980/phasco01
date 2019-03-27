<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master"AutoEventWireup="true" CodeBehind="MSG.aspx.cs" Inherits="phasco_webproject.Cpanel.MSG" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script language="C#" runat="server">
    public string Mss_Open(int Mode)
    {
        if (Mode == 1) return "<font size=1 color=#0000FF>خوانده شده</font>";
        if (Mode == 0) return "<font size=1 color=#FF0000>نخوانده شده</font>";
        return "نامشخص";
    }
</script>


<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
    <tr>
        <td align="right" style="width: 100%">
            <asp:Label ID="Label_Alarm" runat="server"></asp:Label></td>
    </tr>
    <tr>
        <td align="right" style="width: 100%">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td style="width: 100%">
                                &nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td dir="rtl" style="width: 100%" align="center">
                                &nbsp;<asp:GridView ID="Grid_Users" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="Grid_Users_PageIndexChanging"
                                    PageSize="50" Width="80%">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <input id="chkBxMail" runat="server" type="checkbox" />
                                   
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="uid" HeaderText="نام کاربری" />
                                        <asp:BoundField DataField="name" HeaderText="نام " />
                                        <asp:BoundField DataField="Title" HeaderText="عنوان پیام" />
                                        <asp:TemplateField HeaderText="وضعيت">
                                            <ItemTemplate>
                                                 <%# Mss_Open(Convert.ToInt32(Eval("Visted").ToString()))%>
                       
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="عنوان">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton_ViewMssg" 
                                                runat="server" 
                                                 CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                OnCommand="LinkButton_ViewMssg_Command">نمایش</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <div style="text-align: center">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 90%" dir="ltr">
                            <tr>
                                <td align="right" dir="rtl" style="width: 90%" valign="top">
                                    [<asp:LinkButton ID="LinkButton_BackTOList" runat="server" OnClick="LinkButton_BackTOList_Click">برگشت به لیست</asp:LinkButton>]
                                    [<asp:LinkButton ID="LinkButton_Answer" runat="server" OnClick="LinkButton_Answer_Click">پاسخ به پيام</asp:LinkButton>]
                                    [<asp:LinkButton ID="LinkButton_Delete_Message" runat="server" OnClick="LinkButton_Delete_Message_Click">حذف پیام</asp:LinkButton>] [<asp:LinkButton
                                        ID="LinkButton_Next_Message" runat="server" OnClick="LinkButton_Next_Message_Click">پيام بعدی</asp:LinkButton>]
                                    [<asp:LinkButton ID="LinkButton_Back_Message" runat="server" OnClick="LinkButton_Back_Message_Click">پبام قبلی</asp:LinkButton>]</td>
                                <td align="left" dir="rtl" style="width: 10%" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="height: 50px" valign="top">
                                </td>
                                <td align="left" dir="rtl" style="height: 50px" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="width: 90%" valign="top">
                                    <asp:Label ID="LBL_Sender" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:Label></td>
                                <td align="left" dir="rtl" style="width: 10%" valign="top">
                                    فرستنده :</td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="width: 90%" valign="top">
                                    <asp:Label ID="LBL_Date_Send" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:Label></td>
                                <td align="left" dir="rtl" style="width: 10%" valign="top">
                                    تاریخ ارسال :</td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="width: 90%" valign="top">
                                    <asp:Label ID="Lbl_Title" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:Label></td>
                                <td align="left" dir="rtl" style="width: 10%" valign="top">
                                    عنوان :
                                </td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="width: 90%" valign="top">
                                    <asp:Label ID="Lbl_Body" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:Label></td>
                                <td align="right" dir="rtl" style="width: 10%" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="width: 90%" valign="top">
                                </td>
                                <td align="right" dir="rtl" style="width: 10%" valign="top">
                                </td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="width: 90%" valign="top">
                                </td>
                                <td align="right" dir="rtl" style="width: 10%" valign="top">
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 90%">
                        <tr>
                            <td align="right" dir="rtl" style="width: 90%" valign="top">
                            </td>
                            <td align="left" dir="rtl" style="width: 10%" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 90%" valign="top">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="left" style="width: 10%; height: 19px" valign="top">
                                            ارسال به :</td>
                                        <td align="right" style="width: 90%; height: 19px" valign="top">
                                            &nbsp;<asp:Label ID="Label_Send_To" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 10%; height: 19px" valign="top">
                                            عنوان :</td>
                                        <td align="right" style="width: 90%; height: 19px" valign="top">
                                            &nbsp;<asp:TextBox ID="TextBox_Title" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                Width="90%"></asp:TextBox></td>
                                    </tr>
                                </table>
                            </td>
                            <td align="left" dir="rtl" style="width: 10%" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 90%" valign="top">
                              

                                        <FCKeditorV2:FCKeditor ID="RadEditor_Text" runat="server" Height="400px" 
                    Width="800px">
                </FCKeditorV2:FCKeditor>
                            </td>
                            <td align="left" dir="rtl" style="width: 10%" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 90%" valign="top">
                                <asp:FileUpload ID="FileUpload_Attach" runat="server" /></td>
                            <td align="left" dir="rtl" style="width: 10%" valign="top">
                                پيوست :</td>
                        </tr>
                        <tr>
                            <td align="right" dir="rtl" style="width: 90%; height: 19px;" valign="top">
                                <asp:Button ID="Button_Send_Message" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                    Text="ارسال شود" OnClick="Button_Send_Message_Click" /></td>
                            <td align="left" dir="rtl" style="width: 10%; height: 19px;" valign="top">
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView></td>
    </tr>
</table>
<asp:HiddenField ID="HiddenField_Mss_UserId" runat="server" /><asp:HiddenField ID="HiddenField_Back_UserId" runat="server" />
</asp:Content>
 