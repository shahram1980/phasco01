<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master"AutoEventWireup="true" CodeBehind="MssManager.aspx.cs" Inherits="phasco_webproject.Cpanel.MssManager" %>
<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<script type="text/javascript">
var floattext=new Array()
floattext[0]='- <a href="http://www.javascriptkit.com/cutpastejava.shtml">Free JavaScripts</a><br>- <a href="http://www.javascriptkit.com/javaindex.shtml">JavaScript Tutorials</a><br>- <a href="http://www.javascriptkit.com/dhtmltutors/index.shtml">DHTML/ CSS Tutorials</a><br>- <a href="http://www.javascriptkit.com/jsref/">JavaScript Reference</a><br><div align="right"><a href="javascript:hidefloatie()">Hide Box</a></div>'
floattext[1]='Some other floatie text'

var floatiewidth="250px" //default width of floatie in px
var floatieheight="60px" //default height of floatie in px. Set to "" to let floatie content dictate height.
var floatiebgcolor="#6bc1f0" //default bgcolor of floatie
var fadespeed=70 //speed of fade (5 or above). Smaller=faster.

var baseopacity=0
function slowhigh(which2){
imgobj=which2
browserdetect=which2.filters? "ie" : typeof which2.style.MozOpacity=="string"? "mozilla" : ""
instantset(baseopacity)
highlighting=setInterval("gradualfade(imgobj)",fadespeed)
}

function instantset(degree){
cleartimer()
if (browserdetect=="mozilla")
imgobj.style.MozOpacity=degree/100
else if (browserdetect=="ie")
imgobj.filters.alpha.opacity=degree
}

function cleartimer(){
if (window.highlighting) clearInterval(highlighting)
}

function gradualfade(cur2){
if (browserdetect=="mozilla" && cur2.style.MozOpacity<1)
cur2.style.MozOpacity=Math.min(parseFloat(cur2.style.MozOpacity)+0.1, 0.99)
else if (browserdetect=="ie" && cur2.filters.alpha.opacity<100)
cur2.filters.alpha.opacity+=10
else if (window.highlighting)
clearInterval(highlighting)
}

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function paramexists(what){
return(typeof what!="undefined" && what!="")
}

function showfloatie(thetext, e, optbgColor, optWidth, optHeight){
var dsocx=(window.pageXOffset)? pageXOffset: ietruebody().scrollLeft;
var dsocy=(window.pageYOffset)? pageYOffset : ietruebody().scrollTop;
var floatobj=document.getElementById("dhtmlfloatie")
floatobj.style.left="-900px"
floatobj.style.display="block"
floatobj.style.backgroundColor=paramexists(optbgColor)? optbgColor : floatiebgcolor
floatobj.style.width=paramexists(optWidth)? optWidth+"px" : floatiewidth
floatobj.style.height=paramexists(optHeight)? optHeight+"px" : floatieheight!=""? floatieheight : ""
floatobj.innerHTML=thetext
var floatWidth=floatobj.offsetWidth>0? floatobj.offsetWidth : floatobj.style.width
var floatHeight=floatobj.offsetHeight>0? floatobj.offsetHeight : floatobj.style.width
var winWidth=document.all&&!window.opera? ietruebody().clientWidth : window.innerWidth-20
var winHeight=document.all&&!window.opera? ietruebody().clientHeight : window.innerHeight
e=window.event? window.event : e
floatobj.style.left=dsocx+winWidth-floatWidth-5+"px"
if (e.clientX>winWidth-floatWidth && e.clientY+20>winHeight-floatHeight)
floatobj.style.top=dsocy+5+"px"
else
floatobj.style.top=dsocy+winHeight-floatHeight-5+"px"
slowhigh(floatobj)
}

function hidefloatie(){
var floatobj=document.getElementById("dhtmlfloatie")
floatobj.style.display="none"
}

</script>
<script language="C#" runat="server">
    public string Active_Mode(int Mode)
    {
        if (Mode == 1) return "<font size=1 color=#0000FF>فعال</font>";
        if (Mode == 0) return "<font size=1 color=#FF0000>غير فعال</font>";
        return "نامشخص";
    }
