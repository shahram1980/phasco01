<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="view_edit_NewResumes.aspx.cs" Inherits="Rahbina.Administrator.view_edit_NewResumes" %>


<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
      <asp:View ID="View1" runat="server">
            <asp:GridView ID="GridView_waiting_resumes" runat="server"  
             PagerSettings-FirstPageText="صفحه اول" PagerSettings-LastPageText="صفحه آخر" PagerSettings-NextPageText=" صفحه بعد" 
             PagerSettings-PreviousPageText="صفحه قبل"  PageSize="5"
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
            <asp:BoundField HeaderText="عنوان رزومه" DataField="ResumeSubject" />
            <asp:TemplateField HeaderText="تاريخ درج">
            <ItemTemplate>
                <asp:Label ID="Label_insertDate" runat="server" Text='<%#GetfarsiDate(Eval("InsertDate")) %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="تاريخ انقضاء">
            <ItemTemplate>
                <asp:Label ID="Label_Expire_Date" runat="server" Text='<%#GetfarsiDate(Eval("Expire_Date")) %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField HeaderText="گزينه ها" Text="مشاهده و تائيد" DataNavigateUrlFields="id" DataNavigateUrlFormatString="view_edit_NewResumes.aspx?id={0}" />
                
      
            
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:View>
             <%--  showing details of resume--%>
      
        <asp:View ID="View2" runat="server">
<%--عنوان رزومه--%>
    <div class="InstedOfTable" >
 </div>

<div class="InstedOfTable" >

    <asp:Label ID="Label_Subject2" runat="server" Text=""></asp:Label>
    </div>

<div class="InstedOfTable" ><asp:Label ID="Label_Subject" runat="server" Text="عنوان رزومه"></asp:Label>
    </div>
<br />
<%--شماره ملي--%>
<div class="InstedOfTable" >
   </div>

<div class="InstedOfTable" >
<asp:Label ID="Label_nationalNumber2" runat="server" Text=""></asp:Label>
</div>
<div class="InstedOfTable" ><asp:Label ID="Label_nationalNumber" runat="server" Text="شماره ملي"></asp:Label>


    </div>

<br />
<%--وضعيت نظام وظيفه"--%>


<div class="InstedOfTable" ></div>
   
<div class="InstedOfTable" ><asp:Label ID="Label_service2" runat="server" Text=""></asp:Label>
   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_service1" runat="server" Text="وضعيت نظام وظيفه"></asp:Label>


    </div>
<br />
<%--تلفن--%>


<div class="InstedOfTable" >
  </div>

<div class="InstedOfTable" >
<asp:Label ID="Label_phone2" runat="server" Text=""></asp:Label>
   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_phone" runat="server" Text="تلفن"></asp:Label>
    </div>

<br />
<%--موبايل--%>
<div class="InstedOfTable" >
   </div>

<div class="InstedOfTable" >
<asp:Label ID="Label_mobile2" runat="server" Text=""></asp:Label>
   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_mobile" runat="server" Text="موبايل"></asp:Label>
    </div>

<br />
<%--وضعيت شغلي--%>
<div class="InstedOfTable" >

   </div>

<div class="InstedOfTable" >
    <asp:Label ID="Label_job_status2" runat="server" Text=""></asp:Label>

   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_job_status" runat="server" Text="وضعيت شغلي"></asp:Label>


    </div>
    
    <br />
   <%-- وضعيت تحصيلي--%>
   
<div class="InstedOfTable" >
</div>


   
<div class="InstedOfTable" ><asp:Label ID="Label_EduStatus2" runat="server" Text=""></asp:Label>
   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_EduStatus" runat="server" Text="وضعيت تحصيلي"></asp:Label>


    </div>
    
    <%--مدت نمايش رزومه--%>
        <br />
<div class="InstedOfTable" >
    </div>

<div class="InstedOfTable" >
   
    <asp:Label ID="Label_ExpireTime2" runat="server" Text=""></asp:Label>

   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_ExpireTime" runat="server" Text="مدت نمايش رزومه">

</asp:Label>
    </div>
    
<br />
<%--زمينه فعاليت--%>
<div class="InstedOfTable" >
 </div>

<div class="InstedOfTable" ><asp:Label ID="Label_category2" runat="server" Text=""></asp:Label>
   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_category" runat="server" Text="زمينه فعاليت"></asp:Label>
    </div>
    
<br />
<%--زمينه تخصصي--%>
<div class="InstedOfTable" >

</div>
<div class="InstedOfTable" >
<asp:Label ID="Label_Subcategory2" runat="server" Text=""></asp:Label>
   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_Subcategory" runat="server" Text="زمينه تخصصي"></asp:Label>


    </div>
   <%-- نحوه همكاري--%>
   
    <div class="InstedOfTable" >
   </div>


 
<div class="InstedOfTable" ><asp:Label ID="Label_CoOperate_Condition2" runat="server" Text=""></asp:Label>
   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_CoOperate_Condition" runat="server" Text="نحوه همكاري"></asp:Label>


    </div>
    
    <div class="InstedOfTable" >
   </div>

<div class="InstedOfTable" >

    <asp:Label ID="Label_Requested_Wage2" runat="server" Text=""></asp:Label>
    </div>
