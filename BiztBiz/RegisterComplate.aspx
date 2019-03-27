<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Biztbiz.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="RegisterComplate.aspx.cs" Inherits="BiztBiz.RegisterComplate" %>

<%@ Register Assembly="dotNetFreak.WebControls.FormShield" Namespace="dotNetFreak.WebControls"
    TagPrefix="dnf" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <%--  <style type="text/css">
        .style1
        {
            width: 265px;
        }
        .style2
        {
            width: 264px;
        }
        .style3
        {
            width: 202px;
        }
        .style4
        {
            width: 160px;
        }
        .style5
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style6
        {
            height: 72px;
        }
        .style7
        {
            height: 31px;
        }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </ajaxToolkit:ToolkitScriptManager>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table style="width: 482px" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <img alt="" height="108" src="images/reg-bg-frame1-top.jpg" width="482" />
                    </td>
                </tr>
                <tr>
                    <td style="background: transparent url('images/reg-bg-frame1-mid.jpg') repeat-y scroll center top;
                        padding: 20px; text-align: right;">
                        <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px;
                            padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                        <div style="float: right; width: 350px; vertical-align: top">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px; vertical-align: top">نوع عضویت :</span>
                            <asp:RadioButtonList ID="rdbListUserTypes" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                                ForeColor="Gray" Font-Bold="true" CssClass="defaultP">
                                <asp:ListItem Text="فروشنده" Value="1"></asp:ListItem>
                                <asp:ListItem Text="خریدار" Value="2"></asp:ListItem>
                                <asp:ListItem Text="هردو" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div style="float: right; width: 350px; vertical-align: top">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px; vertical-align: top">نام کاربری (ایمیل):</span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="TextBox_Uid_Email" runat="server" Enabled="false" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">نام : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="TextBox_Name" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <div style="float: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox_Name"
                                    ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">نام خانوادگی : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="TextBox_Family" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <div style="float: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox_Family"
                                    ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div style="float: right; width: 430px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">شهر : </span>
                            <div style="float: right; padding-top: 10px; padding-right: 5px;">
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="ddlState" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                    Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                                    ServiceMethod="GetState" />
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="ddlCity" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                                    ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                                    ServicePath="~/Services/BiztBizServices.asmx" Category="City" />
                            </div>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">زمینه اصلی فعالیت: </span>
                            <div style="float: right; height: 26px; width: 180px; padding-top: 10px; padding-right: 5px;">
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="DropDownList_Indus" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                            </div>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">شماره تلفن : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="TextBox_Tel_A_Number" runat="server" Width="132px" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <div style="float: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox_Tel_A_Number"
                                    ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">شماره همراه : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="TextBox_Mobile" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                        </div>
                        <%--<div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">آدرس :</span>
                            <div style="float: right; background: transparent url('images/log-bg-input.jpg') no-repeat scroll center top;
                                height: 26px; width: 180px; padding: 2px 5px">
                                <input class="log-login-input-item" name="Text3" type="text" />
                            </div>
                        </div>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">وب سایت :</span>
                            <div style="float: right; background: transparent url('images/log-bg-input.jpg') no-repeat scroll center top;
                                height: 26px; width: 180px; padding: 2px 5px">
                                <input class="log-login-input-item" name="Text3" type="text" />
                            </div>
                        </div>--%>
                        <div style="float: right; width: 350px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 100px">کد امنیتی : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="TextBox_Sec_Code" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                            <div style="float: right;">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox_Sec_Code"
                                    ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div style="float: right; width: 300px; padding-right: 100px;">
                            <asp:UpdatePanel ID="updSecureKey" runat="server">
                                <ContentTemplate>
                                    <dnf:FormShield ID="FormShield1" runat="server" ImageBorderColor="Transparent" ImageBorderStyle="None"
                                        NoiseColor="255, 128, 128" NoiseColor2="LightBlue" NoiseLevel="30" TextEffect="FontAngleWarp"
                                        TextLength="4" Width="224px">
                                        <RefreshIcon AlternateText="Refresh" />
                                        <SoundIcon AlternateText="Listen" Visible="False" />
                                        <HelpIcon AlternateText="Please enter the characters shown on the image" Visible="False" />
                                    </dnf:FormShield>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <span style="float: right; clear: both; padding: 10px; margin-right: 180px">
                            <asp:ImageButton ID="ImageButton_CreateAccount" runat="server" ImageUrl="~/images/reg-b-reg.jpg"
                                Height="34px" Width="123px" OnClick="ImageButton_CreateAccount_Click" ValidationGroup="complateRegister" />
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img alt="" height="23" src="images/reg-bg-frame1-down.jpg" width="482" />
                    </td>
                </tr>
            </table>
            <%--<table style="width: 900px" class="register_Table" align="center">
                <tr>
                    <td class="style1" align="center">
                        <img alt="" src="images/haer-reg.jpg" width="872" height="155" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td class="center-align">
                                    <img alt="" src="images/top-frame-reg.jpg" width="866" height="10" />
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: middle; background: transparent url('images/bg-frame-reg.jpg') repeat-y scroll center top;
                                    padding: 30px">
                                    <table>
                                        <tr>
                                            <td class="td_register">
                                                &nbsp;
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_alarm" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register_titlr" colspan="2">
                                                <div style="height: 30px; width: 800px; margin: 0px auto; padding: 5px 60px 5px 40px;
                                                    color: #006699; font-family: Arial, Helvetica, sans-serif; font-size: x-large;
                                                    font-weight: bold;">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <asp:Literal ID="Literal14" Text="<%$ Resources:Resource, Select_your_Account_Type %>"
                                                        runat="server" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                <asp:Literal ID="Literal1" Text="<%$ Resources:Resource, Supplier_or_Buyer %>" runat="server" />
                                            </td>
                                            <td class="td_register_de">
                                                &nbsp;
                                                <asp:RadioButton ID="RadioButton1" runat="server" Selected="True" Text="<%$ Resources:Resource, Supplier %>"
                                                    Value="1" GroupName="G1" CssClass="radiobttn" />
                                                &nbsp;
                                                <asp:RadioButton ID="RadioButton2" runat="server" Text="<%$ Resources:Resource, Buyer %>"
                                                    GroupName="G1" CssClass="radiobttn" />
                                                &nbsp;
                                                <asp:RadioButton ID="RadioButton3" runat="server" Text="<%$ Resources:Resource, Both %>"
                                                    GroupName="G1" CssClass="radiobttn" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style7">
                                            </td>
                                            <td class="style7">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="td_register_titlr">
                                                <div style="height: 30px; width: 800px; margin: 0px auto; padding: 5px 60px 5px 40px;
                                                    color: #006699; font-family: Arial, Helvetica, sans-serif; font-size: x-large;
                                                    font-weight: bold;">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Literal ID="Literal15"
                                                        Text="<%$ Resources:Resource, Enter_your_Account_Information %>" runat="server" />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                نام کاربری(ایمیل)
                                            </td>
                                            <td class="td_register_de">
                                                <asp:TextBox ID="TextBox_Uid_Email" runat="server" Enabled="false"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                <asp:Literal ID="Literal33334" Text="<%$ Resources:Resource, Business_Location %>"
                                                    runat="server" />
                                            </td>
                                            <td class="td_register_de">
                                                <asp:DropDownList ID="ddlState" runat="server" CssClass="txtjobsmall">
                                                </asp:DropDownList>
                                                <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                                    Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                                                    ServiceMethod="GetState" />
                                                <asp:DropDownList ID="ddlCity" runat="server" CssClass="txtjobsmall">
                                                </asp:DropDownList>
                                                <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                                                    ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                                                    ServicePath="~/Services/BiztBizServices.asmx" Category="City" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                *<asp:Literal ID="Literal5" Text="<%$ Resources:Resource, Company %>" runat="server" />
                                            </td>
                                            <td class="td_register_de">
                                                <asp:TextBox ID="TextBox_Company" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_Company"
                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, Fill_the_field %>" ForeColor="Maroon"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                زمینه اصلی
                                            </td>
                                            <td class="td_register_de">
                                                &nbsp;<asp:DropDownList ID="DropDownList_Indus" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                <asp:Literal ID="Literal7" Text="<%$ Resources:Resource, Sex %>" runat="server" />
                                            </td>
                                            <td class="td_register_de">
                                                <asp:RadioButton ID="RadioButtonList_sex1" runat="server" CssClass="radiobttn" Text="<%$ Resources:Resource, male %>"
                                                    GroupName="Gsex" />&nbsp;
                                                <asp:RadioButton ID="RadioButtonList_sex2" Text="<%$ Resources:Resource, female %>"
                                                    runat="server" CssClass="radiobttn" GroupName="Gsex" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                *<asp:Literal ID="Literal12" Text="<%$ Resources:Resource, Name %>" runat="server" />
                                            </td>
                                            <td class="td_register_de">
                                                <asp:TextBox ID="TextBox_Name" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox_Name"
                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, Fill_the_field %>" ForeColor="Maroon"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                *<asp:Literal ID="Literal13" Text="<%$ Resources:Resource, Family %>" runat="server" />
                                            </td>
                                            <td class="td_register_de">
                                                <asp:TextBox ID="TextBox_Family" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox_Family"
                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, Fill_the_field %>" ForeColor="Maroon"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                *<asp:Literal ID="Literal8" Text="<%$ Resources:Resource, Tel %>" runat="server" />
                                            </td>
                                            <td class="td_register_de" style="direction: ltr">
                                                <asp:TextBox ID="TextBox_Tel_C_Code" runat="server" Width="24px"></asp:TextBox>
                                                &nbsp;
                                                <asp:TextBox ID="TextBox_Tel_A_Code" runat="server" Width="24px"></asp:TextBox>
                                                &nbsp;&nbsp;
                                                <asp:TextBox ID="TextBox_Tel_A_Number" runat="server" Width="132px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                &nbsp;
                                            </td>
                                            <td class="td_register_de" style="direction: ltr">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox_Tel_A_Number"
                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, Fill_the_field %>" ForeColor="Maroon"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                <asp:Literal ID="Literal9" Text="<%$ Resources:Resource, Mobile %>" runat="server" />
                                            </td>
                                            <td class="td_register_de">
                                                <asp:TextBox ID="TextBox_Mobile" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                *<asp:Literal ID="Literal10" Text="<%$ Resources:Resource, Verify_Your_Registration %>"
                                                    runat="server" />
                                            </td>
                                            <td class="td_register_de">
                                                <asp:TextBox ID="TextBox_Sec_Code" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox_Sec_Code"
                                                    Display="Dynamic" ErrorMessage="<%$ Resources:Resource, Fill_the_field %>" ForeColor="Maroon"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                &nbsp;
                                            </td>
                                            <td class="td_register_de">
                                                <asp:UpdatePanel ID="updSecureKey" runat="server">
                                                    <ContentTemplate>
                                                        <dnf:FormShield ID="FormShield1" runat="server" ImageBorderColor="Transparent" ImageBorderStyle="None"
                                                            NoiseColor="255, 128, 128" NoiseColor2="LightBlue" NoiseLevel="30" TextEffect="FontAngleWarp"
                                                            TextLength="4" Width="224px">
                                                            <RefreshIcon AlternateText="Refresh" />
                                                            <SoundIcon AlternateText="Listen" Visible="False" />
                                                            <HelpIcon AlternateText="Please enter the characters shown on the image" Visible="False" />
                                                        </dnf:FormShield>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_register">
                                                &nbsp;
                                            </td>
                                            <td class="td_register_de">
                                                <asp:ImageButton ID="ImageButton_CreateAccount" runat="server" ImageUrl="~/images/creart-acc-reg.jpg"
                                                    OnClick="ImageButton_CreateAccount_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="center-align">
                                    <img alt="" src="images/b-frame-reg.jpg" width="866" height="10" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>--%>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table cellpadding="0" class="style5">
                <tr>
                    <td align="center">
                        <img alt="" height="155" src="images/haer-reg.jpg" width="872" />
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table cellpadding="0" style="width: 880px;">
                            <tr>
                                <td style="width: 640px;">
                                    <img alt="" src="images/welreg.JPG" />
                                </td>
                                <td style="width: 240px; vertical-align: middle;">
                                    <asp:Label ID="Label_Success" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
