<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    Codebehind="Eshop_Subject.aspx.cs" Inherits="phasco_webproject.Cpanel.Eshop_Subject" %>
<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <script language="javascript">
<!--
function popUp(N) {

newWindow = window.open(N, 'popUp','toolbar=no,menubar=no,resizable=yes,scrollbars=yes,status=no,location=no,width=770,height=650');
}
//-->
    </script>

    <script language="C#" runat="server">
        public string Active_Check(int val)
        {
            string ret_ = "";

            if (val == 1)
                ret_ = "فعال";
            else if (val == 0)
                ret_ = "غير فعال";

            return ret_;
        }
        public string Ex_Icom(string val)
        {
            string ret_ = "";

            switch (val)
            {
                case ".ram":
                    ret_ = "../images/Doc_Icon/real.gif";
                    break;
                case ".ra":
                    ret_ = "../images/Doc_Icon/real.gif";
                    break;
                case ".pdf":
                    ret_ = "../images/Doc_Icon/pdf.gif";
                    break;

                case ".doc":
                    ret_ = "../images/Doc_Icon/Word.gif";
                    break;
                case ".txt":
                    ret_ = "../images/Doc_Icon/txt.gif";
                    break;
                case ".ppt":
                    ret_ = "../images/Doc_Icon/power.gif";
                    break;
                case ".mpg":
                    ret_ = "../images/Doc_Icon/movi.gif";
                    break;

                case ".mpeg":
                    ret_ = "../images/Doc_Icon/movi.gif";
                    break;
                case ".wmv":
                    ret_ = "../images/Doc_Icon/movi.gif";
                    break;
                case ".avi":
                    ret_ = "../images/Doc_Icon/avi.gif";
                    break;
                case ".jpeg":
                    ret_ = "../images/Doc_Icon/jpeg.gif";
                    break;

                case ".jpg":
                    ret_ = "../images/Doc_Icon/jpeg.gif";
                    break;
                case ".gif":
                    ret_ = "../images/Doc_Icon/Gif.gif";
                    break;

                case ".html":
                    ret_ = "../images/Doc_Icon/html.gif";
                    break;
                case ".htm":
                    ret_ = "../images/Doc_Icon/html.gif";
                    break;
                case ".swf":
                    ret_ = "../images/Doc_Icon/swf.gif";
                    break;
                case ".xls":
                    ret_ = "../images/Doc_Icon/excel.gif";

                    break;
                default:
                    ret_ = "../images/Doc_Icon/none.gif";
                    break;


            }

            return ret_;
        }

        public string image_Check(string val, int id_, string Image_Mode, int AutoId)
        {
            string ret_ = "";
            string name_Fiel = Convert.ToString(id_) + Convert.ToString((id_ * 4));
            string Get_Id = Convert.ToString(Request.QueryString["id"]);
            if (val == "yes")
            {
                ret_ = "<a href='" + "javascript:popUp(&#39Image_Product.aspx?Id_Img=" + name_Fiel + Image_Mode + "&#39)" + "'><img border='0' src='../images/Photo_Act.gif' width='16' height='16'></a>";
            }
            else if (val == "no")
            {
                ret_ = "<img border='0' src='../images/Photo_dea.gif' width='16' height='16'>";
            }
            return ret_;
        }
          
         public string image_Check(string Exc, int id_, int Image_Mode)
        {
            string ret_ = "";
            string name_Fiel = phasco.BaseClass.MyFileUploader.GetImageName("BrandImage", id_, Exc);

            if (Exc != "np")
            {
                ret_ = "<img border='0' src='../phascoupfile/" + name_Fiel + "'>";
            }

            return ret_;
        }
        public string image_COmmand(string Exc, int id_, int Image_Mode)
        {
            string ret_ = "";
            string name_Fiel = phasco.BaseClass.MyFileUploader.GetImageName("BrandImage", id_, Exc);

            if (Exc != "np")
            {
                ret_ = "[<a href='c_Images_SubJect.aspx?delid=" + id_ + "'>حذف </a>]";
                ret_ = ret_ + "[<a href='c_Images_SubJect.aspx?chanid=" + id_ + "&img=" + Exc + "'>تعويض </a>]";
            }
            else
                ret_ = "[<a href='c_Images_SubJect.aspx?insid=" + id_ + "'>اضافه </a>]";

            return ret_;
        }

        public string CHeck_Active(int id_, int Image_Mode)
        {
            string ret_ = "";
            if (Image_Mode == 1)
            {
                ret_ = "[<a href='c_Images_SubJect.aspx?Modid=" + id_ + "&now=" + Convert.ToString(Image_Mode) + "'>نمايش</a>]";
            }
            else if (Image_Mode == 0)
                ret_ = "[<a href='c_Images_SubJect.aspx?Modid=" + id_ + "&now=" + Convert.ToString(Image_Mode) + "'>عدم نمايش</a>]";

            return ret_;
        }         
        
    </script>

    <div style="text-align: center">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td style="width: 100%">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="right" style="width: 100%; height: 13px">
                                &nbsp;<asp:Label ID="LBL_Alarm" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                    ForeColor="Red"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 100%" valign="top">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            <div align="center">
                                <table id="Table8" border="1" dir="rtl" onclick="return table1_onclick()" style="border-collapse: collapse"
                                    width="550">
                                    <tr>
                                        <td>
                                            <table id="Table7" border="0" width="100%">
                                                <tr>
                                                    <td colspan="2" dir="ltr">
                                                        <div style="text-align: right">
                                                            <table border="0" style="width: 100%">
                                                                <tr>
                                                                    <td style="width: 70%">
                                                                        <asp:TextBox ID="Text_Title" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                            Width="40%"></asp:TextBox></td>
                                                                    <td align="left" dir="rtl" style="width: 30%" width="5%">
                                                                        عنوان فارسی :</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 70%">
                                                                        <asp:DropDownList ID="DropDownList_Lang" runat="server" Font-Names="Tahoma">
                                                                            <asp:ListItem Value="Persian (Iran)">فارسی</asp:ListItem>
                                                                            <asp:ListItem Value="English (United States)">Eglish</asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                    <td align="left" dir="rtl" style="width: 30%">
                                                                        زبان :</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 70%">
                                                        <asp:FileUpload ID="FileUpload1" runat="server" /></td>
                                                                    <td align="left" dir="rtl" style="width: 30%">
                                                                        تصویر :</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 70%">
                                                        <asp:CheckBox ID="Check_File" runat="server" /></td>
                                                                    <td align="left" dir="rtl" style="width: 30%">
                                                                        نمايش در صفحه اصلی :</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 70%">
                                                        <asp:Button ID="Button" runat="server" Font-Names="Tahoma" Font-Size="X-Small" OnClick="Button_Click"
                                                            Text="ثبت شود" /></td>
                                                                    <td align="left" dir="rtl" style="width: 30%">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" colspan="2" dir="rtl">
                                            <asp:DataGrid ID="Grd_SubJect" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyField="Id"
                                                Font-Names="Tahoma" Font-Size="X-Small" ForeColor="#333333" GridLines="None"
                                                OnCancelCommand="DataCancel" OnDeleteCommand="DataDelete" OnEditCommand="DataEdit"
                                                OnUpdateCommand="DataUpdate" Width="100%">
                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                                <HeaderStyle BackColor="#5D7B9D" BorderColor="Black" BorderWidth="5px" Font-Bold="True"
                                                    ForeColor="White" />
                                                <Columns>
                                                    <asp:BoundColumn DataField="SubJect" HeaderText="گروه"></asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="زیر گروه">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton_Sub_category" 
                                                             CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                             
                                                            runat="server" OnCommand="LinkButton_Sub_category_Command">زير گروه</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:EditCommandColumn CancelText="انصراف" EditText="ويرايش" HeaderText="ويرايش"
                                                        UpdateText="ذخيره"></asp:EditCommandColumn>
                                                    <asp:ButtonColumn CommandName="Delete" HeaderText="حذف" Text="حذف"></asp:ButtonColumn>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <table border="0" width="100%" id="table1" cellpadding="0" style="border-collapse: collapse">
                                                                <tr>
                                                                    <td colspan="2" width="100%">
                                                                        <%# image_Check(Convert.ToString(Eval("Image_Exc")), Convert.ToInt32(Eval("Id")), Convert.ToInt32(Eval("Image_Mode")))%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" width="50%">
                                                                        <%# image_COmmand(Convert.ToString(Eval("Image_Exc")), Convert.ToInt32(Eval("Id")), Convert.ToInt32(Eval("Image_Mode")))%>
                                                                    </td>
                                                                    <td align="center" width="50%">
                                                                        <%# CHeck_Active(Convert.ToInt32(Eval("Id")), Convert.ToInt32(Eval("Image_Mode")))%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="lang" HeaderText="زبان"></asp:BoundColumn>
                                                </Columns>
                                                <EditItemStyle BackColor="#999999" />
                                                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            </asp:DataGrid></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td dir="rtl">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <div align="center">
                                <table id="Table10" border="1" dir="rtl" onclick="return table1_onclick()" style="border-collapse: collapse"
                                    width="550">
                                    <tr>
                                        <td>
                                            <table id="Table9" border="0" width="100%">
                                                <tr>
                                                    <td colspan="2" dir="ltr">
                                                        <div style="text-align: right">
                                                            <table border="0" style="width: 100%">
                                                                <tr>
                                                                    <td align="right" style="width: 70%">
                                                                        <asp:Label ID="Label_Current_Subject" runat="server" Font-Bold="True"></asp:Label></td>
                                                                    <td align="left" dir="rtl" style="width: 30%" width="5%">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="width: 70%">
                                                <asp:LinkButton ID="lnk_btn_thisPage" runat="server" OnCommand="lnk_btn_thisPage_Command">برگشت به مرحله بعد</asp:LinkButton></td>
                                                                    <td align="left" dir="rtl" style="width: 30%" width="5%">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="width: 70%">
                                                                        <asp:TextBox ID="Text_Title2" runat="server" Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox>
                                                                    </td>
                                                                    <td align="left" dir="rtl" style="width: 30%" width="5%">
                                                                        عنوان فارسی :</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="width: 70%">
                                                                        <asp:DropDownList ID="DropDownList_Lang2" runat="server" Font-Names="Tahoma">
                                                                            <asp:ListItem Value="Persian (Iran)">فارسی</asp:ListItem>
                                                                            <asp:ListItem Value="English (United States)">Eglish</asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                    <td align="left" dir="rtl" style="width: 30%">
                                                                        زبان :</td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" style="width: 70%">
                                                            <asp:Button ID="Button_Insert_Level2" runat="server" Font-Names="Tahoma" Font-Size="X-Small" OnClick="Button_Insert_Level2_Click"
                                                                Text="ثبت شود" /></td>
                                                                    <td align="left" dir="rtl" style="width: 30%">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 70%">
                                                                    </td>
                                                                    <td align="left" dir="rtl" style="width: 30%">
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" colspan="2" dir="rtl" style="height: 15px">
                                                <asp:DataGrid ID="Grd_SubJect2" runat="server" AutoGenerateColumns="False"
                                                    DataKeyField="Id" OnCancelCommand="DataCancel2" OnDeleteCommand="DataDelete2" OnEditCommand="DataEdit2"
                                                    OnUpdateCommand="DataUpdate2" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="SubJect" HeaderText="گروه"></asp:BoundColumn>
                                                        <asp:EditCommandColumn CancelText="انصراف" EditText="ويرايش" HeaderText="ويرايش"
                                                            UpdateText="ذخيره"></asp:EditCommandColumn>
                                                        <asp:ButtonColumn CommandName="Delete" HeaderText="حذف" Text="حذف"></asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="کالای جدید">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton_New_Product"
                                                                CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                                 runat="server" OnCommand="LinkButton_New_Product_Command">کالای جدید</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="لیست کالا">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LinkButton_List_Product"
                                                                CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                                 runat="server" OnCommand="LinkButton_List_Product_Command">ليست کالا</asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Lang" HeaderText="زبان"></asp:BoundColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                                    <EditItemStyle BackColor="#999999" />
                                                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                </asp:DataGrid></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td dir="rtl">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <div>
                                <table id="Table5" border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                                    <tr>
                                        <td>
                                            <table id="table2" border="0" dir="rtl" width="100%">
                                                <tr>
                                                    <td width="173" align="left" valign="top">
                                                        نام کالا</td>
                                                    <td width="18">
                                                        :</td>
                                                    <td align="right" dir="rtl" width="896">
                                                        <asp:TextBox ID="Title" runat="server" Font-Names="Tahoma" Font-Size="X-Small" MaxLength="255"></asp:TextBox>
                                                        <asp:TextBox ID="Id" runat="server" Visible="False"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top" width="173">
                                                        تعداد کالا</td>
                                                    <td width="18">
                                                        :</td>
                                                    <td align="right" dir="rtl" width="896">
                                                                    <asp:TextBox ID="Total_No" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                        MaxLength="255">0</asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top" width="173">
                                                                    بررسی تعداد کالا</td>
                                                    <td width="18">
                                                        :</td>
                                                    <td align="right" dir="rtl" width="896">
                                                                    <asp:CheckBox ID="Checker" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top" width="173">
                                                        قيمت</td>
                                                    <td width="18">
                                                        :</td>
                                                    <td align="right" dir="rtl" width="896">
                                                        <asp:TextBox ID="Price" runat="server" Font-Names="Tahoma" Font-Size="X-Small" MaxLength="255">0</asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top" width="173">
                                                        نمايش در صفحه اول</td>
                                                    <td width="18">
                                                        :</td>
                                                    <td align="right" dir="rtl" width="896">
                                                        <asp:CheckBox ID="CheckBox_View_HomePage" runat="server" /></td>
                                                </tr>
                                                <tr>
                                                    <td align="left" valign="top" width="173">
                                                        گروه مالياتی
                                                    </td>
                                                    <td width="18">
                                                        :</td>
                                                    <td align="right" dir="rtl" width="896">
                                                        <asp:DropDownList ID="Drop_Tax" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                                                        </asp:DropDownList></td>
                                                </tr>
                                                <tr>
                                                    <td width="173" align="left" valign="top">
                                                        مشخصات</td>
                                                    <td width="18" valign="top">
                                                        :</td>
                                                    <td align="right" dir="rtl" width="896">
                                                        &nbsp;<rade:radeditor id="RadEditor_Content" runat="server" ShowSubmitCancelButtons="False"></rade:radeditor></td>
                                                </tr>
                                                <tr>
                                                    <td width="173">
                                                        &nbsp;</td>
                                                    <td width="18">
                                                        &nbsp;</td>
                                                    <td align="right" width="896">
                                                        &nbsp;<asp:Button ID="btt_Ins" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                            OnClick="btt_Ins_Click" Text="ثبت شود" />
                                                        <asp:Button ID="Button_Edit_Product" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                            OnClick="Button_Edit_Product_Click" Text="ویرایش شود" /></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="50%">
                                            <table id="Table4" border="0" style="border-collapse: collapse" width="100%">
                                                <tr>
                                                    <td>
                                                        <table id="table3" border="0" dir="ltr" width="100%">
                                                            <tr>
                                                                <td style="width: 70%;" width="128" valign="top">
                                                                    &nbsp; &nbsp;
                                                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                                                        <tr>
                                                                            <td align="center" style="width: 100%" valign="top">
                                                                                <asp:Image ID="Image_Edit_Product" runat="server" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center" style="width: 100%" valign="top">
                                                                                <asp:LinkButton ID="LinkButton_Delete_Product_Image" runat="server" ForeColor="Red"
                                                                                    OnCommand="LinkButton_Delete_Product_Image_Command">حذف تصویر</asp:LinkButton></td>
                                                                        </tr>
                                                                    </table>
                                                                    </td>
                                                                <td style="width: 20%;">
                                                                    &nbsp;<asp:FileUpload ID="File_up" runat="server" /></td>
                                                                <td style="width: 10%;">
                                                                    تصوير </td>
                                                            </tr>
                                                        </table>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 14px">
                                                        &nbsp;&nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View4" runat="server">
                            <asp:DataGrid ID="Grid_List_Pro" runat="server" AutoGenerateColumns="False"
                                DataKeyField="id_Image" Font-Names="Tahoma" Font-Size="X-Small" HorizontalAlign="Center"
                                OnDeleteCommand="Change_Mode" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <Columns>
                                    <asp:TemplateColumn HeaderText="حذف محصول">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnk_btn_Delete" runat="server"
                                             OnClientClick="return confirm('برای حذف اطمینان دارید')"
                                             CommandArgument='<%# Eval("properties_Id") %>'
                                                OnCommand="lnk_btn_Delete_Command" Text="حذف شود"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="پیوست">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton_Gallery" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Id_Image","{0}") %>'
                                                OnCommand="LinkButton_Gallery_Command" Text="گالری"></asp:LinkButton>::
                                            <asp:LinkButton ID="Doc" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Id_Image","{0}") %>'
                                                OnCommand="Doc_Command" Text="سند"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn HeaderText="تصوير">
                                        <ItemTemplate>
                                            <table id="table61" border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                                                <tr>
                                                    <td>
                                                        <%# image_Check(Convert.ToString(Eval("Image_valid")), Convert.ToInt32(Eval("Id_Image")), Convert.ToString(Eval("Image_Mode")), Convert.ToInt32(Eval("AutoId")))%>
                                                    </td>
                                                </tr>
                                            </table>
                                       
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:ButtonColumn CommandName="Delete" HeaderText="تغييرا حالت" Text="تغييرا حالت"></asp:ButtonColumn>
                                    <asp:TemplateColumn HeaderText="حالت محصول">
                                        <ItemTemplate>
                                            <%# Active_Check(Convert.ToInt32(Eval("available_no")))%>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="AUtoid" HeaderText="کد محصول"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="Price" HeaderText="قيمت محصول"></asp:BoundColumn>
                                    <asp:BoundColumn DataField="Title" HeaderText="نام محصول"></asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="ويرايش محصول">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton_Edit_Product" 
                                            runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id_Image","{0}") %>'
                                            OnCommand="LinkButton_Edit_Product_Command">ويرايش</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>
                                </Columns>
                                <FooterStyle HorizontalAlign="Center" BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <ItemStyle HorizontalAlign="Center" BackColor="#F7F6F3" ForeColor="#333333" />
                                <HeaderStyle BackColor="#5D7B9D" HorizontalAlign="Center" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#999999" />
                                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                            </asp:DataGrid></asp:View>
                        <asp:View ID="View5" runat="server">
                            <table border="0" style="width: 100%">
                                <caption>
                                </caption>
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%" dir="ltr">
                                            <tr>
                                                <td style="width: 50%" valign="top">
                                                    <asp:GridView ID="GridView_docs" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="98%">
                                            <Columns>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <table id="table1" border="0" dir="rtl" width="100%">
                                                            <tr>
                                                                <td align="right">
                                                                <%# Eval("Commnet")%>
                                                                    <asp:LinkButton ID="DOwn" runat="server" 
                                                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>'
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
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <img border="0" src='<%# Ex_Icom(Convert.ToString(Eval("ex_")))%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                        <EditRowStyle BackColor="#999999" />
                                        </asp:GridView>
                                                </td>
                                                <td style="width: 50%" valign="top">
                                        <div style="text-align: center">
                                            <table border="0" style="width: 100%">
                                                <tr>
                                                    <td align="right" width="90%">
                                                        <asp:TextBox ID="Text_Comment" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                            Height="55px" TextMode="MultiLine" Width="286px"></asp:TextBox></td>
                                                    <td align="left" width="10%" dir="rtl">
                                                        <span style="font-size: 10pt; font-family: Tahoma">عنوان :</span></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" width="90%">
                                                        <asp:FileUpload ID="FileUpload_DOc" runat="server" /></td>
                                                    <td align="left" width="10%" dir="rtl">
                                                        <span style="font-size: 10pt; font-family: Tahoma">فايل :</span></td>
                                                </tr>
                                                <tr>
                                                    <td align="right" width="90%">
                                                        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox></td>
                                                    <td align="left" width="10%" dir="rtl">
                                                        <span style="font-size: 10pt; font-family: Tahoma"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" width="90%">
                                                        <asp:Button ID="Button_Doc" runat="server" Font-Names="Tahoma" OnClick="Button_Doc_Click"
                                                            Text="ارسال" /></td>
                                                    <td align="left" width="10%" dir="rtl">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" width="90%">
                                                        <asp:LinkButton ID="Link_Back" runat="server" Font-Names="Tahoma" OnClick="Link_Back_Click">برگشت به ليست</asp:LinkButton></td>
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
                        <asp:View ID="View6" runat="server">
                            <div style="text-align: center">
                                <table border="0" style="width: 100%" dir="ltr">
                                    <tr>
                                        <td align="center" style="width: 50%" valign="top">
                                            &nbsp;
                                            <asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="5">
                                                <ItemTemplate>
                                                    <div style="text-align: center">


                                                        <table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <table border="0" style="width: 100%">
                                                                        <tr>
                                                                            <td align="center" style="width: 100%">
                                                                                <a class="thumbnail" href="javascript:popUp('ImageSHow.aspx?img=b<%# Eval("small")%>')">
                                                                                <img src='../phascoupfile/Productgallery/s<%# Eval("small")%>' border="0" />
                                                                                <span>
                                                                                <img src='../phascoupfile/Productgallery/m<%# Eval("small")%>' /><br />
                                                                                </span>
                                                                                </a>
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
                                        <td align="right" style="width: 50%" valign="top">
                                            <table border="0" style="width: 100%">
                                                <tr>
                                                    <td align="right" width="70%">
                                                    </td>
                                                    <td align="right" width="30%">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" width="70%">
                                                        <asp:FileUpload ID="FileUpload_Image_Big" runat="server" /></td>
                                                    <td align="left" width="30%" dir="rtl">
                                                        تصویر :</td>
                                                </tr>
                                                <tr>
                                                    <td align="right" width="70%">
                                                        <asp:Button ID="Button_Images" runat="server" Font-Names="Tahoma" OnClick="Button_Images_Click"
                                                            OnCommand="Button_Images_Command" Text="ارسال" /></td>
                                                    <td align="right" width="30%">
                                                        <span style="font-size: 10pt; font-family: Tahoma"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" width="70%">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="Tahoma" OnClick="Link_Back_Click">برگشت به ليست</asp:LinkButton></td>
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
                                    </tr>
                                    <tr>
                                        <td colspan="2" valign="top">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="View7" runat="server">
                        </asp:View>
                    </asp:MultiView></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 100% ">
                     <asp:HiddenField ID="HiddenField_Subject_Id" runat="server" />
                    <asp:HiddenField ID="HiddenField_Id_Sub_Cat" runat="server" />
                    <asp:HiddenField ID="HiddenField_Lang" runat="server" /><asp:HiddenField ID="HiddenField_Product_Doc" runat="server" /><asp:HiddenField ID="HiddenField_Edit_Id" runat="server" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

