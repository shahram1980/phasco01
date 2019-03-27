<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogList.aspx.cs" Inherits="PHASCO_WEB.Cpanel.UserLogList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView_List" runat="server" EnableModelValidation="True" 
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
            GridLines="None" Width="100%" ShowHeader="False">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table class="style1">
                            <tr>
                                <td style="width:10%;text-align:right;vertical-align:top;">
                                Url :    </td>
                            <td style="width:90%;text-align:left;vertical-align:top;">
                              <a href="<%# Eval("Url")%> " target="_blank"> <%# Eval("Url")%>  </a> </td>
                            </tr>
                                 <tr>
                                <td style="width:10%;text-align:right;vertical-align:top;">
                                  UrlReferrer :   </td>
                            <td style="width:90%;text-align:left;vertical-align:top;">
                                  <a href="<%# Eval("UrlReferrer")%> " target="_blank"> <%# Eval("UrlReferrer")%>  </a> </td>
                            </tr>
                                       <tr>
                                <td style="width:10%;text-align:right;vertical-align:top;">
                                Date :  </td>
                            <td style="width:90%;text-align:left;vertical-align:top;">
                               <%# Eval("data")%>  </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
