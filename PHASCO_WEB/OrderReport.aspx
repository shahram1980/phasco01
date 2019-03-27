<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true"
    CodeBehind="OrderReport.aspx.cs" Inherits="PHASCO_WEB.OrderReport" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">

</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">

    <script language="C#" runat="server">
        public string Change_Date(DateTime sender)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(sender);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            return sunDate.Weekday.ToString();
        }
        public string Change_Time(DateTime sender)
        {
            DateTime dtm = new DateTime();

            return dtm.Hour + ":" + dtm.Minute;
        }
    </script>

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="center" dir="rtl" style="width: 100%">
                        <img src="images/eshop_orders.jpg" />
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 100%" dir="rtl">
                        <asp:DataList ID="DataList_Orders" runat="server" CellSpacing="2" RepeatColumns="6">
                            <ItemTemplate>
                                <table border="1" width="110" id="table1" dir="rtl" style="border-collapse: collapse"
                                    onmouseout="this.style.backgroundColor='#f3e5ca';" onmouseover="this.style.backgroundColor='#ceba99';"
                                    height="70" bordercolor="#ceba99">
                                    <tr>
                                        <td valign="top">
                                            <table border="0" width="100%" id="table2" style="border-collapse: collapse">
                                                <tr>
                                                    <td align="center">
                                                        <a href="orderreport.aspx?id=<%# Eval("Key_Id")%>">
                                                            <%# Eval("Key_Id")%># </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" dir="ltr">
                                                        <a href="orderreport.aspx?id=<%# Eval("Key_Id")%>">
                                                            <%# Change_Date(Convert.ToDateTime(Eval("Date_Finaly")))%>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <a href="orderreport.aspx?id=<%# Eval("Key_Id")%>">نمایش گزارشات</a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" dir="rtl" style="width: 100%; height: 14px;">
                        گزارش رهگیری سفارش شماره
                        <asp:Label ID="Label_Order_No" runat="server" ForeColor="#C00000"></asp:Label><br />
                        <br />
                        <a href="OrderReport.aspx">برگشت به رهگیری سفارشات</a>
                    </td>
                </tr>
                <tr>
                    <td align="center" dir="rtl" style="width: 100%; height: 27px">
                    </td>
                </tr>
                <tr>
                    <td align="center" dir="rtl" style="width: 100%; height: 27px">
                        <img src="images/eshop_orders.jpg" />
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 100%" dir="rtl">
                        <asp:GridView ID="GridView_List_Arc" runat="server" AutoGenerateColumns="False" Width="90%"
                            BorderStyle="None" BorderWidth="0px">
                            <Columns>
                                <asp:BoundField DataField="Order_No" HeaderText="تعداد سفارش" />
                                <asp:BoundField DataField="Product_Price" HeaderText="قيمت" />
                                <asp:BoundField DataField="Product_Namme" HeaderText="محصول" />
                                <asp:TemplateField HeaderText="تاريخ">
                                    <ItemTemplate>
                                        <%# Change_Date(Convert.ToDateTime(Eval("Date_Finaly")))%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <AlternatingRowStyle BackColor="#E2D3BB" CssClass="mycellbg" />
                            <HeaderStyle BackColor="#CEBA99" Font-Bold="False" Font-Italic="False" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="center" dir="rtl" style="width: 100%; height: 27px">
                    </td>
                </tr>
                <tr>
                    <td align="center" dir="rtl" style="width: 100%; height: 27px">
                        <img src="images/eshop_Title.jpg" />
                    </td>
                </tr>
                <tr>
                    <td align="center" style="width: 100%" dir="rtl">
                        <asp:GridView ID="GridView_Comment_Arc" runat="server" AutoGenerateColumns="False"
                            Width="90%" EmptyDataText="هنوز گزارشی ارسال نشده است !" BorderStyle="None" BorderWidth="0px">
                            <Columns>
                                <asp:BoundField DataField="Comment" HeaderText="پيلم مدير">
                                    <ItemStyle Width="80%" HorizontalAlign="Right" VerticalAlign="Top" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="تاریخ واقعه">
                                    <ItemTemplate>
                                        <%# Change_Date(Convert.ToDateTime(Eval("DAte_Ins")))%>
                                    </ItemTemplate>
                                    <ItemStyle Width="30%" />
                                </asp:TemplateField>
                            </Columns>
                            <AlternatingRowStyle BackColor="#E2D3BB" />
                            <HeaderStyle BackColor="#CEBA99" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
