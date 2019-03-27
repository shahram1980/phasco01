<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true" CodeBehind="ManageField.aspx.cs" Inherits="OnlineTest.Admin.ManageField" %>
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
    <h1>مدیریت گروه ها و رشته ها</h1>
    </div>
            <asp:Button ID="ButtonAdd_fieldGroup" runat="server" Text="افزودن گروه" onclick="ButtonAdd_fieldGroup_Click" 
           />
    <br />
    <br />
          <asp:GridView ID="GridView_FieldsGroup" runat="server" AutoGenerateColumns="False" CellPadding="3" CssClass="grd"
            DataKeyNames="id" OnRowCancelingEdit="GridView_FieldsGroup_RowCancelingEdit" OnRowDataBound="GridView_FieldsGroupRowDataBound"
            OnRowDeleting="GridView_FieldsGroup_RowDeleting" OnRowEditing="GridView_FieldsGroup_RowEditing" 
              OnRowUpdating="GridView_FieldsGroup_RowUpdating" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px" >
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <Columns>
                <asp:CommandField HeaderText="ویرایش گروه" ShowEditButton="True" EditText="ویرایش" CancelText="انصراف"  InsertText="افزودن" UpdateText="اعمال تغییرات"/>
                
                
                   <asp:BoundField DataField="id" HeaderText="کد" ReadOnly="True" />
                <asp:BoundField DataField="GroupName" HeaderText="گروه" />
                <asp:CommandField HeaderText="حذف گروه" ShowDeleteButton="True" DeleteText="حذف" />
                                          <asp:TemplateField HeaderText="مشاهده رشته ها">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton_view" runat="server" CommandArgument='<%#Eval("id")  %>'
                                        OnCommand="LinkButton_viewCMD"
                                        ValidationGroup="view">مشاهده</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
            </Columns>
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
        
        <br />
        <hr />
        <br />
        <div runat="server" id="Div_Fields" visible="false">
        
            <asp:HiddenField ID="HiddenField_groupID" runat="server" />
        
                   <asp:Button ID="ButtonAdd_field" runat="server" Text="" onclick="ButtonAdd_field_Click"
           />
    <br />
    <br />
          <asp:GridView ID="GridView_Fields" runat="server" AutoGenerateColumns="False" CellPadding="3" CssClass="grd"
            DataKeyNames="id" OnRowCancelingEdit="GridView_Fields_RowCancelingEdit" OnRowDataBound="GridView_FieldsRowDataBound"
            OnRowDeleting="GridView_Fields_RowDeleting" OnRowEditing="GridView_Fields_RowEditing" 
              OnRowUpdating="GridView_Fields_RowUpdating" BackColor="White" BorderColor="#CCCCCC" 
              BorderStyle="None" BorderWidth="1px" >
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <Columns>
                <asp:CommandField HeaderText="ویرایش رشته" ShowEditButton="True" EditText="ویرایش" CancelText="انصراف"  InsertText="افزودن" UpdateText="اعمال تغییرات"/>
                
                
                   <asp:BoundField DataField="id" HeaderText="کد" ReadOnly="True" />
                <asp:BoundField DataField="FieldName" HeaderText="رشته" />
                <asp:CommandField HeaderText="حذف رشته" ShowDeleteButton="True" DeleteText="حذف" />
            </Columns>
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
          </div>
    </div>
</asp:Content>
 
