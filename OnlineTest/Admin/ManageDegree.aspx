<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Phasco01.Master"
    CodeBehind="ManageDegree.aspx.cs" Inherits="OnlineTest.Admin.ManageDegree" %>

<asp:Content ID="content1" ContentPlaceHolderID="head_Meta" runat="server">
    <style type="text/css">
        .grd
        {
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="Plc" runat="server">
    <div style="padding: 20px;">
    <div style="width:100%; text-align:center; direction:rtl;">
    <h1>مدیریت مقطع تحصیلی</h1>
    </div>
        <asp:Button ID="ButtonAdd_Degree" runat="server" Text="افزودن مقطع تحصیلی" OnClick="ButtonAddField_Click" />
        <br />
        <br />
        <asp:GridView ID="GridView_Degree" runat="server" AutoGenerateColumns="False" CellPadding="3"
            CssClass="grd" DataKeyNames="id" OnRowCancelingEdit="GridView_Degree_RowCancelingEdit"
            OnRowDeleting="GridView_Degree_RowDeleting" OnRowEditing="GridView_Degree_RowEditing"
            OnRowUpdating="GridView_Degree_RowUpdating" BackColor="White" BorderColor="#CCCCCC" OnRowDataBound="GridView_Degree_RowDataBound"
            BorderStyle="None" BorderWidth="1px">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <Columns>
                <asp:CommandField HeaderText="ویرایش مقطع تحصیلی" ShowEditButton="True" EditText="ویرایش"
                    CancelText="انصراف" InsertText="افزودن" UpdateText="اعمال تغییرات" />
                <asp:BoundField DataField="id" HeaderText="کد" ReadOnly="True" />
                <asp:BoundField DataField="DegreeName" HeaderText="مقطع تحصیلی" />
                <asp:CommandField HeaderText="حذف مقطع تحصیلی" ShowDeleteButton="True" DeleteText="حذف"  />
            </Columns>
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
    </div>
</asp:Content>
