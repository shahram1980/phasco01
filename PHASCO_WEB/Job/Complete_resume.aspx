<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Phasco01.Master" CodeBehind="Complete_resume.aspx.cs" Inherits="Rahbina.Job.Complete_resume" %>
  
<asp:Content ContentPlaceHolderID="head_Meta"  runat="server" ID="c1">

    

    <style type="text/css">
        .style18
        {
            width: 498px;
        }
        .style20
        {
            width: 413px;
        }
        </style>

    

</asp:Content>

<asp:Content ContentPlaceHolderID="Plc" runat="server" ID="c2">

<div>

      <a class="btn btn-default" onclick="goBack()">بازگشت <i class="fa fa-reply"></i></a>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
       <div style="text-align:right;">
                   <asp:Label ID="Label2" runat="server" Text="رزومه شما با موفقيت درج شد و پس از تائيد مدير سايت فعال خواهد شد، در صورت عدم تمايل به تكميل اين قسمت روي ادامه كليك كنيد"></asp:Label>
            <asp:HyperLink ID="HyperLink_continue" runat="server" NavigateUrl="~/Job/userJob.aspx">ادامه</asp:HyperLink>
       </div>

         <hr />
         
         <table style="text-align:right;direction:rtl;width:100%; ">
          <%--        career name--%>
          <tr>
            <td>
<asp:Label ID="Label_career_name" runat="server" Text="نام دوره"></asp:Label>
            </td>
            <td>
 <asp:TextBox ID="TextBox_career_name" runat="server"></asp:TextBox>
            </td>
            <td>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2"  ControlToValidate="TextBox_career_name"
                    Text="نام دوره را مشخص كنيد" ValidationGroup="career"
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator> 
            </td>
            </tr>
              <%--career duration--%>
              <tr>
            <td>
        <asp:Label ID="Label_career_duration" runat="server" Text="مدت دوره" ></asp:Label>
            </td>
            <td>
     <asp:TextBox ID="TextBox_career_duration" runat="server" MaxLength="2"></asp:TextBox>
               <asp:Label ID="Label_career_duration2" runat="server" Text="ماه" ></asp:Label> 
            </td>
            <td>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator_career_duration"  ControlToValidate="TextBox_career_duration"
                    Text="مدت دوره را مشخص كنيد" Display="Dynamic" ValidationGroup="career"
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="CompareValidator3" runat="server"  ControlToValidate="TextBox_career_duration" ValidationGroup="career"
                  ErrorMessage="CompareValidator" Text="لطفا فقط عدد وارد كنيد" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
            </tr>
            <%--  start time--%>
            <tr>
            <td>
     <asp:Label ID="Label_start_time" runat="server" Text="تاريخ شروع"></asp:Label>
            </td>
            <td>
    <asp:DropDownList ID="DropDownList_day" runat="server">

                            </asp:DropDownList>
                       
                            <asp:DropDownList ID="DropDownList_month" runat="server">
                 
                          
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="DropDownList_year" runat="server">
                            </asp:DropDownList>
            </td>
            <td>

            </td>
            </tr>
             <%--finish time--%>
             <tr>
                <td>
   <asp:Label ID="Label_finish_time" runat="server" Text="تاريخ اتمام"></asp:Label>
                </td>
                <td>
 <asp:DropDownList ID="DropDownList_day_finish" runat="server">

                            </asp:DropDownList>
                       
                            <asp:DropDownList ID="DropDownList_month_finish" runat="server">
     
                          
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="DropDownList_year_finish" runat="server">
                            </asp:DropDownList>
                </td>
                <td>

                </td>
                </tr>
                 <%--Institute name--%> 
                 <tr>
                <td>
   <asp:Label ID="Label_institute_name" runat="server" Text="نام موسسه"></asp:Label>
                </td>
                <td>
   <asp:TextBox ID="TextBox_institute_name" runat="server"></asp:TextBox>
                </td>
                <td>
