<%@ Page Language="C#"  MasterPageFile="~/Template/Phasco01.Master"  AutoEventWireup="true" CodeBehind="imagemanagement.aspx.cs" Inherits="OnlineTest.Admin.imagemanagement" %>

<asp:Content ID="content1" ContentPlaceHolderID="head_Meta" runat="server">
 
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="Plc" runat="server">
  <table dir="rtl">
  <tr>
  <td>
  ارسال تصویر به سرور
  </td>
  <td>
  
  </td>
  <td>
  
  </td>
  
  </tr>
    <tr>
  <td>
  
  </td>
  <td>
     <asp:FileUpload ID="FileUpload1" runat="server" Style="position: relative" /><br />
    
    
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"

       ControlToValidate="FileUpload1"
        EnableViewState="False" ErrorMessage="فرمت تصویر صحیح نیست"

       Style="position:    relative"      ValidationExpression=

"^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.jpeg|.JPEG|.jpg|.JPG|.bmp|.BMP|.png|.PNG|.gif|.GIF)$"></asp:RegularExpressionValidator><br />
  </td>
  <td>
      <asp:Button ID="Button1" runat="server" Text="ارسال" onclick="Button1_Click" />
  </td>
  
  </tr>
  </table>
</asp:Content>
