<%@ Control Language="C#" AutoEventWireup="true" Codebehind="Product_Home.ascx.cs"
    Inherits="PHASCO_WEB.UI.Product_Home" %>
<%@ Import Namespace="System.Data" %>

<script language="C#" runat="server">
    public string image_Check(string Valid_Image, int id_, string Image_Mode, int AutoId)
    {
        string ret_ = "";
        string name_Fiel = Convert.ToString(id_) + Convert.ToString((id_ * 4));
        string Get_Id = Convert.ToString(Request.QueryString["id"]);
        if (Valid_Image == "yes")
        {
            ret_ = "<a href='ProductDetail.aspx?id=" + Convert.ToString(AutoId) + "'><img border='0' src='phascoupfile/Product_Images/" + name_Fiel + Image_Mode + "' width='120' onload=\"change('photo_Pro" + AutoId + "')\"></a>";
        }
        else if (Valid_Image == "no")
        {
            ret_ = "<a href='ProductDetail.aspx?id=" + Convert.ToString(AutoId) + "'><img border='0' src='Product_Images/NOpic/NoPic.jpg' onload=\"change('photo_Pro" + AutoId + "')\"></a>";
        }
        return ret_;
    }

    public string SingIn_Check(int id_)
    {
        String ret_ = "";
        //if (Session["Uid_Name"] != null)
        ret_ = "<a href='Addtoshop.aspx?Pid=" + Convert.ToString(id_) + "'><img src='images/" + Resources.Resource.addtocart + "' border='0'/></a>";
        return ret_;
    }
</script>

<asp:DataList ID="DataList_Products" runat="server" CellPadding="5" RepeatColumns="4">
    <ItemTemplate>
        <table border="0" width="150" id="table1" cellpadding="0" style="border-collapse: collapse">
            <tr>
                <td>
                    <table border="1" width="100%" id="table2" style="border-collapse: collapse" bordercolor="#C6B58D" bgcolor="#EEE4CB">
                        <tr>
                            <td height="95" align="center" valign="top">
                                <%# image_Check(Convert.ToString(Eval("Image_valid")), Convert.ToInt32(Eval("AutoId")), Convert.ToString(Eval("Image_Mode")), Convert.ToInt32(Eval("AutoId")))%>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <p dir="ltr" style="text-transform: capitalize; font-family: Verdana; font-size: xxx-large;">
                                    <b>
                                        <%# Eval("Title") %>
                                    </b>
                                    </p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#F5EBD2" height="90">
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
