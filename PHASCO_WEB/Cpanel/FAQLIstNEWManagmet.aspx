<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="FAQLIstNEWManagmet.aspx.cs" Inherits="PHASCO_WEB.Cpanel.FAQLIstNEWManagmet" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script language="C#" runat="server">
 
        public string Mss_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString() + "[" + dtm.Hour + ":" + dtm.Minute + "]";
        }
        public string Set_User(int uid)
        {
            //DataAccessLayer.DS_MainPhascoTableAdapters.UsersTableAdapter da = new DataAccessLayer.DS_MainPhascoTableAdapters.UsersTableAdapter();
            //DataAccessLayer.DS_MainPhasco.UsersDataTable dt = new DataAccessLayer.DS_MainPhasco.UsersDataTable();

            DataAccessLayer.Users.TBL_User dauser = new DataAccessLayer.Users.TBL_User();


            System.Data.DataTable dt = dauser.Users_Tra("ref_Uid", uid);
            if (dt.Rows.Count > 0) { return dt.Rows[0]["Name"] + " " + dt.Rows[0]["Famil"]; }

            return "ناشناس";
        }
    </script>
    <asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
<asp:Repeater ID="GridView_Qu" runat="server">
    <ItemTemplate>
        <div align="right">
            <table border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                <tr>
                    <td align="right" background="images/FAQ_Title.jpg" style="height: 27px;" valign="top"
                        width="100%">
                        <b>
                            <%# Eval("title") %>&nbsp;&nbsp;
                        </b>
                       <font color="#FF0000">
                     [  <a  onclick="return confirm(' آیا برای حذف اطمینان دارید')" href="FAQLIstNEWManagmet.aspx?mode=delete&id=<%# Eval("id") %>">
حذف سوال</a>]

</font> 
                           
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2" valign="top" width="100%">
                        <a href='FAQLIstNEWManagmet.aspx?page=faqnew&mode=answer&id=<%# Eval("id") %>'>
                            <%# Eval("text") %>
                        </a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" width="100%">
                        <table border="0" style="border-collapse: collapse" width="100%">
                            <tr>
                                <td width="60%">
                                    ارسال کننده :
                                    <%# Set_User(int.Parse(Eval("sender_Id").ToString()))%>
                                </td>
                                <td width="40%">
                                    <%# Mss_Date(Eval("date").ToString())%>
                                    | (<%# Eval("ans_Count") %>) &#1662;&#1575;&#1587;&#1582;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" width="100%">
                        <hr style="border: 1px solid #C0C0C0">
                    </td>
                </tr>
            </table>
        </div>
    </ItemTemplate>
</asp:Repeater>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table border="0" dir="rtl" style="border-collapse: collapse" width="100%">
            <tr>
                <td align="right" dir="rtl" valign="top" width="100%">
                    <a href="Default.aspx?page=faqnew">برگشت به سوالات</a></td>
            </tr>
            <tr>
                <td align="right" dir="rtl" valign="top" width="100%">
                    <asp:Label ID="Label_Text_title" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td align="right" dir="rtl" valign="top" width="100%">
                    <table border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                        <tr>
                            <td align="right" colspan="2" valign="top">
                                پاسخ به این سوال
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" width="30%">
                                <span lang="fa">عنوان : </span>
                            </td>
                            <td align="right" valign="top" width="80%">
                                <asp:TextBox ID="TextBox_Title_User_Answer" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                    Width="50%"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" width="30%">
                                <span lang="fa">سوال : </span>
                            </td>
                            <td align="right" valign="top" width="80%">
                                <asp:TextBox ID="TextBox_Text_User_Answer" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                    Height="100px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" valign="top" width="30%">
                                &nbsp;</td>
                            <td align="right" valign="top" width="80%">
                                <asp:Button ID="Button_Send__User_Answer" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                    OnClick="Button_Send__User_Answer_Click" Text="ثبت شود" />
                                <asp:Label ID="Label_Send_Ans_Alarm" runat="server" ForeColor="Red"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right" dir="rtl" valign="top" width="100%">
                    &nbsp;</td>
            </tr>
        </table>
    </asp:View>
   
</asp:MultiView>
 <asp:HiddenField id="HiddenField_Id" runat="server">
    </asp:HiddenField>
</asp:Content>

 