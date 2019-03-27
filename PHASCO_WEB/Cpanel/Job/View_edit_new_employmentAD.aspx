<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/admin.Master" CodeBehind="View_edit_new_employmentAD.aspx.cs" Inherits="Rahbina.Administrator.Job.View_edit_new_employmentAD" %>

 
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1" >
    <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                    <asp:GridView ID="GridView_waiting_ad" runat="server"  EnableViewState="false"

                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="100%" 
                       >
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
                     <asp:TemplateField HeaderText="عنوان شغلي" ><ItemTemplate><asp:Label ID="Label_JobTitle" runat="server" Text='<%#get_category_name(Eval("jobTitle")) %>'></asp:Label></ItemTemplate></asp:TemplateField>
                    <asp:TemplateField HeaderText="تخصص مورد نياز" ><ItemTemplate><asp:Label ID="Label_JobTitle" runat="server" Text='<%#get_category_name(Eval("Required_specialty")) %>'></asp:Label></ItemTemplate></asp:TemplateField>
          
           <asp:TemplateField HeaderText="تاريخ درج"><ItemTemplate><asp:Label ID="Label_insert_Date" runat="server" Text='<%#GetfarsiDate(Eval("insertionDate")) %>'></asp:Label></ItemTemplate></asp:TemplateField>
            <asp:HyperLinkField HeaderText="گزينه ها" Text="مشاهده و تائيد" DataNavigateUrlFields="id" DataNavigateUrlFormatString='View_edit_new_employmentAD.aspx?id={0}' />
               
      
            
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
        <%--job title--%>
 <div class="InstedOfTable"></div>
<div class="InstedOfTable" >
    
         
<asp:Label ID="Label_jobtitle2" runat="server" Text=""> </asp:Label>


   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_jobtitle1" runat="server" Text="زمينه فعاليت"> </asp:Label>
    </div>
                <%--required specialty--%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable" >
  
<asp:Label ID="Label_required_specialty2" runat="server" Text=""></asp:Label>


   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_required_specialty1" runat="server" Text="زمينه تخصصي"></asp:Label>


    </div>
        <%--company name--%>
       <div class="InstedOfTable"></div>
        <div class="InstedOfTable">
            <asp:Label ID="Label_coname2" runat="server" Text=""></asp:Label>
        </div>
        <div class="InstedOfTable">
            <asp:Label ID="Label_coname" runat="server" Text="نام شركت / موسسه"></asp:Label>
        </div>
                <%--insertion date--%>
      <div class="InstedOfTable"></div>
     <div class="InstedOfTable">
         <asp:Label ID="Label_insertDate2" runat="server" Text=""></asp:Label>
        </div>
          <div class="InstedOfTable">
              <asp:Label ID="Label_insertDate1" runat="server" Text="تاريخ درج آگهي"></asp:Label>
        </div>
        <%--Call time out--%>
      <div class="InstedOfTable"></div>
     <div class="InstedOfTable">
         <asp:Label ID="Label_call_timeOut2" runat="server" Text=""></asp:Label>
        </div>
          <div class="InstedOfTable">
              <asp:Label ID="Label_call_timeOut" runat="server" Text="مهلت تماس تا"></asp:Label>
        </div>

     
        <%--address--%>
        
     <div class="InstedOfTable"></div>
       <div class="InstedOfTable">
        <asp:Label ID="Label_address2" runat="server" Text=""></asp:Label>
        </div>
        <div class="InstedOfTable">
            <asp:Label ID="Label_address" runat="server" Text="آدرس "></asp:Label>
        </div>
        <%--state--%>
 <div class="InstedOfTable"></div>
<div class="InstedOfTable">
 <asp:Label ID="Label_state2" runat="server" Text=""></asp:Label>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_state1" runat="server" Text="استان محل كار"></asp:Label>
</div>
<%--city--%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable">
 
     <asp:Label ID="Label_city2" runat="server" Text=""></asp:Label>
   
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_city" runat="server" Text=" شهر محل كار"></asp:Label>
</div>
<%--education step--%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable">
   <asp:Label ID="Label_education2" runat="server" Text=""></asp:Label> 
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_education1" runat="server" Text="مقطع تحصيلي"></asp:Label>
</div>
<%--job experience --%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable">
<asp:Label ID="Label_experience2" runat="server" Text=""></asp:Label>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_experience" runat="server" Text="سابقه كار"></asp:Label>
</div>
<%--gender--%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable">
   <asp:Label ID="Label_gender2" runat="server" Text=""></asp:Label> 
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_gender1" runat="server" Text="جنسيت"></asp:Label>
</div>
<%--marriage status--%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable">
  <asp:Label ID="Label_marriage2" runat="server" Text=""></asp:Label>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_marriage1" runat="server" Text="وضعيت تاهل "></asp:Label>
</div>
<%--service status--%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable">
  <asp:Label ID="Label_service2" runat="server" Text=""></asp:Label>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_service1" runat="server" Text="وضعيت نظام وضيفه"></asp:Label>
</div>
<%--age--%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable">
<asp:Label ID="Label_age2" runat="server" Text=""></asp:Label>
</div>
<div class="InstedOfTable">
<asp:Label ID="Label_age" runat="server" Text="حداقل و حداكثر سن"></asp:Label>
</div>
<%--phone--%>
<div class="InstedOfTable"></div>

<div class="InstedOfTable">
  <asp:Label ID="Label_phone2" runat="server" Text=""></asp:Label>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_phone" runat="server" Text="تلفن هاي تماس"></asp:Label>
</div>
<%--explenation--%>
<div class="InstedOfTable">
    <asp:HyperLink ID="HyperLink_return" runat="server" NavigateUrl="View_edit_new_employmentAD.aspx">بازگشت</asp:HyperLink>
</div>
<div class="InstedOfTable" style="height:100px;">
 <asp:Label ID="Label_explenation2" runat="server" Text=""></asp:Label>
</div>
<div class="InstedOfTable" style="height:100px;">
    <asp:Label ID="Label_explenation" runat="server" Text="توضيحات"></asp:Label>
</div>
<table>
<tr>
<td>
  <asp:Label ID="Label_confirm" runat="server" Text="جهت تائيد آگهي روي تائيد كليك كنيد "></asp:Label>
            <asp:LinkButton ID="LinkButton_confirm" runat="server" onclick="LinkButton_confirm_Click" 
               >تائيد</asp:LinkButton>
            <br />
                       <asp:Label ID="Label_confirm2" runat="server" Text="در غير اين صورت علت عدم تائيد را ذكر كرده و روي ادامه كليك كنيد "></asp:Label>
            <asp:TextBox ID="TextBox_confirm" runat="server" MaxLength="499" Columns="40"></asp:TextBox>
            <asp:LinkButton ID="LinkButton_confirm2" runat="server" onclick="LinkButton_confirm2_Click" 
          >ادامه</asp:LinkButton>
</td>
</tr>
</table>
        </asp:View>
    </asp:MultiView>
</asp:Content>