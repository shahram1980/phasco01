<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuestionsOFaLesson.aspx.cs"  MasterPageFile="~/Template/Phasco01.Master"  Inherits="OnlineTest.Admin.QuestionsOFaLesson" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>


<asp:Content ID="content1" ContentPlaceHolderID="head_Meta" runat="server">
<style type="text/css">
.grd
{
    width:100%;
    direction:rtl;
}
</style>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="Plc" runat="server">
    <div>
        <div style="width:100%; text-align:center; direction:rtl;">
    <h1>مدیریت سوالات </h1>
    </div>
      <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
        
            <div>
    <table style="width:100%; direction:rtl;">
    <%--QuestionBody          QuestionBody          QuestionBody          QuestionBody          --%>
    <tr>
    <td style="width:15%;">
    متن سوال
    </td>
        <td style="width:60%;">
            <FCKeditorV2:FCKeditor ID="FCKeditor_QuestionBody" runat="server">
            </FCKeditorV2:FCKeditor> 
    </td>
        <td style="width:20%;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FCKeditor_QuestionBody" 
            Text="متن سوال را مشخص کنید"  ValidationGroup="Insert" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </td>
    
    </tr>
    <%--QuestionAnatomicalResponse              QuestionAnatomicalResponse              QuestionAnatomicalResponse              QuestionAnatomicalResponse              --%>
        <tr>
    <td style="width:15%;">
               پاسخ تشریحی 
    </td>
        <td style="width:60%;">
            <FCKeditorV2:FCKeditor ID="FCKeditor_QuestionAnatomicalResponse" runat="server">
            </FCKeditorV2:FCKeditor>
  
    </td>
        <td style="width:20%;">
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FCKeditor_QuestionAnatomicalResponse" 
            Text="پاسخ تشریحی را مشخص کنید"  ValidationGroup="Insert" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </td>
    
    </tr>
    <%--LessonCoefficient               LessonCoefficient               LessonCoefficient               --%>
            <tr>
    <td style="width:15%;">
    گزینه ها
    </td>
  
        <td style="width:60%;">
     <table style="width:100%;">
     <tr>
     <td style="width:10%; text-align:right; direction:rtl;">
         <asp:RadioButton ID="RadioButton_SwitchBody1" runat="server" Text="1" GroupName="switch"  Checked="true"/>
     </td>
     
          <td style="width:80%;">
             
              
              <FCKeditorV2:FCKeditor ID="FCKeditor_SwitchBody1" runat="server">
              </FCKeditorV2:FCKeditor>
     </td>
          <td style="width:10%;">
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FCKeditor_SwitchBody1" 
            Text="*"  ValidationGroup="Insert" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
          <tr>
     <td style="width:10%;">
     <asp:RadioButton ID="RadioButton_SwitchBody2" runat="server" Text="2" GroupName="switch"/>
     </td>
     
          <td style="width:80%;">
          <FCKeditorV2:FCKeditor ID="FCKeditor_SwitchBody2" runat="server">
              </FCKeditorV2:FCKeditor>
     </td>
          <td style="width:10%;">
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FCKeditor_SwitchBody2" 
            Text="*"  ValidationGroup="Insert" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
     
          <tr>
     <td style="width:10%;">
       <asp:RadioButton ID="RadioButton_SwitchBody3" runat="server" Text="3" GroupName="switch"/>
     </td>
     
          <td style="width:80%;">
            <FCKeditorV2:FCKeditor ID="FCKeditor_SwitchBody3" runat="server">
              </FCKeditorV2:FCKeditor>
     </td>
          <td style="width:10%;">
       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FCKeditor_SwitchBody3" 
            Text="*"  ValidationGroup="Insert" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
          <tr>
     <td style="width:10%;">
     <asp:RadioButton ID="RadioButton_SwitchBody4" runat="server" Text="4" GroupName="switch"/>
     </td>
     
          <td style="width:80%;">
              <FCKeditorV2:FCKeditor ID="FCKeditor_SwitchBody4" runat="server">
              </FCKeditorV2:FCKeditor>
     </td>
          <td style="width:10%;">
       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FCKeditor_SwitchBody4" 
            Text="*"  ValidationGroup="Insert" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
     </td>
     </tr>
     </table>
    </td>
          <td style="width:20%;">
    
    </td>
    </tr>

    <tr>
        <td style="width:20%;">
    
    </td>
        <td style="width:60%; text-align:center;">
                   <asp:Button ID="ButtonAdd_QuestionAndAnswerOfLesson" runat="server" Text="افزودن سوال و پاسخ ها"  
            ValidationGroup="Insert" onclick="ButtonAdd_QuestionAndAnswerOfLesson_Click" style="height: 26px" 
           />   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Label ID="Label_report" runat="server" Text="" EnableViewState="false"></asp:Label>
    </td>
        <td style="width:20%;">
    
    </td>
    </tr>
    </table>

    <br />
    <br />
          <asp:GridView ID="GridView_Questions" runat="server" AutoGenerateColumns="False" CellPadding="3"
            DataKeyNames="id" BackColor="White" BorderColor="#CCCCCC"  CssClass="grd"
              BorderStyle="None" BorderWidth="1px" >
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <Columns>
               
                
                
                   <asp:BoundField DataField="id" HeaderText="کد" ReadOnly="True" />
                       <asp:TemplateField HeaderText="سوال">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("QuestionBody") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                                 <asp:TemplateField HeaderText="پاسخ تشریحی">
                                <ItemTemplate>
                               <asp:Label ID="Label19" runat="server" Text='<%#Eval("QuestionAnatomicalResponse") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <asp:TemplateField HeaderText="گزینه صحیح">
                                <ItemTemplate>
                               <asp:Label ID="Label71" runat="server" Text='<%#Eval("SwitchBody") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                 
                   <asp:BoundField DataField="SwitchNumber" HeaderText="شماره گزینه" />
                    
               
                                  <asp:TemplateField HeaderText="حذف">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton_delete" runat="server" CommandArgument='<%#Eval("id")  %>'
                                        OnClientClick="return confirm(&quot;سوال موردنظرحذفشود؟&quot;)"  OnCommand="LinkButton_deleteCMD"
                                        ValidationGroup="delete2">حذف سوال</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                                 <asp:TemplateField HeaderText="ویرایش">
                                <ItemTemplate>
                                  <a href="QuestionsOFaLesson.aspx?status=edit&id=<%#Eval("LessonID") %>&QuestionID=<%#Eval("id") %>">مشاهده و ویرایش</a>
                                </ItemTemplate>
                            </asp:TemplateField>
             
            </Columns>
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>
        </asp:View>
        
        <asp:View ID="View2" runat="server">
        
            <div>
    <table style="width:100%; direction:rtl;">
    <%--QuestionBody          QuestionBody          QuestionBody          QuestionBody          --%>
    <tr>
    <td style="width:15%;">
    متن سوال
    </td>
        <td style="width:60%;">
            <FCKeditorV2:FCKeditor ID="FCKeditor_QuestionBody_E" runat="server">
            </FCKeditorV2:FCKeditor> 
    </td>
        <td style="width:20%;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1_E" runat="server" ControlToValidate="FCKeditor_QuestionBody_E" 
            Text="متن سوال را مشخص کنید"  ValidationGroup="edit" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </td>
    
    </tr>
    <%--QuestionAnatomicalResponse              QuestionAnatomicalResponse              QuestionAnatomicalResponse              QuestionAnatomicalResponse              --%>
        <tr>
    <td style="width:15%;">
               پاسخ تشریحی 
    </td>
        <td style="width:60%;">
            <FCKeditorV2:FCKeditor ID="FCKeditor_QuestionAnatomicalResponse_E" runat="server">
            </FCKeditorV2:FCKeditor>
  
    </td>
        <td style="width:20%;">
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2_E" runat="server" ControlToValidate="FCKeditor_QuestionAnatomicalResponse_E" 
            Text="پاسخ تشریحی را مشخص کنید"  ValidationGroup="edit" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
    </td>
    
    </tr>
    <%--LessonCoefficient               LessonCoefficient               LessonCoefficient               --%>
            <tr>
    <td style="width:15%;">
    گزینه ها
    </td>
  
        <td style="width:60%;">
     <table style="width:100%;">
     <tr>
     <td style="width:10%; text-align:right; direction:rtl;">
         <asp:RadioButton ID="RadioButton_SwitchBody1_E" runat="server" Text="1" GroupName="switch"  Checked="true"/>
     </td>
     
          <td style="width:80%;">
              <asp:HiddenField ID="HiddenField_SwitchID1" runat="server" />
              
              <FCKeditorV2:FCKeditor ID="FCKeditor_SwitchBody1_E" runat="server">
              </FCKeditorV2:FCKeditor>
     </td>
          <td style="width:10%;">
       <asp:RequiredFieldValidator ID="RequiredFieldValidator3_E" runat="server" ControlToValidate="FCKeditor_SwitchBody1_E" 
            Text="*"  ValidationGroup="edit" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
          <tr>
     <td style="width:10%;">
     <asp:RadioButton ID="RadioButton_SwitchBody2_E" runat="server" Text="2" GroupName="switch"/>
     </td>
     
          <td style="width:80%;">
            <asp:HiddenField ID="HiddenField_SwitchID2" runat="server" />
          <FCKeditorV2:FCKeditor ID="FCKeditor_SwitchBody2_E" runat="server">
              </FCKeditorV2:FCKeditor>
     </td>
          <td style="width:10%;">
       <asp:RequiredFieldValidator ID="RequiredFieldValidator4_E" runat="server" ControlToValidate="FCKeditor_SwitchBody2_E" 
            Text="*"  ValidationGroup="edit" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
     
          <tr>
     <td style="width:10%;">
       <asp:RadioButton ID="RadioButton_SwitchBody3_E" runat="server" Text="3" GroupName="switch"/>
     </td>
     
          <td style="width:80%;">
           <asp:HiddenField ID="HiddenField_SwitchID3" runat="server" />
            <FCKeditorV2:FCKeditor ID="FCKeditor_SwitchBody3_E" runat="server">
              </FCKeditorV2:FCKeditor>
     </td>
          <td style="width:10%;">
       <asp:RequiredFieldValidator ID="RequiredFieldValidator5_E" runat="server" ControlToValidate="FCKeditor_SwitchBody3_E" 
            Text="*"  ValidationGroup="edit" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
     </td>
     </tr>
     
          <tr>
     <td style="width:10%;">
     <asp:RadioButton ID="RadioButton_SwitchBody4_E" runat="server" Text="4" GroupName="switch"/>
     </td>
     
          <td style="width:80%;">
          <asp:HiddenField ID="HiddenField_SwitchID4" runat="server" />
              <FCKeditorV2:FCKeditor ID="FCKeditor_SwitchBody4_E" runat="server">
              </FCKeditorV2:FCKeditor>
     </td>
          <td style="width:10%;">
       <asp:RequiredFieldValidator ID="RequiredFieldValidator6_E" runat="server" ControlToValidate="FCKeditor_SwitchBody4_E" 
            Text="*"  ValidationGroup="edit" Display="Dynamic" 
            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
     </td>
     </tr>
     </table>
    </td>
          <td style="width:20%;">
    
    </td>
    </tr>

    <tr>
        <td style="width:20%;">
    
    </td>
        <td style="width:30%;">
                   <asp:Button ID="ButtonAdd_QuestionAndAnswerOfLesson_E" runat="server" Text="ویرایش سوال و پاسخ ها"  
            ValidationGroup="edit"  style="height: 26px" onclick="ButtonAdd_QuestionAndAnswerOfLesson_E_Click" 
           />   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="Button_return" runat="server" Text="بازگشت"  
            ValidationGroup="return"  style="height: 26px" onclick="Button_return_Click" 
           />   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Label ID="Label_report_E" runat="server" Text="" EnableViewState="false"></asp:Label>
    </td>
        <td style="width:30%;">
    
    </td>
    </tr>
    </table>

    <br />
    <br />
        
    </div>
        </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>


