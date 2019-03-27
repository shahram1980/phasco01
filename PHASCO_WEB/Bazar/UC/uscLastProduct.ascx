<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscLastProduct.ascx.cs"
    Inherits="BiztBiz.UC.uscLastProduct" %>
<table class="h-last-table" cellpadding="0" cellspacing="0">
    <tr>
        <td style="padding-right: 1px;">
            <img alt="" height="54" src="<%= ImgSiteFolder %>bg-title-last.jpg" width="100%" />
        </td>
    </tr>
    <tr>
        <td class="h-last-table-mid">
            <table style="width: 100%" dir="rtl">
                <tr>

                    <td style="width: 400px; vertical-align: top">
                        <div id="Productrotator" style="overflow: hidden;">
                            <asp:Repeater ID="repLastProduct" runat="server">
                                
                                <ItemTemplate>
                                    <div>
                                        <table  style="width: 100%">
                                            <tr class="h-last-table-item2-color3">
                                                <td class="h-last-table-item2-color4-icon" style="width: 40px">
                                                    <img alt="" height="15" src="<%= ImgSiteFolder %>icon-star1.jpg" width="16" />
                                                </td>
                                                <td class="h-last-table-item2-color4" style="width:200px" >
                                                    <a href='Productdetails.aspx?ProductID=<%#Eval("id")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=1'>
                                                        <%#Eval("Produc_Name")%></a>
                                                </td>
                                            <%--    <td class="h-last-table-item3-color2">[<%#GetShamsiDate(Eval("StartDate").ToString())%>]
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </td>
                    <td style="vertical-align: top">
                        <div id="Requestrotator" style="overflow: hidden;">
                            <asp:Repeater ID="repLastRequest" runat="server">
                                <AlternatingItemTemplate>
                                    <div>
                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr class="h-last-table-item1-color1">
                                                <td class="h-last-table-item1-color2-icon" style="width: 40px">
                                                    <img alt="" height="17" src="<%= ImgSiteFolder %>icon-basket.jpg" width="19" />
                                                </td>
                                                <td class="h-last-table-item1-color2" style="width:200px">
                                                    <a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                        <%#Eval("ProductName")%></a>
                                                </td>
                                            <%--    <td class="h-last-table-item3-color2">[<%#GetShamsiDate(Eval("StartDate").ToString())%>]
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </div>
                                </AlternatingItemTemplate>
                                <ItemTemplate>
                                    <div>
                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr class="h-last-table-item1-color3">
                                                <td class="h-last-table-item1-color3-icon" style="width: 40px">
                                                    <img alt="" height="18" src="<%= ImgSiteFolder %>icon-basket1.jpg" width="19" />
                                                </td>
                                                <td class="h-last-table-item1-color3" style="width:200px">
                                                    <a href='Request.aspx?RequestID=<%#Eval("RequestID")%>&CategoryID=<%#Eval("Group_id")%>&Level=2&SearchSection=2'>
                                                        <%#Eval("ProductName")%></a>
                                                </td>
                                            <%--    <td class="h-last-table-item3-color2">[<%#GetShamsiDate(Eval("StartDate").ToString())%>]
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </td>

                    <td style="width: 10px">&nbsp;
                    </td>
                    
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <img alt="" height="14" src="<%= ImgSiteFolder %>bg-title-last-down.jpg" width="100%" />
        </td>
    </tr>
</table>
<script src="js/jquery.rotator.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#Productrotator").rotator();
        $("#Requestrotator").rotator();
    });
</script>
