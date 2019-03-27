<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopMenuBazar.ascx.cs" Inherits="PHASCO_WEB.Template.UI.TopMenuBazar" %>
<div style="float: right;">
    &nbsp;
    <asp:HyperLink  ID="HyperLink239" runat="server" EnableViewState="False" 
        NavigateUrl="~\default.aspx" ForeColor="Black">صفحه اصلی</asp:HyperLink>&nbsp;|&nbsp;
    <asp:HyperLink  ID="HyperLink238" runat="server" EnableViewState="False" 
        NavigateUrl="~\Article.aspx" ForeColor="Black">مقالات</asp:HyperLink>&nbsp;|&nbsp;
            <asp:HyperLink  ID="HyperLink5" runat="server" EnableViewState="False" 
        NavigateUrl="~\video\" ForeColor="Black">ویدئوها</asp:HyperLink> 
  &nbsp;|&nbsp;
     <asp:HyperLink  ID="HyperLink6" runat="server" EnableViewState="False" 
        NavigateUrl="~\bazar\" ForeColor="Black">بازار</asp:HyperLink> 
     &nbsp;|&nbsp;
    <asp:HyperLink  ID="HyperLink237" runat="server" EnableViewState="False" 
        NavigateUrl="~\atlas.aspx" ForeColor="Black">اطلس ها</asp:HyperLink>&nbsp;|&nbsp;
    <asp:HyperLink  ID="HyperLink236" runat="server" EnableViewState="False" 
        NavigateUrl="~\FAQList.aspx" ForeColor="Black">پرسش و پاسخ</asp:HyperLink>&nbsp;|&nbsp;
     <asp:HyperLink ID="HyperLink3" runat="server" EnableViewState="False" 
        NavigateUrl="~\quiz\makequiz.aspx" ForeColor="Black">آزمون</asp:HyperLink><font color="#FF0000"></font>&nbsp;|&nbsp;
     <asp:HyperLink ID="HyperLink4" runat="server" EnableViewState="False" 
        NavigateUrl="~\QuestionsBank.aspx" ForeColor="Black">بانک سوالات</asp:HyperLink><font color="#FF0000"></font>&nbsp;|&nbsp;
    
    <asp:HyperLink  ID="HyperLink234" runat="server" EnableViewState="False" 
        NavigateUrl="~\webloglist.aspx" ForeColor="Black">وبلاگ ها</asp:HyperLink>&nbsp;|&nbsp;
    <asp:HyperLink  ID="HyperLink235" runat="server" EnableViewState="False" 
        NavigateUrl="~\news.aspx" ForeColor="Black">&#1575;&#1582;&#1576;&#1575;&#1585;</asp:HyperLink>&nbsp;|&nbsp;
    <asp:HyperLink ID="HyperLink2"  runat="server" EnableViewState="False" 
        NavigateUrl="~\jobs.aspx" ForeColor="Black">کار و کاریابی</asp:HyperLink><font color="#FF0000"></font>&nbsp;|&nbsp;
    <asp:HyperLink  ID="HyperLink233" runat="server" EnableViewState="False" 
        NavigateUrl="~\LabDirectory.aspx" ForeColor="Black">آزمایشگاه ها</asp:HyperLink>&nbsp;|&nbsp;
    <asp:HyperLink  ID="HyperLink240" runat="server" EnableViewState="False" 
        NavigateUrl="~\CoDirectory.aspx" ForeColor="Black">شرکت ها</asp:HyperLink>&nbsp;|&nbsp;
    <asp:HyperLink  ID="HyperLink1" runat="server" EnableViewState="False" 
        NavigateUrl="~\bazar\contactus.aspx" ForeColor="Black">تماس با ما</asp:HyperLink>

</div>
<asp:Panel runat="server" ID="UserOnline_Panle">
    <br />
    <br />
    <div style="height: 20px;  width: 1030px;; padding-right: 0px; padding-bottom: 5px;">
    <table  style="width: 1030px;;direction:rtl;background-image:url('/bazar/images/topmenuBG.jpg');height:34px;"   >
   
    <tr>
    <td style="width:60%;direction:rtl;color:#ffffff;">
        <a  style="margin: 0 4px;" href="/bazar/Default.aspx" style="color:#ffffff;">بازار فاسکو</a>&nbsp;| &nbsp;
   <a ID="A2" runat="server" href="~\Bazar\MyBiztBiz\Default.aspx" style="color:#ffffff;">دفتر تجاری من
        </a>&nbsp;| &nbsp;
        <a id="A1" href="~\myhome.aspx" runat="server" style="color:#ffffff;">فاسکو من (<asp:Label ID="Label_Name" runat="server" Text="Label"></asp:Label>)
        </a>&nbsp; |&nbsp;

      بانک من (<asp:Label ID="Label_phasny" runat="server"></asp:Label>&nbsp;فاسنی) &nbsp;|
        <asp:LinkButton ID="LinkButton_Logof" runat="server" OnClick="LinkButton_Logof_Click">خروج</asp:LinkButton>
    </td>
    <td style="width:40%;direction:rtl;text-align:left;">
  
        &nbsp;&nbsp;
        <asp:HyperLink ID="lnkMessageInquiry" runat="server" ForeColor="White" 
            NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=3">[lnkMessageInquiry]</asp:HyperLink>
        <asp:HyperLink ID="lnkProductInquiry" runat="server" ForeColor="White" 
            NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=1">[lnkProductInquiry]</asp:HyperLink>
        <asp:HyperLink ID="lnkRequestInquiry" runat="server" ForeColor="White" 
            NavigateUrl="~/bazar/MyBiztBiz/inquiry_List.aspx?TypeID=2">[lnkRequestInquiry]</asp:HyperLink>
         
      
         
    </td></tr>
    </table>

    </div>
</asp:Panel>
<asp:Panel runat="server" ID="UserLogout">
    <br />
    <br />
    <div style="height: 20px;  width: 1030px;; padding-right: 0px; padding-bottom: 5px;">
    <table  style="width: 1030px;;direction:rtl;background-image:url('/bazar/images/topmenuBG.jpg');height:34px;"   >
   
    <tr><td style="width:50%;direction:rtl;color:#ffffff;">
        <a  style="margin: 0 4px;" href="/bazar/Default.aspx" style="color:#ffffff;">بازار فاسکو</a> 
    

 
    </td>
    <td style="width:50%;direction:rtl;text-align:left;">
  
 
         
    </td></tr>
    </table>

    </div>
</asp:Panel>
<br />
<br />