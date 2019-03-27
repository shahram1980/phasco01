<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Article.ascx.cs" Inherits="phasco_webproject.UI.Article" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
</style>
 
<script language="C#" runat="server">
 
    public string Mss_Date( string date)
    {
        DateTime dtm = new DateTime();
        dtm = Convert.ToDateTime(date);
        Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
     
            return  sunDate.Weekday.ToString()  ;
    }
    public string Set_Image(int image)
    {
        if (image == 1) return "phascoupfile\\Userphoto\\" + image + ".jpg";
        else if (image==0) return "phascoupfile\\Userphoto\\Nopic.jpg";

        return "phascoupfile\\Userphoto\\Nopic.jpg";
    }

    public bool ISCurrent(string value)
    {
        try
        {
    if (value == ViewState["drpPagingIndex"].ToString()) return true;
        else return false;
        }
        catch (Exception)
        {
            if (value == "0") return true;
            else return false;
        }
    
  return false;
    }
    </script>
 
<asp:MultiView ID="MultiView1" runat="server">



<asp:View ID="View0" runat="server">
 
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td style="width: 100%">
                <div>
        <table cellpadding="0" cellspacing="0" width="100%" align="center">
        <tr>
                <td style="width: 48%; direction: rtl" valign="top" align="right">
                   <img src="../images/arrow4.gif" />&nbsp;جدیدترین مقالات
                </td>
                <td style="width: 10px">
                </td>
                <td style="width: 48%; direction: rtl" align="right" valign="top">
                    <img src="../images/arrow4.gif" />&nbsp;پربیننده ترین مقالات
                </td>
            </tr>
         <tr>
                <td style="width: 48%; direction: rtl;background-image: url(../images/line.gif); height: 20px" valign="top" align="right">
                </td>
                <td style="width: 10px">
                </td>
                <td style="width: 48%; direction: rtl;background-image: url(../images/line.gif); height: 20px" align="right" valign="top">
                </td>
            </tr>
            <tr>
                <td style="width: 48%; direction: rtl" valign="top" align="right">
                    <asp:Repeater ID="RPT_Last" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <img src="../images/arrow3.gif" />
                                        <a href="../?page=Article&Detailsid=<%# DataBinder.Eval(Container.DataItem, "Id") %>" target=_parent>
                                            <%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                        </a>
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
                <td style="width: 10px">
                </td>
                <td style="width: 48%; direction: rtl" align="right" valign="top">
                    <asp:Repeater ID="RPT_Best" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <img src="../images/arrow3.gif" />
                                        <a title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" href="../?page=Article&Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>" target=_parent>
                                            <%#DataBinder.Eval(Container.DataItem, "SubJect")%>&nbsp;[مشاهده<%#DataBinder.Eval(Container.DataItem, "ClickNumber")%>بار]
                                        </a>
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
    </div>
                
                
                <asp:GridView ID="GridView_Top_User" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    HeaderStyle-BorderStyle="None" HeaderStyle-BorderWidth="0" HeaderStyle-Height="0"
                    ShowHeader="False">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <div align="right">
                                    <table id="table1" border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                                        <tr>
                                            <td>
                                                <img src="../images/arrow3.gif" /></td>
                                            <td>
                                                    
<SPAN class="tip" onmouseover="tooltip(&#39;<%#DataBinder.Eval(Container.DataItem, "Uid")%> &#39;);" onmouseout="exit();">
<A href="#">
<b> <%#DataBinder.Eval(Container.DataItem, "ArticleNo")%> </b> مقاله   <%#DataBinder.Eval(Container.DataItem, "Name")%> <%#DataBinder.Eval(Container.DataItem, "Famil")%>  [<%#DataBinder.Eval(Container.DataItem, "Uid")%>]
</A>
<SPAN id="<%#DataBinder.Eval(Container.DataItem, "Uid")%> "> 

<table border="0" width="350" cellspacing="1" style="border-collapse: collapse">
	<tr>
		<td width="250" valign="top">
		<table border="0" width="250" cellpadding="0" style="border-collapse: collapse">
 
			<tr>
				<td width="70%" valign="top" dir="rtl" align="right">
				&nbsp;<%#DataBinder.Eval(Container.DataItem, "Name")%> <%#DataBinder.Eval(Container.DataItem, "Famil")%> </td>
				<td width="30%" dir="rtl" align="left" valign="top">نام : </td>
			</tr>
			<tr>
				<td width="70%" valign="top" dir="rtl" align="right">
				&nbsp;<%#DataBinder.Eval(Container.DataItem, "Uid")%> </td>
				<td width="30%" dir="rtl" align="left" valign="top">نام کاربر&#1740; :
				</td>
			</tr>
			<tr>
				<td width="70%" valign="top" dir="rtl" align="right">
				&nbsp;<%# Mss_Date(Eval("RegisterDate").ToString())%></td>
				<td width="30%" dir="rtl" align="left" valign="top">عضو&#1740;ت : </td>
			</tr>
					<tr>
				<td width="70%" valign="top" dir="rtl" align="right">
				&nbsp;<%# Mss_Date(Eval("LastLoginDate").ToString())%></td>
				<td width="30%" dir="rtl" align="left" valign="top">آخرین مراجعه: </td>
			</tr>
			<tr>
				<td width="70%" valign="top" dir="rtl" align="right">
				&nbsp;<%#DataBinder.Eval(Container.DataItem, "Point")%></td>
				<td width="30%" dir="rtl" align="left" valign="top">امت&#1740;از :
				</td>
			</tr>
			<tr>
				<td width="70%" valign="top" dir="rtl" align="right">
			&nbsp;	<%#DataBinder.Eval(Container.DataItem, "ArticleNo")%></td>
				<td width="30%" dir="rtl" align="left" valign="top">مقالات :
				</td>
			</tr>
		</table>
		</td>
		<td width="100" valign="top">
		<img border="0" src='<%# Set_Image(int.Parse(Eval("Image").ToString()))%>'  ></td>
	</tr>