<asp:RequiredFieldValidator ID="RequiredFieldValidator_institute_name"  ControlToValidate="TextBox_institute_name"
                    Text="نام موسسه را مشخص كنيد" ValidationGroup="career"
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
                </tr> 
                
                  <%-- insert career button--%>
                  <tr>
                <td>

                </td>
                <td>
  <asp:Button ID="Button_insert_career" runat="server" Text="درج مشخصات دوره" onclick="Button_insert_career_Click" 
                ValidationGroup="career"  />
                </td>
                <td>

                </td>
                </tr>
         </table>
           
   
       
          
       
         
      
         
            
            
           <%--showing inserted Careers--%>
           <div style="text-align:right;direction:rtl;width:100%;">
                  <asp:GridView ID="GridView_career" runat="server" 
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
            <asp:BoundField HeaderText="نام دوره" DataField="career_name" />
       <asp:BoundField HeaderText="مدت دوره به ماه " DataField="career_duration" />
                   <asp:TemplateField HeaderText=" از تاريخ">
            <ItemTemplate>
             <%#GetfarsiDate(Eval("startTime"))%>
            </ItemTemplate>
            </asp:TemplateField>
                         <asp:TemplateField HeaderText="تا تاريخ ">
            <ItemTemplate>
             <%#GetfarsiDate(Eval("FinishTime"))%>
            </ItemTemplate>
            </asp:TemplateField>
      
                  <asp:BoundField HeaderText="نام موسسه" DataField="Institute_name" />  
                  <asp:TemplateField HeaderText="گزينه ها">
                  <ItemTemplate>
                  <asp:Label ID="Label_delete" runat="server" Text='<%#set_URL_creer(Eval("id")) %>'></asp:Label>
    

                     
                  </ItemTemplate>
                  </asp:TemplateField>
                 
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>     
           </div>

            
            <hr />
            <%--getting languages--%>
        
         <table style="text-align:right;direction:rtl;width:100%">
         <tr><td width="20%">
             <asp:Label ID="Label4" runat="server" Text="زبان خارجي"></asp:Label>
             </td>
             <td width="30%">
                 <asp:DropDownList ID="DropDownList_Language" runat="server">
                     <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                     <asp:ListItem Text="انگليسي"></asp:ListItem>
                     <asp:ListItem Text="آلماني"></asp:ListItem>
                     <asp:ListItem Text="روسي"></asp:ListItem>
                     <asp:ListItem Text="فرانسوي"></asp:ListItem>
                     <asp:ListItem Text="عربي"></asp:ListItem>
                 </asp:DropDownList>
             </td>
             <td width="50%">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator_Language" runat="server" 
                     ControlToValidate="DropDownList_Language" ErrorMessage="RequiredFieldValidator" 
                     InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد" 
                     ValidationGroup="Language"></asp:RequiredFieldValidator>
             </td>
             </tr>
             <tr>
                 <td width="20%">
                     <asp:Label ID="Label6" runat="server" Text="مهارت خواندن و نوشتن"></asp:Label>
                 </td>
                 <td width="30%">
                     <asp:DropDownList ID="DropDownList_RandW_Skill" runat="server">
                         <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                         <asp:ListItem Text="عالي"></asp:ListItem>
                         <asp:ListItem Text="خوب"></asp:ListItem>
                         <asp:ListItem Text="متوسط"></asp:ListItem>
                         <asp:ListItem Text="ضعيف"></asp:ListItem>
                     </asp:DropDownList>
                 </td>
                 <td width="50%">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator_RandW_Skill" 
                         runat="server" ControlToValidate="DropDownList_RandW_Skill" 
                         ErrorMessage="RequiredFieldValidator" InitialValue="--انتخاب كنيد--" 
                         Text="لطفا يك مورد را انتخاب كنيد" ValidationGroup="Language"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td width="20%">
                     <asp:Label ID="Label5" runat="server" Text="مهارت مكالمه"></asp:Label>
                 </td>
                 <td width="30%">
                     <asp:DropDownList ID="DropDownList_SpeakSkill" runat="server">
                         <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                         <asp:ListItem Text="عالي"></asp:ListItem>
                         <asp:ListItem Text="خوب"></asp:ListItem>
                         <asp:ListItem Text="متوسط"></asp:ListItem>
                         <asp:ListItem Text="ضعيف"></asp:ListItem>
                     </asp:DropDownList>
                 </td>
                 <td width="50%">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator_SpeakSkill" 
                         runat="server" ControlToValidate="DropDownList_SpeakSkill" 
                         ErrorMessage="RequiredFieldValidator" InitialValue="--انتخاب كنيد--" 
                         Text="لطفا يك مورد را انتخاب كنيد" ValidationGroup="Language"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td width="20%">
                     &nbsp;</td>
                 <td width="30%">
                     <asp:Button ID="Button_insert_language" runat="server" 
                         onclick="Button_insert_language_Click" Text="درج مشخصات زبان خارجي" 
                         ValidationGroup="Language" />
                 </td>
                 <td width="50%">
                     &nbsp;</td>
             </tr>
         </table>

          
    
      
          
           <%--    showing inserted languages--%>
                      <div style="text-align:right;">
                <asp:GridView ID="GridView_languages" runat="server" 
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
            <asp:BoundField HeaderText="زبان خارجي" DataField="Language_name" />
       <asp:BoundField HeaderText="مهارت خواندن و نوشتن " DataField="Read_Write_skill" />
    
            
                  <asp:BoundField HeaderText="مهارت مكالمه" DataField="Speaking_skill" />  
                  <asp:TemplateField HeaderText="گزينه ها">
                  <ItemTemplate>
                  <asp:Label ID="Label_delete2" runat="server" Text='<%#set_URL_lang(Eval("id")) %>'></asp:Label>
                  </ItemTemplate>
                  </asp:TemplateField>
                 
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
           </div>
           <hr />
       
        <%-- EDU--%>
        <table style="text-align:right;direction:rtl;width:100%;">
          <%-- field--%>
                     <tr>
                 <td>
  <asp:Label ID="Label8" runat="server" Text="رشته و گرايش"></asp:Label>
            </td>
            <td>
 <asp:TextBox ID="TextBox_field" runat="server"></asp:TextBox>
            </td>
            <td>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator_field" runat="server"  ControlToValidate="TextBox_field"
                 Text="رشته و گرايش خود را مشخص كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            </tr>
                   <%--Last document--%>
    <tr>
                 <td>
    <asp:Label ID="Label9" runat="server" Text="آخرين مدرك تحصيلي"></asp:Label>
            </td>
            <td>
      <asp:DropDownList ID="DropDownList_Last_doc" runat="server">
               <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                  <asp:ListItem Text="ديپلم"></asp:ListItem>
                  <asp:ListItem Text="فوق ديپلم"></asp:ListItem>
                  <asp:ListItem Text="ليسانس"></asp:ListItem>
                  <asp:ListItem Text="فوق ليسانس"></asp:ListItem>
                   <asp:ListItem Text="دكترا"></asp:ListItem>
                  
               </asp:DropDownList>
            </td>
            <td>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator_Last_doc" runat="server" ControlToValidate="DropDownList_Last_doc"
                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            </tr>
                     <%-- country--%>
            <tr>
                 <td>
           <asp:Label ID="Label10" runat="server" Text="كشور"></asp:Label>
            </td>
            <td>
           <asp:TextBox ID="TextBox_country" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_country" runat="server"  ControlToValidate="TextBox_country"
                 Text="كشور محل تحصيل خود را مشخص كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            </tr>
                 <%-- city--%>
   <tr>
                 <td>
    <asp:Label ID="Label11" runat="server" Text="شهر"></asp:Label>
            </td>
            <td>
