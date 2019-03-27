<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.ascx.cs" Inherits="phasco_webproject.UI.ProductDetail" %>
<%@ Register Src="Attach/Product_Random.ascx" TagName="Product_Random" TagPrefix="uc3" %>
<%@ Register Src="Product_addtocard.ascx" TagName="Product_addtocard" TagPrefix="uc1" %>
<%@ Register Src="Attach/Gallery.ascx" TagName="Gallery" TagPrefix="uc2" %>
<script language="javascript">
<!--
function popUp(N) {

newWindow = window.open(N, 'popUp','toolbar=no,menubar=no,resizable=yes,scrollbars=yes,status=no,location=no,width=770,height=650');
}
//-->
</script>
    <script language="C#" runat="server">
    public string  Ex_Icom(string val) 
    {
        string ret_ = "";

        switch (val)
        {
            case ".ram" :
                ret_ = "Doc_Icon/real.jpg" ;
                break;
            case ".ra":
                ret_="Doc_Icon/real.jpg";
                break; 
            case ".pdf" :
                ret_ = "Doc_Icon/pdf.jpg" ;
                break;
                
            case ".doc":
                ret_="Doc_Icon/Word.jpg";
                break; 
            case ".txt" :
                ret_ = "Doc_Icon/txt.jpg" ;
                break;
            case ".ppt":
                ret_="Doc_Icon/power.jpg";
                break; 
            case ".mpg": 
                ret_ = "Doc_Icon/movi.jpg" ;
                break;
                
            case ".mpeg":
                ret_="Doc_Icon/movi.jpg";
                break; 
            case ".wmv" :
                ret_ = "Doc_Icon/movi.jpg" ;
                break;
            case ".avi":
                ret_="Doc_Icon/avi.jpg";
                break; 
            case ".jpeg" :
                ret_ = "Doc_Icon/jpeg.jpg" ;
                break;
                
            case ".jpg":
                ret_="Doc_Icon/jpeg.jpg";
                break; 
            case ".gif": 
                ret_ = "Doc_Icon/Gif.jpg" ;
                break;
                
            case ".html":
                ret_="Doc_Icon/html.jpg";
                break;                                                                                                 
            case ".htm":
                ret_="Doc_Icon/html.jpg";
                break; 
            case ".swf":
                ret_ = "Doc_Icon/swf.jpg";
                break;
            case ".xls":
                ret_ = "Doc_Icon/excel.jpg";
 
                break;  
            default:
                ret_ = "Doc_Icon/none.jpg";
                break; 
        }
        return ret_;
    }
    </script>
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
    <tr>
        <td style="width: 100%">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" style="width: 50%">
                        گالری تصاوير</td>
                    <td align="right" style="width: 50%">
                        تصوير محصول</td>
                </tr>
                <tr>
                    <td style="width: 50%" valign="top">
                        <uc2:Gallery ID="Gallery1" runat="server" />
                    </td>
                    <td style="width: 50%" valign="top">
                        <asp:Image ID="Image_" runat="server" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="width: 100%; height: 123px">
            <table id="table158" border="0" cellpadding="2" cellspacing="2" dir='<asp:Literal ID="dir4" Text="<%$ Resources:Resource, dir %>" runat="server" />'
                style="font-size: 9pt; font-family: Verdana" width="100%">
                <tr>
                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_12_1" runat="server" />'
                        class="cell1" height="20" valign="middle" width="40%" style="width: 20%">
                        <asp:Label ID="Label233" runat="server" Font-Names="Tahoma" Text="<%$ Resources:Resource, Product_name %>"></asp:Label></td>
                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_13_2" runat="server" />'
                        class="cell1" height="20" valign="middle" width="60%" style="width: 80%">
                        <asp:Label ID="Label_Name" runat="server"></asp:Label></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_3" runat="server" />' valign="middle" width="40%" style="width: 20%;">
                        <span style="font-size: 9pt; font-family: Verdana">
                            <asp:Label ID="Label3" runat="server" Font-Names="Tahoma" Text="<%$ Resources:Resource, Product_Comment %>"></asp:Label></span></td>
                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_4" runat="server" />'
                        dir='<asp:Literal ID="dir6" Text="<%$ Resources:Resource, dir %>" runat="server" />' valign="middle" width="60%" style="width: 80%;">
                        &nbsp;<asp:Label ID="Label_Comment" runat="server"></asp:Label></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_5" runat="server" />'
                        class="cell1" height="20" valign="middle" width="40%" style="width: 20%">
                        <span style="font-size: 9pt; font-family: Verdana">
                            <asp:Label ID="Label4" runat="server" Font-Names="Tahoma" Text="<%$ Resources:Resource, Product_Group %>"></asp:Label></span></td>
                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_6" runat="server" />'
                        class="cell1" dir='<asp:Literal ID="dir7" Text="<%$ Resources:Resource, dir %>" runat="server" />'
                        height="20" valign="middle" width="60%" style="width: 80%">
                        <asp:Label ID="Label_Tax" runat="server"></asp:Label></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_7" runat="server" />'
                        height="20" style="width: 20%;" valign="middle" width="40%">
                        <span style="font-size: 9pt; font-family: Verdana">
                            <asp:Label ID="Label1" runat="server" Font-Names="Tahoma" Text="<%$ Resources:Resource, Price_Text %>"></asp:Label></span></td>
                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_8" runat="server" />'
                        dir='<asp:Literal ID="dir1" Text="<%$ Resources:Resource, dir %>" runat="server" />'
                        height="20" style="width: 80%;" valign="middle" width="60%">
                        <span style="font-size: 9pt; font-family: Verdana"></span>&nbsp;<asp:Label ID="Label_Price"
                            runat="server"></asp:Label>
                        <asp:Literal ID="direc_Page0101" runat="server" Text="<%$ Resources:Resource, MonyUnit %>"></asp:Literal></td>
                </tr>
            </table>
            <table cellpadding="2" style="border-right: #f0f0f0 1px solid; border-top: #f0f0f0 1px solid;
                border-left: #f0f0f0 1px solid; width: 100%; border-bottom: #f0f0f0 1px solid">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Lbl_alarm" runat="server" Font-Overline="False" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <asp:DataList ID="DataList_DOC_Download" runat="server" RepeatColumns="5" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <table id="table2" border="1" bordercolor="#FFFFFF" dir="rtl" style="border-collapse: collapse"
                                    width="100">
                                    <tr>
                                        <td>
                                            <table id="table1" border="0" width="100%">
                                                <tr>
                                                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_9" runat="server" />'
                                                        width="20">
                                                        <img border="0" src='<%# Ex_Icom(Convert.ToString(Eval("ex_")))%>' />
                                                    </td>
                                                    <td align='<asp:Literal Text="<%$ Resources:Resource,align %>" ID="align_00_01_11_10" runat="server" />'
                                                        width="80">
                                                        <asp:LinkButton ID="DOwn" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>'
                                                            OnCommand="DOwn_Command"> 
                                            <%# Eval("Commnet")%>
                                            </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <table width="100%">
                            <tr>
                                <td>
                                    <uc1:Product_addtocard ID="Product_addtocard1" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="width: 100%">
            <uc3:Product_Random id="Product_Random1" runat="server">
            </uc3:Product_Random></td>
    </tr>
</table>