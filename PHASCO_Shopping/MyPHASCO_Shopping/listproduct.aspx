<%@ Page Language="C#"  MasterPageFile="~/Template/Office.Master" AutoEventWireup="true" CodeBehind="listproduct.aspx.cs" Inherits="PHASCO_Shopping.MyPHASCO_Shopping.listproduct1" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" type="text/css" href="../ajaxtabs/ajaxtabs.css" />
<script type="text/javascript" src="../ajaxtabs/ajaxtabs.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br />
<div dir='<asp:Literal ID="Literal540s1"   Text="<%$ Resources:Resource, dir %>" runat="server" />'>
<ul id="countrytabs" class="shadetabs">
<li><a href="Wait_Pro.aspx" rel="#iframe" class="selected">
<asp:Literal ID="Literal2"   Text="<%$ Resources:Resource, Checking %>" runat="server" />

 </a></li>
<li><a href="RejectedProduct.aspx" rel="countrycontainer"> 
<asp:Literal ID="Literal1"   Text="<%$ Resources:Resource, Rejected %>" runat="server" />
</a></li>
<li><a href="PasedProduct.aspx" rel="countrycontainer">
<asp:Literal ID="Literal3"   Text="<%$ Resources:Resource, Passed %>" runat="server" />
  </a></li>
</ul>

<div id="countrydivcontainer" style="border:1px solid gray; width:550px;height:550px; margin-bottom: 1em; padding: 10px">
 
</div>
</div>
<script type="text/javascript">

    var countries = new ddajaxtabs("countrytabs", "countrydivcontainer")
    countries.setpersist(true)
    countries.setselectedClassTarget("link") //"link" or "linkparent"
    countries.init()

</script>
</asp:Content>