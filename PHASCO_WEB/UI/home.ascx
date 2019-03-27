<%@ Control Language="C#" AutoEventWireup="true" Codebehind="home.ascx.cs" Inherits="phasco.UI.home" %>
 
<%@ Register Src="Shopcart.ascx" TagName="Shopcart" TagPrefix="uc2" %>
<%@ Register Src="Product_Subjects.ascx" TagName="Product_Subjects" TagPrefix="uc1" %>

<script language="C#" runat="server">
    public string image_Check(string Valid_Image, int id_, string Image_Mode, int AutoId)
    {
        string ret_ = "";
        string name_Fiel = Convert.ToString(id_) + Convert.ToString((id_ * 4));
        string Get_Id = Convert.ToString(Request.QueryString["id"]);
        if (Valid_Image == "yes")
        {
            ret_ = "<a href='Default.aspx?Page=ProductDetail&id=" + Convert.ToString(AutoId) + "'><img border='0' src='phascoupfile/Product_Images/" + name_Fiel + Image_Mode + "' width='120'></a>";
        }
        else if (Valid_Image == "no")
        {
            ret_ = "<a href='Default.aspx?Page=ProductDetail&id=" + Convert.ToString(AutoId) + "'><img border='0' src='phascoupfile/Product_Images/NOpic/NoPic.jpg' ></a>";
        }
        return ret_;
    }

    public string SingIn_Check(int id_)
    {
        String ret_ = "";
        //if (Session["Uid_Name"] != null)
        ret_ = "<a href='addtocard.aspx?Pid=" + Convert.ToString(id_) + "'>" + Resources.Resource.addtocart + "</a>";
        return ret_;
    }
</script>
<!--

<div class="flash-photo">

    <script language="javascript" type="text/javascript" src="js/adurl.js"></script>

    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0"
        width="480" height="220">
        <param name="movie" value="flashad.swf" />
        <param name="quality" value="High" />
        <param name="wmode" value="transparent" />
        <embed src="flashad.swf" quality="High" pluginspage="http://www.macromedia.com/go/getflashplayer"
            type="application/x-shockwave-flash" width="480" height="220" wmode="transparent">
						</embed>
    </object>
</div>
<div class="mini-text">
    دانشگاه علم و صنعت ایران در سال <a href="http://fa.wikipedia.org/w/index.php?title=%DB%B1%DB%B3%DB%B0%DB%B8&amp;action=edit">
        ۱۳۰۸</a> هجری شمسی با نام هنر سرای عالی در خیابان 30 تیر محل مدرسه ایران و آلمان
    کار خود را به عنوان اولین مرکز آموزشی عالی در ایران آغاز کرد. سپس به <a href="http://fa.wikipedia.org/w/index.php?title=%DA%86%D9%87%D8%A7%D8%B1_%D8%B1%D8%A7%D9%87_%DA%A9%D8%A7%D9%84%D8%AC&amp;action=edit">
        چهار راه کالج</a> محل کنونی <a href="http://fa.wikipedia.org/wiki/دانشگاه_صنعتی_امیرکبیر">
            دانشگاه صنعتی امیرکبیر</a> انتقال یافت و بZه عنوان هنرسرای عالی فنی فعالیت
    آموزشی خود را پی گرفت و بالاخره در سال ۱۳۴۲ به محل کنونی آن واقع در نارمک منتقل
    شد. این موسسه، در سال ۱۳۵۷با دارا بودن سه دانشکده علوم فنی و مهندسی و هنر و معماری،
    از سوی وزارت فرهنگ و آموزش عالی رسما به دانشگاه علم و صنعت ایران تبدیل شد.
</div>
<div class="product">
    <div class="product-header">
        &nbsp; لینک های سایت<img alt="" src="images/bul.jpg" width="7" height="7" style="padding-left: 20px" /></div>
    <div class="product-content">
        <ul style="direction: rtl; margin-top: 0px">
            <li style="list-style-image: url('images/icon.jpg');">&nbsp;&nbsp; لینک سایت</li>
            <li style="list-style-image: url('images/icon.jpg');">&nbsp;&nbsp; لینک سایت</li>
            <li style="list-style-image: url('images/icon.jpg');">&nbsp;&nbsp; لینک سایت</li>
            <li style="list-style-image: url('images/icon.jpg');">&nbsp;&nbsp; لینک سایت</li>
            <li style="list-style-image: url('images/icon.jpg');">&nbsp;&nbsp; لینک سایت</li>
            <li style="list-style-image: url('images/icon.jpg');">&nbsp;&nbsp; لینک سایت</li>
            <li style="list-style-image: url('images/icon.jpg');">&nbsp;&nbsp; لینک سایت</li>
        </ul>
    </div>
</div>
<div class="news">
    <div class="newa-header">
        <img alt="" src="images/news.jpg" width="233" height="23" /></div>
    <div class="newa-content">
        <asp:Repeater ID="News" runat="server">
            <ItemTemplate>
                <table border="0" width="100%" id="table3" style="border-collapse: collapse">
                    <tr>
                        <td width="17" align='<asp:Literal Text="<%$ Resources:Resource, align %>" ID="align301" runat="server" />'>
                            ::
                        </td>
                        <td align='<asp:Literal Text="<%$ Resources:Resource, align %>" ID="align302" runat="server" />'>
                            <a href="News.aspx?News_Id=<%#Eval("id") %>">
                                <%#Eval("Title") %>
                            </a>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<div class="flash-pro">
    <img alt="" src="images/plasma.jpg" width="190" height="125" /></div>
