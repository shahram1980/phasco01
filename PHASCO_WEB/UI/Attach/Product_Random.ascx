<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Product_Random.ascx.cs" Inherits="phasco_webproject.UI.Attach.Product_Random" %>
<%@ Import Namespace="System.Data" %>
<script language="C#" runat="server">
    public string image_Check(string Valid_Image, int id_, string Image_Mode, int AutoId)
    {
        string ret_ = "";
        string name_Fiel = Convert.ToString(id_) + Convert.ToString((id_ * 4));
        string Get_Id = Convert.ToString(Request.QueryString["id"]);
        if (Valid_Image == "yes")
        {
            ret_ = "<a href='Default.aspx?Page=ProductDetail&id=" + Convert.ToString(AutoId) + "'><img border='0' src='phascoupfile/Product_Images/" + name_Fiel + Image_Mode + "' width='120'></a>";
        }
        else if (Valid_Image == "no")
        {
            ret_ = "<a href='Default.aspx?Page=ProductDetail&id=" + Convert.ToString(AutoId) + "'><img border='0' src='phascoupfile/Product_Images/NOpic/NoPic.jpg'></a>";
        }
        return ret_;
    }

    public string SingIn_Check(int id_)
    {
        String ret_ = "";
        if (Session["Login_Acc"] != null && (Session["lang"].ToString() == "1" && Session["lang"].ToString() != null))
            ret_ = "<a href='Addtoshop.aspx?Pid=" + Convert.ToString(id_) + "&rid=" + Convert.ToString(Request.QueryString["id"]) + "'><img src='images/go2basket.gif' border='0' /></a>";
        else if ((Session["Login_Acc"] != null && (Session["lang"].ToString() == "2" && Session["lang"].ToString() != null)))
            ret_ = "<a href='Addtoshop.aspx?Pid=" + Convert.ToString(id_) + "&rid=" + Convert.ToString(Request.QueryString["id"]) + "'><img src='images/addtocart01.jpg' border='0' /></a>";
        return ret_;
    }
    </script>
 <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
    <tr>
        <td align="center" style="width: 100%" valign="top">
<asp:DataList ID="DataList_Products" runat="server" RepeatColumns="4" Width="100%" BorderStyle="None" BorderWidth="0px">
    <ItemTemplate>
                        <table id="table6" cellpadding="0" onmouseout="this.style.backgroundColor='#FEF3DA';" 
                        onmouseover="this.style.backgroundColor='#FECE61';" cellspacing="0" 
                         style="width: 120px;height: 250px; border-collapse: collapse" bordercolor="#c0c0c0">
                            <tr>
                                <td  title="ItemTemplate - Click to start editing." valign="top">
                                    <table id="table7" border="0" style="border-collapse: collapse" width="140" dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" ID="direc401" runat="server" />'>
                                        <tr>
                                            <td style="height: 21px" dir='<asp:Literal ID="align033" Text="<%$ Resources:Resource, Align %>" runat="server" />'>
                                                <%# image_Check(Convert.ToString(Eval("Image_valid")), Convert.ToInt32(Eval("AutoId")), Convert.ToString(Eval("Image_Mode")), Convert.ToInt32(Eval("AutoId")))%>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td dir='<asp:Literal ID="align034" Text="<%$ Resources:Resource, Align %>" runat="server" />'>
                                                <table id="table8" border="0" style="border-collapse: collapse" width="100%">
                                                    <tr>
                                                        <td style="height: 20px">
                                                            <a href='Default.aspx?Page=ProductDetail&id=<%# DataBinder.Eval(Container.DataItem, "AutoId") %>'>
                                                                <%# Eval("Title")%></a></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table id="table9" border="0" style="border-collapse: collapse" width="100%" dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" ID="direc402" runat="server" />'>
                                                                <tr>
                                                                    <td width="40%" style="height: 21px">
                                                                      <asp:Literal Text="<%$ Resources:Resource, Price_Text %>" ID="direc" runat="server" /></td>
                                                                    <td width="60%" style="height: 21px" >
                                                                        <asp:Label ID="lbl_price" runat="server"  Width="120px" Text='<%#Eval("Price") %>' ></asp:Label>
                                                                        <asp:Literal Text="<%$ Resources:Resource, MonyUnit %>" ID="MonyUnit" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 21px">
                                                            <table id="Table1" border="0" style="border-collapse: collapse" width="100%" dir='<asp:Literal Text="<%$ Resources:Resource, dir %>" ID="direc405" runat="server" />'>
                                                                <tr>
                                                                    
                                                                    <td>
                                                                        <%# SingIn_Check(Convert.ToInt32(Eval("AutoId")))%>
                                                                        </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
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
