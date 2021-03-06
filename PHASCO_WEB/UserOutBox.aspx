<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="UserOutBox.aspx.cs" Inherits="PHASCO_WEB.UserOutBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">

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
                return "<table class='no-border table-sm' border='0' width='100%' cellpadding='0' style='border-collapse: collapse'><tr><td align='center' valign='top'>اين پیام خوانده شده</td>	</tr><tr><td align='center' valign='top'><p style='direction:ltr;'>" + sunDate.Weekday.ToString() + "</p></td>	</tr>	<tr>		<td align='center' valign='top'>" + dtm.Hour + ":" + dtm.Minute + ":" + dtm.Second + "</td>	</tr></table>";
            }

            else if (mode == 3)
            {
                return "<table  class='no-border table-sm' border='0' width='100%' cellpadding='0' style='border-collapse: collapse'><tr><td align='center' valign='top'>اين پیام حذف شده</td>	</tr><tr><td align='center' valign='top'><p style='direction:ltr;'>" + sunDate.Weekday.ToString() + "</p></td>	</tr>	<tr>		<td align='center' valign='top'>  " + dtm.Hour + ":" + dtm.Minute + ":" + dtm.Second + "</td>	</tr></table>";
            }
            else if (mode == 1) return "بازنشده";
            return "نامشخص";
        }
    </script>

    <table dir="rtl" class="table table-responsive no-border">
        <tr>
            <td>
                <asp:Label ID="LBL_Alarm" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton_Delete" OnClientClick="return confirm('آیا برای حذف اطمینان دارید')"
                    runat="server" OnClick="LinkButton_Delete_Click">حذف</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="Grid_Users" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    OnPageIndexChanging="Grid_Users_PageIndexChanging"
                    CssClass="table table-bordered table-striped table-hover table-responsive rtl-text">
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
                                <p class="rtl-text">
                                    <i class="date-wrapper">
                                       
                                    </i>

                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
