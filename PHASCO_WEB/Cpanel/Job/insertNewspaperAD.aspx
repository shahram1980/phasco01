<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/admin.Master" CodeBehind="insertNewspaperAD.aspx.cs" Inherits="Rahbina.Administrator.Job.insertNewspaperAD" %>

 

<asp:Content ID="content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:MultiView ID="MultiView1" runat="server">
<%--  inserting newspaper advertisment--%>
        <asp:View ID="View1" runat="server">
        <table>
<%--        the topic of AD--%>
       <tr>
       <td>
           <asp:Label ID="Label_AdTopic" runat="server" Text="عنوان آگهي"></asp:Label>
       </td>
       <td>
           <asp:TextBox ID="TextBox_AdTopic" runat="server"></asp:TextBox>
       </td>
       <td>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Text="مشخص كنيد"
            ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox_AdTopic"></asp:RequiredFieldValidator>
       </td>
       </tr>
   <%--  explenation --%>
   <tr>
   <td>
   <asp:Label ID="Label_explenation" runat="server" Text="توضيحات"></asp:Label>
   </td>
   <td>
    <asp:TextBox ID="TextBox_explenation" runat="server" TextMode="MultiLine" Columns="30" Rows="4"></asp:TextBox>
   </td>
   <td>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator_explenation" runat="server" Text="مشخص كنيد"
            ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox_explenation"></asp:RequiredFieldValidator>
   </td>
   </tr>
   <%--TimeOutCall--%>
   <tr>
   <td>
   <asp:Label ID="Label_TimeOutCall" runat="server" Text="مهلت تماس"></asp:Label>
   </td>
   <td>
   <asp:TextBox ID="TextBox_TimeOutCall" runat="server" ReadOnly="true"></asp:TextBox>
    <img alt="مهلت تماس" src="~/job/date.jpeg" onclick="DisplayCalendar()" width="30px" height="30px" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_TimeOutCall"
              Text="تاريخ را وارد كنيد" ValidationGroup="note" 
               ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    
   <div id="Datepicker">
 <asp:Calendar ID="Calendar1" runat="server" onselectionchanged="Calendar1_SelectionChanged"
             ></asp:Calendar>
   </div>
   </td>
   </tr>
 <%--  newspaper name --%>
  <tr>
   <td>
   <asp:Label ID="Label_newsPaperNmae" runat="server" Text="روزنامه"></asp:Label>
   </td>
   <td>
    <asp:TextBox ID="TextBox_newsPaperNmae" runat="server" ></asp:TextBox>
   </td>
   <td>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Text="نام روزنامه مشخص كنيد"
            ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox_newsPaperNmae"></asp:RequiredFieldValidator>
   </td>
   </tr>
    <%--  newspaper date --%>
  <tr>
   <td>
   <asp:Label ID="Label_newsPaperDate" runat="server" Text="تاريخ روزنامه"></asp:Label>
   
   </td>
   <td>
    <asp:TextBox ID="TextBox_newsPaperDate" runat="server" ReadOnly="true" ></asp:TextBox>
    <img alt="مهلت تماس" src="~/job/date.jpeg" onclick="DisplayCalendar2()" width="30px" height="30px" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_TimeOutCall"
              Text="تاريخ را وارد كنيد" ValidationGroup="note" 
               ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    
   <div id="Datepicker2">
 <asp:Calendar ID="Calendar_newsPaperDate" runat="server" onselectionchanged="Calendar_newsPaperDate_SelectionChanged" 
             ></asp:Calendar></div>
   </td>
   <td>
     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Text="نام روزنامه مشخص كنيد"
            ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox_newsPaperDate"></asp:RequiredFieldValidator>
   </td>
   </tr>
 <%--  number--%>
   <tr>
   <td>
   <asp:Label ID="Label_number" runat="server" Text="شماره روزنامه"></asp:Label>
   </td>
   <td>
    <asp:TextBox ID="TextBox_number" runat="server" ></asp:TextBox>
   </td>
   <td>
       <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox_number"
       ErrorMessage="CompareValidator" Text="فقط عدد وارد كنيد" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
   </td>
   </tr>
   <%--advertisement image--%>
   <tr>
   <td>
       <asp:Label ID="Label_img" runat="server" Text="تصوير آگهي"></asp:Label>
   </td>
   <td>
       <asp:FileUpload ID="FileUpload_img" runat="server"   />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="FileUpload_img"
        ErrorMessage="  لطفا یک فایل تصویر با فرمتهای (jpg)یا(gif)یا(jpeg)یا(png)یا(bmp)انتخاب کنید " SetFocusOnError="True" ValidationExpression="^.+\.((jpg)|(JPG)|(gif)|(GIF)|(jpeg)|(JPEG)|(png)|(PNG)|(bmp)|(BMP))$"
        Display="Dynamic"></asp:RegularExpressionValidator>
   </td>
   <td>
   
   </td>
   </tr>
        </table>
        <%--insert advertisment--%>
        <table>
        <tr>
        <td>
            <asp:Button ID="Button_insert_AD" runat="server" Text="درج آگهي" onclick="Button_insert_AD_Click" 
              />
        </td>
        </tr>
        </table>
        </asp:View>
            <%--inserting details of newspaper advertisment--%>
            
    <asp:View ID="View2" runat="server">
        <asp:Label ID="Label1" runat="server" Text=" در اين قسمت مي توانيد مشاغل مربوط به آگهي را ويرايش، اضافه و حذف نماييد "></asp:Label>
        <asp:HyperLink ID="HyperLink_returnFrom_SubAd" runat="server" Visible="false">بازگشت</asp:HyperLink>
    <hr />
