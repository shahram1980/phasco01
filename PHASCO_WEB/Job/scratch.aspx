<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="scratch.aspx.cs" Inherits="Rahbina.Job.scratch" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <fieldset dir="rtl">
    <legend>
جديدترين رزومه ها
    </legend>
    
    
       <asp:GridView ID="GridView_recent_resumes" runat="server"  

   
              AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None"    >

              <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
              <Columns>
              <asp:TemplateField HeaderText="زمينه فعاليت">
              <ItemTemplate>
                  <asp:Label ID="Label_CategoryID" runat="server" Text='<%#get_category_name(Eval("CategoryID")) %>'></asp:Label>
              </ItemTemplate>
              </asp:TemplateField>
               <asp:TemplateField HeaderText="زمينه تخصصي">
              <ItemTemplate>
                  <asp:Label ID="Label_CategoryID" runat="server" Text='<%#get_category_name(Eval("CategoryID_Sub")) %>'></asp:Label>
              </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderText="تاريخ درج ">
              <ItemTemplate>
                  <asp:Label ID="Label_CategoryID" runat="server" Text='<%#GetfarsiDate(Eval("InsertDate")) %>'></asp:Label>
              </ItemTemplate>
              </asp:TemplateField>
       
           
               
                 <asp:HyperLinkField Text="جزئيات بيشتر" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/job/SearchResumes.aspx?ResumeID={0}" />
                
              </Columns>
   
    
              <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
              <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <AlternatingRowStyle BackColor="White" />
   
    
    </asp:GridView>
    </fieldset>
    <hr />
    <fieldset dir="rtl">
    <legend>جديدترين آگهي ها</legend>
        <asp:GridView ID="GridView_recent_ADs" runat="server"   EnableViewState="false"
  
 
              AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None"   >

              <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
              <Columns>
              <asp:BoundField HeaderText="نام شركت" DataField="Company_name" />
              <asp:TemplateField HeaderText="تاريخ درج آگهي">
              <ItemTemplate>
                  <asp:Label ID="Label_date" runat="server" Text='<%#GetfarsiDate(Eval("insertionDate")) %>'></asp:Label>
              </ItemTemplate>
              </asp:TemplateField>
                <asp:BoundField HeaderText="زمينه فعاليت" DataField="JobTitle" />
                 <asp:BoundField HeaderText="زمينه تخصصي" DataField="Required_specialty" />
                  <asp:BoundField HeaderText=" مقطع تحصيلي" DataField="Edu_step" />
                  <asp:TemplateField HeaderText="استان محل فعاليت">
                  <ItemTemplate>
                    <asp:Label ID="Label_state" runat="server" Text='<%#evaluateState(Eval("_state")) %>'></asp:Label>
                  </ItemTemplate>                  
                  </asp:TemplateField>
                 <asp:HyperLinkField Text="جزئيات بيشتر" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/job/SearchEmploymentAD.aspx?id={0}" />
                
              </Columns>
   
    
              <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
              <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
              <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
              <AlternatingRowStyle BackColor="White" />
   
    
    </asp:GridView>
    </fieldset>
    </div>
    </form>
</body>
</html>