<asp:TextBox ID="TextBox_city" runat="server"></asp:TextBox>
            </td>
            <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator_city" runat="server"  ControlToValidate="TextBox_city"
                 Text="شهر محل تحصيل خود را مشخص كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            </tr>
              <%-- university--%> 
                         <tr>
                 <td>
   <asp:Label ID="Label12" runat="server" Text="دانشگاه"></asp:Label>
            </td>
            <td>
         <asp:TextBox ID="TextBox_university" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_university" runat="server"  ControlToValidate="TextBox_university"
                 Text="دانشگاه محل تحصيل خود را مشخص كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            </tr>
               <%-- Average--%>
                          <tr>
                 <td>
     <asp:Label ID="Label13" runat="server" Text="معدل" ></asp:Label>
            </td>
            <td>
   <asp:TextBox ID="TextBox_average" runat="server" MaxLength="5"></asp:TextBox>
            </td>
            <td>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator_average" runat="server"  ControlToValidate="TextBox_average"
                 Text="معدل خود را مشخص كنيد" ValidationGroup="Education" Display="Dynamic"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox_average" ValidationGroup="Education" 
                ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" Text="معدل وارد شده معتبر نيست"></asp:CompareValidator>
            </td>
            </tr>
                 <%--  start time Edu--%>
                            <tr>
                 <td>
    <asp:Label ID="Label_start_time_edu" runat="server" Text="تاريخ شروع"></asp:Label>
            </td>
            <td>
                      <asp:DropDownList ID="DropDownList_day_edu" runat="server">

                            </asp:DropDownList>
                       
                            <asp:DropDownList ID="DropDownList_month_edu" runat="server">
                 
                          
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="DropDownList_year_edu" runat="server">
                            </asp:DropDownList>
            </td>
            <td>

            </td>
            </tr>
             <%--finish time--%>
             
                        <tr>
                 <td>
