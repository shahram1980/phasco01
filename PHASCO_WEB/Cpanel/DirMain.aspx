<%@ Page Language="C#" EnableViewState="true" MasterPageFile="~/Template/admin.Master"
    AutoEventWireup="true" CodeBehind="DirMain.aspx.cs" Inherits="phasco.Cpanel.DirMain" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="javascript">
<!--
function popUp(N) {
newWindow = window.open(N, 'popUp','toolbar=no,menubar=no,resizable=yes,scrollbars=yes,status=no,location=no,width=770,height=650');
}
//-->
    </script>

 

    <div align="center">
        <table border="0" width="100%" id="table1">
            <tr>
                <td>
                    <div align="right">
                        <div>
                            <table border="2" style="width: 100%">
                                <tr>
                                    <td align="right" style="width: 100%">
                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td dir="rtl" style="width: 100%; height: 20px;">
                                                    <a href="dirmain.aspx?mode=1">اضافه و ويرايش محل</a>| <a href="dirmain.aspx?mode=2">
                                                        اضافه و ويرايش گروه 3</a>| <a href="dirmain.aspx?mode=3">اضافه و ويرايش آزمايشگاه</a>|
                                                    <a href="dirmain.aspx?mode=4">ويرايش</a>|<a href="dirmain.aspx?mode=5"> آزمایشگاههای
                                                        جدید<br />
                                                    </a>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Visible="False">اضافه و ويرايش محل</asp:LinkButton>
                                                    |
                                                    <asp:LinkButton ID="LinkButton_Group3" runat="server" OnClick="LinkButton_Group3_Click"
                                                        Visible="False">اضافه و ويرايش گروه 3</asp:LinkButton>
                                                    |
                                                    <asp:LinkButton ID="Link_rest" runat="server" OnClick="Link_rest_Click" Visible="False">اضافه و ويرايش آزمايشگاه </asp:LinkButton>
                                                    |
                                                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Visible="False">ويرايش</asp:LinkButton>
                                                    <a href="Default.aspx"></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="rtl" style="width: 100%">
                                                    <hr />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td dir="rtl" style="width: 100%">
                                                    آمار آزمايشگاه وارد شده
                                                    <asp:Label ID="LBL_CountLab" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                        <asp:MultiView ID="MultiView1" runat="server">
                                            <asp:View ID="View1" runat="server">
                                                <div>
                                                    <table border="0" style="width: 100%">
                                                        <tr>
                                                            <td align="right">
                                                                <asp:DropDownList ID="DropDownList_region" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_region_SelectedIndexChanged"
                                                                    Font-Names="Tahoma" Font-Size="X-Small">
                                                                    <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
                                                                    <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
                                                                    <asp:ListItem Value="31">البرز</asp:ListItem>
                                                                    <asp:ListItem Value="3">اردبیل</asp:ListItem>
                                                                    <asp:ListItem Value="4">اصفهان</asp:ListItem>
                                                                    <asp:ListItem Value="5">ایلام</asp:ListItem>
                                                                    <asp:ListItem Value="6">بوشهر</asp:ListItem>
                                                                    <asp:ListItem Value="7">تهران</asp:ListItem>
                                                                    <asp:ListItem Value="8">چهار محال و بختیاری</asp:ListItem>
                                                                    <asp:ListItem Value="9">خراسان جنوبی</asp:ListItem>
                                                                    <asp:ListItem Value="10">خراسان رضوی</asp:ListItem>
                                                                    <asp:ListItem Value="11">خراسان شمالی</asp:ListItem>
                                                                    <asp:ListItem Value="12">خورستان</asp:ListItem>
                                                                    <asp:ListItem Value="13">زنجان</asp:ListItem>
                                                                    <asp:ListItem Value="14">سمنان</asp:ListItem>
                                                                    <asp:ListItem Value="15">سیستان و بلوچستان</asp:ListItem>
                                                                    <asp:ListItem Value="16">فارس</asp:ListItem>
                                                                    <asp:ListItem Value="17">قزوین</asp:ListItem>
                                                                    <asp:ListItem Value="18">قم</asp:ListItem>
                                                                    <asp:ListItem Value="19">کردستان</asp:ListItem>
                                                                    <asp:ListItem Value="20">کرمان</asp:ListItem>
                                                                    <asp:ListItem Value="21">کرمانشاه</asp:ListItem>
                                                                    <asp:ListItem Value="22">کهکیلویه و بویر احمد</asp:ListItem>
                                                                    <asp:ListItem Value="23">گلستان</asp:ListItem>
                                                                    <asp:ListItem Value="24">گیلان</asp:ListItem>
                                                                    <asp:ListItem Value="25">لرستان</asp:ListItem>
                                                                    <asp:ListItem Value="26">مازندران</asp:ListItem>
                                                                    <asp:ListItem Value="27">مرکزی</asp:ListItem>
                                                                    <asp:ListItem Value="28">هرمزگان</asp:ListItem>
                                                                    <asp:ListItem Value="29">همدان</asp:ListItem>
                                                                    <asp:ListItem Value="30">یزد</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <table style="width: 100%">
                                                                    <tr>
                                                                        <td align="right" style="height: 22px">
                                                                            <asp:TextBox ID="Txt_state" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                        </td>
                                                                        <td width="50" style="height: 22px">
                                                                            نام شهر
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            <asp:TextBox ID="Txt_stateEN" runat="server" Font-Names="Verdana" Font-Size="X-Small"></asp:TextBox>
                                                                        </td>
                                                                        <td width="50">
                                                                            City
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            <asp:Button ID="Button_Ins" runat="server" Text="ثبت شود" OnClick="Button_Ins_Click"
                                                                                Font-Names="Tahoma" Font-Size="X-Small" />
                                                                        </td>
                                                                        <td width="50">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:DataGrid ID="Grd_region" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyField="Id"
                                                                    Font-Names="Tahoma" Font-Size="X-Small" ForeColor="Black" GridLines="Vertical"
                                                                    OnCancelCommand="DataCancel" OnDeleteCommand="DataDelete" OnEditCommand="DataEdit"
                                                                    OnUpdateCommand="DataUpdate" Width="70%">
                                                                    <FooterStyle BackColor="#CCCCCC" />
                                                                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                                    <AlternatingItemStyle BackColor="#CCCCCC" />
                                                                    <HeaderStyle BackColor="Black" BorderColor="Black" BorderWidth="5px" Font-Bold="True"
                                                                        ForeColor="White" />
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="StateEN" HeaderText="English"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Satate" HeaderText="فارسی"></asp:BoundColumn>
                                                                        <asp:EditCommandColumn CancelText="انصراف" EditText="ويرايش" HeaderText="ويرايش"
                                                                            UpdateText="ذخيره"></asp:EditCommandColumn>
                                                                        <asp:ButtonColumn CommandName="Delete" HeaderText="حذف" Text="حذف"></asp:ButtonColumn>
                                                                    </Columns>
                                                                </asp:DataGrid>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:View>
                                            <asp:View ID="View2" runat="server">
                                                <table border="0" style="width: 100%">
                                                    <tr>
                                                        <td>
                                                            درج مشخصات آزمايشگاه
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <table border="0" dir="rtl" style="width: 100%">
                                                                <tr>
                                                                    <td style="height: 49px">
                                                                        <table border="0" style="width: 100%">
                                                                            <tr>
                                                                                <td align="right" colspan="2">
                                                                                    استان:
                                                                                    <asp:DropDownList ID="Drop_Dataentry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Drop_Dataentry_SelectedIndexChanged"
                                                                                        Font-Names="Tahoma" Font-Size="X-Small">
                                                                                        <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
                                                                                        <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
                                                                                        <asp:ListItem Value="31">البرز</asp:ListItem>
                                                                                        <asp:ListItem Value="3">اردبیل</asp:ListItem>
                                                                                        <asp:ListItem Value="4">اصفهان</asp:ListItem>
                                                                                        <asp:ListItem Value="5">ایلام</asp:ListItem>
                                                                                        <asp:ListItem Value="6">بوشهر</asp:ListItem>
                                                                                        <asp:ListItem Value="7">تهران</asp:ListItem>
                                                                                        <asp:ListItem Value="8">چهار محال و بختیاری</asp:ListItem>
                                                                                        <asp:ListItem Value="9">خراسان جنوبی</asp:ListItem>
                                                                                        <asp:ListItem Value="10">خراسان رضوی</asp:ListItem>
                                                                                        <asp:ListItem Value="11">خراسان شمالی</asp:ListItem>
                                                                                        <asp:ListItem Value="12">خورستان</asp:ListItem>
                                                                                        <asp:ListItem Value="13">زنجان</asp:ListItem>
                                                                                        <asp:ListItem Value="14">سمنان</asp:ListItem>
                                                                                        <asp:ListItem Value="15">سیستان و بلوچستان</asp:ListItem>
                                                                                        <asp:ListItem Value="16">فارس</asp:ListItem>
                                                                                        <asp:ListItem Value="17">قزوین</asp:ListItem>
                                                                                        <asp:ListItem Value="18">قم</asp:ListItem>
                                                                                        <asp:ListItem Value="19">کردستان</asp:ListItem>
                                                                                        <asp:ListItem Value="20">کرمان</asp:ListItem>
                                                                                        <asp:ListItem Value="21">کرمانشاه</asp:ListItem>
                                                                                        <asp:ListItem Value="22">کهکیلویه و بویر احمد</asp:ListItem>
                                                                                        <asp:ListItem Value="23">گلستان</asp:ListItem>
                                                                                        <asp:ListItem Value="24">گیلان</asp:ListItem>
                                                                                        <asp:ListItem Value="25">لرستان</asp:ListItem>
                                                                                        <asp:ListItem Value="26">مازندران</asp:ListItem>
                                                                                        <asp:ListItem Value="27">مرکزی</asp:ListItem>
                                                                                        <asp:ListItem Value="28">هرمزگان</asp:ListItem>
                                                                                        <asp:ListItem Value="29">همدان</asp:ListItem>
                                                                                        <asp:ListItem Value="30">یزد</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                    شهر:
                                                                                    <asp:DropDownList ID="Drop_state" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                                        AutoPostBack="True" OnSelectedIndexChanged="Drop_down_ChangeList">
                                                                                    </asp:DropDownList>
                                                                                    منطقه:
                                                                                    <asp:DropDownList ID="DropDownList_Region_newINsert" runat="server" Enabled="False"
                                                                                        Font-Names="Tahoma" Font-Overline="False" Font-Size="X-Small">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="Lbl_success" runat="server" ForeColor="Blue" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <div>
                                                                            <table border="0" style="width: 100%">
                                                                                <tr>
                                                                                    <td align="right" width="80" style="height: 22px">
                                                                                        نام آزمايشگاه
                                                                                    </td>
                                                                                    <td align="right" style="height: 22px">
                                                                                        <asp:TextBox ID="txt_name" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="right" width="80" style="height: 22px">
                                                                                        تعداد ستاره
                                                                                    </td>
                                                                                    <td align="right" style="height: 22px">
                                                                                        <asp:DropDownList ID="Drop_stars" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                                                                                            <asp:ListItem Value="1">يک ستاره</asp:ListItem>
                                                                                            <asp:ListItem Value="2">دو ستاره</asp:ListItem>
                                                                                            <asp:ListItem Value="3">سه ستاره</asp:ListItem>
                                                                                            <asp:ListItem Value="4">چهار ستاره</asp:ListItem>
                                                                                            <asp:ListItem Value="5">پنج ستاره</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        LAB Name
                                                                                    </td>
                                                                                    <td align="right" dir="ltr">
                                                                                        <asp:TextBox ID="txt_nameEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="right" width="80">
                                                                                    </td>
                                                                                    <td align="right">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        آدرس
                                                                                    </td>
                                                                                    <td align="right" colspan="3">
                                                                                        <asp:TextBox ID="txt_Address" runat="server" Width="90%" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        Adress
                                                                                    </td>
                                                                                    <td align="right" colspan="3">
                                                                                        <asp:TextBox ID="txt_AddressEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                                            Width="90%"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        مسئول فنی آزمايشگاه
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:TextBox ID="txt_manager" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="right" width="80">
                                                                                        ساعت کار
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:TextBox ID="txt_Time" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        Manager
                                                                                    </td>
                                                                                    <td align="right" dir="ltr">
                                                                                        <asp:TextBox ID="txt_managerEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="right" width="80">
                                                                                        Time
                                                                                    </td>
                                                                                    <td align="right" dir="ltr">
                                                                                        <asp:TextBox ID="txt_TimeEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        خدمات
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:TextBox ID="Txt_foods" runat="server" TextMode="MultiLine" Font-Names="Tahoma"
                                                                                            Font-Size="X-Small" Height="50px" Width="200px"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="right" width="80">
                                                                                        تلفن
                                                                                    </td>
                                                                                    <td align="right" dir="ltr">
                                                                                        <asp:TextBox ID="Txt_tel" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        Services
                                                                                    </td>
                                                                                    <td align="right" dir="ltr">
                                                                                        <asp:TextBox ID="Txt_foodsEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                                            Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="right" width="80">
                                                                                    </td>
                                                                                    <td align="right">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        ايميل
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:TextBox ID="txt_email" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="right" colspan="2">
                                                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email"
                                                                                            Display="Dynamic" ErrorMessage="ايميل نامعتیر است" ForeColor="DarkRed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" style="height: 15px" width="80">
                                                                                        وب سايت
                                                                                    </td>
                                                                                    <td align="right" style="height: 15px">
                                                                                        <asp:TextBox ID="TXT_website" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="right" colspan="2" style="height: 15px">
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                        تصوير
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:FileUpload ID="File_Image" runat="server" />
                                                                                    </td>
                                                                                    <td align="right" width="80">
                                                                                        تاريخ ابطال
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:DropDownList ID="Drop_Expire" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                                                                                            <asp:ListItem Value="0">نا محدود</asp:ListItem>
                                                                                            <asp:ListItem Value="1">يک ماه</asp:ListItem>
                                                                                            <asp:ListItem Value="2">دو ماه</asp:ListItem>
                                                                                            <asp:ListItem Value="3">سه ماه</asp:ListItem>
                                                                                            <asp:ListItem Value="6">شش ماه</asp:ListItem>
                                                                                            <asp:ListItem Value="12">يکسال</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="right" width="80">
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        حداکثر عرض 400px
                                                                                    </td>
                                                                                    <td align="right" width="80">
                                                                                    </td>
                                                                                    <td align="right">
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="Button1" runat="server" Text="ثبت شود" OnClick="Button1_Click" Font-Names="Tahoma" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                            <asp:View ID="View3" runat="server">
                                                <table width="400">
                                                    <tr>
                                                        <td style="width: 592px; height: 13px">
                                                        </td>
                                                        <td style="height: 13px" align="right">
                                                            <table border="0" style="width: 100%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="Button_ListGrid" runat="server" OnClick="Button_ListGrid_Click" Text="نمايش"
                                                                            Font-Names="Tahoma" Font-Size="X-Small" />
                                                                    </td>
                                                                    <td colspan="2" dir="rtl">
                                                                        &nbsp;&nbsp;<div style="text-align: center">
                                                                            <table border="0" style="width: 100%">
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        استان :
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                                                                            Font-Names="Tahoma" Font-Size="X-Small">
                                                                                            <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
                                                                                            <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
                                                                                            <asp:ListItem Value="31">البرز</asp:ListItem>
                                                                                            <asp:ListItem Value="3">اردبیل</asp:ListItem>
                                                                                            <asp:ListItem Value="4">اصفهان</asp:ListItem>
                                                                                            <asp:ListItem Value="5">ایلام</asp:ListItem>
                                                                                            <asp:ListItem Value="6">بوشهر</asp:ListItem>
                                                                                            <asp:ListItem Value="7">تهران</asp:ListItem>
                                                                                            <asp:ListItem Value="8">چهار محال و بختیاری</asp:ListItem>
                                                                                            <asp:ListItem Value="9">خراسان جنوبی</asp:ListItem>
                                                                                            <asp:ListItem Value="10">خراسان رضوی</asp:ListItem>
                                                                                            <asp:ListItem Value="11">خراسان شمالی</asp:ListItem>
                                                                                            <asp:ListItem Value="12">خورستان</asp:ListItem>
                                                                                            <asp:ListItem Value="13">زنجان</asp:ListItem>
                                                                                            <asp:ListItem Value="14">سمنان</asp:ListItem>
                                                                                            <asp:ListItem Value="15">سیستان و بلوچستان</asp:ListItem>
                                                                                            <asp:ListItem Value="16">فارس</asp:ListItem>
                                                                                            <asp:ListItem Value="17">قزوین</asp:ListItem>
                                                                                            <asp:ListItem Value="18">قم</asp:ListItem>
                                                                                            <asp:ListItem Value="19">کردستان</asp:ListItem>
                                                                                            <asp:ListItem Value="20">کرمان</asp:ListItem>
                                                                                            <asp:ListItem Value="21">کرمانشاه</asp:ListItem>
                                                                                            <asp:ListItem Value="22">کهکیلویه و بویر احمد</asp:ListItem>
                                                                                            <asp:ListItem Value="23">گلستان</asp:ListItem>
                                                                                            <asp:ListItem Value="24">گیلان</asp:ListItem>
                                                                                            <asp:ListItem Value="25">لرستان</asp:ListItem>
                                                                                            <asp:ListItem Value="26">مازندران</asp:ListItem>
                                                                                            <asp:ListItem Value="27">مرکزی</asp:ListItem>
                                                                                            <asp:ListItem Value="28">هرمزگان</asp:ListItem>
                                                                                            <asp:ListItem Value="29">همدان</asp:ListItem>
                                                                                            <asp:ListItem Value="30">یزد</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        شهر :&nbsp;
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:DropDownList ID="Drop_View_State" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                                            OnSelectedIndexChanged="Drop_View_State_SelectedIndexChanged" AutoPostBack="True">
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td align="left">
                                                                                        منطقه :
                                                                                    </td>
                                                                                    <td align="right">
                                                                                        <asp:DropDownList ID="Drop_View_State2" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                                                                                        </asp:DropDownList>
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
                                                        <td align="right" valign="top" style="width: 592px">
                                                            <asp:Panel Enabled="false" ID="edit" runat="server">
                                                                <table border="0" dir="rtl" style="width: 500px">
                                                                    <tr>
                                                                        <td style="height: 49px">
                                                                            <table border="0" style="width: 100%">
                                                                                <tr>
                                                                                    <td colspan="2">
                                                                                        استان :
                                                                                        <asp:DropDownList ID="DropDownList_edit_Region" runat="server" AutoPostBack="True"
                                                                                            OnSelectedIndexChanged="DropDownList_edit_Region_SelectedIndexChanged" Font-Names="Tahoma"
                                                                                            Font-Size="X-Small">
                                                                                            <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
                                                                                            <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
                                                                                            <asp:ListItem Value="31">البرز</asp:ListItem>
                                                                                            <asp:ListItem Value="3">اردبیل</asp:ListItem>
                                                                                            <asp:ListItem Value="4">اصفهان</asp:ListItem>
                                                                                            <asp:ListItem Value="5">ایلام</asp:ListItem>
                                                                                            <asp:ListItem Value="6">بوشهر</asp:ListItem>
                                                                                            <asp:ListItem Value="7">تهران</asp:ListItem>
                                                                                            <asp:ListItem Value="8">چهار محال و بختیاری</asp:ListItem>
                                                                                            <asp:ListItem Value="9">خراسان جنوبی</asp:ListItem>
                                                                                            <asp:ListItem Value="10">خراسان رضوی</asp:ListItem>
                                                                                            <asp:ListItem Value="11">خراسان شمالی</asp:ListItem>
                                                                                            <asp:ListItem Value="12">خورستان</asp:ListItem>
                                                                                            <asp:ListItem Value="13">زنجان</asp:ListItem>
                                                                                            <asp:ListItem Value="14">سمنان</asp:ListItem>
                                                                                            <asp:ListItem Value="15">سیستان و بلوچستان</asp:ListItem>
                                                                                            <asp:ListItem Value="16">فارس</asp:ListItem>
                                                                                            <asp:ListItem Value="17">قزوین</asp:ListItem>
                                                                                            <asp:ListItem Value="18">قم</asp:ListItem>
                                                                                            <asp:ListItem Value="19">کردستان</asp:ListItem>
                                                                                            <asp:ListItem Value="20">کرمان</asp:ListItem>
                                                                                            <asp:ListItem Value="21">کرمانشاه</asp:ListItem>
                                                                                            <asp:ListItem Value="22">کهکیلویه و بویر احمد</asp:ListItem>
                                                                                            <asp:ListItem Value="23">گلستان</asp:ListItem>
                                                                                            <asp:ListItem Value="24">گیلان</asp:ListItem>
                                                                                            <asp:ListItem Value="25">لرستان</asp:ListItem>
                                                                                            <asp:ListItem Value="26">مازندران</asp:ListItem>
                                                                                            <asp:ListItem Value="27">مرکزی</asp:ListItem>
                                                                                            <asp:ListItem Value="28">هرمزگان</asp:ListItem>
                                                                                            <asp:ListItem Value="29">همدان</asp:ListItem>
                                                                                            <asp:ListItem Value="30">یزد</asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                        شهر :
                                                                                        <asp:DropDownList ID="DropDownList_edit_State" runat="server" Font-Names="Tahoma"
                                                                                            Font-Size="X-Small" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_edit_State_SelectedIndexChanged">
                                                                                        </asp:DropDownList>
                                                                                        منطقه :
                                                                                        <asp:DropDownList ID="DropDownList_Region_Edit_3" runat="server" Font-Names="Tahoma"
                                                                                            Font-Size="XX-Small">
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <div>
                                                                                <table border="0" style="width: 100%">
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            نام آزمايشگاه
                                                                                        </td>
                                                                                        <td align="right">
                                                                                            <asp:TextBox ID="txt_Ename" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                        <td align="right">
                                                                                            تعداد ستاره
                                                                                        </td>
                                                                                        <td align="right">
                                                                                            <asp:DropDownList ID="Drop_estar" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                                                                                                <asp:ListItem Value="1">يک ستاره</asp:ListItem>
                                                                                                <asp:ListItem Value="2">دو ستاره</asp:ListItem>
                                                                                                <asp:ListItem Value="3">سه ستاره</asp:ListItem>
                                                                                                <asp:ListItem Value="4">چهار ستاره</asp:ListItem>
                                                                                                <asp:ListItem Value="5">پنج ستاره</asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            Lab name
                                                                                        </td>
                                                                                        <td align="right" dir="ltr">
                                                                                            <asp:TextBox ID="txt_EnameEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                        <td align="right">
                                                                                        </td>
                                                                                        <td align="right">
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" style="height: 22px">
                                                                                            آدرس
                                                                                        </td>
                                                                                        <td align="right" colspan="3" style="height: 22px">
                                                                                            <asp:TextBox ID="txt_Eaddress" runat="server" Width="90%" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            address
                                                                                        </td>
                                                                                        <td align="right" colspan="3" dir="ltr">
                                                                                            <asp:TextBox ID="txt_EaddressEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                                                Width="90%"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            مسئول فنی آزمايشگاه
                                                                                        </td>
                                                                                        <td align="right" colspan="3">
                                                                                            <asp:TextBox ID="txt_Emagaer" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            Manager
                                                                                        </td>
                                                                                        <td align="right" colspan="3" dir="ltr">
                                                                                            <asp:TextBox ID="txt_EmagaerEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            خدمات
                                                                                        </td>
                                                                                        <td align="right" colspan="3">
                                                                                            <asp:TextBox ID="Txt_Efood" runat="server" TextMode="MultiLine" Font-Names="Tahoma"
                                                                                                Font-Size="X-Small" Height="50px" Width="200px"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            Services
                                                                                        </td>
                                                                                        <td align="right" colspan="3" dir="ltr">
                                                                                            <asp:TextBox ID="Txt_EfoodEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                                                Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            ساعت کار
                                                                                        </td>
                                                                                        <td align="right" colspan="3">
                                                                                            <asp:TextBox ID="Txt_Etime" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            Time
                                                                                        </td>
                                                                                        <td align="right" colspan="3" dir="ltr">
                                                                                            <asp:TextBox ID="Txt_EtimeEN" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            تلفن
                                                                                        </td>
                                                                                        <td id="TD1" runat="server" align="right" colspan="3">
                                                                                            <asp:TextBox ID="Txt_etel" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" style="height: 15px">
                                                                                            ايميل
                                                                                        </td>
                                                                                        <td runat="server" align="right" colspan="3" style="height: 15px" id="Td2">
                                                                                            <asp:TextBox ID="TXT_EEmail" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            وب سايت
                                                                                        </td>
                                                                                        <td runat="server" align="right" colspan="3" id="Td3">
                                                                                            <asp:TextBox ID="TXT_Ewebsite" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            تاريخ ابطال
                                                                                        </td>
                                                                                        <td align="right" colspan="3">
                                                                                            <asp:DropDownList ID="Drop_Eexpire" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                                                                                                <asp:ListItem Value="0">نا محدود</asp:ListItem>
                                                                                                <asp:ListItem Value="1">يک ماه</asp:ListItem>
                                                                                                <asp:ListItem Value="2">دو ماه</asp:ListItem>
                                                                                                <asp:ListItem Value="3">سه ماه</asp:ListItem>
                                                                                                <asp:ListItem Value="6">شش ماه</asp:ListItem>
                                                                                                <asp:ListItem Value="12">يکسال</asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                        </td>
                                                                                        <td align="right" colspan="3">
                                                                                            <asp:Label ID="lbl_Exp_date" runat="server"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                        </td>
                                                                                        <td align="right" colspan="3">
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right">
                                                                                            تصوير
                                                                                        </td>
                                                                                        <td align="right" colspan="3">
                                                                                            <asp:FileUpload ID="FileUpload_E" runat="server" />
                                                                                            <asp:TextBox ID="Txt_id" runat="server" Visible="False"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" style="height: 15px">
                                                                                        </td>
                                                                                        <td align="right" colspan="3" style="height: 15px">
                                                                                            حداکثر عرض 400px
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="center" colspan="4" style="height: 15px">
                                                                                            <asp:Button ID="Button_Apply_Edit" runat="server" Text="تغييرات ثبت شود" OnClick="Button_Apply_Edit_Click"
                                                                                                Font-Names="Tahoma" Font-Size="X-Small" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="center" colspan="4" style="height: 15px">
                                                                                            <asp:Image ID="img_Edit" runat="server" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="center" colspan="4" style="height: 15px">
                                                                                            <div style="text-align: center">
                                                                                                <table border="0" style="width: 100%">
                                                                                                    <tr>
                                                                                                        <td align="center" valign="top">
                                                                                                            <table border="0" dir="ltr" style="width: 100%">
                                                                                                                <tr>
                                                                                                                    <td align="right" colspan="2" dir="rtl">
                                                                                                                        &nbsp;
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td align="right" width="70%">
                                                                                                                        <asp:Label ID="Lbl_alarm" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                    <td align="right" width="30%">
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td align="right" width="70%">
                                                                                                                        <asp:FileUpload ID="FileUpload_Image_Big" runat="server" />
                                                                                                                    </td>
                                                                                                                    <td align="left" dir="rtl" width="30%">
                                                                                                                        &nbsp;تصویر بزرگ&nbsp; :
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td align="right" width="70%">
                                                                                                                        <asp:TextBox ID="TextBox_Comment" runat="server" Height="40px" TextMode="MultiLine"></asp:TextBox>
                                                                                                                    </td>
                                                                                                                    <td align="left" dir="rtl" width="30%">
                                                                                                                        <span style="font-size: 10pt; font-family: Tahoma">توضیح کوتاه تصویر :</span>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td align="right" width="70%">
                                                                                                                        <asp:Button ID="Button_Images" runat="server" Font-Names="Tahoma" OnCommand="Button_Images_Command"
                                                                                                                            Text="ارسال" />
                                                                                                                    </td>
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
                                                                                                        <td valign="top">
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td valign="top" align="center">
                                                                                                            <!--**************************************************-->
                                                                                                            <div id="preview_div" style="display: none; z-index: 110; left: -500px; position: absolute;
                                                                                                                top: 302px">
                                                                                                                <div id="loader">
                                                                                                                    <div id="loader_bg">
                                                                                                                        <div id="progress" style="left: 92px; width: 20px">
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                            <div class="preview_temp_load">
                                                                                                            </div>
                                                                                                            <asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="3" CellPadding="3">
                                                                                                                <ItemTemplate>
                                                                                                                    <div style="text-align: center">
                                                                                                                        <table border="1" cellpadding="0" cellspacing="0" style="width: 100px;">
                                                                                                                            <tr>
                                                                                                                                <td style="width: 100%">
                                                                                                                                    <table border="0" style="width: 100%">
                                                                                                                                        <tr>
                                                                                                                                            <td align="center" style="width: 100%">
                                                                                                                                                <img src='../phascoupfile/Dir_Gallery/s<%# image_Check_dir(Eval("id").ToString())%>'>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td align="center" style="width: 100%">
                                                                                                                                                <%# Eval("comment")%>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td align="center" style="width: 100%">
                                                                                                                                                <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                                                                                                                    Font-Names="Tahoma" Font-Size="Small" Font-Underline="False" OnCommand="LinkButton_Delete_Command">حذف</asp:LinkButton>
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </table>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </div>
                                                                                                                </ItemTemplate>
                                                                                                                <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                                                                                    Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
                                                                                                            </asp:DataList>
                                                                                                            <p>
                                                                                                            </p>
                                                                                                            <p>
                                                                                                            </p>
                                                                                                            <div>
                                                                                                            </div>
                                                                                                            <!--**************************************************-->
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            ss
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </asp:Panel>
                                                        </td>
                                                        <td valign="top" width="400">
                                                            <asp:DataGrid ID="Grid_Rest" runat="Server" AllowPaging="True" AutoGenerateColumns="False"
                                                                BackColor="White" BackImageUrl="~/images/bg-bo-1.jpg" BorderColor="#999999" BorderStyle="None"
                                                                BorderWidth="0px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanged="dgrdTitles_PageIndexChanged"
                                                                PagerStyle-BorderColor="beige" PagerStyle-Mode="NumericPages" PageSize="25" ShowHeader="False"
                                                                Width="100%">
                                                                <FooterStyle BackColor="#CCCCCC" />
                                                                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                                <PagerStyle BackColor="#C0C0FF" BorderColor="DimGray" BorderStyle="Solid" BorderWidth="1px"
                                                                    Font-Names="Verdana" Font-Size="Small" Font-Strikeout="False" Font-Underline="False"
                                                                    ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" PageButtonCount="20"
                                                                    Position="TopAndBottom" VerticalAlign="Middle" />
                                                                <AlternatingItemStyle BackColor="#E0E0E0" BorderStyle="None" BorderWidth="0px" />
                                                                <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                                <Columns>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <table id="Table3" border="0" dir="rtl" width="100%">
                                                                                <tr>
                                                                                    <td width="76">
                                                                                        <span lang="fa">نام آزمايشگاه </span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <%#Eval("name")%>
                                                                                    </td>
                                                                                    <td width="32">
                                                                                        <span lang="fa">ستاره</span>
                                                                                    </td>
                                                                                    <td width="325">
                                                                                        <img src='../Images/star<%#Eval("star")%>.jpg' border="0" />
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td width="76">
                                                                                        <span lang="fa">تصوير</span>
                                                                                    </td>
                                                                                    <td>
                                                                                        <%# image_Check(Convert.ToString(Eval("pic")))%>
                                                                                    </td>
                                                                                    <td width="32">
                                                                                    </td>
                                                                                    <td width="325">
                                                                                        <asp:LinkButton ID="Link_Edit" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Autoid","{0}") %>'
                                                                                            runat="server" OnCommand="Link_Edit_Command">ويرايش</asp:LinkButton>
                                                                                        <asp:LinkButton ID="Link_Delete" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Autoid","{0}") %>'
                                                                                            runat="server" OnCommand="Link_Delete_Command">حذف</asp:LinkButton>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 592px">
                                                        </td>
                                                        <td>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </asp:View>
                                            <asp:View ID="View4" runat="server">
                                                <div>
                                                    <table border="0" style="width: 100%">
                                                        <tr>
                                                            <td align="right">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <table style="width: 100%">
                                                                    <tr>
                                                                        <td align="right" style="height: 19px">
                                                                        </td>
                                                                        <td align="right" style="height: 19px">
                                                                            <asp:DropDownList ID="DropDownList_Group2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                                                Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Group2_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td style="height: 19px" width="50">
                                                                            <asp:DropDownList ID="DropDownList_Group1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Group1_SelectedIndexChanged"
                                                                                Font-Names="Tahoma" Font-Size="X-Small">
                                                                                <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
                                                                                <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
                                                                                <asp:ListItem Value="31">البرز</asp:ListItem>
                                                                                <asp:ListItem Value="3">اردبیل</asp:ListItem>
                                                                                <asp:ListItem Value="4">اصفهان</asp:ListItem>
                                                                                <asp:ListItem Value="5">ایلام</asp:ListItem>
                                                                                <asp:ListItem Value="6">بوشهر</asp:ListItem>
                                                                                <asp:ListItem Value="7">تهران</asp:ListItem>
                                                                                <asp:ListItem Value="8">چهار محال و بختیاری</asp:ListItem>
                                                                                <asp:ListItem Value="9">خراسان جنوبی</asp:ListItem>
                                                                                <asp:ListItem Value="10">خراسان رضوی</asp:ListItem>
                                                                                <asp:ListItem Value="11">خراسان شمالی</asp:ListItem>
                                                                                <asp:ListItem Value="12">خورستان</asp:ListItem>
                                                                                <asp:ListItem Value="13">زنجان</asp:ListItem>
                                                                                <asp:ListItem Value="14">سمنان</asp:ListItem>
                                                                                <asp:ListItem Value="15">سیستان و بلوچستان</asp:ListItem>
                                                                                <asp:ListItem Value="16">فارس</asp:ListItem>
                                                                                <asp:ListItem Value="17">قزوین</asp:ListItem>
                                                                                <asp:ListItem Value="18">قم</asp:ListItem>
                                                                                <asp:ListItem Value="19">کردستان</asp:ListItem>
                                                                                <asp:ListItem Value="20">کرمان</asp:ListItem>
                                                                                <asp:ListItem Value="21">کرمانشاه</asp:ListItem>
                                                                                <asp:ListItem Value="22">کهکیلویه و بویر احمد</asp:ListItem>
                                                                                <asp:ListItem Value="23">گلستان</asp:ListItem>
                                                                                <asp:ListItem Value="24">گیلان</asp:ListItem>
                                                                                <asp:ListItem Value="25">لرستان</asp:ListItem>
                                                                                <asp:ListItem Value="26">مازندران</asp:ListItem>
                                                                                <asp:ListItem Value="27">مرکزی</asp:ListItem>
                                                                                <asp:ListItem Value="28">هرمزگان</asp:ListItem>
                                                                                <asp:ListItem Value="29">همدان</asp:ListItem>
                                                                                <asp:ListItem Value="30">یزد</asp:ListItem>
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                        </td>
                                                                        <td align="right">
                                                                            <asp:Label ID="Lbl_Alarm_group3" runat="server" ForeColor="Red" Text="گروه دوم را انتخاب نکرده اید"
                                                                                Visible="False"></asp:Label>
                                                                            <asp:TextBox ID="TXt_Group3" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox>
                                                                        </td>
                                                                        <td width="50">
                                                                            نام منطقه
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                        </td>
                                                                        <td align="right">
                                                                            <asp:TextBox ID="TXt_Group3EN" runat="server" Font-Names="Verdana" Font-Size="X-Small"></asp:TextBox>
                                                                        </td>
                                                                        <td width="50">
                                                                            Region
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                        </td>
                                                                        <td align="right">
                                                                            <asp:Button ID="Button_group3" runat="server" Text="ثبت شود" OnClick="Button_group3_Click"
                                                                                Font-Names="Tahoma" Font-Size="X-Small" />
                                                                        </td>
                                                                        <td width="50">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:DataGrid ID="DataGrid_Group3" runat="server" AutoGenerateColumns="False" BackColor="White"
                                                                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyField="Id"
                                                                    Font-Names="Tahoma" Font-Size="X-Small" ForeColor="Black" GridLines="Vertical"
                                                                    OnCancelCommand="DataGrid_Group3_CancelCommand" OnDeleteCommand="DataGrid_Group3_DeleteCommand"
                                                                    OnEditCommand="DataGrid_Group3_EditCommand" OnUpdateCommand="DataGrid_Group3_UpdateCommand"
                                                                    Width="70%">
                                                                    <FooterStyle BackColor="#CCCCCC" />
                                                                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                                                    <AlternatingItemStyle BackColor="#CCCCCC" />
                                                                    <HeaderStyle BackColor="Black" BorderColor="Black" BorderWidth="5px" Font-Bold="True"
                                                                        ForeColor="White" />
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="StateEN" HeaderText="English"></asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Satate" HeaderText="فارسی"></asp:BoundColumn>
                                                                        <asp:EditCommandColumn CancelText="انصراف" EditText="ويرايش" HeaderText="ويرايش"
                                                                            UpdateText="ذخيره"></asp:EditCommandColumn>
                                                                        <asp:ButtonColumn CommandName="Delete" HeaderText="حذف" Text="حذف"></asp:ButtonColumn>
                                                                    </Columns>
                                                                </asp:DataGrid>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:View>
                                            <asp:View ID="View5" runat="server">
                                                <asp:DataGrid ID="DataGrid_NewList" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    BackColor="White" BackImageUrl="~/images/bg-bo-1.jpg" BorderColor="#999999" BorderStyle="None"
                                                    BorderWidth="0px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnPageIndexChanged="dgrdTitles_PageIndexChanged"
                                                    PagerStyle-BorderColor="beige" PagerStyle-Mode="NumericPages" PageSize="25" ShowHeader="False"
                                                    Width="100%">
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                    <PagerStyle BackColor="#C0C0FF" BorderColor="DimGray" BorderStyle="Solid" BorderWidth="1px"
                                                        Font-Names="Verdana" Font-Size="Small" Font-Strikeout="False" Font-Underline="False"
                                                        ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" PageButtonCount="20"
                                                        Position="TopAndBottom" VerticalAlign="Middle" />
                                                    <AlternatingItemStyle BackColor="#E0E0E0" BorderStyle="None" BorderWidth="0px" />
                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <table border="0" style="width: 100%">
                                                                    <tr>
                                                                        <td align="right">
                                                                            نام آزمايشگاه
                                                                        </td>
                                                                        <td align="right">
                                                                            <%#Eval("name")%>
                                                                        </td>
                                                                        <td align="right">
                                                                            تعداد ستاره
                                                                        </td>
                                                                        <td align="right">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" style="height: 22px">
                                                                            آدرس
                                                                        </td>
                                                                        <td align="right" colspan="3" style="height: 22px">
                                                                            <%#Eval("Address")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            مسئول فنی آزمايشگاه
                                                                        </td>
                                                                        <td align="right" colspan="3">
                                                                            <%#Eval("Manager")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            خدمات
                                                                        </td>
                                                                        <td align="right" colspan="3">
                                                                            <%#Eval("Foods")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            ساعت کار
                                                                        </td>
                                                                        <td align="right" colspan="3">
                                                                            <%#Eval("Time")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            تلفن
                                                                        </td>
                                                                        <td id="TD1" runat="server" align="right" colspan="3">
                                                                            <%#Eval("tel")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" style="height: 15px">
                                                                            ايميل
                                                                        </td>
                                                                        <td runat="server" align="right" colspan="3" style="height: 15px" id="Td2">
                                                                            <%#Eval("EMail")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            وب سايت
                                                                        </td>
                                                                        <td runat="server" align="right" colspan="3" id="Td3">
                                                                            <%#Eval("WebSite")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            تاريخ ابطال
                                                                        </td>
                                                                        <td align="right" colspan="3">
                                                                            <%#Eval("ExpDate")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            کاربر
                                                                        </td>
                                                                        <td align="right" colspan="3">
                                                                            <%#Eval("uid")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            عملیات
                                                                        </td>
                                                                        <td align="right" colspan="3">
                                                                            <a href="dirmain.aspx?opaid=<%#Eval("autoid")%>&mode=5">تائید</a> <a href="dirmain.aspx?opdid=<%#Eval("autoid")%>&mode=5">
                                                                                حذف</a>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" colspan="4" style="height: 15px">
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid></asp:View>
                                        </asp:MultiView>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
