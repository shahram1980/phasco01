<%@ Page Language="C#" MasterPageFile="~/Template/CompanyDeteil.Master" AutoEventWireup="true"
    CodeBehind="Productdetails.aspx.cs" Inherits="PHASCO_Shopping.C_p.Productdetails" %>

<%@ Register Src="../UC/B-card.ascx" TagName="B" TagPrefix="uc1" %>
<%@ Register src="../UC/UserTranceVisit.ascx" tagname="UserTranceVisit" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1">
        <tr>
            <td>
                <uc2:UserTranceVisit ID="UserTranceVisit1" runat="server" />
                <asp:Label EnableViewState="false" ID="Label_Title" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="td_register">
                            <asp:Image EnableViewState="false" ID="Image_Product" runat="server" />
                        </td>
                        <td class="td_register_de">
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal14" Text="<%$ Resources:Resource, Specialty_of_Product %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Specialty_of_Product" runat="server"></asp:Label>
                            &nbsp;<br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal1" Text="<%$ Resources:Resource, Description %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Description" runat="server"></asp:Label>
                            <br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal2" Text="<%$ Resources:Resource, Model_Number %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Model_Number" runat="server"></asp:Label>
                            <br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal3" Text="<%$ Resources:Resource, Product_Brand %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Product_Brand" runat="server"></asp:Label>
                            <br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal4" Text="<%$ Resources:Resource, Place_of_Origin %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Place_of_Origin" runat="server"></asp:Label>
                            <br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal5" Text="<%$ Resources:Resource, Supply_Ability %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Supply_Ability" runat="server"></asp:Label>
                            <br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal6" Text="<%$ Resources:Resource, Minimum_Order %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Minimum_Order" runat="server"></asp:Label>
                            <br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal7" Text="<%$ Resources:Resource, Delivery_Time %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Delivery_Time" runat="server"></asp:Label>
                            <br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal8" Text="<%$ Resources:Resource, Terms_of_Payment %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Terms_of_Payment" runat="server"></asp:Label>
                            <br />
                            <br />
                            <b>
                                <asp:Literal EnableViewState="false" ID="Literal9" Text="<%$ Resources:Resource, Packaging %>"
                                    runat="server" /></b>
                            <br />
                            <asp:Label EnableViewState="false" ID="Label_Packaging" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td>
                            <div style="margin: 5px;">
                                <a runat="server" id="inquery_Link">
                                    <img src="../images/inq_contact.jpg" />
                                </a>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="1" style="border-collapse: collapse; width: 550px; height: 150px;margin-bottom:5px;"
                    bordercolor="C0C0C0;">
                    <tr>
                        <td valign="top">
                            <table class="style1">
                                <tr>
                                    <td style="padding: 10px;">
                                        <span style="color: #11a618;"><b>
                                            <asp:Literal EnableViewState="false" ID="Literal15" Text="<%$ Resources:Resource, Image_Gallery %>"
                                                runat="server" />
                                            <br />
                                        </b></span>
                                        <br />
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;vertical-align:top;">
                                        <asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="8">
                                            <ItemTemplate>
<div style="text-align: center;border-width:3px;border-style:solid;border-color:#e1e1e1;margin:5px;">
<a href="javascript:poptastic('ImageShow.aspx?img=b<%# Eval("small")%>');"> 
                                                     <img src='../MyPHASCO_Shopping/ProductGallery/s<%# Eval("small")%>' border="0" />
                                                     </a> 
                                                </div>
                                            </ItemTemplate>
                                            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                                Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table border="1" style="border-collapse: collapse; width: 550px; height: 150px;"
                    bordercolor="C0C0C0;">
                    <tr>
                        <td valign="top">
                            <table class="style1">
                                <tr>
                                    <td style="padding: 10px;">
                                        <span style="color: #11a618;"><b>
                                            <asp:Literal EnableViewState="false" ID="Literal10" Text="<%$ Resources:Resource, other_products %>"
                                                runat="server" />
                                            <br />
                                        </b></span>
                                        <br />
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;">
                                        <asp:Repeater ID="Repeater_Other_Product" EnableViewState="false" runat="server">
                                            <ItemTemplate>
                                                <img src="../images/other-product-b.jpg" />
                                                <a href='Productdetails.aspx?pid=<%# Eval("id")%>&uid=<%#Eval("uid_id")%>' title='<%# Eval("Produc_Name")%>'>
                                                    <%# Eval("Produc_Name")%>
                                                </a>&nbsp;&nbsp;</ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding: 10px;">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td>
                <uc1:B ID="B1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<SCRIPT language="javascript">
var newwindow;
function poptastic(url)
{
	newwindow=window.open(url,'name','height=500,width=400');
	if (window.focus) {newwindow.focus()}
}

</SCRIPT>
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style2
        {
            border-collapse: collapse;
            border-left-style: solid;
            border-left-width: 1px;
            border-right: 1px solid #C0C0C0;
            border-top-style: solid;
            border-top-width: 1px;
            border-bottom: 1px solid #C0C0C0;
        }
    </style>
</asp:Content>
