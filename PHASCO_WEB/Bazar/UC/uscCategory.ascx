<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscCategory.ascx.cs"
    Inherits="BiztBiz.UC.uscCategory" %>
<div dir="rtl">
    <asp:TreeView ID="trvCategoryList" runat="server" OnSelectedNodeChanged="trvCategoryList_SelectedNodeChanged"
        ShowLines="True" LineImagesFolder="~/TreeLineImages">
    </asp:TreeView>
</div>