<asp:Label ID="Label_finish_time_edu" runat="server" Text="تاريخ اتمام"></asp:Label>
            </td>
            <td>
                   <asp:DropDownList ID="DropDownList_day_edu_finish" runat="server">

                            </asp:DropDownList>
                       
                            <asp:DropDownList ID="DropDownList_month_edu_finish" runat="server">
     
                          
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="DropDownList_year_edu_finish" runat="server">
                            </asp:DropDownList>
            </td>
            <td>

            </td>
            </tr>
               <%-- insert education button--%>
                          <tr>
                 <td>

            </td>
            <td>
               <asp:Button ID="Button_insert_education" runat="server" Text="درج سوابق تحصيلي" 
                   onclick="Button_insert_education_Click"   ValidationGroup="Education"/>
            </td>
            <td>

            </td>
            </tr>
        </table>
    

      
           
                     <%--showing inserted Edu--%>
                                <div style="text-align:right;">
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
                     <asp:BoundField HeaderText="معدل" DataField="average" />  
                                        <asp:TemplateField HeaderText=" از تاريخ">
            <ItemTemplate>
             <%#GetfarsiDate(Eval("StartDate"))%>
            </ItemTemplate>
            </asp:TemplateField>
                         <asp:TemplateField HeaderText="تا تاريخ ">
            <ItemTemplate>
             <%#GetfarsiDate(Eval("FinishDate"))%>
            </ItemTemplate>
            </asp:TemplateField>
            
                  <asp:TemplateField HeaderText="گزينه ها">
                  <ItemTemplate>
                     <asp:Label ID="Label_delete3" runat="server" Text='<%#set_URL_edu(Eval("id")) %>'></asp:Label>
                  </ItemTemplate>
                  </asp:TemplateField>
                 
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>  
           </div>
           <hr />
   
            </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:Label ID="Label1" runat="server" Text="حذف شد"></asp:Label>
            <asp:HyperLink ID="HyperLink_return" runat="server">بازگشت</asp:HyperLink>
        
        </asp:View>
        <asp:View ID="View3" runat="server">
           <h1><asp:Label ID="Label14" runat="server" Text=""></asp:Label></h1> 
           <table style="text-align:right;direction:rtl;width:100%;">
                   <%--      Edit  career name--%>
           <tr>
            <td>
     <asp:Label ID="Label_career_name_E" runat="server" Text="نام دوره"></asp:Label>
            </td>
            <td>
  <asp:TextBox ID="TextBox_career_name_E" runat="server"></asp:TextBox>
            </td>
            <td>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator2_E"  ControlToValidate="TextBox_career_name_E"
                    Text="نام دوره را مشخص كنيد" ValidationGroup="career"
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            </tr>
                 <%--Edit career duration--%>
                 
                            <tr>
            <td>
         <asp:Label ID="Label_career_duration_E" runat="server" Text="مدت دوره" ></asp:Label>
            </td>
            <td>
               <asp:TextBox ID="TextBox_career_duration_E" runat="server" MaxLength="2"></asp:TextBox>
               <asp:Label ID="Label_career_duration2_E" runat="server" Text="ماه" ></asp:Label> 
            </td>
            <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator_career_duration_E"  ControlToValidate="TextBox_career_duration_E"
                    Text="مدت دوره را مشخص كنيد" Display="Dynamic" ValidationGroup="career"
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="CompareValidator_E" runat="server"  ControlToValidate="TextBox_career_duration_E" ValidationGroup="career"
                  ErrorMessage="CompareValidator" Text="لطفا فقط عدد وارد كنيد" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            </td>
            </tr>
              <%-- Edit start time--%>
                         <tr>
            <td>
  <asp:Label ID="Label_start_time_E" runat="server" Text="تاريخ شروع"></asp:Label>
            </td>
            <td>
                      <asp:DropDownList ID="DropDownList_day_E" runat="server">

                            </asp:DropDownList>
                       
                            <asp:DropDownList ID="DropDownList_month_E" runat="server">
                 
                          
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="DropDownList_year_E" runat="server">
                            </asp:DropDownList>
            </td>
            <td>

            </td>
            </tr>
                <%--Edit finish time--%>
                           <tr>
            <td>
        <asp:Label ID="Label_finish_time_E" runat="server" Text="تاريخ اتمام"></asp:Label>
            </td>
            <td>
                      <asp:DropDownList ID="DropDownList_day_finish_E" runat="server">

                            </asp:DropDownList>
                       
                            <asp:DropDownList ID="DropDownList_month_finish_E" runat="server">
     
                          
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="DropDownList_year_finish_E" runat="server">
                            </asp:DropDownList>
            </td>
            <td>

            </td>
            </tr>
                       <%-- Edit Institute name--%>
                                 <tr>
            <td>
      <asp:Label ID="Label_institute_name_E" runat="server" Text="نام موسسه"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBox_institute_name_E" runat="server"></asp:TextBox>
            </td>
            <td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator_institute_name_E"  ControlToValidate="TextBox_institute_name_E"
                    Text="نام موسسه را مشخص كنيد" ValidationGroup="career"
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
            </tr> 
            
           <%-- update career button--%>
                      <tr>
            <td>

            </td>
            <td>
     <asp:Button ID="Button_update_career" runat="server" Text="اعمال تغييرات" 
                   onclick="Button_update_career_Click" />
            </td>
            <td>
