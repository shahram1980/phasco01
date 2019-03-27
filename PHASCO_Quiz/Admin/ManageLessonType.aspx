<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageLessonType.aspx.cs" MasterPageFile="~/Template/Phasco01.Master" Inherits="OnlineTest.Admin.ManageLessonType" %>

<asp:Content ID="content1" ContentPlaceHolderID="head_Meta" runat="server">
<style type="text/css">
.grd
{
    width:400px;
}
</style>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="Plc" runat="server">
    <div style="padding:20px;">
        <div style="width:100%; text-align:center; direction:rtl;">
    <h1>مدیریت نوع دروس</h1>
    </div>
     <asp:Button ID="ButtonAdd_LessonType" runat="server" Text="افزودن نوع جدید" onclick="ButtonAdd_LessonType_Click"  
           />
    <br />
    <br />
          <asp:GridView ID="GridView_LessonType" runat="server" AutoGenerateColumns="False" CellPadding="3" CssClass="grd"
            DataKeyNames="id" OnRowCancelingEdit="GridView_LessonType_RowCancelingEdit" OnRowDataBound="GridView_LessonType_RowDataBound"
            OnRowDeleting="GridView_LessonType_RowDeleting" OnRowEditing="GridView_LessonType_RowEditing" 
              OnRowUpdating="GridView_LessonType_RowUpdating" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px" >
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <Columns>
                <asp:CommandField HeaderText="ویرایش " ShowEditButton="True" EditText="ویرایش" CancelText="انصراف"  InsertText="افزودن" UpdateText="اعمال تغییرات"/>
                
                
                   <asp:BoundField DataField="id" HeaderText="کد" ReadOnly="True" />
                <asp:BoundField DataField="LessonType" HeaderText="نوع درس" />
                <asp:CommandField HeaderText="حذف " ShowDeleteButton="True" DeleteText="حذف" />
            </Columns>
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>
</asp:Content>