<img src="images/ads.jpg" style="padding-right: 10px" alt="" />
<asp:DataList ID="DataList_Products" runat="server" HorizontalAlign="Right" RepeatColumns="4"
    RepeatDirection="Horizontal" Width="95%">
    <ItemTemplate>
        <div align="center">
            <table onmouseout="this.style.backgroundColor='#FEF3DA';" onmouseover="this.style.backgroundColor='#FECE61';"
                cellpadding="0" border="1" cellspacing="0" style="width: 120px;height: 250px; border-collapse: collapse"
                bordercolor="#c0c0c0">
                <tr>
                    <td align="center" valign="top">
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="center" colspan="3" valign="top">
                                    <%# image_Check(Convert.ToString(Eval("Image_valid")), Convert.ToInt32(Eval("AutoId")), Convert.ToString(Eval("Image_Mode")), Convert.ToInt32(Eval("AutoId")))%>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3">
                                    <%# Eval("Title") %>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3">
                                    <asp:Literal ID="COde" runat="server" Text="<%$ Resources:Resource, Code %>"></asp:Literal>
                                    <%# DataBinder.Eval(Container.DataItem, "Autoid") %>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3" style="font-size: small; font-weight: bold; color: #333333;">
                                    <asp:Label ID="lbl_price" runat="server" Text='<%# string.Format("{0:N0}", Convert.ToInt32(DataBinder.Eval(Container.DataItem, "Price"))) %>'
                                        Width="120px">
                                    </asp:Label>
                                    <asp:Literal ID="direc_Page" runat="server" Text="<%$ Resources:Resource, MonyUnit %>">
                                    </asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3">
                                    [<a href='Default.aspx?Page=ProductDetail&id=<%# DataBinder.Eval(Container.DataItem, "AutoId") %>'>
                                        <asp:Literal ID="DetailsImage" runat="server" Text="<%$ Resources:Resource, DetailsImage %>" />
                                    </a>]<br />
                                    [<%# SingIn_Check(Convert.ToInt32(Eval("AutoId")))%>]
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3" height="15">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </ItemTemplate>
    <ItemStyle VerticalAlign="Top" />
</asp:DataList>-->

<!-- RAD Code -->
<table cellpadding=0 cellspacing=0 width=100%>
<tr><td>
<table style="float: right; margin: 10px">
					<tr>
						<td class="style9">
						<script type="text/javascript" language="javascript" src="js/adurl.js"></script>
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" height="220" style="width: 300px">
							<param name="movie" value="flashad.swf" />
							<param name="quality" value="High" />
							<param name="menu" value="false" />
							<param name="wmode" value="transparent" />
							<embed src="flashad.swf" quality="High" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" height="220" style="width: 300px" menu="false" wmode="transparent">
							
							
							
							
							
							</embed>
  						</object>
						</td>
						<td style="padding: 3px" valign="top" width="393px">
						<img alt="" src="images/about-phasco.jpg" width="393" height="30" />
						<br />
						<p style="text-align: justify; direction: rtl; line-height: 18px; padding: 0px 3px 0px 8px; font-size: 11px">
						در پنجم فروردین ماه سال 1380 باهدف تحقیق ، تولید و توزیع 
						کیتهای تشخیصی آزمایشگاهی با بهترین کیفیت تأسیس شد . در همین 
						راستا فعالیت گسترده ای را در زمینه همکاری انحصاری با تولید 
						کنندگان واقعی کیتهای تشخیص طبی در اروپا و امریکا شروع کرده 
						است و هم اکنون توانسته با ارائه بیش از یکصد نوع محصول ، 
						نیازمندیهای آزمایشگاههای تشخیص طبی صاحب نام کشور را تأمین 
						کرده و با دانش و تجربه حاصل گامهای نخست تولید را در دستور 
						کار خود قرار دهد . تمامی محصولات قابل ارائه این شرکت دارای 
						تأییدیه های بین المللی همچون FDA امریکا ، CE اروپا و آزمایشگاه 
						رفرانس ایران می باشند . </p>
						</td>
					</tr>
				</table>

</td></tr>
<tr><td>
<table style="width: 100%; float: right;">
					<tr>
						<td style="padding: 3px 6px 0px 1px">
						<div style="width: 722px; float: right;">
							<ul id="countrytabs" class="shadetabs">
								<li><a href="ExternalHome/External_Article.aspx" rel="#iframe">
								<img alt="" src="images/tazehaye-phasic.gif" width="116" height="24" /></a></li>
								<li><a href="external2.htm" rel="#iframe">
								<img alt="" src="images/nokat.gif" width="117" height="24" /></a></li>
								<li><a href="ExternalHome/External_News.aspx" rel="#iframe">
								<img alt="" src="images/moton.gif" width="117" height="24" />
								</a></li>
								<li><a href="ExternalHome/External_Directory.aspx" rel="#iframe">
								<img alt="" src="images/azmayeshgah.gif" width="117" height="24" /></a></li>
								
							</ul>
							<div id="countrydivcontainer" style="border: 1px solid #C8B68E; padding: 10px; background-color: #FCF0D5; margin: -5px 0px 0px 0px; height: 150px">
								<p>This is some default tab content, embedded directly 
								inside this space and not via Ajax. It can be shown 
								when no tabs are automatically selected, or associated 
								with a certain tab, in this case, the first tab.</p>
							</div>
							<script type="text/javascript">

var countries=new ddajaxtabs("countrytabs", "countrydivcontainer")
countries.setpersist(true)
countries.setselectedClassTarget("link") //"link" or "linkparent"
countries.init()

</script>
						</div>
						</td>
					</tr>					
				</table>
</td></tr>
</table>