</table>


</SPAN></SPAN>.
 
 
                                                 </td>
                                            
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                            <ControlStyle BorderStyle="None" BorderWidth="0px" />
                            <FooterStyle BorderStyle="None" />
                            <HeaderStyle BorderStyle="None" BorderWidth="0px" Height="0px" />
                            <ItemStyle BorderStyle="None" BorderWidth="0px" HorizontalAlign="Right" VerticalAlign="Top" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BorderStyle="None" BorderWidth="0px" Height="0px" />
                </asp:GridView>
                
                
                </td>
        </tr>
        <tr>
            <td style="width: 100%">
                <asp:Repeater ID="RTP_RND" runat="server">
                    <ItemTemplate>
                        <table border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                            <tr>
                                <td width="2%">
                             <img src="../images/arrow3.gif" /></td>
                                <td width="98%">
                                    <a  href='../?page=Article&Detailsid=<%# DataBinder.Eval(Container.DataItem, "Id") %>'>
                                        <%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td style="width: 100%">
                v<asp:GridView ID="GRD_Slide" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                    HeaderStyle-BorderStyle="None" HeaderStyle-BorderWidth="0" HeaderStyle-Height="0"
                    ShowHeader="False">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ControlStyle BorderStyle="None" BorderWidth="0px" />
                            <ItemStyle BorderStyle="None" BorderWidth="0px" HorizontalAlign="Right" VerticalAlign="Top" />
                            <HeaderStyle BorderStyle="None" BorderWidth="0px" Height="0px" />
                            <ItemTemplate>
                                <div align="Right">
                                    <table id="table1" border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                                        <tr>
                                            <td>
                                               <img src="../images/arrow3.gif" /></td>
                                            <td>
                                                <a href='../?page=Article&slideid=<%#DataBinder.Eval(Container.DataItem, "Id")%>&Title=<%#DataBinder.Eval(Container.DataItem, "Title")%>'>
                                                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                                </a>
                                            </td>
                                            <td>
                                                (
                                                <%#DataBinder.Eval(Container.DataItem, "Visitcount")%>
                                                )</td>
                                        </tr>
                                    </table>
                                </div>
                            </ItemTemplate>
                            <FooterStyle BorderStyle="None" />
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BorderStyle="None" BorderWidth="0px" Height="0px" />
                </asp:GridView>

 
                <asp:Repeater ID="Repeater_New_Slides" runat="server">
                <ItemTemplate>

                
                </ItemTemplate>
                </asp:Repeater>


            </td>
        </tr>
    </table>
    </asp:View>
    <asp:View ID="View1" runat="server">
        <table align="right" cellpadding="0" cellspacing="0" dir="rtl" style="height: 20px">
            <tr>
                <td style="height: 19px">
                    &nbsp;
                    <asp:DropDownList ID="drpPaging" runat="server" AutoPostBack="true" Font-Names="Tahoma"
                        Font-Size="11px" OnSelectedIndexChanged="drpPaging_SelectedIndexChanged">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td>
                    <asp:Repeater ID="RPT_Article" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <img src="../images/arrow3.gif" />&nbsp;
                                        <%# Eval("SubJect")%>
                                        [ مشاهده
                                        <%# Eval("ClickNumber")%>
                                        بار ]
                                        &nbsp;
                                        <asp:LinkButton ID="lnk" runat="server" OnCommand="SetDetails" CommandName="ID" CommandArgument=<%# Eval("ID") %> Text="[ جزئیات ... ]">
	                                    </asp:LinkButton>                                        
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
            <tr>
                <td>

                    <asp:Repeater ID="Repeater_Article_List" runat="server">
                    <ItemTemplate>
                   <asp:LinkButton  ID="Linkbutton_Panging" runat="server" 
                   CommandArgument='<%#DataBinder.Eval(Container,"DataItem.value","{0}") %>'
                   OnCommand="Linkbutton_Panging_Command" Text='<%# Eval("item")%>' Font-Bold='<%# ISCurrent(Eval("value").ToString()) %>' />
                    
                    </ItemTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
    
    <table border="0" width="100%" id="table37" dir="ltr">
    <tr>
                                    <td colspan="3" style="background-image: url(../images/line.gif); height: 20px">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="height: 20px" align=right>
                                    <asp:LinkButton ID="Lb_Back" onclick="Lb_Back_Click" runat=server Text="[ بازگشت ]"></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="background-image: url(../images/line.gif); height: 20px">
                                    </td>
                                </tr>
								<tr>
									<td dir="rtl" align="right" valign="top" width="537">
									<font size="2">
									<asp:Label ID="SubJect" runat="server" CssClass="TXTClass"></asp:Label>
									</font>
									</td>
									<td width="5" dir="rtl" align="left" valign="top">
                                            :</td>
									<td width="143" dir="rtl" align="right" valign="top">
                                            <font size="2">عنوان</font></td>
								</tr>
        <tr>
            <td align="right" dir="rtl" valign="top" width="537">
                <asp:Label ID="LBL_UserSender" runat="server" CssClass="TXTClass"></asp:Label></td>
            <td align="left" dir="rtl" valign="top" width="5">
                :</td>
            <td align="right" dir="rtl" valign="top" width="143">
                ارسال کننده</td>
        </tr>
								<tr>
									<td dir="rtl" align="right" valign="top" width="537">
									<font size="2">
									<asp:Label ID="Writer" runat="server" CssClass="TXTClass"></asp:Label>
									</font>
									</td>
									<td width="5" dir="rtl" align="left" valign="top">
                                            :</td>
									<td width="143" dir="rtl" align="right" valign="top">
                                            <font size="2">نویسنده / نويسندگان</font></td>
								</tr>
								<tr>
									<td dir="rtl" align="right" valign="top" width="537">
									<font size="2"><asp:Label ID="Translator" runat="server" CssClass="TXTClass"></asp:Label>
									</font>
									</td>
									<td width="5" dir="rtl" align="left" valign="top">
                                            :</td>
									<td width="143" dir="rtl" align="right" valign="top">
                                            <font size="2">مترجم</font></td>
								</tr>
								<tr>
									<td dir="rtl" align="right" valign="top" width="537">
                                        <font size="2">
                                        <asp:Label ID="keyWork" runat="server" CssClass="TXTClass"></asp:Label>
										</font>
									</td>
									<td width="5" dir="rtl" align="left" valign="top">
                                            :</td>
									<td width="143" dir="rtl" align="right" valign="top">
                                            <font size="2">کلید واژه</font></td>
								</tr>
								<tr>
									<td dir="rtl" align="right" valign="top" width="537">
                                        <font size="2">
                                        <asp:Label ID="ShortText" runat="server"></asp:Label>
										</font>
									</td>
									<td width="5" dir="rtl" align="left" valign="top">
                                            :</td>
									<td width="143" dir="rtl" align="right" valign="top">
                                            <font size="2">چکیده</font></td>
								</tr>
								<tr>
									<td dir="rtl" align="right" valign="top" width="537">
                                        <font size="2">
                                        <asp:Label ID="Ref" runat="server"></asp:Label>
										</font>
									</td>
									<td width="5" dir="rtl" align="left" valign="top">
                                            :</td>
									<td width="143" dir="rtl" align="right" valign="top">
                                            <font size="2">
                                                منابع</font></td>
								</tr>
								<tr>
                                    <td colspan="3" style="background-image: url(../images/line.gif); height: 20px">
                                    </td>
                                </tr>
								<tr>
									<td dir="rtl" align="right" width="689" colspan="3" style="width: 100%;text-align:justify">
                                        <font size="2">
                                        <asp:Label ID="Text" Width="100%" runat="server"></asp:Label>
										</font>
									</td>
								</tr>
								<tr>
                                    <td colspan="3" style="background-image: url(../images/line.gif); height: 20px">
                                    </td>
                                </tr>
        <tr>
            <td colspan="3" style="background-image: url(../images/line.gif); height: 20px">
            </td>
        </tr>
							</table>
    </asp:View>
    <asp:View ID="View3" runat="server">
        <br />
        خطا در خواندن اطلاعات
        <br />
    </asp:View>
    <asp:View ID="View4" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td align="right" style="width: 100%">
                    <asp:LinkButton ID="LinkButton_Back" runat="server" OnClick="LinkButton_Back_Click">برگشت</asp:LinkButton></td>
            </tr>
            <tr>
                <td style="width: 100%">
                    <asp:DataList ID="DataList_Slid" runat="server" RepeatColumns="6">
                        <ItemTemplate>
                            <table border="1" bordercolor="#fba800" cellpadding="0" cellspacing="0" onmouseout="this.style.backgroundColor='#f1f1f1';"
                                onmouseover="this.style.backgroundColor='#d0d1d2';" style="border-collapse: collapse;
                                height: 100%">
                                <tr>
                                    <td align="center" style="width: 100%; height: 14px" valign="top">
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 60px; height: 100%">
                                            <tr>
                                                <td style="width: 100%">
                                                    <a href="javascript:open_new_window('ViewSlide.aspx?Id=<%#DataBinder.Eval(Container.DataItem, "id")%>')">
                                                        <img src='phascoupfile/Slides/s_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg' />
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100%" valign="bottom">
                                                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>


