<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Quiz.ascx.cs" Inherits="OnlineTest.UC.Quiz" %>
<table style="width:100%; direction:rtl; text-align:right;">
<tr>
<td style="width:80%; text-align:center; direction:rtl; direction:rtl; text-align:right; padding:20px;">
    <asp:Image ID="Image_newQuiz" runat="server" ImageUrl="~/Images2/Quiz2.png" Width="40px" Height="35px" />
    &nbsp;
    <asp:HyperLink ID="HyperLink_newQuiz" runat="server" NavigateUrl="~/user/MakeQuiz.aspx">آزمون جدید</asp:HyperLink>
</td>
</tr>
<tr>
<td style="width:80%; text-align:center; direction:rtl; direction:rtl; text-align:right; padding:20px;">
    <asp:Image ID="Image_MyQuizzes" runat="server" ImageUrl="~/Images2/MyQuizzes.png"  Width="40px" Height="35px" />
        &nbsp;
         <asp:HyperLink ID="HyperLink_MyQuizzes" runat="server" NavigateUrl="~/user/MyQuiz.aspx"> آزمون های من</asp:HyperLink>
</td>
</tr>


</table>