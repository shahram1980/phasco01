<%@ Control Language="C#" AutoEventWireup="true" Codebehind="Home_Subject.ascx.cs"
    Inherits="PHASCO_WEB.UI.Home_Subject" %>
<%@ Import Namespace="System.Data" %>

<script language="C#" runat="server">
    public string image_Check(string Valid_Image, int id_)
    {
        string ret_ = "";
        string filenname = "";
        if (Valid_Image != "np")
        {
            filenname = Convert.ToString(id_) + Convert.ToString((id_ * 4));
            ret_ = "<img border='0' src='phascoupfile/BrandImage/" + filenname + Valid_Image + "' >";
        }
        return ret_;
    }

    public string SetSubLevel(int id_)
    {
        String ret_ = "";
        PHASCO_WEB.BLL.Eshop.SubJectS_Tbl da = new PHASCO_WEB.BLL.Eshop.SubJectS_Tbl();
        System.Data.DataTable dt = da.SubJect_tra("Level_2", id_, 0, "", "");
        for (int i = 0; i < dt.Rows.Count; i++)
        {

            ret_ = ret_ + " <a class='menu' href='Products.aspx?SubId=" + dt.Rows[i][0].ToString() + "'>" + dt.Rows[i]["SubJect"].ToString() + "</a><br />";
        }


        return ret_;
    }
</script>

<asp:DataList ID="DataList_Subject" runat="server" CellPadding="5" RepeatColumns="5" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" ShowFooter="False" ShowHeader="False">
    <ItemTemplate>
        <table border="0" width="120" id="table1" cellpadding="0" style="border-collapse: collapse">
            <tr>
                <td>
                    <table border="1" width="100%" id="table2" style="border-collapse: collapse" bordercolor="#C6B58D"
                        bgcolor="#EEE4CB">
                        <tr>
                            <td height="95" align="center" valign="top">
                                <%# image_Check(Eval("Image_Exc").ToString(), Convert.ToInt32(Eval("Id")))%>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <p dir="ltr" style="text-transform: capitalize; font-family: Verdana; font-size: xxx-large;">
                                    <b>
                                        <%# Eval("SubJect")%>
                                                                    </b>
                                </p>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td bgcolor="#F5EBD2" height="90" >
                
                    <div style="padding:5px;text-align:center;">
                    <%# SetSubLevel(Convert.ToInt32(Eval("Id")))%>
                    </div>
                </td>
            </tr>
        </table>
    </ItemTemplate>
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
</asp:DataList>
