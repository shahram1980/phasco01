<%@ Page Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="Wait_Pro.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Wait_Pro" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="C#" runat="server">
        public string image_view(int Mode, string imagename)
        {
            if (Mode == 1) return "<img src='Pupload/sm_" + imagename + "' width='40'  style='border: 1px #818181 solid;'/>";
            if (Mode == 0) return "<img src='Pupload/none.jpg'  width='40' style='border: 1px #818181 solid;' />";
            return "نامشخص";
        }


        public string Set_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);

            if (Page.Culture.ToString() == "English (United States)")
                return dtm.ToString();
            if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
            {
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
                return sunDate.Weekday.ToString() + "&nbsp;&nbsp; ساعت" + dtm.Hour + ":" + dtm.Minute;
            }

            return dtm.ToString();
        }
    </script>
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
</asp:Content>
