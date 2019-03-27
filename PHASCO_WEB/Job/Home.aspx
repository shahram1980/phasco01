<%@ Page Language="C#" MasterPageFile="~/Template/Phasco01.Master" AutoEventWireup="true"
    CodeBehind="Home.aspx.cs" Inherits="Rahbina.Job.WebForm1" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head_Meta">
    <style type="text/css">
        .Menu_Emp
        {
            padding: 5px 15px;
            background: transparent url( '../images/B-L.gif' ) no-repeat scroll right center;
        }
    </style>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="Plc">
    <center>
        <fieldset dir="rtl" style="width: 90%; text-align: right; margin-right: 10px;">
            <legend>گزینه های بخش مشاغل فاسکو</legend>
            <itemtemplate>
<div style="width:100%">

    <div class="Menu_Emp">
<asp:HyperLink ID="HyperLink1" runat="server" EnableViewState="false" NavigateUrl="~/Job/userJob.aspx">كارجو</asp:HyperLink>
</div>
    <div class="Menu_Emp">
<asp:HyperLink ID="HyperLink2" runat="server" EnableViewState="false" NavigateUrl="~/employer/employer.aspx">كارفرما</asp:HyperLink>
</div>

</div>
        </itemtemplate>
        </fieldset>
    </center>
    <center>
        <fieldset dir="rtl" style="width: 90%; text-align: right; margin-right: 10px;">
            <legend>جديدترين آگهي جرايد</legend>
            <asp:DataList ID="dtlist_newspaperAds" runat="server" RepeatColumns="5">
            <ItemTemplate>
            
            <div class="Menu_Emp">
                  <a href='<%#Eval("AD_ID","Nwespaper_AdsDetails.aspx?id={0}") %>' title="<%# Eval("JobTitle") %> - <%# Eval("EduField")%>">
                        <%# Eval("JobTitle") %>
                        -
                        <%# Eval("EduField")%></a>
                        
                        </div>
            </ItemTemplate>
            </asp:DataList>
             
        </fieldset>
    </center>
</asp:Content>
