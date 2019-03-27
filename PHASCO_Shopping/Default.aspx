<%@ Page Language="C#" MasterPageFile="~/Template/MAin.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="PHASCO_Shopping._Default" %>

<%@ Register src="UC/ProductOffer.ascx" tagname="ProductOffer" tagprefix="uc1" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="TooTipSub/supernote.js"></script>
    <script type="text/javascript" src="java/NewsTitle.js"></script>
    <link rel="stylesheet" type="text/css" href="TooTipSub/supernote.css">
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Tooltip script -->
    <script type="text/javascript">
        var supernote = new SuperNote('supernote', {});
        function animFade(ref, counter) {
            var f = ref.filters, done = (counter == 0.0009);
            if (f) {
                if (!done && ref.style.filter.indexOf("alpha") == -1)
                    ref.style.filter += ' alpha(opacity=' + (counter * 100) + ')';
                else if (f.length && f.alpha) with (f.alpha) {
                    if (done) enabled = false;
                    else { opacity = (counter * 100); enabled = true }
                }
            }
            else ref.style.opacity = ref.style.MozOpacity = counter * 0.999;
        };
        supernote.animations[supernote.animations.length] = animFade;

        addEvent(document, 'click', function (evt) {
            var elm = evt.target || evt.srcElement, closeBtn, note;

            while (elm) {
                if ((/note-close/).test(elm.className)) closeBtn = elm;
                if ((/snb-pinned/).test(elm.className)) { note = elm; break }
                elm = elm.parentNode;
            }

            if (closeBtn && note) {
                var noteData = note.id.match(/([a-z_\-0-9]+)-note-([a-z_\-0-9]+)/i);
                for (var i = 0; i < SuperNote.instances.length; i++)
                    if (SuperNote.instances[i].myName == noteData[1]) {
                        setTimeout('SuperNote.instances[' + i + '].setVis("' + noteData[2] +
     '", false, true)', 100);
                        cancelEvent(evt);
                    }
            }
        });

        addEvent(supernote, 'show', function (noteID) {

        });
        addEvent(supernote, 'hide', function (noteID) {

        });

    </script>
    <script language="C#" runat="server">
        public string image_view(int Mode, string imagename)
        {
            if (Mode == 1) return "<img src='MyPHASCO_Shopping/Pupload/sm_" + imagename + "' width='60'  height='52'/>";
            if (Mode == 0) return "<img src='MyPHASCO_Shopping/Pupload/none.jpg' width='60' height='52'/>";
            return "";
        }


        public string Set_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);

            if (Page.Culture.ToString() == "English (United States)")
                return dtm.ToString();
            if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
            {
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
                return sunDate.Weekday.ToString() + "&nbsp;&nbsp;[" + dtm.Hour + ":" + dtm.Minute + "]";
            }

            return dtm.ToString();
        }
    </script>
    <table style="width: 100%">
        <tr>
            <td>
                <table style="width: 1000px; margin: 0px auto">
                    <tr>
                        <td class="last-news">
                            <table style="width: 100%">
                                <tr>
                                    <td class="center-align">
                                        <img alt="" src="images/last.png" width="56" height="9" />
                                    </td>
                                    <td class="last-news-center">
                                        <marquee behavior="slide" direction="right" scrollamount="4" scrolldelay="89"> 
                                                                <asp:Repeater ID="Repeater_Top_News" runat="server">
                                                                    <ItemTemplate>
                                                                      <a class="more" href="News/?id=<%# Eval("id")%>">
                                                                            <%# Eval("Title")%>
                                                                        </a>&nbsp;&nbsp;&nbsp;&nbsp;::&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    </ItemTemplate>
                                                                </asp:Repeater></marquee>
                                    </td>
                                    <td>
                                        <img alt="" src="images/LIN-LOGO.png" width="29" height="20" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <center>
                                <div style="height: 100px; width: 862px; background: red;">
                                    <img alt="" class="style1" src="Adver_obj/1.jpg" /></div>
                            </center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="cat-main">
                                <!-- Tooltip script -->
                                <%  if (Page.Culture.ToString() == "English (United States)")
                                    {
                                %>
                                <!--#include file="Cat_Menu_Txt/ConHomeEN.txt"-->
                                <%
                                    }
                                    if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
                                    {
                                %>
                                <!--#include file="Cat_Menu_Txt/ConHomeFA.txt"-->
                                <%} %>
                                <%
                                    
                                    if (Page.Culture.ToString() == "Chinese (People's Republic of China)")
                                    {
                                %>
                                <!--#include file="Cat_Menu_Txt/ConHomeCH.txt"-->
                                <%} %>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    
    <br /><br /><br />
    
    
     <uc1:ProductOffer ID="ProductOffer1" 
        runat="server" />
     
    <table style="width: 100%">
        <tr>
            <td>
                <table style="width: 870px; margin: 8px auto">
                    <tr>
                        <td style="width: 50%; vertical-align: top;">
                            <table class="Home_Page_Box">
                                <tr>
                                    <td class="Home_Page_Box_Title">
                                        <asp:Literal ID="LiteralLast_company_Products00021" Text="<%$ Resources:Resource, Last_company_Products %>"
                                            runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="width: 90%">
                                            <marquee direction="up" height="250" scrollamount="2" scrolldelay="80">    
