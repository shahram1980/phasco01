<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Master_Phasco.Master" CodeBehind="UserMssg.aspx.cs" Inherits="PHASCO_WEB.UserMssg" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">

        <script language="C#" runat="server">
            public string Mss_Open(int Mode)
            {
                if (Mode == 1) return "<font size=1 color=#0000FF>خوانده شده</font>";
                if (Mode == 0) return "<font size=1 color=#FF0000>نخوانده شده</font>";
                return "نامشخص";
            }
            public string Set_User_Name(string Uid, string name, int sender)
            {
                if (sender == 0) return "مدیریت سایت فاسکو";
                if (sender != 0) return "<a href='UserProfile.aspx?id=" + sender.ToString() + "'>" + name + "</a>"; ;
                return "نامشخص";
            }
        </script>
        <asp:View ID="View1" runat="server"></asp:View>

        <asp:View ID="View2" runat="server">
            <asp:GridView ID="Grid_Users" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered table-striped table-responsive rtl-text"
                            OnPageIndexChanging="Grid_Users_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <input id="chkBxMail" runat="server" type="checkbox" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="فرستنده">
                                    <ItemTemplate>

                                        <%# Set_User_Name(Eval("uid").ToString(), Eval("name").ToString(), Convert.ToInt32(Eval("Sender").ToString()))%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Title" HeaderText="عنوان پیام" />
                                <asp:TemplateField HeaderText="وضعيت">
                                    <ItemTemplate>
                                        <%# Mss_Open(Convert.ToInt32(Eval("Visted").ToString()))%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        [<%# Eval("id")%>]
                                    <asp:LinkButton ID="LinkButton_ViewMssg" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                        OnCommand="LinkButton_ViewMssg_Command">نمایش</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                            </Columns>
                            <PagerStyle CssClass="table no-border" />
                        </asp:GridView>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div style="text-align: center">
                <table class="table table-responsive no-border" dir="ltr">
                    <tr>
                        <td align="center" colspan="2" dir="rtl"  valign="top">[<asp:LinkButton ID="LinkButton_BackTOList" runat="server" OnClick="LinkButton_BackTOList_Click">برگشت به لیست</asp:LinkButton>]
                        [<asp:LinkButton ID="LinkButton_Answer" runat="server" OnClick="LinkButton_Answer_Click">پاسخ به پيام</asp:LinkButton>]
                        [<asp:LinkButton ID="LinkButton_Delete_Message" runat="server" OnClick="LinkButton_Delete_Message_Click">حذف پیام</asp:LinkButton>]
                        [<asp:LinkButton ID="LinkButton_Next_Message" runat="server" OnClick="LinkButton_Next_Message_Click">پيام بعدی</asp:LinkButton>]
                        [<asp:LinkButton ID="LinkButton_Back_Message" runat="server" OnClick="LinkButton_Back_Message_Click">پبام قبلی</asp:LinkButton>]</td>
                    </tr>
                  
                    <tr>
                        <td align="right" dir="rtl" style="width: 70%" valign="top">
                            <asp:Label ID="LBL_Sender" runat="server" ></asp:Label></td>
                        <td align="left" dir="rtl"  valign="top" title="width:30%">فرستنده :</td>
                    </tr>
                    <tr>
                        <td align="right" dir="ltr" style="width: 70%" valign="top">
                            <asp:Label ID="LBL_Date_Send" runat="server"></asp:Label></td>
                        <td align="left" dir="rtl" style="width: 10%; height: 16px;" valign="top" title="width:30%">تاریخ ارسال :</td>
                    </tr>
                    <tr>
                        <td align="right" dir="ltr" style="width: 70%" valign="top">
                            <asp:Label ID="Label_Time" runat="server" ></asp:Label></td>
                        <td align="left" dir="rtl"  title="width:30%" valign="top">ساعت ارسال :</td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="width: 70%" valign="top">
                            <asp:Label ID="Lbl_Title" runat="server" ></asp:Label></td>
                        <td align="left" dir="rtl" valign="top" title="width:30%">عنوان :
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" valign="top" colspan="2">
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="width: 70%" valign="top">
                            <asp:Label ID="Lbl_Body" runat="server" ></asp:Label>
                        </td>
                        <td align="right" dir="rtl" style="width: 10%" valign="top" title="width:30%"></td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="width: 70%" valign="top">
                            <asp:LinkButton ID="LinkButton_Attach" runat="server"
                                OnClick="LinkButton_Attach_Click">اين پيوست دارد</asp:LinkButton>
                        </td>
                        <td align="right" dir="rtl" style="width: 10%" valign="top" title="width:30%"></td>
                    </tr>
                    
                </table>
            </div>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table class=" table no-border form-group"  dir="ltr">
                <tr>
                    <td align="right" dir="rtl" style="width: 90%" valign="top"></td>
                    <td align="left" dir="rtl" style="width: 10%" valign="top"></td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 90%" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="left" style="width: 10%; height: 19px" valign="top">ارسال به :</td>
                                <td align="right" style="width: 90%; height: 19px" valign="top">&nbsp;<asp:Label ID="Label_Send_To" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td align="left" style="width: 10%; height: 19px" valign="top">عنوان :</td>
                                <td align="right" style="width: 90%; height: 19px" valign="top">
                                <asp:TextBox ID="TextBox_Title" runat="server" CssClass="form-control"
                                   ></asp:TextBox></td>
                            </tr>
                        </table>
                    </td>
                    <td align="left" dir="rtl" style="width: 10%" valign="top"></td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 90%" valign="top">
                        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="350px">
                        </FCKeditorV2:FCKeditor>
                    </td>
                    <td align="left" dir="rtl" style="width: 10%" valign="top"></td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 90%" valign="top">
                        <asp:FileUpload ID="FileUpload_Attach" runat="server" />
                    </td>
                    <td align="left" dir="rtl" style="width: 10%" valign="top">پيوست :</td>
                </tr>
                <tr>
                    <td align="right" colspan="2" dir="rtl" valign="top">
                        <asp:CheckBox ID="CheckBox_Outbox" runat="server" />نگهداری در صندوق پیام های ارسال
                    شده.</td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 90%; height: 19px" valign="top">
                        <asp:Button ID="Button_Send_Message" runat="server"  CssClass="btn btn-primary"
                            OnClick="Button_Send_Message_Click" Text="ارسال شود" /></td>
                    <td align="left" dir="rtl" style="width: 10%; height: 19px" valign="top"></td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_Mss_UserId" runat="server" />
    <asp:HiddenField ID="HiddenField_Back_UserId" runat="server" />
    <asp:HiddenField ID="HiddenField_Attach_Name" runat="server" />
</asp:Content>
