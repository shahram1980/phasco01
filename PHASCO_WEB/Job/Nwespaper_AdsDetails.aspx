<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true" CodeBehind="Nwespaper_AdsDetails.aspx.cs" Inherits="Rahbina.Job.Nwespaper_AdsDetails" %>


<asp:Content runat="server" ID="content1" ContentPlaceHolderID="head_Meta" ></asp:Content>


<asp:Content runat="server" ID="content2" ContentPlaceHolderID="Plc" >
      <a class="btn btn-default" onclick="goBack()">بازگشت <i class="fa fa-reply"></i></a>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
           <table style="width:100%;direction:rtl;">
<%--        the topic of AD--%>
       <tr>
       <td>
           <asp:Label ID="Label_AdTopic" runat="server" Text="عنوان آگهي"></asp:Label>
       </td>
       <td>
        <asp:Label ID="Label_AdTopic2" runat="server" Text=""></asp:Label>
       </td>
     
       </tr>
   <%--  explenation --%>
   <tr>
   <td>
   <asp:Label ID="Label_explenation" runat="server" Text="توضيحات"></asp:Label>
   </td>
   <td>
    <asp:Label ID="Label_explenation2" runat="server" Text=""></asp:Label>
   </td>
 
   </tr>
   <%--TimeOutCall--%>
   <tr>
   <td>
   <asp:Label ID="Label_TimeOutCall" runat="server" Text="مهلت تماس"></asp:Label>
   </td>
   <td>
 <asp:Label ID="Label_TimeOutCall2" runat="server" Text=""></asp:Label>
   </td>
   </tr>
 <%--  newspaper name --%>
  <tr>
   <td>
   <asp:Label ID="Label_newsPaperNmae" runat="server" Text="روزنامه"></asp:Label>
   </td>
   <td>
    <asp:Label ID="Label_newsPaperNmae2" runat="server" Text=""></asp:Label>
   </td>
  
   </tr>
    <%--  newspaper date --%>
  <tr>
   <td>
   <asp:Label ID="Label_newsPaperDate" runat="server" Text="تاريخ روزنامه"></asp:Label>
   
   </td>
   <td>
    <asp:Label ID="Label_newsPaperDate2" runat="server" Text=""></asp:Label>
   </td>
   
   </tr>
 <%--  number--%>
   <tr>
   <td>
   <asp:Label ID="Label_number" runat="server" Text="شماره روزنامه"></asp:Label>
   </td>
   <td>
     <asp:Label ID="Label_number2" runat="server" Text=""></asp:Label>
   </td>

   </tr>
   <%--visit counter--%>
   <tr>
   <td>
     <asp:Label ID="Label_visit_counter" runat="server" Text="تعداد بازديد"></asp:Label>
   </td>
   <td>
        <asp:Label ID="Label_visit_counter2" runat="server" Text=""></asp:Label>
   </td>
   </tr>
   <%--advertisement image--%>
   
               <tr>
                   <td>
                       &nbsp;</td>
                   <td>
                       <asp:Image ID="Image_adver" runat="server" />
                   </td>
               </tr>
   
        </table>
            <asp:HyperLink ID="HyperLink_return" runat="server" NavigateUrl="~/Job/Home.aspx">بازگشت</asp:HyperLink>
            <br />
            <hr />
            <center>
            <asp:GridView ID="GridView_All_jobs" runat="server" AutoGenerateColumns="False" 
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <Columns>
                    <asp:BoundField DataField="JobTitle" HeaderText="عنوان شغل" />
                    <asp:BoundField DataField="EduField" HeaderText="رشته" />
                    <asp:BoundField DataField="EduTendency" HeaderText="گرايش" />
                    <asp:BoundField DataField="EduDegree" HeaderText="مدرک تحصيلي" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            </center>
            <hr />
            <br />
        </asp:View>
    </asp:MultiView>
</asp:Content>

