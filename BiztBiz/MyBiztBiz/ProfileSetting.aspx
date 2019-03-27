<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="ProfileSetting.aspx.cs" Inherits="BiztBiz.MyBiztBiz.ProfileSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
  
    <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px; font-weight: bold">
        </div>
        <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000;">
            <table style="width: 450px; padding: 30px 15px;" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                        <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px;
                            padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                            <asp:Label ID="lblMessage" runat="server"></asp:Label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;">
                        <div style="float: right; width: 400px; vertical-align: top">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 140px; vertical-align: top">نوع عضویت :</span>
                            <asp:RadioButtonList ID="rdbListUserTypes" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                                ForeColor="Gray" Font-Bold="true" CssClass="defaultP">
                                <asp:ListItem Text="فروشنده" Value="1"></asp:ListItem>
                                <asp:ListItem Text="خریدار" Value="2"></asp:ListItem>
                                <asp:ListItem Text="هردو" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                        <div style="float: right; width: 400px; vertical-align: top">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 140px; vertical-align: top">نام کاربری (ایمیل):</span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="TextBox_Uid_Email" runat="server" Enabled="false" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                        </div>
                        <div style="float: right; width: 400px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 140px">نام : </span>
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
                        <div style="float: right; width: 400px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 140px">نام خانوادگی : </span>
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
                        <div style="float: right; width: 450px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 140px">شهر : </span>
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
                        <div style="float: right; width: 400px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 140px">زمینه اصلی فعالیت: </span>
                            <div style="float: right; height: 26px; width: 180px; padding-top: 10px; padding-right: 5px;">
                                <div class="ddl-bg-normal">
                                    <asp:DropDownList ID="DropDownList_Indus" runat="server" CssClass="log-login-ddl-item">
                                    </asp:DropDownList>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                            </div>
                        </div>
                        <div style="float: right; width: 400px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 140px">شماره تلفن : </span>
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
                        <div style="float: right; width: 400px">
                            <span style="float: right; color: #0066cc; font: 12px tahoma; clear: both; padding: 10px 15px;
                                font-weight: bold; width: 140px">شماره همراه : </span>
                            <div class="input-bg-normal">
                                <asp:TextBox ID="TextBox_Mobile" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                            </div>
                            <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                *</div>
                        </div>
                        <div style="float: right; width: 400px;">
                            <div style="float: right; width: 180px;">
                                &nbsp;
                            </div>
                            <div style="float: right; width: 170px;">
                                <asp:Button SkinID="btnNormal" runat="server" ID="BtnConfirm" OnClick="BtnConfirm_Click"
                                    ValidationGroup="register" Text="ثبت اطلاعات" />
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right">
            <img alt="" height="22" src="../images/cp-frame2-down.jpg" width="611" />
        </div>
    </div>
</asp:Content>
