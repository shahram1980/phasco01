<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftCat.ascx.cs" Inherits="BiztBiz.UC.LeftCat" %>
<%--<%@ Register Src="~/UC/uscAdvertisement.ascx" TagName="uscAdvertisement" TagPrefix="uc1" %>--%>
<table style="width: 240px">
    <tr>
        <td>
            <img alt="" src="../images/left-title.png" width="240" height="25" />
        </td>
    </tr>
    <tr>
        <td class="cat_Left">
            <asp:Repeater ID="Repeater_Cat" runat="server">
                <ItemTemplate>
                    <div style="padding: 1px;" class="direction">
                        <img src="images/PB.jpg" />
                        &nbsp;<a href='categories-list.aspx?qid=<%# Eval("id")%>' title='<%# Eval(Resources.Resource.F_Subject)%>'>
                            <%# Eval(Resources.Resource.F_Subject)%></a>
                    </div>
                    <br />
                </ItemTemplate>
            </asp:Repeater>
        </td>
    </tr>
    <tr>
        <td>
            <img alt="" src="../images/fotter-left.png" width="241" height="10" />
        </td>
    </tr>
</table>
<br />
<table style="width: 240px">
    <tr>
        <td>
            <img alt="" src="../images/left-title.png" width="240" height="25" />
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top; text-align: center;">
          <%--  <uc1:uscAdvertisement ID="uscAdvertisement9" runat="server" ZoneID="11" />--%>
            <%-- <img src="../Biztbiz-adv/temp.jpg" />--%>
        </td>
    </tr>
    <tr>
        <td>
            <img alt="" src="../images/fotter-left.png" width="241" height="10" />
        </td>
    </tr>
</table>
