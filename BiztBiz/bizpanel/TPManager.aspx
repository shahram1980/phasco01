<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="TPManager.aspx.cs" Inherits="PerisanCMS.CPanel.TPManager" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<script language="C#" runat="server">
    public string Allow_Mode(int Allow)
    {
        if (Allow == 0) return "<font size=1 color=#0000FF>آزاد</font>";
        if (Allow == 1) return "<b><font size=1 color=#FF0000>محدود</font></b>";
        return "نامشخص";
    }
    public string Active_Mode(int Mode)
    {
        if (Mode == 1) return "<font size=1 color=#0000FF>فعال</font>";
        if (Mode == 0) return "<font size=1 color=#FF0000>غير فعال</font>";
        return "نامشخص";
    }
    public string Banner_View(int Allow, int id)
    {
        string image_Rollover = "";
        if (Allow == 1)
        // image_Rollover = "<a href='#' class='thumbnail' ><img src='Images/images.gif' border='0' /><span><img src='../Upf/FolderImages/mperis_" + id.ToString() + ".jpg' /><br /></span></a>";
        {
            image_Rollover = " <div>";
            image_Rollover = image_Rollover + "<a href='../Upf/FolderImages/mperis_" + id.ToString() + ".jpg' class='highslide' onclick='return hs.expand(this)'><img src='Images/images.gif' alt='Highslide JS'	title='Click to enlarge'></a>";
            image_Rollover = image_Rollover + "<div id='closebutton' class='highslide-overlay closebutton'  onclick='return hs.close(this)' title='Close'></div>";
            image_Rollover = image_Rollover + "</div>";
        }
        return image_Rollover;
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
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<table style="width: 100%">
    <tr>
        <td dir="rtl" style="width: 80%" valign="top" align="right">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; width: 10%;
                        padding-top: 5px">
                        <img src="Images/PERiSANALARM.jpg" /></td>
                    <td style="width: 90%;padding:5px;">
                        <asp:Label ID="Lbl_ALARM" runat="server" Font-Names="Tahoma" ForeColor="Red"></asp:Label></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td dir="rtl" style="width: 80%" valign="top">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="left" style="width: 20%" valign="top">
                        زبان :
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                            Font-Size="X-Small" 
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Enabled="False">
                            <asp:ListItem Value="Persian (Iran)">فارسی</asp:ListItem>
                            <asp:ListItem Value="English (United States)">English</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td style="width: 20%" valign="top" align="left">
                        عنوان :</td>
                    <td style="width: 80%" valign="top" align="right">
                        <asp:TextBox ID="TextBox_Text" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            Width="383px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 20px" valign="top" align="left">
                        توضيحات :</td>
                    <td style="width: 80%; height: 20px" valign="top" align="right">
                        <asp:TextBox ID="TextBox_Description" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            Width="383px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 20px;" valign="top" align="left">
                        وضعیت نمايش&nbsp; :
                    </td>
                    <td style="width: 80%; height: 20px;" valign="top" align="right">
                        <asp:CheckBox ID="CheckBox_Allow_wview" runat="server" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                </tr>
                <tr>
                    <td style="width: 20%" valign="top" align="left">
                        بنر :</td>
                    <td style="width: 80%" valign="top" align="right">
                        <asp:FileUpload ID="FileUpload_Banner" runat="server" Font-Names="Tahoma" Font-Size="X-Small" />&nbsp;
                        <asp:LinkButton ID="LinkButton_delete_Image" runat="server" Font-Size="XX-Small"
                            ForeColor="Red" OnClick="LinkButton_delete_Image_Click" Visible="False">حذف تصویر</asp:LinkButton></td>
                </tr>
                <tr>
                    <td style="width: 20%; height: 37px;" valign="top">
                        <asp:HiddenField ID="HiddenField_CurrentId" runat="server" />
                        <asp:HiddenField ID="HiddenField_Current_cell_Id" runat="server" />
                        <asp:HiddenField ID="HiddenField_Mode_Search" runat="server" />
                    </td>
                    <td style="width: 80%; height: 37px;" valign="top" align="right">
                        <asp:Button ID="Button_Insert" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_Insert_Click" Text="ثبت شود" />
                        <asp:Button ID="Button_Edit" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            OnClick="Button_Edit_Click" Text="ويرايش" Visible="False" /></td>
                </tr>
                <tr>
                    <td colspan="2" style="width: 100%" valign="top" align="right">
                        &nbsp;
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td style="width: 30%" valign="top">
                                    <asp:LinkButton ID="LinkButton_Change_Mode" runat="server" OnClick="LinkButton_Change_Mode_click">تغییر حالت منو</asp:LinkButton></td>
                                <td style="width: 70%" valign="top">
                                    <asp:LinkButton ID="LinkButton_Back_To_Parent" runat="server" OnClick="LinkButton_Back_To_Parent_Click"
                                        Visible="False">برگشت به مرحله قبل</asp:LinkButton></td>
                            </tr>
                            <tr>
                                <td style="width: 30%" valign="top">
                                    <asp:Menu ID="Menu1" DataSourceID="xmlDataSource" runat="server" DynamicHorizontalOffset="2"
                                        StaticDisplayLevels="1" DynamicEnableDefaultPopOutImage="False" StaticPopOutImageUrl="~/bizpanel/Images/Menu_PopUp_f.gif"
                                        DynamicPopOutImageUrl="~/bizpanel/Images/Menu_PopUp_f.gif" Height="23px" MaximumDynamicDisplayLevels="9">
                                        <DataBindings>
                                            <asp:MenuItemBinding DataMember="MenuItem" NavigateUrlField="NavigateUrl" TextField="Text"
                                                ToolTipField="ToolTip" />
                                        </DataBindings>
                                        <StaticSelectedStyle CssClass="Menu_static_Text" />
                                        <StaticHoverStyle CssClass="Menu_static_Ohover" />
                                        <StaticMenuItemStyle CssClass="Menu_static" />
                                        <StaticMenuStyle CssClass="Menu_static_Text" />
                                        <DynamicMenuItemStyle CssClass="Menu_static" />
                                        <DynamicMenuStyle CssClass="Menu_static" />
                                        <DynamicSelectedStyle CssClass="Menu_static_Text" />
                                        <DynamicHoverStyle CssClass="Menu_static_Ohover" />
                                    </asp:Menu>
                                    <asp:XmlDataSource ID="xmlDataSource" TransformFile="~/TransformXSLT.xsl" XPath="MenuItems/MenuItem"
                                        runat="server" EnableCaching="False" />
                                </td>
                                <td style="width: 70%" valign="top">
                                    <asp:GridView ID="GRD_List" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        ForeColor="#333333" GridLines="None" Width="100%" EmptyDataText="زیر گروه انتخابی عنوانی وجود ندارد">
                                        <FooterStyle BackColor="#FF8080" Font-Bold="True" ForeColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="text" HeaderImageUrl="~/bizpanel/Images/folder.png" HeaderText="عنوان">
                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="40%" />
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderImageUrl="~/bizpanel/Images/Subject.png" HeaderText="زیرگروه">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton_SubLevel" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.MenuID","{0}") %>'
                                                        runat="server" OnCommand="LinkButton_SubLevel_Command">زیرگروه</asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderImageUrl="~/bizpanel/Images/Text.png" HeaderText="متن">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton_Text" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.MenuID","{0}") %>'
                                                        runat="server" OnCommand="LinkButton_Text_Command">متن</asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderImageUrl="~/bizpanel/Images/Image.png" HeaderText="گالری">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton_Gallery" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.MenuID","{0}") %>'
                                                        runat="server" OnCommand="LinkButton_Gallery_Command">گالری</asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderImageUrl="~/bizpanel/Images/attach.png" HeaderText="سند">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton_Doc" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.MenuID","{0}") %>'
                                                        runat="server" OnCommand="LinkButton_Doc_Command">سند</asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderImageUrl="~/bizpanel/Images/Permission.png" HeaderText="تنظیمات">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton_Secuirty" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.MenuID","{0}") %>'
                                                        runat="server" OnCommand="LinkButton_Secuirty_Command">تنظیمات</asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderImageUrl="~/bizpanel/Images/Edit.png" HeaderText="حذف | ویرایش">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton_edit" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.MenuID","{0}") %>'
                                                        runat="server" OnCommand="LinkButton_edit_Command">
                                            ويرايش
                                                    </asp:LinkButton><br />
                                                    <asp:LinkButton ID="LinkButton_delete" 
                                                    OnClientClick="return confirm('در صورت حذف تمامی زیر منوها و مطالب آن حذف خواهد شد')"
                                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.MenuID","{0}") %>'
                                                        runat="server" OnCommand="LinkButton_delete_Command">
                                            حذف
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Right" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderImageUrl="~/bizpanel/Images/icon_users_32px.gif" HeaderText="وضعیت">
                                                <ItemTemplate>
                                                    <%# Allow_Mode(Convert.ToInt32(Eval("View_Allow"))) %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <%# Banner_View(Convert.ToInt32(Eval("banner")),Convert.ToInt32(Eval("Menuid"))) %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle BackColor="#EFF3FB" />
                                        <EditRowStyle BackColor="AppWorkspace" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="InactiveCaptionText" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td dir="rtl" style="width: 80%" valign="top">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td style="width: 40%">
                                <table border="0" dir="ltr" style="width: 100%">
                                    <tr>
                                        <td align="right" width="70%">
                                        </td>
                                        <td align="right" width="30%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="70%">
                                            <asp:FileUpload ID="FileUpload_Image_Big" runat="server" /></td>
                                        <td align="right" width="30%">
                                            تصویر بزرگ</td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="70%">
                                        </td>
                                        <td align="right" width="30%">
                                            <span style="font-size: 10pt; font-family: Tahoma"></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="70%">
                                            <asp:Button ID="Button_Images" runat="server" Font-Names="Tahoma" OnClick="Button_Images_Click"
                                                Text="ارسال" /></td>
                                        <td align="right" width="30%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" width="70%">
                                        </td>
                                        <td align="right" width="30%">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 60%">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="width: 100%">
                                <asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="5">
                                    <ItemTemplate>
                                        <div style="text-align: center">
                                            <table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
                                                <tr>
                                                    <td style="width: 100%">
                                                        <table border="0" style="width: 100%">
                                                            <tr>
                                                                <td align="center" style="width: 100%">
                                                                    <div>
                                                                        <a href="../upf/imgtpme/b<%# Eval("small")%>" class="highslide" onclick="return hs.expand(this)">
                                                                            <img src="../upf/imgtpme/s<%# Eval("small")%>" alt="Highslide JS" title="Click to enlarge" />
                                                                        </a>
                                                                      
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center" style="width: 100%">
                                                                    <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Autoid","{0}") %>'
                                                                        Font-Names="Tahoma" Font-Size="Small" Font-Underline="False" OnCommand="LinkButton_Delete_Command">حذف</asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="width: 100%">
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <table border="0" dir="ltr" style="width: 100%">
                        <caption>
                        </caption>
                        <tr>
                            <td>
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td style="width: 50%" valign="top">
                                            <asp:GridView ID="GridView_docs" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black"
                                                GridLines="Vertical" Width="98%">
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <table id="table1" border="0" dir="rtl" width="100%">
                                                                <tr>
                                                                    <td align="right">
                                                                        <%# Eval("Commnet")%>
                                                                        <asp:LinkButton ID="DOwn" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>'
                                                                            OnCommand="DOwn_Command"> 
                                  [دانلود]
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                    <td width="20%">
                                                                        <asp:LinkButton ID="delete" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>'
                                                                            Font-Bold="True" Font-Names="tahoma" Font-Size="X-Small" Font-Underline="False"
                                                                            ForeColor="Red" OnCommand="delete_Command"> 
                                        حذف
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                        <ItemStyle Width="80%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <img border="0" src='<%# Ex_Icom(Convert.ToString(Eval("ex_")))%>' />
                                                        </ItemTemplate>
                                                        <ItemStyle Width="20%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                            </asp:GridView>
                                        </td>
                                        <td style="width: 50%" valign="top">
                                            <div style="text-align: center">
                                                <table border="0" style="width: 100%">
                                                    <tr>
                                                        <td align="right" width="90%">
                                                            <asp:TextBox ID="Text_Comment" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                Height="55px" TextMode="MultiLine" Width="286px"></asp:TextBox></td>
                                                        <td align="right" width="10%">
                                                            <span style="font-size: 10pt; font-family: Tahoma">عنوان</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" width="90%">
                                                            <asp:FileUpload ID="FileUpload_DOc" runat="server" /></td>
                                                        <td align="right" width="10%">
                                                            <span style="font-size: 10pt; font-family: Tahoma">فايل</span></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" width="90%">
                                                            <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox></td>
                                                        <td align="right" width="10%">
                                                            <span style="font-size: 10pt; font-family: Tahoma"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" width="90%">
                                                            <asp:Button ID="Button_Doc" runat="server" Font-Names="Tahoma" OnClick="Button_Doc_Click"
                                                                Text="ارسال" /></td>
                                                        <td align="right" width="10%">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" width="90%">
                                                        </td>
                                                        <td align="right" width="10%">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td style="width: 100%">
                               <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="350px" Width="550px">
                        </FCKeditorV2:FCKeditor>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%">
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="Button_Insert_text" runat="server" Font-Names="Tahoma" OnClick="Button_Insert_Menutext"
                        Text="ارسال" /></asp:View>
                <asp:View ID="View5" runat="server">
                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="right" style="width: 100%">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 10%" valign="top">
                                            جستجو :</td>
                                        <td align="right" style="width: 20%" valign="top">
                                            <asp:TextBox ID="TextBox_Search" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                Width="168px"></asp:TextBox></td>
                                        <td align="right" style="width: 60%" valign="top">
                                            <asp:RadioButtonList ID="RadioButtonList_Search_Mode" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0">نمايش کل کاربران</asp:ListItem>
                                                <asp:ListItem Selected="True" Value="1">نام کاربری</asp:ListItem>
                                                <asp:ListItem Value="2">کد کاربری</asp:ListItem>
                                                <asp:ListItem Value="3">ايميل</asp:ListItem>
                                            </asp:RadioButtonList></td>
                                        <td align="right" colspan="2" style="width: 10%" valign="top">
                                            <asp:Button ID="Button_Search" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                OnClick="Button_Search_Click" Text="پيدا کن" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 100%">
                                &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr>
                                        <td align="right" style="width: 50%" valign="top">
                                            <asp:GridView ID="Grid_Users" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="Grid_Users_PageIndexChanging"
                                                PageSize="25" Width="100%">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <input id="chkBxMail" type="checkbox" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="id" HeaderText="کد کاربری" />
                                                    <asp:BoundField DataField="Uid" HeaderText="نام کاربری" />
                                                    <asp:BoundField DataField="Email" HeaderText="ایمیل" />
                                                    <asp:TemplateField HeaderText="وضعيت">
                                                        <ItemTemplate>
                                                            <%# Active_Mode(Convert.ToInt32(Eval("UserActive").ToString()))%>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle BackColor="#EFF3FB" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                        </td>
                                        <td align="left" style="width: 50%" valign="top">
                                            <asp:GridView ID="Grid_Users_Access" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="Grid_Users_Access_PageChanging"
                                                PageSize="25" Width="80%">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <input id="Checkbox1" type="checkbox" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="id" HeaderText="کد کاربری" />
                                                    <asp:BoundField DataField="Uidm" HeaderText="نام کاربری" />
                                                </Columns>
                                                <RowStyle BackColor="#EFF3FB" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <AlternatingRowStyle BackColor="White" />
                                            </asp:GridView>
                                            <asp:Button ID="Button_Delete_User_Active" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                OnClick="Button_Delete_User_Active_click" Text="حذف شود" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 50%" valign="top">
                                            <asp:Button ID="Button_AddUser" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                OnClick="Button_Button_AddUser" Text="اضافه کردن" /></td>
                                        <td align="right" style="width: 50%" valign="top">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 100%">
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView></td>
    </tr>
</table>

</asp:Content>
 