<asp:HyperLink ID="HyperLink_returnFrom_edit_career" runat="server">بازگشت</asp:HyperLink>
            </td>
            </tr>
           </table>
       
   
        
        
      
   
        
            
        </asp:View>
        <asp:View ID="View4" runat="server">  
        <table style="text-align:right;direction:rtl;width:100%;">
            <%--  Edit      Language name--%>
        <tr>
        <td>
             <asp:Label ID="Label4e" runat="server" Text="زبان خارجي"></asp:Label>
        </td>
        <td>
                   <asp:DropDownList ID="DropDownList_Language_E" runat="server">
               <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                  <asp:ListItem Text="انگليسي"></asp:ListItem>
                  <asp:ListItem Text="آلماني"></asp:ListItem>
                  <asp:ListItem Text="روسي"></asp:ListItem>
                  <asp:ListItem Text="فرانسوي"></asp:ListItem>
                  <asp:ListItem Text="عربي"></asp:ListItem>
               </asp:DropDownList>
        </td>
        <td>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator_Language_E" runat="server" ControlToValidate="DropDownList_Language"
                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد" ValidationGroup="Language"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
        </tr>
        
            <%--Edit Read & Write skill--%>
                    <tr>
        <td>
             <asp:Label ID="Label6e" runat="server" Text="مهارت خواندن و نوشتن" ></asp:Label>
        </td>
        <td>
              <asp:DropDownList ID="DropDownList_RandW_Skill_E" runat="server">
               <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                  <asp:ListItem Text="عالي"></asp:ListItem>
                  <asp:ListItem Text="خوب"></asp:ListItem>
                  <asp:ListItem Text="متوسط"></asp:ListItem>
                  <asp:ListItem Text="ضعيف"></asp:ListItem>
                  
               </asp:DropDownList>
        </td>
        <td>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator_RandW_Skill_E" runat="server" ControlToValidate="DropDownList_RandW_Skill_E"
                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد" ValidationGroup="Language"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
        </tr>
        <%-- Edit Speaking skill--%>
        
                <tr>
        <td>
                 <asp:Label ID="Label5a" runat="server" Text="مهارت مكالمه" ></asp:Label>
        </td>
        <td>
                          <asp:DropDownList ID="DropDownList_SpeakSkill_E" runat="server">
               <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                  <asp:ListItem Text="عالي"></asp:ListItem>
                  <asp:ListItem Text="خوب"></asp:ListItem>
                  <asp:ListItem Text="متوسط"></asp:ListItem>
                  <asp:ListItem Text="ضعيف"></asp:ListItem>
                  
               </asp:DropDownList>
        </td>
        <td>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator_SpeakSkill_E" runat="server" ControlToValidate="DropDownList_SpeakSkill_E"
                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد" ValidationGroup="Language"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
        </tr>
                          <%-- update language button--%>  
                          
    <tr>
        <td>
        
        </td>
        <td>
                       <asp:Button ID="Button_update_lang" runat="server" Text="اعمال تغييرات" 
                   onclick="Button_update_lang_Click" />
        </td>
        <td>
          <asp:HyperLink ID="HyperLink_return_from_editLang" runat="server">بازگشت</asp:HyperLink>
        </td>
        </tr>
            </table>
      
        
        </asp:View>
              <asp:View ID="View5" runat="server">
