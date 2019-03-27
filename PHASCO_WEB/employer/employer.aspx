<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true"
    CodeBehind="employer.aspx.cs" Inherits="Rahbina.Job.employer" %>

<asp:Content ContentPlaceHolderID="head_Meta" ID="content1" runat="server">
    <style type="text/css">
        .style18
        {
            width: 100%;
        }
        .Menu_Emp
        {
        	padding: 5px 15px; background: transparent url('../images/B-L.gif') no-repeat scroll right center
        	}
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc" ID="content2" runat="server">


 <center>
    <fieldset dir="rtl" style="width:90%; text-align:right; margin-right:10px; ">
    <legend>گزینه های بخش کارفرما</legend>
       
        <ItemTemplate>
   
   
    <div class="Menu_Emp">
        <a href="CompanyInfo.aspx">اطلاعات كارفرما</a></div>
    <div class="Menu_Emp">
        <a href="employment.aspx">درج ظرفيت شغلي</a></div>
    <div class="Menu_Emp">
        <a href="Waiting_employmentAD.aspx">مشاهده آگهي هاي غير فعال و تائيد نشده </a>
    </div>
    <div class="Menu_Emp">
        <a href="Enabled_employmentAD.aspx">مشاهده آگهي هاي فعال و تائيد شده</a></div>
    <div class="Menu_Emp">
        <a href="Disabled_EmploymentAD.aspx">مشاهده آگهي هاي غير فعال و منقضي شده</a></div>
   
        </ItemTemplate>
        
        </asp:Repeater>
    </fieldset>
</center>
   
</asp:Content>
