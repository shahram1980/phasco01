<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscAdvertisement.ascx.cs"
    Inherits="AdvertisementManagement.UC.uscAdvertisement" %>
<table id="pnlZone" runat="server" style="width:100%;">
    <tr>
        <td>
            <asp:Repeater ID="repAdvertisementImage" runat="server">
                <ItemTemplate>
                    <div style='width: <%# Eval("BannerWidth") %>px; height: <%# Eval("BannerHeight") %>px;
                        border: 1px solid #efefef;float:right;'>
                        <a target="_blank" href='<%# GetBannerTargetURL(Eval("TargetURL").ToString(),Eval("BannerID").ToString(),Eval("ZoneID").ToString(),Eval("CampaignID").ToString()) %>'>
                      <%--  <asp:ImageButton  runat="server"
                            PostBackUrl='<%# GetBannerTargetURL(Eval("TargetURL").ToString(),Eval("BannerID").ToString(),Eval("ZoneID").ToString(),Eval("CampaignID").ToString()) %>'
                            AlternateText='<%# Eval("AltText") %>' />--%>
                            <asp:Image ID="imgBanner" runat="server"  ImageUrl='<%#GetBannerURL(Eval("ImageURL").ToString()) %>'  AlternateText='<%# Eval("AltText") %>' />
                            </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="repAdvertisementText" runat="server">
                <ItemTemplate>
                    <a href='<%# GetBannerTargetURL(Eval("TargetURL").ToString(),Eval("BannerID").ToString(),Eval("ZoneID").ToString(),Eval("CampaignID").ToString()) %>'>
                        <div style='width: <%# Eval("BannerWidth") %>px; height: <%# Eval("BannerHeight") %>px;
                            border: 1px solid #efefef;'>
                            <%# Eval("HeadlineText")%>
                            <br />
                            <%# Eval("LinkText")%>
                            <br />
                            <%# Eval("DisplayURL")%>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="repAdvertisementFlash" runat="server">
                <ItemTemplate>
                    <div style='width: <%# Eval("BannerWidth") %>px; height: <%# Eval("BannerHeight") %>px;
                        border: 1px solid #efefef;'>
                        <object width='<%# Eval("BannerWidth") %>' height='<%# Eval("BannerHeight") %>'>
                            <param name="movie" value='<%# GetBannerURL(Eval("FlashURL").ToString()) %>'>
                            <embed src='<%# GetBannerURL(Eval("FlashURL").ToString()) %>' width='<%# Eval("BannerWidth") %>'
                                height='<%# Eval("BannerHeight") %>' href='<%# GetBannerTargetURL(Eval("TargetURL").ToString(),Eval("BannerID").ToString(),Eval("ZoneID").ToString(),Eval("CampaignID").ToString()) %>'></embed>
                        </object>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </td>
    </tr>
</table>
