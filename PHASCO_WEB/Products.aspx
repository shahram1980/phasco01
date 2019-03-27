<%@ Page Language="C#" MasterPageFile="~/Template/Phasco_Eshop.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="PHASCO_WEB.Products" %>

<%@ Register Src="UI/ProductGallery.ascx" TagName="ProductGallery" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Plc" runat="server">
<script language="C#" runat="server">
public string image_Check(string Valid_Image, int id_, string Image_Mode, int AutoId)
{
    string ret_ = "";
    string name_Fiel = Convert.ToString(id_) + Convert.ToString((id_ * 4));
    string Get_Id = Convert.ToString(Request.QueryString["id"]);
    if (Valid_Image == "yes")
    {
        ret_ = "<a href='products.aspx?Deid=" + Convert.ToString(AutoId) + "'><img border='0' src='phascoupfile/Product_Images/" + name_Fiel + Image_Mode + "' ></a>";
    }
    else if (Valid_Image == "no")
    {
        ret_ = "<a href='products.aspx?Deid=" + Convert.ToString(AutoId) + "'><img border='0'  src='phascoupfile/Product_Images/NOpic/NoPic.jpg'></a>";
    }
    return ret_;
}
 
        public string Ex_Icom(string val)
        {
            string ret_ = "";

            switch (val)
            {
                case ".ram":
                    ret_ = "images/Doc_Icon/real.gif";
                    break;
                case ".ra":
                    ret_ = "images/Doc_Icon/real.gif";
                    break;
                case ".pdf":
                    ret_ = "images/Doc_Icon/pdf.gif";
                    break;

                case ".doc":
                    ret_ = "images/Doc_Icon/Word.gif";
                    break;
                case ".txt":
                    ret_ = "images/Doc_Icon/txt.gif";
                    break;
                case ".ppt":
                    ret_ = "images/Doc_Icon/power.gif";
                    break;
                case ".mpg":
                    ret_ = "images/Doc_Icon/movi.gif";
                    break;

                case ".mpeg":
                    ret_ = "images/Doc_Icon/movi.gif";
                    break;
                case ".wmv":
                    ret_ = "images/Doc_Icon/movi.gif";
                    break;
                case ".avi":
                    ret_ = "images/Doc_Icon/avi.gif";
                    break;
                case ".jpeg":
                    ret_ = "images/Doc_Icon/jpeg.gif";
                    break;

                case ".jpg":
                    ret_ = "images/Doc_Icon/jpeg.gif";
                    break;
                case ".gif":
                    ret_ = "images/Doc_Icon/Gif.gif";
                    break;

                case ".html":
                    ret_ = "images/Doc_Icon/html.gif";
                    break;
                case ".htm":
                    ret_ = "images/Doc_Icon/html.gif";
                    break;
                case ".swf":
                    ret_ = "images/Doc_Icon/swf.gif";
                    break;
                case ".xls":
                    ret_ = "images/Doc_Icon/excel.gif";

                    break;
                default:
                    ret_ = "images/Doc_Icon/none.gif";
                    break;
            }
            return ret_;
        }
    </script>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table cellpadding="0" style="width: 100%; border-collapse: collapse">
                <tr>
                    <td width="100%" align="center">
                        <asp:DataList ID="DataList_Product" runat="server" CellPadding="5" 
                            Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" 
                            RepeatColumns="5" ShowFooter="False" ShowHeader="False">
                            <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                            <AlternatingItemStyle Font-Bold="False" Font-Italic="False" 
                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                                VerticalAlign="Top" />
                            <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                            <SelectedItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                                Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                            <ItemTemplate>
                                <table ID="table13" border="0" cellpadding="0" 
                                    style="border-collapse: collapse" width="120">
                                    <tr>
                                        <td>
                                            <table ID="table14" bgcolor="#EEE4CB" border="1" bordercolor="#C6B58D" 
                                                style="border-collapse: collapse" width="100%">
                                                <tr>
                                                    <td align="center" height="95" valign="top">
                                                        <%# image_Check(Convert.ToString(Eval("Image_valid")), Convert.ToInt32(Eval("AutoId")), Convert.ToString(Eval("Image_Mode")), Convert.ToInt32(Eval("AutoId")))%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center">
                                                        <p dir="ltr" 
                                                            style="text-transform: capitalize; font-family: Verdana; font-size: xxx-large;">
                                                            <b><a class="menu" href='products.aspx?Deid=<%# Eval("AutoId")%>' 
                                                                title='<%# Eval("title")%>'><%# Eval("title")%> </a></b>
                                                        </p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center">
                        <br />
                        <br />
                        <table ID="table15" border="0" style="border-collapse: collapse;direction:rtl" 
                            width="100%">
                            <tr>
                                <td bgcolor="#A20001" width="30%">
                                    &nbsp;محصولات پیشنهادی</td>
                                <td width="70%">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table ID="table16" border="1" bordercolor="#A20001" 
                                        style="border-collapse: collapse" width="100%">
                                        <tr>
                                            <td style="text-align:justify;">
                                                <asp:Repeater ID="Repeater_Pro_Rnd" runat="server">
                                                    <ItemTemplate>
                                                     <a class="menu" href='products.aspx?Deid=<%# Eval("AutoId")%>' 
                                                                title='<%# Eval("title")%>'><%# Eval("title")%> </a>&nbsp;,
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            
            
            </asp:View>
        <asp:View ID="View2" runat="server">
          <table id="Table6" border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                <tr>
                    <td valign="top" width="60%">
                        <table id="Table3" border="0" style="border-collapse: collapse" width="100%">
                            <tr>
                                <td bgcolor="#ebdcc0">
                                    &nbsp;نام کالا :
                        <asp:Label ID="Label_Name" runat="server"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#ebdcc0">
                        <asp:Label ID="Label_des" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                    <td width="40%">
                        <table id="Table5" border="0" style="border-collapse: collapse" width="100%">
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; padding-top: 10px">
                                    <table id="table4" border="1" bordercolor="#cab797" style="border-collapse: collapse"
                                        width="100%">
                                        <tr>
                                            <td align="center" style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px;
                                                padding-top: 10px">
                                                &nbsp;<asp:Image ID="Image_Product" runat="server" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    &nbsp;<asp:Label ID="Label_Price" runat="server"></asp:Label>
                                    <strong>ریال</strong></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table id="Table7" border="0" dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" ID="direc" runat="server" />'
                                        style="border-collapse: collapse" width="100%">
                                        <tr>
                                            <td colspan="2" dir='<asp:Literal ID="align007" Text="<%$ Resources:Resource, Align %>" runat="server" />'
                                                style="width: 50%" align="left">
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Eshop_Q"
                                                    ErrorMessage="Please Insert Number    " MaximumValue="999999999999" MinimumValue="0"></asp:RangeValidator>&nbsp;
                                                <asp:TextBox ID="Eshop_Q" runat="server" Width="22px">1</asp:TextBox>
                                                &nbsp;&nbsp;</td>
                                            <td dir='<asp:Literal ID="align008" Text="<%$ Resources:Resource, Align %>" runat="server" />'
                                                style="width: 50%" width="15%" align="right">
                                                <asp:ImageButton ID="ImageButton_Buy" runat="server" ImageUrl="~/images/button_in_cart.gif"
                                                    OnClick="ImageButton_Buy_Click" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="Table10" border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                <tr>
                    <td style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; padding-top: 10px"
                        valign="top" width="50%">
                        <table id="Table8" border="0" style="border-collapse: collapse" width="100%">
                            <tr>
                                <td bgcolor="#ebdcc0">
                                    &nbsp;گالری تصاوير</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                                 <uc1:ProductGallery ID="ProductGallery1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; padding-top: 10px"
                        valign="top" width="50%">
                        <table id="Table9" border="0" style="border-collapse: collapse" width="100%">
                            <tr>
                                <td bgcolor="#ebdcc0">
                                    &nbsp;پیوست ها</td>
                            </tr>
                            <tr>
                                <td align="center" valign="top">
                        <asp:DataList ID="DataList_DOC_Download" runat="server" CellPadding="3" RepeatColumns="3"
                            RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <table id="table2" border="1" bordercolor="#ffffff" dir="rtl" style="border-collapse: collapse"
                                    width="100">
                                    <tr>
                                        <td>
                                            <table id="table1" border="0" style="height: 100px" width="100%">
                                                <tr>
                                                    <td align="center" width="100px">
                                                    <div style="padding:5px;text-align:center;">
                                                    <a href="products.aspx?Deid=5660&DownId=<%# Eval("AUTOiD")%>">
                                                        <img border="0" src='<%# Ex_Icom(Convert.ToString(Eval("ex_")))%>' /></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" width="100px">
                                                     <a href="products.aspx?Deid=5660&DownId=<%# Eval("AUTOiD")%>">
                                                    <%# Eval("Commnet")%></a>
                                                        
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table id="Table12" border="0" style="border-collapse: collapse" width="100%">
                <tr>
                    <td style="padding-right: 20px; padding-left: 20px; padding-bottom: 20px; padding-top: 20px"
                        valign="top">
                        <table id="Table11" border="0" style="border-collapse: collapse" width="100%">
                            <tr>
                                <td bgcolor="#ebdcc0">
                                    سایر محصولات این گروه&nbsp;</td>
                            </tr>
                            <tr>
                                <td dir="rtl">
                                
                                <asp:DataList ID="DataList_Family_Ptoduct" runat="server" CellPadding="5" Font-Bold="False"
                Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"
                HorizontalAlign="Center" RepeatColumns="5" ShowFooter="False" ShowHeader="False">
                <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                    Font-Underline="False" VerticalAlign="Top" />
                <AlternatingItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False"
                    Font-Strikeout="False" Font-Underline="False" VerticalAlign="Top" />
                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                    Font-Underline="False" VerticalAlign="Top" />
                <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                    Font-Underline="False" VerticalAlign="Top" />
                <SelectedItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                    Font-Underline="False" VerticalAlign="Top" />
                <ItemTemplate>
                    <table id="table1" border="0" cellpadding="0" style="border-collapse: collapse" width="120">
                        <tr>
                            <td>
                                <table id="table2" bgcolor="#EEE4CB" border="1" bordercolor="#C6B58D" style="border-collapse: collapse"
                                    width="100%">
                                    <tr>
                                        <td align="center" height="95" valign="top">
                                         <%# image_Check(Convert.ToString(Eval("Image_valid")), Convert.ToInt32(Eval("AutoId")), Convert.ToString(Eval("Image_Mode")), Convert.ToInt32(Eval("AutoId")))%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <p dir="ltr" style="text-transform: capitalize; font-family: Verdana; font-size: xxx-large;">
                                                <b>
                                                <a class="menu"  href="products.aspx?Deid=<%# Eval("AutoId")%>" title="<%# Eval("title")%>">
                                                    <%# Eval("title")%>
                                                    </a>
                                                </b>
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
 
                    </table>
                </ItemTemplate>
            </asp:DataList>
                                
                        </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>



</asp:Content>
 