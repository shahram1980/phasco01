<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PHASCO_WEB.Register" %>

<%@ Register Assembly="dotNetFreak.WebControls.FormShield" Namespace="dotNetFreak.WebControls"
    TagPrefix="dnf" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<asp:Content runat="server" ContentPlaceHolderID="head_Meta">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">

            <table class="table table-responsive no-border form-group rtl-text table-sm">
                <tr>
                    <td align="right" colspan="2">
                        <div class="alert alert-danger" id="lbl_Alarm_Wrapper" runat="server">
                            <asp:Label ID="lbl_Alarm" runat="server"></asp:Label>
                        </div>


                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%; height: 20px" valign="top">*نام کاربری&nbsp; :</td>
                    <td align="right" style="width: 80%; height: 20px" valign="top">
                        <asp:TextBox ID="TextBox_uid" runat="server" CssClass="form-control" Width="40%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_uid"
                            ErrorMessage="نام کاربری وارد نشده" ForeColor="Maroon"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <script>

                    $("#<%=TextBox_uid.ClientID%>").keypress(function (event) {
                        var control = $(this);
                        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
                        if (/[^A-Za-z0-9]/g.test(key)) {
                            alert("فقط کاراکتر لاتین وارد نمایید .")
                            return false;
                        } else {
                            return true;
                        }
                    })
                </script>
                <tr>
                    <td align="left" style="width: 20%; height: 20px" valign="top"></td>
                    <td align="right" style="width: 80%; height: 20px" valign="top">* کاربر گرامی لطفا نام کاربری خود را با حروف انگلیسی وارد نمائید</td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%" valign="top">نام رمز&nbsp; :</td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Pass" CssClass="form-control" runat="server"
                            TextMode="Password" Width="40%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Pass"
                            ErrorMessage="نام رمز را وارد کنید" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%" valign="top">تکرار نام رمز :</td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:TextBox CssClass="form-control" ID="TextBox_Pass2" runat="server" TextMode="Password" Width="40%"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox_Pass"
                            ControlToValidate="TextBox_Pass2" ErrorMessage="نام رمزها یکسان نیست"
                            ForeColor="DarkRed"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%; height: 19px;" valign="top">نام :</td>
                    <td align="right" style="width: 80%; height: 19px;" valign="top">
                        <asp:TextBox CssClass="form-control only-per" ID="TextBox_Name" runat="server" Width="40%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox_Name"
                            ErrorMessage="نام  وارد نشده" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%" valign="top">نام خانوادگی :
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Famil" CssClass="form-control only-per" runat="server" Width="40%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_Famil"
                            ErrorMessage="نام  خانوادگی  وارد نشده" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
                </tr>


                <tr>
                    <td align="left" style="width: 20%" valign="top">نام پدر :
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Father" CssClass="form-control only-per" runat="server" Width="40%"></asp:TextBox></td>
                </tr>

                <script>

                    $(".only-per").keypress(function (event) {

                        var control = $(this);
                        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);

                        if (key == " ") return true;
                        if (/[^\u0600-\u06FF]/g.test(key)) {
                            alert('"فقط کاراکتر فارسی تایپ نمایید');
                            return false;
                        } else {
                            return true;
                        }
                    });

                </script>
                <tr>
                    <td align="left" style="width: 20%" valign="top">جنسیت :
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:RadioButtonList RepeatLayout="Flow" RepeatDirection="Horizontal" ID="RadioButtonList_sex" runat="server" Width="30%">
                            <asp:ListItem Selected="True" Value="0">مرد</asp:ListItem>
                            <asp:ListItem Value="1">زن</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%" valign="top">تاریخ تولد:
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:DropDownList CssClass="form-control pull-right margin-left-5" ID="cmbDay" runat="server" Width="80px">
                            <asp:ListItem Text="روز" Value="-1"></asp:ListItem>

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
                        <asp:DropDownList CssClass="pull-right margin-left-5" ID="cmbMonth" runat="server"
                            Width="80px">
                            <asp:ListItem Text="ماه" Value="-1"></asp:ListItem>

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
                        <asp:DropDownList CssClass="form-control pull-right" ID="cmbYear" runat="server" Width="80px">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%" valign="top">موبایل :
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Website" runat="server" CssClass="form-control ltr-text" Width="40%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%; height: 20px" valign="top">پست الکترونیک :</td>
                    <td align="right" style="width: 80%; height: 20px" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_Email"
                            ErrorMessage="پست الکترونیک وارد نشده" ForeColor="Maroon"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_Email"
                            Display="Dynamic" ErrorMessage="پست الکترونیک معتبر نمی باشد"
                            ForeColor="DarkRed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:TextBox CssClass="form-control ltr-text" ID="TextBox_Email" runat="server" Width="40%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%" valign="top">تلفن :
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:TextBox CssClass="form-control ltr-text" ID="TextBox_Tel" runat="server" Width="40%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%" valign="top">آدرس :
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Address" runat="server" CssClass="form-control" Width="40%"></asp:TextBox></td>
                </tr>
                <%--    <tr>
                    <td align="left" style="width: 20%" valign="top">توضیحات :
                    </td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:TextBox CssClass="form-control" ID="TextBox_Description" runat="server" Height="30px" TextMode="MultiLine" Width="60%"></asp:TextBox></td>
                </tr>--%>
                <tr>
                    <td align="left" style="width: 20%" valign="top">معرف :</td>
                    <td align="right" style="width: 80%" valign="top">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="TextBox_IntriId" runat="server" CssClass="form-control" Style="width: 40%;"></asp:TextBox>
                                <asp:LinkButton ID="LinkButton_IntoCheck" runat="server" BorderStyle="None"
                                    CausesValidation="False" OnClick="LinkButton_IntoCheck_Click">این معرف وجود 
                                دارد ؟</asp:LinkButton>
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                    <ProgressTemplate>
                                        در حال بررسی ..
                                    </ProgressTemplate>
                                </asp:UpdateProgress>
                                <asp:Label ID="Label_Intro_Alarm" runat="server" ForeColor="#CC0000"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <%--  <tr>
                    <td align="left" style="width: 20%; height: 19px" valign="top">
                        کد امینتی زیر را وارد کنید :</td>
                    <td align="right" style="width: 80%; height: 19px" valign="top">
                        <asp:TextBox ID="TextBox_Code" runat="server" BackColor="white" BorderColor="white" Font-Names="Tahoma"
                            Font-Size="X-Small" Width="40%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%; height: 19px" valign="top">
                    </td>
                    <td align="right" style="width: 80%; height: 19px" valign="top">
                     <dnf:FormShield ID="FormShield1" runat="server" ImageBorderColor="Transparent" ImageBorderStyle="None"
                    NoiseColor="255, 128, 128" NoiseColor2="LightBlue" NoiseLevel="30" TextEffect="FontAngleWarp"
                    Width="224px"><RefreshIcon AlternateText="Refresh" /><SoundIcon AlternateText="Listen" Visible="False" /><HelpIcon AlternateText="Please enter the characters shown on the image" Visible="False" /></dnf:FormShield>
                     
                     </td>
                </tr>--%>
                <tr>
                    <td align="left" style="width: 20%; height: 19px" valign="top"></td>
                    <td align="right" style="width: 80%; height: 19px" valign="top">
                        <asp:Button ID="Button_insert" runat="server" CssClass="btn btn-primary" OnClick="Button_insert_Click"
                            Text="  ثبت شود  " />
                        <asp:HiddenField ID="HiddenField_Intro" runat="server" Value="0" />
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%" valign="top"></td>
                    <td align="right" style="width: 80%" valign="top"></td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="table table-responsive no-border">
                <tr>
                    <td align="center" style="width: 100%" dir="rtl">کاربر گرامی با تشکر از ثبت نام شما، کد فعال سازی نام کاربری شما به آدرس پست 
                        الکترونیکی تان فرستاده شد .<br />
                        <span class="style19">تذکر&nbsp; مهم : ایمیل ارسالی 
                        ممکن است به بخش bulk یا&nbsp; spam برود<br />
                            <br />
                        </span>لطفا پس از فعال سازی نام کاربری خود از سایت فاسکو استفاده نمائید.<br />
                        <br />
                        با تشکر&nbsp;
                        <br />
                        سایت&nbsp; جامع علوم آزمایشگاهی و پزشکی فاسکو</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>

</asp:Content>