<table>
<tr>
<td>
    <asp:Label ID="Label_JobTitle" runat="server" Text="عنوان شغل"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_JobTitle" runat="server" MaxLength="49"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="TextBox_JobTitle"
    ErrorMessage="RequiredFieldValidator" Text="عنوان شغل را مشخص كنيد"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
   <td>
   <asp:Label ID="Label_EduField" runat="server" Text="رشته"></asp:Label>
   </td> 
   <td>
       <asp:TextBox ID="TextBox_EduField" runat="server" MaxLength="49"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox_EduField"
        ErrorMessage="RequiredFieldValidator" Text="رشته مرد نظر را مشخص كنيد "></asp:RequiredFieldValidator>
   </td>
</tr>
<tr>
<td>
    <asp:Label ID="Label_EduTendency" runat="server" Text="گرايش"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_EduTendency" runat="server" MaxLength="49" ></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label_EduDegree" runat="server" Text="مدرک تحصيلي"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_EduDegree" runat="server" MaxLength="49"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="Button_insert_SubAd" runat="server" Text="درج شغل مورد نياز" 
        onclick="Button_insert_SubAd_Click" />
</td>
</tr>
</table>
<fieldset>
<legend>مشاغل درج شده</legend>
<%--showing inserted jobs--%>
  <asp:GridView ID="GridView_Jobs" runat="server" 
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <Columns>
            <asp:BoundField HeaderText="عنوان شغل" DataField="JobTitle" />
       <asp:BoundField HeaderText="رشته " DataField="EduField" />
      <asp:BoundField HeaderText="گرايش" DataField="EduTendency" />
            <asp:BoundField HeaderText="مدرک تحصيلي" DataField="EduDegree" />
                 
                  <asp:TemplateField HeaderText="گزينه ها">
                  <ItemTemplate>
              
                      <asp:Label ID="Label_options" runat="server" Text='<%#Set_Url_SubAd(Eval("id")) %>'></asp:Label>
                  </ItemTemplate>
                  </asp:TemplateField>
                 
            </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>

</fieldset>
    </asp:View>
    <%--delete confirmation--%>
    <asp:View ID="View3" runat="server">
        <asp:Label ID="Label_report" runat="server" Text=""></asp:Label>
        <asp:HyperLink ID="HyperLink_return" runat="server">بازگشت</asp:HyperLink>
    </asp:View>
    <%--edit jobcapacity--%>
    <asp:View ID="View4" runat="server">
    <fieldset>
    <legend>ويرايش اطلاعات شغلي</legend>
    <table>
<tr>
<td>
    <asp:Label ID="Label_JobTitleE" runat="server" Text="عنوان شغل"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_JobTitleE" runat="server" MaxLength="49"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6E" runat="server"  ControlToValidate="TextBox_JobTitleE"
    ErrorMessage="RequiredFieldValidator" Text="عنوان شغل را مشخص كنيد"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
   <td>
   <asp:Label ID="Label_EduFieldE" runat="server" Text="رشته"></asp:Label>
   </td> 
   <td>
       <asp:TextBox ID="TextBox_EduFieldE" runat="server" MaxLength="49"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator7E" runat="server" ControlToValidate="TextBox_EduFieldE"
        ErrorMessage="RequiredFieldValidatorE" Text="رشته مرد نظر را مشخص كنيد "></asp:RequiredFieldValidator>
   </td>
</tr>
<tr>
<td>
    <asp:Label ID="Label_EduTendencyE" runat="server" Text="گرايش"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_EduTendencyE" runat="server" MaxLength="49" ></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Label ID="Label_EduDegreeE" runat="server" Text="مدرک تحصيلي"></asp:Label>
</td>
<td>
    <asp:TextBox ID="TextBox_EduDegreeE" runat="server" MaxLength="49"></asp:TextBox>
</td>
</tr>
<tr>
<td>
    <asp:Button ID="Button_Edit_job" runat="server" Text="ذخيره تغييرات" onclick="Button_Edit_job_Click" 
         />
</td>
<td>
    <asp:HyperLink ID="HyperLink_return_from_edit" runat="server">بازگشت</asp:HyperLink>
</td>
</tr>
</table>
    </fieldset>
    </asp:View>
    </asp:MultiView>

</asp:Content>