<%--       editing education--%>
              
              <table style ="text-align:right;direction:rtl;width:100%;">
          <%--Edit field--%>
                  <tr>
        <td>
                <asp:Label ID="Label8_E" runat="server" Text="رشته و گرايش"></asp:Label>
        </td>
        <td>
          <asp:TextBox ID="TextBox_field_E" runat="server"></asp:TextBox>
        </td>
        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_field_E" runat="server"  ControlToValidate="TextBox_field_E"
                 Text="رشته و گرايش خود را مشخص كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
        </tr>    
         <%--Edit Last document--%>
                <tr>
        <td>
                     <asp:Label ID="Label9_E" runat="server" Text="آخرين مدرك تحصيلي"></asp:Label>
        </td>
        <td>
                       <asp:DropDownList ID="DropDownList_Last_doc_E" runat="server">
               <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                  <asp:ListItem Text="ديپلم"></asp:ListItem>
                  <asp:ListItem Text="فوق ديپلم"></asp:ListItem>
                  <asp:ListItem Text="ليسانس"></asp:ListItem>
                  <asp:ListItem Text="فوق ليسانس"></asp:ListItem>
                   <asp:ListItem Text="دكترا"></asp:ListItem>
                  
               </asp:DropDownList>
        </td>
        <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Last_doc_E" runat="server" ControlToValidate="DropDownList_Last_doc_E"
                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
        </tr>
                 <%--Edit country--%>
         <tr>
        <td>
                   <asp:Label ID="Label10_E" runat="server" Text="كشور"></asp:Label>
        </td>
        <td>
                      <asp:TextBox ID="TextBox_country_E" runat="server"></asp:TextBox>
        </td>
        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_country_E" runat="server"  ControlToValidate="TextBox_country_E"
                 Text="كشور محل تحصيل خود را مشخص كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
        </tr>
               <%--Edit city--%>
    <tr>
        <td>
                 <asp:Label ID="Label11_E" runat="server" Text="شهر"></asp:Label>
        </td>
        <td>
                       <asp:TextBox ID="TextBox_city_E" runat="server"></asp:TextBox>
        </td>
        <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_city_E" runat="server"  ControlToValidate="TextBox_city_E"
                 Text="شهر محل تحصيل خود را مشخص كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
        </tr>
                <%--Edit university--%>
                        <tr>
        <td>
             <asp:Label ID="Label12_E" runat="server" Text="دانشگاه"></asp:Label>
        </td>
        <td>
                  <asp:TextBox ID="TextBox_university_E" runat="server"></asp:TextBox>
        </td>
        <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_university_E" runat="server"  ControlToValidate="TextBox_university_E"
                 Text="دانشگاه محل تحصيل خود را مشخص كنيد" ValidationGroup="Education"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        </td>
        </tr>
            <%--Edit Average--%>
                    <tr>
        <td>
                      <asp:Label ID="Label13_E" runat="server" Text="معدل" ></asp:Label>
        </td>
        <td>
         <asp:TextBox ID="TextBox_average_E" runat="server" MaxLength="5"></asp:TextBox>
        </td>
        <td>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator_average_E" runat="server"  ControlToValidate="TextBox_average_E"
                 Text="معدل خود را مشخص كنيد" ValidationGroup="Education" Display="Dynamic"
                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1_E" runat="server" ControlToValidate="TextBox_average_E" ValidationGroup="Education" 
                ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" Text="معدل وارد شده معتبر نيست"></asp:CompareValidator>
        </td>
        </tr>
               <%--Edit  start time Edu--%>
                       <tr>
        <td>
                 <asp:Label ID="Label_start_time_edu_E" runat="server" Text="تاريخ شروع"></asp:Label>
        </td>
        <td>
                              <asp:DropDownList ID="DropDownList_day_edu_E" runat="server">

                            </asp:DropDownList>
                       
                            <asp:DropDownList ID="DropDownList_month_edu_E" runat="server">
                 
                          
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="DropDownList_year_edu_E" runat="server">
                            </asp:DropDownList>
        </td>
        <td>
        
        </td>
        </tr>
            <%-- Edit finish time--%>
                    <tr>
        <td>
           <asp:Label ID="Label_finish_time_edu_E" runat="server" Text="تاريخ اتمام"></asp:Label>
        </td>
        <td>
                            <asp:DropDownList ID="DropDownList_day_edu_finish_E" runat="server">

                            </asp:DropDownList>
                       
                            <asp:DropDownList ID="DropDownList_month_edu_finish_E" runat="server">
     
                          
                            </asp:DropDownList>
                     
                            <asp:DropDownList ID="DropDownList_year_edu_finish_E" runat="server">
                            </asp:DropDownList>
        </td>
        <td>
        
        </td>
        </tr>
            <%-- update education button--%>
                    <tr>
        <td>
        
        </td>
        <td>
               <asp:Button ID="Button_update_edu" runat="server" Text="اعمال تغييرات" 
                   onclick="Button_update_edu_Click" />
        </td>
        <td>
           <asp:HyperLink ID="HyperLink_return_from_editEdu" runat="server">بازگشت</asp:HyperLink>
        </td>
        </tr>
              </table>


       
        
         
              
        </asp:View>
              <asp:View ID="View6" runat="server">
                  <asp:Label ID="Label_return_from_edit" runat="server" Text="تغييرات شما با موفقيت اعمال شد"></asp:Label>
              <asp:HyperLink ID="HyperLink_returnFrom_edit" runat="server">بازگشت</asp:HyperLink>
        </asp:View>
        
     </asp:MultiView>
</div>
</asp:Content>