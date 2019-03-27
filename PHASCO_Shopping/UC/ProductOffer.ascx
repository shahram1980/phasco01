<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductOffer.ascx.cs" Inherits="PHASCO_Shopping.UC.ProductOffer" %>
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
        <asp:Panel runat="server" ID="Panel_Offer">
        <div style="float:right;margin-right:250px;">
        <table border="0" width="860px" dir="rtl" cellspacing="0" cellpadding="0">
	<tr>
		<td width="60">
		<img border="0" src="images/Phasco_Offer.jpg" width="60" height="61"></td>
		<td background="images/Phasco_Offer_Bg.gif">&nbsp;</td>
	</tr>
</table>
</div>
<div style="border:1px solid #85becf;width:838px;margin-right:270px;padding-top:5px;float:right">
<asp:DataList ID="DataList_Offer" runat="server" RepeatColumns="4">
    <ItemTemplate>
  <table border="0" width="105" style="margin:0px 3px 0px 3px;" dir='<asp:Literal ID="Literal0ww023" runat="server" Text="<%$ Resources:Resource, dir %>" />'>
	<tr>
		<td style="text-align:center;vertical-align:top;"><%# image_view(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%></td>
	</tr>
	<tr>
		<td style="text-align:center;vertical-align:top;">
        <a href='C-p/Productdetails.aspx?pid=<%#Eval("id")%>&uid=<%#Eval("uid_id")%>' title='<%#Eval("Produc_Name")%>'>  
<DIV style="white-space: pre-wrap;white-space: -moz-pre-wrap !important;  white-space: -pre-wrap; white-space: -o-pre-wrap; word-wrap: break-word; border: 1px ;width: 160px;padding: 1px;line-break: strict;   color : #3a66cc; padding-right: 5px; padding-left: 5px;">
<%# Eval("Produc_Name")%>
</DIV>

<div style="color:#b5b4b4">
<asp:Literal ID="LiteralSpecialty_of_Product103291" Text="<%$ Resources:Resource, Specialty_of_Product %>" runat="server" /> : 
<%# Eval("Specialty_Product")%>
 </div>
 <br />

 <div style="color:#F0F0F0">
<asp:Literal ID="Literal1" Text="<%$ Resources:Resource, Product_Keywords %>" runat="server" /> : 
<%# Eval("Product_Keywords")%>
 </div>
</a>
        </td>
	</tr>
</table>
    </ItemTemplate>
</asp:DataList>
</div>
</asp:Panel>
