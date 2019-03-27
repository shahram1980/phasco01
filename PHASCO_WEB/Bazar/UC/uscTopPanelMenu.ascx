<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscTopPanelMenu.ascx.cs"
    Inherits="BiztBiz.UC.uscTopPanelMenu" %>
<div style="width: 570px; float: right;">
    <h1 style="color: #99cccc; font-family: Arial, Helvetica, sans-serif">
        به بازار بزرگ فاسکو خوش آمدید!</h1>
    <div style="float: right; width: 300px">
        <span style="color: #006699;">نام و نام خانوادگی :</span><span style="color: #000;"><asp:Label
            ID="lblFullName" runat="server"></asp:Label></span></div>
    <div style="float: left; width: 200px; text-align: left">
        <span style="color: #006699;">تاریخ عضویت :</span><span style="color: #000;">
            <asp:Label ID="lblRegisterDate" runat="server"></asp:Label></span></div>
</div>
