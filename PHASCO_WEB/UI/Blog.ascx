<%@ Control Language="C#" AutoEventWireup="true" Codebehind="Blog.ascx.cs" Inherits="phasco_webproject.UI.Blog" %>

<script language="C#" runat="server">
 
    public string Blog_Date(string date)
    {
        DateTime dtm = new DateTime();
        dtm = Convert.ToDateTime(date);
        Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

        return sunDate.Weekday.ToString() + "&nbsp;&nbsp;[" + dtm.Hour + ":" + dtm.Minute + "]";

    }

    public bool Set_Comment(int mode)
    {
        if (mode == 1)
            return true;
        return false;
    }

    public string Set_Popup(int mode,int id)
    {
        if (mode == 1)
            return "javascript:popDemo('BlogComment.aspx?id=" + id.ToString() + "')";
        return "111";
    }
    
    public string Set_Comment_Count(int id)
    {
        phasco_webproject.DAL.DS_MainPhascoTableAdapters.Users_Blog_CommentTableAdapter da = new phasco_webproject.DAL.DS_MainPhascoTableAdapters.Users_Blog_CommentTableAdapter();
        int count = 0;
        int? count_ = 0;
        count_ = da.Comment_Count(id);
        return Resources.Resource.Comment.ToString()+" ("+ count_.ToString()+")";
    }
     
</script>
<script language=javascript>
<!--
function popDemo(N) {
newWindow = window.open(N, 'popD','toolbar=no,menubar=no,resizable=no,scrollbars=no,status=no,location=no,width=600,height=500');
}
//-->
</script>

<table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 95%">
    <tr>
        <td align="right" dir="rtl" style="width: 100%">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" style="width: 100%">
                        <asp:Image ID="Image_User" runat="server" ImageUrl="~/phascoupfile/Userphoto/Nopic.jpg" />
                        <asp:ImageButton ID="ImageButton_SendMail" runat="server" ImageUrl="~/images/Send_Mail.jpg"
                            OnClick="ImageButton_SendMail_Click" /></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100%">
                        <asp:Label ID="Label_Name" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td align="right" style="width: 100%">
                        <asp:Label ID="Label_Uid" runat="server"></asp:Label></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="right" dir="rtl" style="width: 100%">
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
        پیدا نشذ</asp:View>
    <asp:View ID="View2" runat="server">
        <asp:GridView ID="GridView_Blog" runat="server" AutoGenerateColumns="False" Width="100%">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table border="0" width="100%" dir="rtl" cellpadding="0" style="border-collapse: collapse">
                            <tr>
                                <td>
                                    <%# Blog_Date(Eval("DateIns").ToString()) %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%# Eval("Title") %>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <%# Eval("body") %>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                <a href="#"  onclick="<%# Set_Popup(Convert.ToInt32(Eval("Comment")),Convert.ToInt32(Eval("id"))) %>">
                                
                                  <asp:Label runat="server" Enabled='<%# Set_Comment(Convert.ToInt32(Eval("Comment"))) %>'>
                                    <%# Set_Comment_Count(Convert.ToInt32(Eval("id"))) %>
                                  </asp:Label>
                                  </a>
                               
                             
                             
                                     </td>
 
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:View>
</asp:MultiView></td>
    </tr>
</table>
 