</script>
 
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
    <tr>
        <td align="right" style="width: 100%">
            <div style="text-align: right">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 50%">
                    <tr>
                        <td align="right" style="width: 81%; height: 15px">
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">ارسال برای همه</asp:LinkButton></td>
                        <td style="width: 30%;">
                            :::</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 81%">
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">ارسال دستی</asp:LinkButton></td>
                        <td style="width: 30%">
                            :::</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 81%">
                            </td>
                        <td style="width: 30%">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 81%">
                            &nbsp;<asp:Label ID="Label_Alarm" runat="server"></asp:Label></td>
                        <td style="width: 30%">
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
    <tr>
        <td align="right" style="width: 100%">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <table dir="rtl" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="right" style="width: 100%; height: 50px">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 100%">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 10%" valign="top">
                                            جستجو :</td>
                                        <td align="right" style="width: 20%" valign="top">
                                            <asp:TextBox ID="TextBox_Search" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                Width="168px"></asp:TextBox></td>
                                        <td align="right" style="width: 60%" valign="top">
                                            <asp:RadioButtonList ID="RadioButtonList_Search_Mode" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0" Selected="True">نمايش کل کاربران</asp:ListItem>
                                                <asp:ListItem Value="1">نام کاربری</asp:ListItem>
                                                <asp:ListItem Value="2">کد کاربری</asp:ListItem>
                                                <asp:ListItem Value="3">ايميل</asp:ListItem>
                                            </asp:RadioButtonList></td>
                                        <td align="right" colspan="2" style="width: 10%" valign="top">
                                            <asp:Button ID="Button_Search" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                OnClick="Button_Search_Click" Text="پيدا کن" />
                                            <asp:Button ID="Button_Select_User" runat="server" OnClick="Button_Select_User_Click"
                                                Text="ارسال پیام" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 100%">
                                &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="left" colspan="2" dir="rtl" valign="top">
                                            <asp:GridView ID="Grid_Users" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="Grid_Users_PageIndexChanging"
                                                PageSize="50" Width="100%">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <input id="chkBxMail" runat="server" type="checkbox" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="id" HeaderText="کد کاربری" />
                                                    <asp:BoundField DataField="Uid" HeaderText="نام کاربری" />
                                                    <asp:BoundField DataField="Email" HeaderText="ایمیل" />
                                                    <asp:TemplateField HeaderText="وضعيت">
                                                        <ItemTemplate>
                                                            <%# Active_Mode(Convert.ToInt32(Eval("UserActive").ToString()))%>
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
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 50%" valign="top">
                                            </td>
                                        <td align="right" style="width: 50%" valign="top">
                                            <asp:HiddenField ID="HiddenField_Mode_Search" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 100%">
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
                        <tr>
                            <td align="left" colspan="2" dir="rtl" style="height: 50px" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" style="width: 10%; height: 19px" valign="top">
                                ارسال به :</td>
                            <td align="right" dir="rtl" style="width: 90%; height: 19px">
                              
                                
<div id="dhtmlfloatie" ></div>
                                &nbsp;<a  id="User_Count_List"   runat="server"><asp:Label ID="LBL_User_Reciver" runat="server"></asp:Label>
</a> 

                                
                                
                                </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" style="width: 10%; height: 19px" valign="top">
                                عنوان پیام :</td>
                            <td align="right" dir="rtl" style="width: 90%; height: 19px">
                                &nbsp;<asp:TextBox ID="TextBox_Title" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                    Width="452px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" style="width: 10%" valign="top">
                                متن پيام :</td>
                            <td align="right" dir="rtl" style="width: 90%">
                                <rade:radeditor id="RadEditor_Text" runat="server" uploadflashpaths="~/upf/EditorFiles"
                                    uploadimagespaths="~/upf/EditorFiles">&nbsp;</rade:radeditor>&nbsp; &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" style="width: 10%" valign="top">
                                پيوست :</td>
                            <td align="right" dir="ltr" style="width: 90%">
                                <asp:FileUpload ID="FileUpload_Attach" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" style="width: 10%">
                            </td>
                            <td align="right" dir="rtl" style="width: 90%">
                                <asp:Button ID="Button_Send_Message" runat="server" Text="ارسال شود" Font-Names="Tahoma" Font-Size="X-Small" OnClick="Button_Send_Message_Click" />
                                <asp:Button ID="Button_Send_To_all" runat="server" Text="ارسال به همه" Font-Names="Tahoma" Font-Size="X-Small" OnClick="Button_Send_To_all_Click" /></td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView></td>
    </tr>
    <tr>
        <td align="right" style="width: 100%">
        </td>
    </tr>
</table>
</asp:Content>
 