<%@ Page Language="C#" MasterPageFile="~/Template/Phasco_Eshop.Master" AutoEventWireup="true" CodeBehind="Final.aspx.cs" Inherits="PHASCO_WEB.Final" %>
<asp:Content ContentPlaceHolderID="Plc" runat="server">
<table id="Table6" border="0" cellpadding="0" cellspacing="0" dir='<asp:Literal ID="dir3" Text="<%$ Resources:Resource, Price_Text %>" runat="server" />'
        style="border-collapse: collapse" width="100%">
        <tr>
            <td align="center" style="text-align: center">
                <table id="Table5" border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td background="images/topcellbg2.jpg" height="25" valign="middle">
                        <img src="images/Title_Final.jpg" /></td>
                    </tr>
                    <tr>
                        <td class="mycell2" height="2" style="text-align: center" valign="top">
							<table id="Table9" border="0" dir='<asp:Literal Text="<%$ Resources:Resource, dir%>" ID="Literal1" runat="server" />' style="border-collapse: collapse" width="100%">
            <tr>
                <td align="center">
                    <div align="center">
                        <table id="Table2" border="1" bordercolor="#e2d3bb" style="border-collapse: collapse"
                            width="95%">
                            <tr>
                                <td align="right" bgcolor="#e2d3bb" dir="rtl" valign="top">
                                    &nbsp;فاکتور نهایی</td>
                            </tr>
                            <tr>
                                <td align="right" bordercolor="#e2d3bb" dir="rtl" valign="top">
                                <asp:Label ID="lbl_message" runat="server" Font-Bold="True" Font-Names="tahoma" Font-Size="10pt"
                                    ForeColor="#990000"></asp:Label>
                    <asp:DataGrid ID="GRD_Final_Shop" runat="server" AutoGenerateColumns="False" BorderColor="Black"
                        BorderStyle="Dotted" Font-Names="Tahoma" Font-Size="X-Small" Width="100%">
                        <EditItemStyle Font-Names="Tahoma" Font-Size="X-Small" />
                        <AlternatingItemStyle CssClass="mycell" BackColor="PapayaWhip" />
						<ItemStyle CssClass="mycellbg" />
                        <HeaderStyle BorderColor="Black" CssClass="marqcell" />
                        <Columns>
                            <asp:HyperLinkColumn DataNavigateUrlField="pid" DataNavigateUrlFormatString="~\ProductDetail.aspx?Id={0}"
                                DataTextField="Product_Namme" HeaderText="نام محصول"></asp:HyperLinkColumn>
                            <asp:BoundColumn DataField="Order_No" HeaderText="تعداد"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Product_Price" HeaderText="قیمت واحد" ReadOnly="True"></asp:BoundColumn>
                            <asp:BoundColumn DataField="Total_Price" HeaderText="قیمت کل" ReadOnly="True"></asp:BoundColumn>
                        </Columns>
                    </asp:DataGrid>
                    <table id="Table8" border="0" style="border-collapse: collapse" width="95%" align="center">
                        <tr class="mycellbg">
                            <td width="20%" style="text-align: left; height: 41px;" valign="middle">
                              قيمت کل :&nbsp;
                           </td>
                            <td style="width: 402px; text-align: right; height: 41px;">
                               <asp:Label ID="lbl_Total_Price" runat="server" Font-Bold="True"></asp:Label>
                                <asp:Literal ID="direc_Page0101" runat="server" Text="<%$ Resources:Resource, MonyUnit %>"></asp:Literal></td>
                        </tr>
                        <tr class="mycellbg">
                            <td width="20%" style="text-align: left; height: 41px;" valign="middle" 
                                align="left">
                                فاسنی دریافتی : </td>
                            <td style="width: 402px; text-align: right; height: 41px;">
                               <asp:Label ID="lbl_Total_Phancy" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                        </tr>
                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <div style="text-align: center">
                    </div>
                    <div align="center">
                    	<table border="1" width="95%" id="table1" style="border-collapse: collapse" bordercolor="#E2D3BB">
                            <tr>
                                <td align="right" bgcolor="#e2d3bb" dir="rtl" valign="top">
                                    &nbsp; انتخاب
                وضعیت پرداخت</td>
                            </tr>
                            <tr>
                                <td align="right" bordercolor="#e2d3bb" dir="rtl" valign="top">
                                    &nbsp;<table dir='<asp:Literal Text="<%$ Resources:Resource, dir%>" ID="dir001" runat="server" />' width="100%" class="mycellbg">
									<tr>
										<td style="text-align: right;" width="120px">
										&nbsp;</td>
										<td align='<asp:Literal Text="<%$ Resources:Resource, align%>" ID="align001" runat="server" />' style="text-align: right; height: 20px;">
										&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align: right;" width="120px" align='<asp:Literal Text="<%$ Resources:Resource, align%>" ID="align003" runat="server" />'>
										<asp:RadioButton ID="RadioButton1" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            GroupName="Payment_Choice" Text="پرداخت آنلاین" Enabled="False" />
                            
										</td>
										<td align='<asp:Literal Text="<%$ Resources:Resource, align%>" ID="align002" runat="server" />' style="text-align: right">
                                            انتخاب بانک برای پرداخت :
                                            <asp:DropDownList ID="DropDownList_Ebank" runat="server" AppendDataBoundItems="True" Font-Names="Tahoma" Font-Size="X-Small" Enabled="False">
                                                <asp:ListItem Value="-1">----انتخاب کنید----</asp:ListItem>
                                            </asp:DropDownList></td>
									</tr>
									<tr>
										<td style="text-align: right" width="120px" align='<asp:Literal Text="<%$ Resources:Resource, align%>" ID="align004" runat="server" />'>
										<asp:RadioButton ID="RadioButton2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            GroupName="Payment_Choice" Text="پرداخت فیش" />
										</td>
										<td align="right">
                                            مشخصات فیش پرداختی :
                                   
									<asp:TextBox ID="Txt_Fishnumber" runat="server" Font-Names="Tahoma" Font-Size="X-Small" Width="215px"></asp:TextBox></td>
									</tr>
									<tr>
										<td style="text-align: right" width="120px"><asp:RadioButton ID="RadioButton3" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                            GroupName="Payment_Choice" Text="سفارش آنلاین" /></td>
										<td style="text-align: right" align='<asp:Literal Text="<%$ Resources:Resource, align%>" ID="align005" runat="server" />'>
                                   
									</td>
									</tr>
									<tr>
										<td colspan="2" style="text-align: right">
                        &nbsp;</td>
									</tr>
									<tr>
										<td width="120px" ></td>
										<td style="text-align: right">
                        <asp:Button ID="Button_NextLevel0" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_NextLevel_Click" Text="  اتمام فرآیند فروش " /></td>
									</tr>
									<tr>
										<td width="120px" >&nbsp;</td>
										<td style="text-align: right; height: 20px;">
                        &nbsp;</td>
									</tr>
								</table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
                        </td>
                    </tr>
                    <tr>
                        <td height="2">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

 