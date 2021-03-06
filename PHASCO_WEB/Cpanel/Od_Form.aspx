<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="Od_Form.aspx.cs" Inherits="PHASCO_WEB.Cpanel.Od_Form" %>
<script language="C#" runat="server">
 
    public string Set_Title(  string date,int id,int mode)
    {
        string uid="";
        string date_="";
        DataAccessLayer.Users.TBL_User da = new DataAccessLayer.Users.TBL_User();
        System.Data.DataTable dt = new System.Data.DataTable();
        dt = da.Users_Tra("select_Item", id);
        if (dt.Rows.Count > 0) uid = " .:: " + dt.Rows[0]["Uid"].ToString() + " ::. " + " .:: " + dt.Rows[0]["Name"].ToString() + " ::. ";
        DateTime dtm = new DateTime();
        dtm = Convert.ToDateTime(date);
        Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

        date_ = sunDate.Weekday.ToString() + "[" + dtm.Hour + ":" + dtm.Minute + "]";

        string mode_ = "مشاوره علمی";
        if (mode == 1)
            mode_ = "اعتراض";
        return date_ + " " + uid+" فرم("+mode_+")";
    }
    </script>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table align="right" cellpadding="0" cellspacing="0" dir="rtl" style="height: 20px;
                weidht: 100%">
                <tr>
                    <td style="height: 19px">
               
                        <asp:DropDownList ID="drpPaging" runat="server" AutoPostBack="true" Font-Names="Tahoma"
                            Font-Size="11px" OnSelectedIndexChanged="drpPaging_SelectedIndexChanged">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <asp:Repeater ID="RPT_Od" runat="server">
                            <ItemTemplate>
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <img src="../images/arrow3.gif" />&nbsp;
                                            <%# Set_Title( Eval("DateSend").ToString() , int.Parse(Eval("uid").ToString()),int.Parse(Eval("mode").ToString()))%>
                                            [ کاربر
                                            <%# Eval("uid")%>
                                            بار ] &nbsp;
                                            <a href="od_form.aspx?id=<%# Eval("ID") %>&uid=<%# Eval("uid") %>">[ جزئیات ... ]</a>
                                       
	                                 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="background-image: url(../images/line.gif); height: 20px">
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>

            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table id="TABLE1" align="center" border="0" cellpadding="0" cellspacing="0" language="javascript"
                onclick="return TABLE1_onclick()" style="width: 90%" dir="ltr">
                <tr>
                    <td align="right" colspan="3" dir="rtl" style="width: 70%">
                        <asp:LinkButton ID="LinkButton_Archive" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            ForeColor="#00C000" OnClick="LinkButton_Archive_Click">آرشیو ودرج امتیاز</asp:LinkButton>
                        &nbsp;&nbsp; || &nbsp;
                        <asp:LinkButton ID="LinkButton_Delete" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            ForeColor="#C00000" OnClick="LinkButton_Delete_Click">حذف شود</asp:LinkButton></td>
                    <td align="left" dir="rtl" style="width: 20%">
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="3" dir="rtl" style="width: 70%">
                    </td>
                    <td align="left" dir="rtl" style="width: 20%">
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="3" dir="rtl" style="width: 70%">
                        <asp:Label ID="Label_Mode" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%">
                        نوع فرم:</td>
                </tr>
                <tr>
                    <td colspan="3" dir="rtl" style="width: 70%" align="right">
                        <asp:Label ID="TextBox_Az_Name" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%">
                        نام آزمايشگاه :</td>
                </tr>
                <tr>
                    <td colspan="3" dir="rtl" style="width: 70%; height: 13px;" align="right">
                        <asp:Label ID="TextBox_Mas_Test" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%; height: 13px;">
                        مسئول انجام تست :</td>
                </tr>
                <tr>
                    <td dir="rtl" style="width: 30%; height: 20px" align="right">
                        <asp:Label ID="TextBox_Dafe_Estefade" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%; height: 20px">
                        دفعه استفاده از کیت :</td>
                    <td dir="rtl" style="width: 30%; height: 20px" align="right">
              
                        <asp:Label ID="TextBox_Mas_Fani" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%; height: 20px">
                        مسئول فنی آزمایشگاه :</td>
                </tr>
                <tr>
                    <td dir="rtl" style="width: 30%; height: 13px;" align="right">
                        <asp:Label ID="TextBox_Tarikh" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%; height: 13px;">
                        تاریخ انجام تست :</td>
                    <td dir="rtl" style="width: 30%; height: 13px;" align="right">
                        <asp:Label ID="TextBox_Tel" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%; height: 13px;">
                        تلفن :</td>
                </tr>
                <tr>
                    <td dir="rtl" style="width: 30%; height: 20px" align="right">
                        <asp:Label ID="TextBox_Mark" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%; height: 20px">
                        مارک کیت :</td>
                    <td dir="rtl" style="width: 30%; height: 20px" align="right">
                        <asp:Label ID="TextBox_Test_mored" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%; height: 20px">
                        تست مورد نظر :</td>
                </tr>
                <tr>
                    <td dir="rtl" style="width: 30%" align="right">
                        <asp:Label ID="TextBox_Engeza_Tarikh" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%">
                        تاریخ انقضاء :</td>
                    <td dir="rtl" style="width: 30%" align="right">
                        <asp:Label ID="TextBox_Seri_Sakht" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%">
                        سری ساخت :</td>
                </tr>
                <tr>
                    <td colspan="3" dir="rtl" style="width: 70%" align="right">
                        <asp:Label ID="TextBox_Tozih" runat="server" Font-Names="Tahoma" Font-Size="XX-Small" TextMode="MultiLine"></asp:Label></td>
                    <td align="left" dir="rtl" style="width: 20%" valign="top">
                        توضيحات :</td>
                </tr>
            </table>
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%" dir="ltr">
                <tr>
                    <td align="center" style="width: 7%">
                    </td>
                    <td align="center" style="width: 7%">
                        1</td>
                    <td align="center" style="width: 7%">
                        2</td>
                    <td align="center" style="width: 7%">
                        3</td>
                    <td align="center" style="width: 7%">
                        4</td>
                    <td align="center" style="width: 7%">
                        5</td>
                    <td align="center" style="width: 7%">
                        6</td>
                    <td align="center" style="width: 7%">
                        7</td>
                    <td align="center" style="width: 7%">
                        8</td>
                    <td align="center" style="width: 7%">
                        9</td>
                    <td align="center" style="width: 7%">
                        10</td>
                    <td align="center" style="width: 7%">
                        11</td>
                    <td align="center" style="width: 7%">
                        12</td>
                    <td align="center" style="width: 7%">
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%; height: 19px">
                        A</td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                    
                        <asp:Label ID="TextBox_A4" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A5" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A6" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A7" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A8" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A9" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A10" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A11" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        <asp:Label ID="TextBox_A12" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 19px">
                        A</td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">
                        B</td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B4" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B5" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B6" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B7" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B8" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B9" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B10" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B11" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_B12" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        B</td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%; height: 13px;">
                        C</td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C4" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C5" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C6" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C7" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C8" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C9" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C10" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C11" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        <asp:Label ID="TextBox_C12" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 13px;">
                        C</td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%; height: 20px">
                        D</td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D4" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D5" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D6" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D7" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D8" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D9" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D10" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D11" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        <asp:Label ID="TextBox_D12" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%; height: 20px">
                        D</td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">
                        E</td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E4" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E5" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E6" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E7" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E8" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E9" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E10" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E11" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_E12" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        E</td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">
                        F</td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F4" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F5" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F6" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F7" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F8" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F9" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F10" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F11" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_F12" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        F</td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">
                        G</td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G4" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G5" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G6" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G7" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G8" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G9" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G10" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G11" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_G12" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        G</td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">
                        H</td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H4" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H5" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H6" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H7" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H8" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H9" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H10" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H11" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        <asp:Label ID="TextBox_H12" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            Width="90%"></asp:Label></td>
                    <td align="center" style="width: 7%">
                        H</td>
                </tr>
                <tr>
                    <td align="center" style="width: 7%">
                    </td>
                    <td align="center" style="width: 7%">
                        1</td>
                    <td align="center" style="width: 7%">
                        2</td>
                    <td align="center" style="width: 7%">
                        3</td>
                    <td align="center" style="width: 7%">
                        4</td>
                    <td align="center" style="width: 7%">
                        5</td>
                    <td align="center" style="width: 7%">
                        6</td>
                    <td align="center" style="width: 7%">
                        7</td>
                    <td align="center" style="width: 7%">
                        8</td>
                    <td align="center" style="width: 7%">
                        9</td>
                    <td align="center" style="width: 7%">
                        10</td>
                    <td align="center" style="width: 7%">
                        11</td>
                    <td align="center" style="width: 7%">
                        12</td>
                    <td align="center" style="width: 7%">
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_Mode" runat="server" />
</asp:Content>
 