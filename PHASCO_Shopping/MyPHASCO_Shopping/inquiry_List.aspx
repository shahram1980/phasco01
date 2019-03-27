<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Office.Master" CodeBehind="inquiry_List.aspx.cs" Inherits="PHASCO_Shopping.MyPHASCO_Shopping.inquiry_List1" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="C#" runat="server">
 
        public string Set_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);

            if (Page.Culture.ToString() == "English (United States)")
                return dtm.ToString();
            if (Page.Culture.ToString() == "Persian (Iran)" || Page.Culture.ToString() == "Persian")
            {
                Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
                return sunDate.Weekday.ToString() + "&nbsp;&nbsp; ساعت" + dtm.Hour + ":" + dtm.Minute ;
            }

            return dtm.ToString();
        }
    </script>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table border="0"  dir="ltr" cellpadding="0" style="width:550px;height:20px; border-collapse: collapse;background: transparent url(  '../images/bg_Panel_title.jpg' ) repeat-x scroll center top;">
                <tr>
                    <td width="5%">
                    </td>
                    <td align="left" width="19%" valign="top">
                    </td>
                    <td align="left" width="19%" valign="top">
                        <asp:Literal Text="<%$ Resources:Resource, Topic %>" runat="server" ID="lit001" />
                    </td>
                    <td align="left" width="19%" valign="top">
                        <asp:Literal Text="<%$ Resources:Resource, email %>" runat="server" ID="Literal2" />
                    </td>
                    <td align="left" width="19%" valign="top">
                        <asp:Literal Text="<%$ Resources:Resource, Date_send %>" runat="server" ID="Literal3" />
                    </td>
                    <td align="left" width="19%" valign="top">
                        <asp:Literal Text="<%$ Resources:Resource, Operate %>" runat="server" ID="Literal4" />
                    </td>
                </tr>
            </table>
            <asp:DataPager PagedControlID="listItems" runat="server" ID="dataPager">
                <Fields>
                    <asp:NumericPagerField />
                </Fields>
            </asp:DataPager>
            <br />
            <table cellspacing="1" class="style1">
                <tr>
                    <td>
                        <asp:ListView ID="listItems" runat="server" OnPagePropertiesChanging="listItems_PagePropertiesChanging">
                            <LayoutTemplate>
                                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            </LayoutTemplate>
                            <ItemTemplate>
                                <table id="table2" border="0" cellpadding="0" dir="ltr" style="border-collapse: collapse"
                                    width="550">
                                    <tr>
                                        <td width="5%">
                                            <input id="chkBxMail" runat="server" class="filename" name="checked[]" type="checkbox"
                                                value='<%# Eval("id")%>' />
                                            <img src="../images/Icons/lock.png" />
                                        </td>
                                        <td align="left" valign="top" width="19%">
                                        </td>
                                        <td align="left" valign="top" width="19%">
                                            <%# Eval("topic")%>
                                        </td>
                                        <td align="left" valign="top" width="19%">
                                           <%-- <%# Eval("Uid")%>--%>
                                        </td>
                                        <td align="left" valign="top" width="19%">
                                            <%# Set_Date(Eval("Send_date").ToString())%>
                                        </td>
                                        <td align="left" valign="top" width="19%">
                                            <a href='http://www.phasco.com/SendMss.aspx?id=<%# Eval("Id") %>'>
                                                <asp:Literal ID="lit2" runat="server" Text="<%$ Resources:Resource, Reply %>" />
                                            </a>| <a href='inquiry_List.aspx?vid=<%# Eval("Id") %>'>
                                                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, Detail %>" />
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            <ItemSeparatorTemplate>
                              <hr />
                            </ItemSeparatorTemplate>
                        </asp:ListView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button_Delete" runat="server" OnClick="Button_Delete_Click" Text="<%$ Resources:Resource, Delete %>" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <center>
                <table dir='<asp:Literal ID="Literal14580w4w" runat="server" Text="<%$ Resources:Resource, dir %>" />' width="550">
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label1" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Subject %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_Topic" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource, Date_send %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_Send_Date" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource, Message %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_Message" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource, Company_Name %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_Company_Name" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource, Name %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_Name" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="background:#ccc;" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource, CompanyCompany_Address_Name %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_Company_address" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Email %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_Email" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Resource, UId %>" />
                        </td>
                        <td class="td_register_de">
                            <asp:Label ID="Label_UId" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                          <img src="../images/reload.jpg" />  <asp:HyperLink ID="HyperLink_Reply" runat="server" NavigateUrl="inquiry_List.aspx" 
                                Text="<%$ Resources:Resource, Reply %>"></asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register" colspan="2">
                            <asp:HyperLink NavigateUrl="inquiry_List.aspx" ID="HyperLink11" Text="<%$ Resources:Resource, Back_List %>"
                                runat="server"></asp:HyperLink>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td class="td_register_de">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </center>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <center>
                <table dir='<asp:Literal ID="Literal14580ww" runat="server" Text="<%$ Resources:Resource, dir %>" />' width="550">
                    <tr>
                        <td class="td_register">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Label_Mss" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal14" runat="server" 
                                Text="<%$ Resources:Resource, topic %>" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_Subject" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:Resource, email %>" />
                        </td>
                        <td>
                            <asp:Label ID="Label_Email_send" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:Resource, message %>" />
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_BodyMail" runat="server" TextMode="MultiLine" Height="100px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="td_register">
                            &nbsp;
                        </td>
                        <td>
                            <asp:ImageButton ID="ImageButton_Insert" runat="server" ImageUrl="<%$ Resources:Resource, Submit_Img %>"
                                OnClick="ImageButton_Insert_Click" />
                        </td>
                    </tr>
                </table>
            </center>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</asp:Content>
