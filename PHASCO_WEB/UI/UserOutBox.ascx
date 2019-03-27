<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserOutBox.ascx.cs" Inherits="phasco_webproject.UI.UserOutBox" %>
<script language="C#" runat="server">
        public string Mss_Open(int Mode)
        {
            if (Mode == 1) return "<font size=1 color=#0000FF>خوانده نشده</font>";
            if (Mode == 0) return "<font size=1 color=#FF0000>نخوانده شده</font>";
            return "نامشخص";
        }
    public string Mss_Date(int mode, string date)
    {
        DateTime dtm = new DateTime();
        dtm = Convert.ToDateTime(date);
        Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
        if (mode == 2)
        {
            return   "<table border='0' width='100%' cellpadding='0' style='border-collapse: collapse'><tr><td align='center' valign='top'>اين پیام خوانده شده</td>	</tr><tr><td align='center' valign='top'>" + sunDate.Weekday.ToString() + "</td>	</tr>	<tr>		<td align='center' valign='top'>" + dtm.Hour+":"+dtm.Minute+":"+dtm.Second+"</td>	</tr></table>";
        }
        
        else if (mode == 3)
        {
         return   "<table border='0' width='100%' cellpadding='0' style='border-collapse: collapse'><tr><td align='center' valign='top'>اين پیام حذف شده</td>	</tr><tr><td align='center' valign='top'>" + sunDate.Weekday.ToString() + "</td>	</tr>	<tr>		<td align='center' valign='top'>" + dtm.Hour+":"+dtm.Minute+":"+dtm.Second+"</td>	</tr></table>";
        } 
        else if (mode == 1) return "بازنشده";
        return "نامشخص";
    }
    </script>
 <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
    <tr>
        <td style="width: 100%">
            <asp:LinkButton ID="LinkButton_Delete" OnClientClick="return confirm('آیا برای حذف اطمینان دارید')" runat="server" OnClick="LinkButton_Delete_Click">حذف</asp:LinkButton></td>
    </tr>
    <tr>
        <td style="width: 100%">
<asp:GridView ID="Grid_Users" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="Grid_Users_PageIndexChanging"
    PageSize="50" Width="80%">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <input id="chkBxMail" runat="server" type="checkbox" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="id" HeaderText="شماره نامه" />
        <asp:BoundField DataField="uid" HeaderText="گیرنده" />
        <asp:BoundField DataField="name" HeaderText="نام  گيرنده" />
        <asp:BoundField DataField="Title" HeaderText="عنوان پیام" />
        <asp:TemplateField HeaderText="وضعیت">
            <ItemTemplate>
                  <%# Mss_Date(Convert.ToInt32(Eval("ModeMss").ToString()), Eval("DateOpen").ToString())%>
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
