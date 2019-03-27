<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="RequestUserPm.aspx.cs" Inherits="phasco.Cpanel.RequestUserPm" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script language="C#" runat="server">
     public string Fixdate(DateTime val)
     {
         string ret_ = "";
         System.Globalization.PersianCalendar pers = new System.Globalization.PersianCalendar();
         Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(val);
         ret_ = sunDate.Weekday;
         return ret_;
     }
</script>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td dir="rtl" style="width: 100%">
            <asp:GridView ID="Grid_Sms" runat="server" AutoGenerateColumns="False" BackColor="White"
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black"
                GridLines="Vertical" Width="100%">
                <FooterStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:TemplateField HeaderText="فرستنده">
                    <ItemTemplate>
                    <%# Eval("name") %> <%# Eval("famil") %> 
                    </ItemTemplate>
                        <ItemStyle Width="10%" />
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="پيام" DataField="Message" >
                        <ItemStyle Width="65%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="تاریخ ارسال">
                    <ItemTemplate>
                    <%# Fixdate(Convert.ToDateTime(Eval("DateSend"))) %>
                    </ItemTemplate>
                        <ItemStyle Width="15%" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="وضعیت">
                        <ItemStyle Width="10%" />
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton_delete" runat="server" Font-Names="Tahoma" Font-Size="X-Small" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                ForeColor="#C00000" OnCommand="LinkButton_delete_Command">حذف</asp:LinkButton>
                            |
                            <asp:LinkButton ID="LinkButton_Answer" runat="server" Font-Names="Tahoma" Font-Size="X-Small" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                ForeColor="#00C000" OnCommand="LinkButton_Answer_Command">پاسخ</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" dir="rtl" style="width: 70%">
                        <asp:TextBox ID="TextBox_PM" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            Height="200px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
                    <td align="left" dir="rtl" style="width: 30%">
                        متن پيام :</td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 70%">
                        <asp:FileUpload ID="FileUpload_Attach" runat="server" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                    <td align="left" dir="rtl" style="width: 30%">
                        پیوست :</td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 70%">
                        <asp:Button ID="Button_Send" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_Send_Click" Text="ارسال" /></td>
                    <td align="left" dir="rtl" style="width: 30%">
                    </td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 70%">
                    </td>
                    <td align="left" dir="rtl" style="width: 30%">
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="HiddenField_Id" runat="server" />
        </asp:View>
    </asp:MultiView>
</asp:Content>

 
