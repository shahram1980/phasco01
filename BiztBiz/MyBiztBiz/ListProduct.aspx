<%@ Page Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="ListProduct.aspx.cs" Inherits="BiztBiz.MyBiztBiz.ListProduct" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="../ajaxtabs/ajaxtabs.css" />
    <script type="text/javascript" src="../ajaxtabs/ajaxtabs.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView runat="server" ID="MultiView_Grd">
        <asp:View runat="server" ID="view01">
            <asp:Label ID="Label_Alaram" runat="server"></asp:Label>
            <br />
            <asp:ListView ID="listItems" runat="server" OnPagePropertiesChanging="listItems_PagePropertiesChanging"
                OnSelectedIndexChanged="listItems_SelectedIndexChanged">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </LayoutTemplate>
                <ItemTemplate>
                    <table border="0" id="table1" dir="ltr" cellpadding="0" style="border-collapse: collapse;
                        background: transparent url( '../images/Pro_Bg.jpg' ) no-repeat scroll center top;
                        height: 54px; width: 550;">
                        <tr>
                            <td align="left" width="30%" style="vertical-align: middle;">
                                <a href="EditProduct.aspx?id=<%# Eval("Id") %>" target="_parent">
                                    <asp:Literal Text="<%$ Resources:Resource, Edit %>" runat="server" ID="lit001" />
                                </a>| <a href="Wait_Pro.aspx?status=2&id=<%# Eval("Id") %>" onclick="return confirm('Are you sure you want to delete?')">
                                    <asp:Literal Text="<%$ Resources:Resource, Delete %>" runat="server" ID="Literal1" />
                                </a>
                            </td>
                            <td align="left" width="21%" style="vertical-align: middle;">
                                <%# Eval("Produc_Name")%>
                            </td>
                            <td align="left" width="31%" style="vertical-align: middle;">
                                <%# Set_Date(Eval("Send_Date").ToString())%>
                            </td>
                            <td align="left" width="10%" style="vertical-align: middle;">
                                <%# image_view(int.Parse(Eval("image").ToString()), Eval("image_name").ToString())%>
                            </td>
                            <td width="5%" style="vertical-align: middle;">
                                <input id="chkBxMail" class="filename" name="checked[]" runat="server" type="checkbox"
                                    value='<%# Eval("id")%>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemSeparatorTemplate>
                </ItemSeparatorTemplate>
            </asp:ListView>
            <table class="style1">
                <tr>
                    <td style="text-align: right;">
                        <asp:Button ID="Button_Delete" runat="server" Text="<%$ Resources:Resource, Delete %>"
                            OnClick="Button_Delete_Click" Font-Names="Tahoma" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <center>
                            <div style="background: #ccc; width: 400px; height: 30px; vertical-align: middle;">
                                <asp:DataPager PagedControlID="listItems" runat="server" ID="dataPager">
                                    <Fields>
                                        <asp:NumericPagerField />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </center>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View runat="server" ID="view2">
            <asp:Literal Text="<%$ Resources:Resource, Record_Not_Found %>" runat="server" ID="Literal2" />
        </asp:View>
    </asp:MultiView>
    <%--<div dir='<asp:Literal ID="Literal540s1"   Text="<%$ Resources:Resource, dir %>" runat="server" />'>
        <ul id="countrytabs" class="shadetabs">
            <li><a href="Wait_Pro.aspx" rel="#iframe" class="selected">
                <asp:Literal ID="Literal2" Text="<%$ Resources:Resource, Checking %>" runat="server" />
            </a></li>
            <li><a href="RejectedProduct.aspx" rel="countrycontainer">
                <asp:Literal ID="Literal1" Text="<%$ Resources:Resource, Rejected %>" runat="server" />
            </a></li>
            <li><a href="PasedProduct.aspx" rel="countrycontainer">
                <asp:Literal ID="Literal3" Text="<%$ Resources:Resource, Passed %>" runat="server" />
            </a></li>
        </ul>
        <div id="countrydivcontainer" style="border: 1px solid gray; width: 550px; height: 550px;
            margin-bottom: 1em; padding: 10px">
        </div>
    </div>
    <script type="text/javascript">

        var countries = new ddajaxtabs("countrytabs", "countrydivcontainer")
        countries.setpersist(true)
        countries.setselectedClassTarget("link") //"link" or "linkparent"
        countries.init()

    </script>--%>
</asp:Content>