<asp:Repeater ID="Repeater_Featured_Product"  runat="server">
<ItemTemplate>
<table border="0" id="table1" style="border-collapse: collapse">
<tr>
<td width="20%" style="padding-right: 1px; padding-left: 3px;">
<%# image_view(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%>
</td>
<td width="80%">
<a href='C-p/Productdetails.aspx?pid=<%#Eval("id")%>&uid=<%#Eval("uid_id")%>' title='<%#Eval("Produc_Name")%>'>  
<DIV style="white-space: pre-wrap;white-space: -moz-pre-wrap !important;  white-space: -pre-wrap; white-space: -o-pre-wrap; word-wrap: break-word; border: 1px ;width: 160px;padding: 1px;line-break: strict;   color : #3a66cc; padding-right: 5px; padding-left: 5px;">
<%# Eval("Produc_Name")%>
</DIV>

<div style="color:#b5b4b4">
<asp:Literal ID="LiteralDate_send103291" Text="<%$ Resources:Resource, Date_send %>" runat="server" /> : 
<%# Set_Date(Eval("Send_Date").ToString())%>
<BR />
<asp:Literal ID="LiteralCompany0255" Text="<%$ Resources:Resource, Company %>" runat="server" /> : 

<%# Eval("Company_Name")%>

</div>
</a>
</td>
</tr>
</table>
<div style="background: #EFF6F8 url( 'images/dotted_product.gif' ) repeat-x scroll center top;
height: 3px; width: 100%">
</div>
</ItemTemplate>
</asp:Repeater></marquee>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 50%; vertical-align: top;">
                            <table class="Home_Page_Box">
                                <tr>
                                    <td class="Home_Page_Box_Title">
                                        <asp:Literal ID="LiteralLast_company_News03291" Text="<%$ Resources:Resource, Last_company_News %>"
                                            runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="direction_Align" style="padding: 5px;">
                                        <marquee direction="up" height="250" scrollamount="2" scrolldelay="1">
<asp:Repeater ID="Repeater_LastNews" runat="server" EnableViewState="False">
<ItemTemplate>


:: <a href="c-p/News.aspx?uid=<%# Eval("uid") %>&id=<%# Eval("id") %>" title="<%# Eval("Title")%>">
<%# Eval("Title")%>
</a>
<div style="color:#b5b4b4">
<asp:Literal ID="LiteralDate_send103291" Text="<%$ Resources:Resource, Date_send %>" runat="server" /> : 
<%# Set_Date(Eval("datesend").ToString())%>

</div>
<br /> 
</ItemTemplate>
</asp:Repeater></marquee>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>
                <table style="width: 870px; margin: 0px auto">
                    <tr>
                        <td class="sp-right">
                        </td>
                        <td class="sp-center">
                            <div style="float: left">
                                <img src="ADV/1.jpg" />
                            </div>
                            <div class="liner">
                            </div>
                            <div style="float: left">
                                <img src="ADV/2.jpg" /></div>
                            <div class="liner">
                            </div>
                            <div style="float: left">
                                <img src="ADV/3.jpg" /></div>
                            <div class="liner">
                            </div>
                            <div style="float: left">
                                <img src="ADV/4.jpg" /></div>
                            <div class="liner">
                            </div>
                        </td>
                        <td class="sp-left">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
