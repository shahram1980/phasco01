<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    Codebehind="Products.aspx.cs" Inherits="phasco.Cpanel.Products" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="C#" runat="server">
        public string Active_Check(int id)
        {
            string ret_ = " <input id=chkBxMail type=checkbox  /> ";
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Company_ListTableAdapter da_li = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Company_ListTableAdapter();
            PHASCO_WEB.DAL.DS_MainPhasco.Company_ListDataTable ds_li = new PHASCO_WEB.DAL.DS_MainPhasco.Company_ListDataTable();

            ds_li = da_li.Select_By_Id_ComanyId(Convert.ToInt32(HiddenField_Properties_Id.Value), id);
            if(ds_li.Rows.Count >0)
             ret_ = " <input id=chkBxMail type=checkbox checked /> ";
         
            return ret_;
        }

        public string Ex_Icom(string val)
        {
            string ret_ = "";

            switch (val)
            {
                case ".ram":
                    ret_ = "../Images/Doc_Icon/real.gif";
                    break;
                case ".ra":
                    ret_ = "../Images/Doc_Icon/real.gif";
                    break;
                case ".pdf":
                    ret_ = "../Images/Doc_Icon/pdf.gif";
                    break;

                case ".doc":
                    ret_ = "../Images/Doc_Icon/Word.gif";
                    break;
                case ".txt":
                    ret_ = "../Images/Doc_Icon/txt.gif";
                    break;
                case ".ppt":
                    ret_ = "../Images/Doc_Icon/power.gif";
                    break;
                case ".mpg":
                    ret_ = "../Images/Doc_Icon/movi.gif";
                    break;

                case ".mpeg":
                    ret_ = "../Images/Doc_Icon/movi.gif";
                    break;
                case ".wmv":
                    ret_ = "../Images/Doc_Icon/movi.gif";
                    break;
                case ".avi":
                    ret_ = "../Images/Doc_Icon/avi.gif";
                    break;
                case ".jpeg":
                    ret_ = "../Images/Doc_Icon/jpeg.gif";
                    break;

                case ".jpg":
                    ret_ = "../Images/Doc_Icon/jpeg.gif";
                    break;
                case ".gif":
                    ret_ = "../Images/Doc_Icon/Gif.gif";
                    break;

                case ".html":
                    ret_ = "../Images/Doc_Icon/html.gif";
                    break;
                case ".htm":
                    ret_ = "../Images/Doc_Icon/html.gif";
                    break;
                case ".swf":
                    ret_ = "../Images/Doc_Icon/swf.gif";
                    break;
                case ".xls":
                    ret_ = "../Images/Doc_Icon/excel.gif";

                    break;
                default:
                    ret_ = "../Images/Doc_Icon/none.gif";
                    break;
            }

            return ret_;
        }
    </script>

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table id="table88" border="0" dir="rtl" width="95%">
                <tr>
                    <td colspan="3">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="left" dir="rtl" style="width: 20%; height: 24px">
                                    <asp:LinkButton ID="LinkButton_Back_Level" runat="server" OnClick="LinkButton_Back_Level_Click">برگشت</asp:LinkButton></td>
                                <td align="right" dir="rtl" style="width: 60%; height: 24px">
                                    <asp:LinkButton ID="LinkButton_Insert_New_Company" runat="server" OnClick="LinkButton_Insert_New_Company_Click">درج شرکت جدید</asp:LinkButton>|
                                    <asp:LinkButton ID="LinkButton_Edit_Company" runat="server" OnClick="LinkButton_Edit_Company_Click">ويرايش شرکت </asp:LinkButton></td>
                                <td align="right" style="width: 20%; height: 24px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td align="left" dir="rtl" style="width: 20%; height: 24px">
                                    عنوان جدید :
                                </td>
                                <td align="right" dir="rtl" style="width: 60%; height: 24px">
                                    <asp:TextBox ID="Txt_Title" runat="server" CssClass="TxtClass" Width="90%"></asp:TextBox></td>
                                <td align="right" style="width: 20%; height: 24px">
                                    <asp:Button ID="Button_Insert" runat="server" Font-Names="Tahoma" OnClick="Button_Insert_Click"
                                        Text="ثبت" Width="50px" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" width="742">
                        <asp:GridView ID="GRD_LIST" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC"
                            BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
                            DataKeyNames="id" ForeColor="Black" OnRowCancelingEdit="GRD_LIST_RowCancelingEdit"
                            OnRowEditing="GRD_LIST_RowEditing" OnRowUpdating="GRD_LIST_RowUpdating" Width="746px">
                            <FooterStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="کد">
                                    <ItemStyle Width="5%" HorizontalAlign="Right" VerticalAlign="Top" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Title" HeaderText="عنوان">
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="65%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="زيرگروه">
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="10%" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton_Subject" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                            OnCommand="LinkButton_Subject_Command">زیرگروه</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="حذف">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Top" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton_Delete_Subject" runat="server" OnClientClick="return confirm('در صورت حذف اين شاخه تمام زير شاخه ها و مطالب مربوط به آنها حذف می شود ؟!؟ آيا بر حذف مطمئن هستيد؟');"
                                            CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' OnCommand="LinkButton_Delete_Subject_Command1">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ويرايش" HeaderText="ویرايش"
                                    ShowEditButton="True" UpdateText="بروز شود">
                                    <ItemStyle Width="10%" HorizontalAlign="Right" VerticalAlign="Top" />
                                </asp:CommandField>
                                <asp:TemplateField HeaderText="مشخصات">
                                    <ItemTemplate>
                                        <table border="0" id="peroperties" runat="server" cellpadding="0" cellspacing="0"
                                            style="width: 100%">
                                            <tr>
                                                <td style="width: 33%; height: 16px;" align="right" valign="top" title="WIDTH: 100%">
                                                    <asp:LinkButton ID="LinkButton_Peroperties_Ins_Esit" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                        OnCommand="LinkButton_Peroperties_Ins_Esit_Command">مشخصات</asp:LinkButton></td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="width: 33%; height: 13px" title="WIDTH: 100%" valign="top">
                                                    <asp:LinkButton ID="LinkButton_Attach_File" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' runat="server" OnCommand="LinkButton_Attach_File_Command">پيوست</asp:LinkButton></td>
                                            </tr>
                                        </table>
                                        &nbsp;
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="center" dir="rtl" style="width: 100%">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" dir="rtl" style="width: 100%">
                            <div style="text-align: center">
                                <table border="0" cellpadding="0" cellspacing="0" style="width: 70%">
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q1" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R1" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q3" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R3" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q4" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R4" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q5" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R5" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%; height: 20px">
                                            <asp:TextBox ID="TextBox_q6" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%; height: 20px">
                                        </td>
                                        <td align="right" style="width: 40%; height: 20px">
                                            <asp:TextBox ID="TextBox_R6" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q7" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R7" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q8" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R8" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%; height: 20px">
                                            <asp:TextBox ID="TextBox_q9" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%; height: 20px">
                                        </td>
                                        <td align="right" style="width: 40%; height: 20px">
                                            <asp:TextBox ID="TextBox_R9" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q10" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R10" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q11" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R11" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <asp:TextBox ID="TextBox_q12" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_R12" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                        </td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                            <span style="font-size: 10pt">تاریخ انقضای کیت</span></td>
                                        <td style="width: 20%">
                                        </td>
                                        <td align="right" style="width: 40%">
                                            <asp:TextBox ID="TextBox_Expire_Time" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%; height: 13px">
                                            <span style="font-size: 10pt">قیمت کیت</span></td>
                                        <td style="width: 20%; height: 13px">
                                        </td>
                                        <td align="right" style="width: 40%; height: 13px">
                                            <asp:TextBox ID="TextBox_Price_Kit" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                Width="80%"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 40%">
                                        </td>
                                        <td colspan="2">
                                            <asp:GridView ID="GRD_Company" runat="server" AutoGenerateColumns="False" Width="90%"
                                                BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
                                                CellPadding="4" CellSpacing="2" ForeColor="Black">
                                                <Columns>
                                                    <asp:BoundField HeaderText="کد" DataField="id">
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="10%" />
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="نام شرکت" DataField="Coname">
                                                        <HeaderStyle Width="100px" />
                                                        <ItemStyle Width="70%" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <input id="chkBxMail" type="checkbox"  runat="server"  /> 
                                                        </ItemTemplate>
                                                        <HeaderStyle Width="50px" />
                                                        <ItemStyle Width="20%" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle Height="25px" BackColor="Black" HorizontalAlign="Center" VerticalAlign="Middle"
                                                    Font-Bold="True" ForeColor="White" />
                                                <RowStyle Height="25px" BackColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <AlternatingRowStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <FooterStyle BackColor="#CCCCCC" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" dir="rtl" style="width: 100%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" dir="rtl" style="width: 100%">
                            <asp:Button ID="Button_propertis_Insert" runat="server" OnClick="Button_propertis_Insert_Click"
                                Text="ثبت شود" Font-Names="Tahoma" />
                            <asp:Button ID="Button_propertis_Edit" runat="server" OnClick="Button_propertis_Edit_Click"
                                Text="ويرايش شود" Font-Names="Tahoma" /></td>
                    </tr>
                </table>
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <div style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 70%">
                    <tr>
                        <td align="right" dir="rtl" style="width: 60%; height: 13px">
                            &nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton_Edit_Company_Click">ليست شرکت ها</asp:LinkButton>
                            | &nbsp;<asp:LinkButton ID="LinkButton_Back_ToList" runat="server" OnClick="LinkButton_Back_ToList_Click1">شاخه ها</asp:LinkButton></td>
                        <td align="left" style="width: 40%; height: 13px">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 60%; height: 13px" dir="rtl">
                            <asp:TextBox ID="TextBox_COName" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
                        <td align="left" style="width: 40%; height: 13px">
                            نام شرکت</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 60%" dir="rtl">
                            <asp:TextBox ID="TextBox_CODate" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
                        <td align="left" style="width: 40%">
                            تاریخ تاسیس</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 60%" dir="rtl">
                            <asp:TextBox ID="TextBox_COCountry" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
                        <td align="left" style="width: 40%">
                            کشور</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 60%; height: 58px" dir="rtl">
                            <asp:TextBox ID="TextBox_COShort" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                        <td align="left" style="width: 40%; height: 58px">
                            خلاصه فعاليت</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 60%; height: 13px" dir="rtl">
                            <asp:TextBox ID="TextBox_COAbout" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox></td>
                        <td align="left" style="width: 40%; height: 13px">
                            درباره شرکت</td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 60%">
                            <asp:Button ID="Button_Company_Edit" runat="server" Font-Names="Tahoma" OnClick="Button_Company_Edit_Click"
                                Text="ويرايش شود" />
                            <asp:Button ID="Button_Company_Insert" runat="server" Font-Names="Tahoma" OnClick="Button_Company_Insert_Click"
                                Text="ثبت شود" /></td>
                        <td align="left" style="width: 40%">
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="right" dir="rtl" style="width: 100%">
                        &nbsp;&nbsp;
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton_Insert_New_Company_Click">شرکت جدید</asp:LinkButton>
                        | &nbsp;<asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton_Back_ToList_Click1">شاخه ها</asp:LinkButton></td>
                </tr>
                <tr>
                    <td align="right" dir="rtl" style="width: 100%">
                        <asp:GridView ID="Grd_Copmany" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC"
                            BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2"
                            DataKeyNames="id" ForeColor="Black" Width="746px">
                            <FooterStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="کد">
                                    <ItemStyle Width="5%" HorizontalAlign="Right" VerticalAlign="Top" />
                                </asp:BoundField>
                                <asp:BoundField DataField="COName" HeaderText="عنوان">
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" Width="65%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="حذف">
                                    <ItemStyle Width="10%" HorizontalAlign="Center" VerticalAlign="Top" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton_Delete_Company" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                            OnClientClick="return confirm('در صورت حذف اين شاخه تمام زير شاخه ها و مطالب مربوط به آنها حذف می شود ؟!؟ آيا بر حذف مطمئن هستيد؟');"
                                            OnCommand="LinkButton_Delete_Company_Command">حذف</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ويرايش">
                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                    <ItemTemplate>
                                        &nbsp;
                                        <asp:LinkButton ID="LinkButton_Edit_Company" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' OnCommand="LinkButton_Edit_Company_Command">ويرايش</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View5" runat="server">
            <table border="0" style="width: 100%">
       
                                                    <tr>
                                                        <td style="height: 195px">
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
                                                                            <asp:TextBox ID="id" runat="server" Visible="False"></asp:TextBox></td>
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
                                                                            <asp:LinkButton ID="Link_Back" runat="server" Font-Names="Tahoma" OnClick="Link_Back_Click">برگشت</asp:LinkButton></td>
                                                                        <td align="right" width="10%">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            &nbsp;<asp:GridView ID="GridView_docs" runat="server" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Width="250px">
                                                                <Columns>
                                                                    <asp:TemplateField>
                                                                        <ItemTemplate>
                                                                            <table id="table1" border="0" dir="rtl" width="100%">
                                                                                <tr>
                                                                                    <td align="right">
                                                                                        <asp:LinkButton ID="DOwn" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.AUTOiD","{0}") %>'
                                                                                            OnCommand="DOwn_Command"> 
                                        <%# Eval("Commnet")%>'
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
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                <EditRowStyle BackColor="#999999" />
                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                </table>
            
       </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_Subjects_Id" runat="server" />
    <asp:HiddenField ID="HiddenField_Properties_Id" runat="server" /><asp:HiddenField ID="HiddenField_Company_Id" runat="server" />
    <br /><asp:HiddenField ID="HiddenField_Company_attach_Id" runat="server" />
</asp:Content>
