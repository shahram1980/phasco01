<%@ Page Language="C#" MasterPageFile="~/Template/MAin.Master"  AutoEventWireup="true" CodeBehind="S_p.aspx.cs" Inherits="PHASCO_Shopping.S_p" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="C#" runat="server">
 
        public string Set_Image(int image, string image_Name)
        {
            if (image == 1) return "MyPHASCO_Shopping/Pupload/sm_" + image_Name;
            else if (image == 0) return "MyPHASCO_Shopping/Pupload/None/NONE.jpg";
            return "MyPHASCO_Shopping/Pupload/None/NONE.jpg";
        }
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
    <div class="direction">
        <asp:Repeater ID="Repeater_Product"  runat="server">
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
</asp:Repeater>
    </div>
</asp:Content>