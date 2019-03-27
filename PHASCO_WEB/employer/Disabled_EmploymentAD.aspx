<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true" CodeBehind="Disabled_EmploymentAD.aspx.cs" Inherits="PHASCO_WEB.employer.Disabled_EmploymentAD" %>
<asp:Content ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:ScriptManager ID="ScriptManger1" runat="server"></asp:ScriptManager>

<h3>آگهی های غیر فعال و منقضی شده</h3>
<asp:MultiView ID="MultiView1" runat="server">
   <%-- view summary of advertisments--%>
        <asp:View ID="View1" runat="server">
                    <asp:GridView ID="GridView_enabled_ad" runat="server"  AllowPaging="true"
             PagerSettings-FirstPageText="صفحه اول" PagerSettings-LastPageText="صفحه آخر" PagerSettings-NextPageText=" صفحه بعد" 
             PagerSettings-PreviousPageText="صفحه قبل"  PageSize="5"  PagerSettings-Mode="NextPreviousFirstLast"
                AutoGenerateColumns="False" CssClass="table table-responsive table-striped rtl-text"
                BorderStyle="None" CellPadding="3" CellSpacing="2" 
                        onpageindexchanging="GridView_waiting_ad_PageIndexChanging">
                <%--<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />--%>
            <Columns>
            <asp:TemplateField HeaderText="عنوان شغلي" >
            <ItemTemplate>
                <asp:Label ID="Label_JobTitle" runat="server" Text='<%#get_category_name(Eval("jobTitle")) %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
                    <asp:TemplateField HeaderText="تخصص مورد نياز" >
            <ItemTemplate>
                <asp:Label ID="Label_JobTitle" runat="server" Text='<%#get_category_name(Eval("Required_specialty")) %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
          
           <asp:TemplateField HeaderText="تاريخ درج">
            <ItemTemplate>
                <asp:Label ID="Label_insert_Date" runat="server" Text='<%#GetfarsiDate(Eval("insertionDate")) %>'></asp:Label>
            </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField HeaderText="گزينه ها" Text="مشاهده و ويرايش" DataNavigateUrlFields="id" DataNavigateUrlFormatString='~/employer/Disabled_EmploymentAD.aspx?id={0}' />
               
      
            
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <%--<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />--%>
            </asp:GridView>
        </asp:View>
     <%--   view and edit advertisment--%>
        <asp:View ID="View2" runat="server">
        
                              <%--job title--%>
   <div class="InstedOfTable" >
    <asp:RequiredFieldValidator ID="RequiredFieldValidator_job_title"  ControlToValidate="DropDownList_job_title"
    Text="لطفا يك مورد را انتخاب كنيد"  ValidationGroup="company" 
     runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator></div>
<div class="InstedOfTable" >
    
        <asp:DropDownList ID="DropDownList_job_title" runat="server" AutoPostBack="true"
     AppendDataBoundItems="true"
     DataTextField="CategoryName" DataValueField="CategoryID" onselectedindexchanged="DropDownList_job_title_SelectedIndexChanged"
    
            >
    <asp:ListItem Text="--انتخاب كنيد--"  Value=""></asp:ListItem>
    </asp:DropDownList>
     



   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_job_title" runat="server" Text="زمينه فعاليت">

</asp:Label>
    </div>
        
   
                      <%--required specialty--%>
     <div class="InstedOfTable" >


    <asp:RequiredFieldValidator ID="RequiredFieldValidator_specialty"  ControlToValidate="DropDownList_specialty"
    Text="لطفا يك مورد را انتخاب كنيد" ValidationGroup="company" 
     runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator></div>
<div class="InstedOfTable" >

    <asp:UpdatePanel ID="UpdatePanel2" runat="server"   >
    <ContentTemplate>
    <asp:DropDownList ID="DropDownList_specialty" runat="server" DataTextField="CategoryName" DataValueField="CategoryID" >

   
   
    </asp:DropDownList>
     
    </ContentTemplate>
   <Triggers >
   <asp:AsyncPostBackTrigger   ControlID="DropDownList_job_title"/>
   </Triggers>
    </asp:UpdatePanel>

   </div>
<div class="InstedOfTable" ><asp:Label ID="Label_specialty" runat="server" Text="زمينه تخصصي">