<div class="InstedOfTable" ><asp:Label ID="Labe_Requested_Wage" runat="server" Text="حقوق درخواستي">

</asp:Label>
    </div>
<%--توانايي هاي حرفه اي--%>
<br />

    <br /> 
    <div class="InstedOfTable" style="height:120px;" >
   
 </div>

<div class="InstedOfTable"style="height:120px;" >
 <asp:Label ID="Label_pro_abilities2" runat="server" Text=""></asp:Label>
 </div>
<div class="InstedOfTable" style="height:120px;">
<asp:Label ID="Label_pro_abilities" runat="server" Text="توانايي هاي حرفه اي"></asp:Label>


    </div>
    <%--توضيحات--%>
    <br />   
<div class="InstedOfTable" style="height:120px;" >
 </div>

<div class="InstedOfTable"style="height:120px;" >
<asp:Label ID="Label_Explantion2" runat="server" Text=""></asp:Label>
</div>

<div class="InstedOfTable" style="height:120px;">
<asp:Label ID="Label_Explantion" runat="server" Text="توضيحات"></asp:Label></div>
<br />
<br />
 <table>
 <tr>
 <td>
 <%--showing all careers--%>
<fieldset>
<legend>
<asp:Label ID="Label_special_career" runat="server" Text="دوره هاي تخصصي"></asp:Label>      
</legend>
 <asp:GridView ID="GridView_career" runat="server" 
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
            <asp:BoundField HeaderText="نام دوره" DataField="career_name" />
       <asp:BoundField HeaderText="مدت دوره به ماه " DataField="career_duration" />
       <asp:TemplateField HeaderText="از تاريخ">
       <ItemTemplate>
           <asp:Label ID="Label_startTime" runat="server" Text='<%#GetfarsiDate(Eval("startTime" ))%>'></asp:Label>
       </ItemTemplate>
       </asp:TemplateField>
          <asp:TemplateField HeaderText="تا تاريخ">
       <ItemTemplate>
           <asp:Label ID="Label_startTime" runat="server" Text='<%#GetfarsiDate(Eval("FinishTime" ))%>'></asp:Label>
       </ItemTemplate>
       </asp:TemplateField>
    
                  <asp:BoundField HeaderText="نام موسسه" DataField="Institute_name" />  
           
             
                 
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
</fieldset>
 </td>
 </tr>
 <tr>
 <td>
 <fieldset>
 <legend>زبانهاي خارجي</legend>
  <asp:GridView ID="GridView_languages" runat="server" 
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
            <asp:BoundField HeaderText="زبان خارجي" DataField="Language_name" />
       <asp:BoundField HeaderText="مهارت خواندن و نوشتن " DataField="Read_Write_skill" />
    
            
                  <asp:BoundField HeaderText="مهارت مكالمه" DataField="Speaking_skill" />  
           
                 
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
 
 </fieldset>
 </td>

 </tr>
 
 <tr>
  <td>
 <fieldset>
 <legend>سوابق تحصيلي</legend>
 
                      <%--showing inserted Edu--%>
            <asp:GridView ID="GridView_edu" runat="server" 
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
            <asp:BoundField HeaderText="رشته و گرايش" DataField="Field" />
       <asp:BoundField HeaderText="آخرين مدرك تحصيلي " DataField="Last_document" />    
                  <asp:BoundField HeaderText="كشور" DataField="country" />  
                   <asp:BoundField HeaderText="شهر" DataField="City" />  
                    <asp:BoundField HeaderText="دانشگاه" DataField="University" />  
   <asp:TemplateField HeaderText="از تاريخ">
       <ItemTemplate>
           <asp:Label ID="Label_startTime" runat="server" Text='<%#GetfarsiDate(Eval("StartDate" ))%>'></asp:Label>
       </ItemTemplate>
       </asp:TemplateField>
          <asp:TemplateField HeaderText="تا تاريخ">
       <ItemTemplate>
           <asp:Label ID="Label_startTime" runat="server" Text='<%#GetfarsiDate(Eval("FinishDate" ))%>'></asp:Label>
       </ItemTemplate>
       </asp:TemplateField>
                     <asp:BoundField HeaderText="معدل" DataField="average" />  
                   
                  
                 
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
            </fieldset>
 </td>
 </tr>
 </table>
            <asp:Label ID="Label_confirm" runat="server" Text="جهت تائيد رزومه روي تائيد كليك كنيد "></asp:Label>
            <asp:LinkButton ID="LinkButton_confirm" runat="server" 
                onclick="LinkButton_confirm_Click">تائيد</asp:LinkButton>
            <br />
                       <asp:Label ID="Label_confirm2" runat="server" Text="در غير اين صورت علت عدم تائيد را ذكر كرده و روي ادامه كليك كنيد "></asp:Label>
            <asp:TextBox ID="TextBox_confirm" runat="server" MaxLength="499" Columns="40"></asp:TextBox>
            <asp:LinkButton ID="LinkButton_confirm2" runat="server" onclick="LinkButton_confirm2_Click" 
          >ادامه</asp:LinkButton>
</asp:View>
    </asp:MultiView>
</asp:Content>