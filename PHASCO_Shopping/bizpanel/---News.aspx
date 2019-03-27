<%@ Page Language="C#"  MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" Codebehind="---News.aspx.cs" Inherits="phasco.Cpanel.News"  %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>


<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script language="C#" runat="server">
        
         public string set_Lang(string lang) 
    {
        if (lang == "Persian (Iran)") return "فارسی";
        if (lang == "English (United States)") return "انگليسی";
        return "زبان ناشناخته";
    }
        </script>
 
    <div style="text-align: right">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td colspan="2" dir="rtl" style="width: 100%">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; width: 10%;
                                padding-top: 5px">
                                <img src="Images/PERiSANALARM.jpg" />
                                </td>
                            <td style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; width: 90%;
                                padding-top: 5px">
                                <asp:Label ID="Lbl_ALARM_Main" runat="server" Font-Names="Tahoma" ForeColor="Red"></asp:Label></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 90%">
                    <asp:LinkButton ID="LinkButton_Insert_New" runat="server" OnClick="LinkButton_Insert_New_Click">درج خبر جدید</asp:LinkButton>&nbsp;
                    | &nbsp;
                    <asp:LinkButton ID="LinkButton_Edit_News" runat="server" OnClick="LinkButton_Edit_News_Click">ويرايش خبر</asp:LinkButton>&nbsp;
                  </td>
                <td style="width: 10%">
                </td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 90%; height: 13px">
                    </td>
                <td style="width: 10%; height: 13px">
                </td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 90%; height: 13px;">
                </td>
                <td style="width: 10%; height: 13px;">
                </td>
            </tr>
        </table>
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table id="table69" border="0" dir="rtl" width="700">
                <tr>
                    <td style="height: 32px; width: 77px;">
                    </td>
                    <td align="right" style="font-size: 12pt; font-family: Times New Roman; height: 32px">
                        <asp:Label ID="lbl_alarm" runat="server" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td style="height: 32px; width: 77px;">
                        زبان</td>
                    <td style="font-size: 12pt; font-family: Times New Roman; height: 32px" align="right">
                        <asp:DropDownList ID="DropDownList1" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                            <asp:ListItem Value="Persian (Iran)">فارسی</asp:ListItem>
                            <asp:ListItem Value="English (United States)">English</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="height: 32px; width: 77px;">
                        <font face="Tahoma" size="2"><span lang="fa">عنوان خبر</span></font></td>
                    <td style="font-size: 12pt; font-family: Times New Roman; height: 32px" align="right">
                        <asp:TextBox ID="Title" runat="server" Font-Names="Tahoma" Font-Size="X-Small" TextMode="MultiLine"
                            Width="70%"></asp:TextBox></td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td style="height: 18px; width: 77px;" valign="top">
                        <font face="Tahoma" size="2"><span lang="fa">متن خبر</span></font></td>
                    <td style="height: 18px" dir="rtl">
                             <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="350px" 
                                Width="95%">
                        </FCKeditorV2:FCKeditor>
                        </td>
                </tr>
                <tr style="font-size: 12pt; font-family: Times New Roman">
                    <td style="height: 24px; width: 77px;">
                        تصوير</td>
                    <td style="height: 24px" align="right">
                        &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td style="width: 100%">
                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100%">
                                    <asp:Image ID="Image_News" runat="server" Visible="False" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="height: 22px; width: 77px;">
                        <font face="Tahoma" size="2"><span lang="fa">&nbsp;نظر خواهی</span></font></td>
                    <td style="height: 22px" align="right">
                        &nbsp;<asp:CheckBox ID="CheckBox" runat="server" /></td>
                </tr>
                <tr>
                    <td style="width: 77px; height: 22px">
                    </td>
                    <td align="right" style="height: 22px">
                        <asp:RadioButtonList ID="RadioButtonList_Mode" runat="server" Font-Names="Tahoma"
                            Font-Size="X-Small">
                            <asp:ListItem Selected="True" Value="0">خبر</asp:ListItem>
                            <asp:ListItem Value="1">ارسال به خبر نامه</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td style="height: 21px; width: 77px;">
                    </td>
                    <td style="height: 21px">
                        <asp:Button ID="Button_Insert_New" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            Text="ثبت شود" OnClick="Button_Insert_New_Click" />
                        <asp:Button ID="Button_News_Edit" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            Text="ويرايش شود" OnClick="Button_News_Edit_Click" /></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table id="Table1" border="0" width="100%">
                <tr>
                    <td align="right" valign="top" width="248" dir="rtl" style="width: 33%">
                        <font face="Tahoma" size="2">
                            <asp:DataGrid ID="GRD_Comm" runat="Server" AutoGenerateColumns="False" CellPadding="10"
                                ShowHeader="False" Width="100%">
                                <HeaderStyle BackColor="Salmon" />
                                <Columns>
                                    <asp:BoundColumn DataField="comment" HeaderText="Product Name"></asp:BoundColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AutoId","{0}") %>'
                                                OnCommand="lnk_Command">&#1575;&#1580;&#1575;&#1586;&#1607;</asp:LinkButton>
                                            <asp:LinkButton ID="Link_delete_Commnet" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AutoId","{0}") %>'
                                                OnCommand="Link_delete_Commnet_Command">&#1581;&#1584;&#1601;</asp:LinkButton>
                                      <%--      <%#if (Request.QueryString["IdArchive_m"] != "" && Request.QueryString["IdArchive_d"] != "")
                                                              { %>--%>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>
                          </font></td>
                    <td align="right" rowspan="2" valign="top" width="316" style="width: 33%">
                        <font face="Tahoma" size="2"> 
                      
                                                   
                            <asp:DataGrid ID="Grid_editList" runat="Server" AllowPaging="True" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#333333" GridLines="None" PagerStyle-BorderColor="beige"
                                PagerStyle-Mode="NumericPages" PageSize="20" ShowHeader="False" Width="100%">
                                <Columns>
                                    <asp:TemplateColumn HeaderText="Column 1">
                                        <ItemTemplate>
                                  
                                                 <table id="table1" border="0" dir="rtl" style="border-collapse: collapse" width="95%"> <tr>
                                                        <td align="right" dir="rtl" style="height: 59px" valign="top">
                                               <%# Eval("title")%>
                                            <b>   <font size="1" color="#ff0000">
                                               (<%# set_Lang(Eval("lang").ToString())%>)
                                               </font></b>
                                                            <br />
                                                    
                                                            <%# Eval("Farsi_Month")%>
                                                            <%# Eval("Farsi_Daye")%>
                                                            [<asp:LinkButton ID="Comment_User" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                                OnCommand="Comment_User_Command">نظرات</asp:LinkButton>] [
                                                            <asp:LinkButton ID="Link_Delete" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                                OnCommand="Link_Delete_Command" OnClientClick="return confirm('آیا برای حذف اطمینان دارید ');">&#1581;&#1584;&#1601;</asp:LinkButton>] [<asp:LinkButton
                                                                    ID="Link_Edit_News" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                                    OnCommand="Link_Edit_News_Command">&#1608;&#1610;&#1585;&#1575;&#1610;&#1588;</asp:LinkButton>]</td>
                                                 
                                             </tr></table>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                                <PagerStyle BackColor="#2461BF" BorderColor="Red" BorderStyle="Solid" BorderWidth="1px"
                                    Font-Size="Medium" ForeColor="White" HorizontalAlign="Center"
                                    Position="TopAndBottom" VerticalAlign="Middle" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <AlternatingItemStyle BackColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <ItemStyle BackColor="#EFF3FB" />
                            </asp:DataGrid>
                        </font>
                    </td>
                    <td align="right" rowspan="2" style="width: 33%" valign="top">
                        <font face="Tahoma" size="1">&nbsp;
                            <div style="text-align: center">
                                <table border="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 100%">
                                            آرشیو
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" dir="ltr" style="width: 100%">
                                            <asp:DataList ID="DataList_archive" runat="server" RepeatColumns="3">
                                                <ItemTemplate>
                                                    <table border="1" bordercolor="#C0C0C0" onmouseout="this.bgColor='#ffffff'" onmouseover="this.bgColor='#CFDEE9'"
                                                        style="border-collapse: collapse">
                                                        <tr>
                                                            <td dir="ltr" style="width: 7px">
                                                                <a href='?page=news&IdArchive_m=<%#DataBinder.Eval(Container.DataItem, "Farsi_Month")%>&IdArchive_d=<%#DataBinder.Eval(Container.DataItem, "Farsi_Daye")%>'>
                                                                    <%#DataBinder.Eval(Container.DataItem, "Farsi_Daye")%>
                                                                    /<%#DataBinder.Eval(Container.DataItem, "Farsi_Month")%>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList></td>
                                    </tr>
                                </table>
                            </div>
                        </font>
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top" width="248">
                        <font face="Tahoma" size="2"></font>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_Nazar_Id" runat="server" />
    <asp:HiddenField ID="HiddenField_Edit_Id" runat="server" />
</asp:Content>