</asp:Label>
    </div>
         <%--company name--%>
        <div class="InstedOfTable">
          <asp:RequiredFieldValidator ID="RequiredFieldValidator_coname"  ControlToValidate="TextBox_coname"
                            Text="نام موسسه را مشخص كنيد" ValidationGroup="company"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator> 
        </div>
        <div class="InstedOfTable">
            <asp:TextBox ID="TextBox_coname" runat="server" MaxLength="48"></asp:TextBox>
        </div>
        <div class="InstedOfTable">
            <asp:Label ID="Label_coname" runat="server" Text="نام شركت / موسسه"></asp:Label>
        </div>
        <%--Call time out--%>
        <div class="InstedOfTable">
           
        </div>
     <div class="InstedOfTable">
         <asp:TextBox ID="TextBox_call_timeOut" runat="server"></asp:TextBox>
        </div>
          <div class="InstedOfTable">
              <asp:Label ID="Label_call_timeOut" runat="server" Text="مهلت تماس تا"></asp:Label>
        </div>
        <%--address--%>
        <div class="InstedOfTable">
        
        </div>
       <div class="InstedOfTable">
           <asp:TextBox ID="TextBox_address" runat="server" Columns="40"></asp:TextBox>
        </div>
        <div class="InstedOfTable">
            <asp:Label ID="Label2" runat="server" Text="آدرس "></asp:Label>
        </div>
        <%--state--%>
   <div class="InstedOfTable">
  <asp:RequiredFieldValidator ID="RequiredFieldValidator_state"  ControlToValidate="DropDownList_state"
                    Text=" مشخص كنيد" ValidationGroup="company" InitialValue="--انتخاب كنيد--" 
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator> 
</div>
<div class="InstedOfTable">
    <asp:DropDownList ID="DropDownList_state" runat="server"  AutoPostBack="true" onselectedindexchanged="DropDownList_state_SelectedIndexChanged" 
    
        >
    <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
    <asp:ListItem Text="آذربایجان شرقی"></asp:ListItem>
    <asp:ListItem Text="آذربایجان غربی"></asp:ListItem>
    <asp:ListItem Text="اردبیل"></asp:ListItem>
    <asp:ListItem Text="اصفهان"></asp:ListItem>
    
    <asp:ListItem Text="ایلام"></asp:ListItem>
    <asp:ListItem Text="بوشهر"></asp:ListItem>
    <asp:ListItem Text="تهران"></asp:ListItem>
    <asp:ListItem Text="چهار محال و بختیاری"></asp:ListItem>
    <asp:ListItem Text="خراسان جنوبی"></asp:ListItem>
    <asp:ListItem Text="خراسان رضوی"></asp:ListItem>
    
    <asp:ListItem Text="خراسان شمالی"></asp:ListItem>
    <asp:ListItem Text="خورستان"></asp:ListItem>
    <asp:ListItem Text="زنجان"></asp:ListItem>
    <asp:ListItem Text="سمنان"></asp:ListItem>
    <asp:ListItem Text="سیستان و بلوچستان"></asp:ListItem>
    
    <asp:ListItem Text="فارس"></asp:ListItem>
    <asp:ListItem Text="قزوین"></asp:ListItem>
    <asp:ListItem Text="قم"></asp:ListItem>
    <asp:ListItem Text="کردستان"></asp:ListItem>
    
    <asp:ListItem Text="کرمان"></asp:ListItem>
    <asp:ListItem Text="کرمانشاه"></asp:ListItem>
    <asp:ListItem Text="کهکیلویه و بویر احمد"></asp:ListItem>
    <asp:ListItem Text="گلستان"></asp:ListItem>
        
    <asp:ListItem Text="گیلان"></asp:ListItem>
    <asp:ListItem Text="لرستان"></asp:ListItem>
    <asp:ListItem Text="مازندران"></asp:ListItem>
    <asp:ListItem Text="مرکزی"></asp:ListItem>
    
        
    <asp:ListItem Text="هرمزگان"></asp:ListItem>
    <asp:ListItem Text="همدان"></asp:ListItem>
    <asp:ListItem Text="یزد"></asp:ListItem>
 
    </asp:DropDownList>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_state" runat="server" Text="استان محل كار"></asp:Label>
</div>
<%--city--%>
<div class="InstedOfTable">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  ControlToValidate="DropDownList_city"
                    Text=" مشخص كنيد" ValidationGroup="company" InitialValue="--انتخاب كنيد--" 
            runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator> 
</div>
<div class="InstedOfTable">
  
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
     <asp:DropDownList ID="DropDownList_city" runat="server"  DataTextField="city" DataValueField="id">
    
          <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
         
    </asp:DropDownList>
        
    </ContentTemplate>
        
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID="DropDownList_state" />
         
    </Triggers>
    </asp:UpdatePanel>
   
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_city" runat="server" Text=" شهر محل كار"></asp:Label>
</div>
<%--education step--%>
<div class="InstedOfTable"></div>
<div class="InstedOfTable">
    <asp:DropDownList ID="DropDownList_education_step" runat="server">
    <asp:ListItem Text="مهم نيست"></asp:ListItem>
    <asp:ListItem Text="زير ديپلم"></asp:ListItem>
    <asp:ListItem Text="ديپلم"></asp:ListItem>
    <asp:ListItem Text="فوق ديپلم"></asp:ListItem>
    <asp:ListItem Text="ليسانس"></asp:ListItem>
    <asp:ListItem Text="فوق ليسانس"></asp:ListItem>
    <asp:ListItem Text="دكترا"></asp:ListItem>
    </asp:DropDownList>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_education" runat="server" Text="مقطع تحصيلي"></asp:Label>
