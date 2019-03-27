<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    Codebehind="Eshop_Order.aspx.cs" Inherits="phasco_webproject.Cpanel.Eshop_Order" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="C#" runat="server">
        public string Mode_Pey(int val, string pey_Mode)
        {
            string ret_ = "";
            if (val == 0)
                ret_ = "[" + pey_Mode + "] فيش بانکی ";
            else if (val == 1)
                ret_ = " پرداخت آن لاين";
            else if (val == 3)
                ret_ = "سفارش آن لاین";
            return ret_;
        }

        public string change_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString() + "&nbsp;&nbsp;[" + dtm.Hour + ":" + dtm.Minute + "]";
        }
    </script>

    <script type="text/javascript">
function CopyDIV(IDS) {
  document.getElementById('<%=TextBox_Comment.ClientID %>').value=document.getElementById(IDS).innerHTML;
}
    </script>

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td style="width: 100%">
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%" align="center">
                        <asp:GridView ID="GridView_New" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            Font-Names="Tahoma" Font-Size="X-Small" GridLines="None" Width="80%" ForeColor="#333333">
                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                            <Columns>
                                <asp:BoundField DataField="Key_Id" HeaderText="کد فاکتور" />
                                <asp:HyperLinkField DataNavigateUrlFields="Key_Id" DataNavigateUrlFormatString="Eshop_Order.aspx?id={0}&amp;mode=detail"
                                    DataTextField="name" HeaderText="کاربر" />
                                <asp:BoundField DataField="Uid" HeaderText="نام کاربری" />
                                <asp:BoundField DataField="count_" HeaderText="تعداد محصول" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table id="table1" border="0" width="100%">
                                            <tr>
                                                <td align="left">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Key_Id","{0}") %>'
                                                        OnCommand="LinkButton1_Command">آرشیو</asp:LinkButton>
                                                </td>
                                                <td align="right">
                                                </td>
                                                <td align="right">
                                                    <%# Mode_Pey(Convert.ToInt32(Eval("Mode_payment")),Convert.ToString(Eval("FIsh_Number")))%>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="تاریخ خرید">
                                    <AlternatingItemTemplate>
                                        <%# change_Date(Eval("Date_Finaly").ToString()) %>
                                    </AlternatingItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <EditRowStyle BackColor="#999999" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table id="table45" border="0" height="100%" style="border-collapse: collapse" width="100%">
                <tr>
                    <td>
                        <table id="table46" border="0" style="border-collapse: collapse" width="100%">
                            <tr>
                                <td align="center" dir="rtl">
                                    <asp:GridView ID="GridView_List" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        ForeColor="#333333" GridLines="None" Width="80%">
                                        <Columns>
                                            <asp:BoundField DataField="Order_No" HeaderText="تعداد سفارشات" />
                                            <asp:BoundField DataField="Date_Finaly" HeaderText="تاریخ خرید" />
                                            <asp:BoundField DataField="Product_Price" HeaderText="مبلغ" />
                                            <asp:BoundField DataField="Product_Namme" HeaderText="محصول" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <EditRowStyle BackColor="#999999" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <table id="table47" border="0" width="100%">
                            <tr>
                                <td align="center" dir="rtl">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td dir="rtl" width="100%">
                                    <table id="table49" border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                                        <tr>
                                            <td width="50%">
                                                <table id="table50" border="0" style="border-collapse: collapse" width="100%">
                                                    <tr>
                                                        <td style="width: 387px; height: 65px">
                                                            <div align="right">
                                                                <table border="1" width="100%" id="table1" style="border-collapse: collapse" bordercolor="#C0C0C0"
                                                                    dir="ltr">
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext1" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1601;&#1575;&#1705;&#1578;&#1608;&#1585; &#1589;&#1575;&#1583;&#1585; &#1588;&#1583;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext2" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1662;&#1610;&#1588; &#1601;&#1575;&#1705;&#1578;&#1608;&#1585; &#1589;&#1575;&#1583;&#1585;
                                                                                &#1588;&#1583;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right"
                                                                            valign="top" width="100%">
                                                                            <hr style="border-right: #ff6600 3px solid; border-top: #ff6600 3px solid; border-left: #ff6600 3px solid;
                                                                                border-bottom: #ff6600 3px solid" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext3" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1581;&#1608;&#1575;&#1604;&#1607; &#1587;&#1601;&#1575;&#1585;&#1588; &#1589;&#1575;&#1583;&#1585;
                                                                                &#1588;&#1583;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext4" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1587;&#1601;&#1575;&#1585;&#1588; &#1570;&#1605;&#1575;&#1583;&#1607; &#1575;&#1585;&#1587;&#1575;&#1604;
                                                                                &#1575;&#1587;&#1578;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext5" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1587;&#1601;&#1575;&#1585;&#1588; &#1570;&#1605;&#1575;&#1583;&#1607; &#1578;&#1581;&#1608;&#1740;&#1604;
                                                                                &#1575;&#1587;&#1578;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" 
                                                                            valign="top" width="100%">
                                                                            <hr style="border-right: #ff6600 3px solid; border-top: #ff6600 3px solid; border-left: #ff6600 3px solid;
                                                                                border-bottom: #ff6600 3px solid" />
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext6" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1608;&#1575;&#1581;&#1583; &#1575;&#1585;&#1587;&#1575;&#1604;
                                                                                &#1587;&#1601;&#1575;&#1585;&#1588;&#1575;&#1578; &#1588;&#1585;&#1705;&#1578; &#1601;&#1575;&#1587;&#1705;&#1608;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIV1" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1578;&#1581;&#1608;&#1740;&#1604;
                                                                                &#1581;&#1590;&#1608;&#1585;&#1740;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext7" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1662;&#1740;&#1705;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext8" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1588;&#1585;&#1705;&#1578; &#1578;&#1593;&#1575;&#1608;&#1606;&#1740;
                                                                                &#1605;&#1587;&#1575;&#1601;&#1585;&#1576;&#1585;&#1740; &#1578;&#1585;&#1605;&#1740;&#1606;&#1575;&#1604;
                                                                                &#1588;&#1585;&#1602;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext9" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1588;&#1585;&#1705;&#1578; &#1578;&#1593;&#1575;&#1608;&#1606;&#1740;
                                                                                &#1605;&#1587;&#1575;&#1601;&#1585;&#1576;&#1585;&#1740; &#1578;&#1585;&#1605;&#1740;&#1606;&#1575;&#1604;
                                                                                &#1594;&#1585;&#1576;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext10" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1588;&#1585;&#1705;&#1578; &#1578;&#1593;&#1575;&#1608;&#1606;&#1740;
                                                                                &#1605;&#1587;&#1575;&#1601;&#1585;&#1576;&#1585;&#1740; &#1578;&#1585;&#1605;&#1740;&#1606;&#1575;&#1604;
                                                                                &#1580;&#1606;&#1608;&#1576;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext11" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1588;&#1585;&#1705;&#1578; &#1578;&#1593;&#1575;&#1608;&#1606;&#1740;
                                                                                &#1605;&#1587;&#1575;&#1601;&#1585;&#1576;&#1585;&#1740; &#1578;&#1585;&#1605;&#1740;&#1606;&#1575;&#1604;
                                                                                &#1570;&#1585;&#1688;&#1575;&#1606;&#1578;&#1740;&#1606;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext12" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1578;&#1740; &#1662;&#1575;&#1705;&#1587;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';">
                                                                            <div id="DIVtext13" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1575;&#1586; &#1591;&#1585;&#1740;&#1602; &#1607;&#1608;&#1575;&#1662;&#1740;&#1605;&#1575;&#1740;&#1740;</div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" 
                                                                            valign="top" width="100%">
                                                                            <hr style="border-right: #ff6600 3px solid; border-top: #ff6600 3px solid; border-left: #ff6600 3px solid;
                                                                                border-bottom: #ff6600 3px solid" />
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" width="100%" valign="top"  onmouseout="this.style.backgroundColor='#ffffff';" onmouseover="this.style.backgroundColor='#C0C0C0';" style="height: 29px">
                                                                            <div id="DIVtext14" style="width: 100%;cursor:pointer;" onclick="CopyDIV(this.id)">
                                                                                &#1578;&#1581;&#1608;&#1610;&#1604; &#1711;&#1610;&#1585;&#1606;&#1583;&#1607;</div>
                                                                        </td>
                                                                    </tr>
                                                   
                                                                </table>
                                                            </div>
                                                            <asp:TextBox ID="TextBox_Comment" runat="server" Font-Names="Tahoma" Height="66px"
                                                                TextMode="MultiLine" Width="100%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 387px; height: 65px">
                                                            <asp:Button ID="Button_Ins_Comment" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                OnClick="Button_Ins_Comment_Click" Text="  ثبت شود  " /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top" width="50%">
                                                <asp:GridView ID="GridView_Comment" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                    ForeColor="#333333" GridLines="None" Width="100%">
                                                    <Columns>
                                                        <asp:BoundField DataField="Comment" HeaderText="محصول" />
                                                        <asp:TemplateField>
                                                            <ItemTemplate>
                                                                <font color="#800080"><b><a onclick="return confirm('Are you sure you want to delete?')"
                                                                    href="Eshop_Order.aspx?id=<%# Eval("Key_Id") %>&mode=detail&delid=<%# Eval("Autoid") %>">
                                                                    X </a></b></font>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <EditRowStyle BackColor="#999999" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <a href="Eshop_Order.aspx">برگشت به لیست</a></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>
