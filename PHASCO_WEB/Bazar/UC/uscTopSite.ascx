<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscTopSite.ascx.cs"
    Inherits="BiztBiz.UC.uscTopSite" %>
 
 
<table class="table-header">
    <tr>
        <td  style="width:25%;text-align:right;vertical-align:top;">
 
 
           </td>
  
    
        <td  style="width:25%;text-align:right;vertical-align:top;">
        <asp:Panel runat="server" id="userPanel" Visible="false">
            <div style="float: left; padding: 2px 10px;">
                <asp:LinkButton ID="lnkLogout" runat="server" OnClick="lnkLogout_Click" Text="خروج"></asp:LinkButton>
            </div>
            <div style="float: left; padding: 2px 10px;">
                <img src="<%= ImgSiteFolder %>new-icon-top-settinh.jpg" alt="" width="18" height="18"
                    style="vertical-align: middle;" />
                <asp:HyperLink ID="lnkUserInfo" runat="server" Text="پنل کاربری" NavigateUrl="~/MyBiztBiz/Default.aspx"></asp:HyperLink>
            </div>
            <div style="float: left; padding: 2px 10px;">
                <img src="<%= ImgSiteFolder %>NEW-ICON-TOP-user.jpg" alt="" width="19" height="17"
                    style="vertical-align: middle;" />
                <div style="float: left; padding-top: 2px; padding-right: 5px;">
                    <asp:Label ID="lblUserInfo" runat="server"></asp:Label>
                </div>
            </div>
</asp:Panel>
        </td>
  
     
            <td  style="width:25%;text-align:right;vertical-align:top;">
                <img alt="" height="18" src="<%= ImgSiteFolder %>help_Icon.jpg" width="17"
                style="vertical-align: middle;" />  <a
                href="<%= SiteFolder %>page.aspx?id=3" style="margin: 0 4px;"> راهنما </a>   
        </td>
     
  
            <td  style="width:25%;text-align:right;vertical-align:top;">
                 <img alt="" height="18" src="<%= ImgSiteFolder %>NEW-ICON-TOP-time.jpg" width="17"
                style="vertical-align: middle;" />
            امروز &nbsp;
            <%=QLink.Helpers.DateHelper.GregorianToJalaali(DateTime.Now.ToString(), 1) %>
        </td>
    </tr>
</table>




 