</div>
<%--job experience --%>
<div class="InstedOfTable">
    <asp:CompareValidator ID="CompareValidator1" runat="server" Operator="DataTypeCheck" Type="Double"
    ControlToValidate="TextBox_experience" Text="فقط عدد وارد كنيد"
     ErrorMessage="CompareValidator"></asp:CompareValidator>
</div>
<div class="InstedOfTable">
    <asp:TextBox ID="TextBox_experience" runat="server" MaxLength="2" Columns="2"></asp:TextBox>
    <asp:Label ID="Label3" runat="server" Text="سال"></asp:Label>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_experience" runat="server" Text="سابقه كار"></asp:Label>
</div>
<%--gender--%>
<div class="InstedOfTable">

</div>
<div class="InstedOfTable">
    <asp:DropDownList ID="DropDownList_gender" runat="server">
    <asp:ListItem Text="مهم نيست"></asp:ListItem>
    <asp:ListItem Text="مرد"></asp:ListItem>
    <asp:ListItem Text="زن"></asp:ListItem>
    </asp:DropDownList>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_gender" runat="server" Text="جنسيت"></asp:Label>
</div>
<%--marriage status--%>
<div class="InstedOfTable">

</div>
<div class="InstedOfTable">
   <asp:DropDownList ID="DropDownList_marriage" runat="server">
    <asp:ListItem Text="مهم نيست"></asp:ListItem>
    <asp:ListItem Text="مجرد"></asp:ListItem>
    <asp:ListItem Text="متاهل"></asp:ListItem>
    </asp:DropDownList>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_marriage" runat="server" Text="وضعيت تاهل "></asp:Label>
</div>
<%--service status--%>
<div class="InstedOfTable">

</div>
<div class="InstedOfTable">
   <asp:DropDownList ID="DropDownList_service" runat="server">
    <asp:ListItem Text="مهم نيست"></asp:ListItem>
    <asp:ListItem Text="پايان خدمت"></asp:ListItem>
    <asp:ListItem Text="معافيت غير پزشكي"></asp:ListItem>
    </asp:DropDownList>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_service" runat="server" Text="وضعيت نظام وضيفه"></asp:Label>
</div>
<%--age--%>
<div class="InstedOfTable">
   
</div>
<div class="InstedOfTable">
<asp:DropDownList ID="DropDownList_age" runat="server">
    <asp:ListItem Text="مهم نيست"></asp:ListItem>
    <asp:ListItem Text="بين 20 تا 30 سال"></asp:ListItem>
    <asp:ListItem Text="بين 30 تا 40 سال "></asp:ListItem>
    </asp:DropDownList>
</div>
<div class="InstedOfTable">
<asp:Label ID="Label_age" runat="server" Text="حداقل و حداكثر سن"></asp:Label>
</div>
<%--phone--%>

<div class="InstedOfTable">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4"  ControlToValidate="TextBox_phone"
     runat="server" ErrorMessage="RequiredFieldValidator" Text="مشخص كنيد"  Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" runat="server" Operator="DataTypeCheck" Type="Double"
    ControlToValidate="TextBox_phone" Text="فقط عدد وارد كنيد"
     ErrorMessage="CompareValidator"></asp:CompareValidator>
</div>
<div class="InstedOfTable">
    <asp:TextBox ID="TextBox_phone" runat="server" Columns="40"></asp:TextBox>
</div>
<div class="InstedOfTable">
    <asp:Label ID="Label_phone" runat="server" Text="تلفن هاي تماس"></asp:Label>
</div>
<%--explenation--%>
<div class="InstedOfTable" style="height:100px;">
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_explenation"
             ErrorMessage="RequiredFieldValidator" Text="مشخص كنيد"></asp:RequiredFieldValidator>
</div>
<div class="InstedOfTable" style="height:100px;">
    <asp:TextBox ID="TextBox_explenation"  TextMode="MultiLine" Columns="32" Rows="5" runat="server"></asp:TextBox>
</div>
<div class="InstedOfTable" style="height:100px;">
    <asp:Label ID="Label_explenation" runat="server" Text="توضيحات"></asp:Label>
</div>
<%--updating an employment advertisment--%>
<div class="InstedOfTable">
    <asp:HyperLink ID="HyperLink_return" runat="server" NavigateUrl="~/Job/Disabled_EmploymentAD.aspx">بازگشت</asp:HyperLink>
</div>
<div class="InstedOfTable">
 <asp:Button ID="Button_update_employment_ad" runat="server" Text=" اعمال تغييرات" onclick="Button_update_employment_ad_Click" 
         />
</div>
<div class="InstedOfTable">
   
</div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Label ID="Label_update_report" runat="server" Text=" تغييرات شما با موفقيت اعمال شد و حالت آگهي به تائيد نشده تغيير يافت"></asp:Label>
            <asp:HyperLink ID="HyperLink_return2" runat="server" NavigateUrl="~/Job/Disabled_EmploymentAD.aspx">بازگشت</asp:HyperLink>
        </asp:View>
    </asp:MultiView>



</asp:Content>

 
