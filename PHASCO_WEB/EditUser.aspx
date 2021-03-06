<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="EditUser.aspx.cs" Inherits="PHASCO_WEB.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <table style="width: 100%">
        <tr>
            <td dir="rtl" style="width: 100%">
                <asp:Label ID="Label_Alarm" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    ForeColor="#C00000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100%">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div style="text-align: center">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 80%">
                                <tr>
                                    <td align="right" colspan="2" dir="rtl">
                                        <%--   تصویر مجاز فرمت JPEG و سایز 112*112 پیکسل می باشد.--%>
                                    </td>
                                    <td align="center" rowspan="3" style="width: 33%" valign="middle"><table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr>
                                            <td align="center" style="width: 100%">
                                                <asp:Image ID="Image_Photo" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" style="width: 100%">
                                                <asp:LinkButton ID="LinkButton_DeleteImage" OnClientClick="return confirm('برای حذف تصوير اطمینان داريد')"
                                                    runat="server" ForeColor="#C00000" OnClick="LinkButton_DeleteImage_Click">حذف تصوير</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 33%">
                                        <asp:FileUpload ID="FileUpload_NewPhoto" runat="server" />
                                    </td>
                                    <td align="left" dir="rtl" style="width: 33%">تصویرجدید:
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 33%; height: 18px;">
                                        <asp:Button ID="Button_UpLoadPhoto" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                            OnClick="Button_UpLoadPhoto_Click" Text="ارسال شود" />
                                    </td>
                                    <td align="left" dir="rtl" style="width: 33%; height: 18px;"></td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div class="col-md-8 col-md-offset-4">
                            <table border="0" dir="rtl" class="table table-responsive form-group no-border table-sm">
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">نام :</td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                        <asp:TextBox ID="TextBox_Name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">نام خانوادگی :</td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                        <asp:TextBox ID="TextBox_Famil" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">تلفن تماس :</td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                        <asp:TextBox ID="TextBox_Tel" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">آدرس :</td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                        <asp:TextBox ID="TextBox_Address" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">جنسیت :</td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                        <asp:RadioButtonList ID="RadioButtonList_sex" runat="server"
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="0">مرد</asp:ListItem>
                                            <asp:ListItem Value="1">زن</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">شهر :
                                    </td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                    <asp:TextBox ID="TextBox_City" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">رشته :
                                    </td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                    <asp:TextBox ID="TextBox_Reshte" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%; height: 16px" valign="top">مقطع تحصیلی :
                                    </td>
                                    <td align="right" dir="rtl" style="height: 16px" valign="top" width="80%">
                                    <asp:TextBox ID="TextBox_Maghata" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">تخصص :
                                    </td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                    <asp:TextBox ID="TextBox_Takhasos" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%; height: 18px" valign="top">نام محل کار :
                                    </td>
                                    <td align="right" dir="rtl" style="height: 18px" valign="top" width="80%">
                                    <asp:TextBox ID="TextBox_OfficeName" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">عنوان شغلي :
                                    </td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                    <asp:TextBox ID="TextBox_Job" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">پست الکترونیک :
                                    </td>
                                    <td align="right" dir="ltr" valign="top" width="80%">
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_Email"
                                            Display="Dynamic" ErrorMessage="پست الکترونیک معتبر نمی باشد" ForeColor="DarkRed"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="TextBox_Email" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">تاریخ تولد :
                                    </td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                        <asp:DropDownList ID="cmbDay" runat="server"  Width="30%" CssClass="form-control display-inline">
                                            <asp:ListItem Text="01" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="02" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="03" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="04" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="05" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="06" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="07" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="08" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="09" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                                            <asp:ListItem Text="21" Value="21"></asp:ListItem>
                                            <asp:ListItem Text="22" Value="22"></asp:ListItem>
                                            <asp:ListItem Text="23" Value="23"></asp:ListItem>
                                            <asp:ListItem Text="24" Value="24"></asp:ListItem>
                                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                                            <asp:ListItem Text="26" Value="26"></asp:ListItem>
                                            <asp:ListItem Text="27" Value="27"></asp:ListItem>
                                            <asp:ListItem Text="28" Value="28"></asp:ListItem>
                                            <asp:ListItem Text="29" Value="29"></asp:ListItem>
                                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                                            <asp:ListItem Text="31" Value="31"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="cmbMonth" runat="server" CssClass="form-control display-inline" Width="38%">
                                            <asp:ListItem Text="فروردين" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="ارديبهشت" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="خرداد" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="تير" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="مرداد" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="شهريور" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="مهر" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="آبان" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="آذز" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="دي" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="بهمن" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="اسفند" Value="12"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="cmbYear"  Width="30%" runat="server" CssClass="form-control display-inline">
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="left" height="0" style="width: 20%" valign="top">
                                    </td>
                                    <td align="right" dir="rtl" valign="top" width="80%">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary"
                                        Text="ثبت شود" OnClick="Button1_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <div style="text-align: center">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 60%">
                                <tr>
                                    <td align="right" style="width: 60%">
                                        <asp:TextBox ID="TextBox_Pass_Current" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td align="left" dir="rtl" style="width: 40%">نام رمز فعلی :
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 60%"></td>
                                    <td align="left" dir="rtl" style="width: 40%"></td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 60%">
                                        <asp:TextBox ID="TextBox_Pass_New1" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td align="left" dir="rtl" style="width: 40%">نام رمز جدید:
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 60%">
                                        <asp:TextBox ID="TextBox_Pass_New2" runat="server"   TextMode="Password"
                                            CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td align="left" dir="rtl" style="width: 40%">تکرار نام رمز جدید :
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" dir="rtl" style="width: 60%">
                                        <asp:CompareValidator ControlToCompare="TextBox_Pass_New1" ControlToValidate="TextBox_Pass_New2"
                                            Display="Dynamic" ErrorMessage="نام رمزها یکسان نمی باشند !" ForeColor="DarkRed"
                                            ID="CompareValidator1" runat="server"></asp:CompareValidator>
                                    </td>
                                    <td align="left" dir="rtl" style="width: 40%"></td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 60%">
                                        <asp:Button ID="Button_ChangePAss" runat="server" CssClass="btn btn-primary"
                                            OnClick="Button_ChangePAss_Click" Text="ثبت شود" />
                                    </td>
                                    <td align="left" dir="rtl" style="width: 40%"></td>
                                </tr>
                            </table>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>