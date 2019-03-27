<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="External_News.aspx.cs" Inherits="phasco_webproject.ExternalHome.External_News" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <link rel="stylesheet" type="text/css" href="../CSS/art-final.css" />
    <script language="JavaScript">
      function toggle(id) {
            var state = document.getElementById(id).style.display;
            if (state == 'none') {
                  document.getElementById(id).style.display = 'block';
            } else {
                  document.getElementById(id).style.display = 'none';
            }
      }
</script>
        <script language="C#" runat="server">
        
         public string set_Image(string Image,int id) 
    {
        if (Image == "none.jpg") return "";
        if (Image != "none.jpg") return "../phascoupfile/NewsImages/" + Image;
        return "تصویر ناشناخته";
    }
        </script>
    
    
</head>
<body onload="toggle('load')"  style="background-color:#FCF0D5;">
<div id="load">
  <img src="../images/CalBiotech_Adv.jpg"  align="left" />
  در حال بارگزاری ..
  </div>
    <form id="form1" runat="server">
    <div>
        <asp:Repeater ID="Repeater_News" runat="server">
        <ItemTemplate>
        <table border="0" width="100%" dir="rtl" style="border-collapse: collapse">
	<tr>
		<td width="20%" align="right" valign="top">
		<img src="<%# set_Image(Eval("Image").ToString(),int.Parse(Eval("Id").ToString())) %>" width="100" />
		</td> 
		<td width="80%" align="right" valign="top">					
				  <a  href="../News.aspx?News_Id=<%#Eval("id") %>"  target=_parent>
          <b><%# Eval("Title") %></b>  
            </a>
            <br />
            <%# Eval("news") %> ...
         
            </td>
	</tr>
	 
</table>
           <hr>
        
        </ItemTemplate>
        </asp:Repeater>
    
    </div>
    </form>
</body>
</html>
