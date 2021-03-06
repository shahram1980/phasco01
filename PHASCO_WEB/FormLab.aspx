<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="FormLab.aspx.cs" Inherits="PHASCO_WEB.FormLab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View2" runat="server">
            <table border="0" style="width: 100%">
                <tr>
                    <td>درج مشخصات آزمايشگاه
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table class="table table-sm no-border form-group" border="0" dir="rtl" style="width: 100%">
                            <tr>
                                <td style="height: 49px">
                                    <asp:UpdatePanel ID="UpdatePanel14" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <table border="0" style="width: 100%">
                                                <tr>
                                                    <td align="right" colspan="2">استان:
                                                        <asp:DropDownList ID="Drop_Dataentry" runat="server" AutoPostBack="True" class="form-control" OnSelectedIndexChanged="Drop_Dataentry_SelectedIndexChanged">
                                                            <asp:ListItem Value="0">انتخاب استان</asp:ListItem>
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
                                                        <asp:DropDownList ID="Drop_state" runat="server" AutoPostBack="True" class="form-control" OnSelectedIndexChanged="Drop_down_ChangeList">
                                                        </asp:DropDownList>
                                                        منطقه:
                                                        <asp:DropDownList ID="DropDownList_Region_newINsert" runat="server" Enabled="False"
                                                            Font-Names="Tahoma" Font-Overline="False" class="form-control">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Label ID="Lbl_success" runat="server" ForeColor="Blue" Visible="False"></asp:Label>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel14">
                                        <ProgressTemplate>
                                            در حال بارگزاری
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                        <table border="0" style="width: 100%">
                                            <tr>
                                                <td align="right" style="height: 22px" width="80">&#1606;&#1575;&#1605; &#1570;&#1586;&#1605;&#1575;&#1610;&#1588;&#1711;&#1575;&#1607;
                                                </td>
                                                <td align="right" style="height: 22px">
                                                    <asp:TextBox ID="txt_name" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 22px"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="80">&#1570;&#1583;&#1585;&#1587;
                                                </td>
                                                <td align="right">
                                                    <asp:TextBox ID="txt_Address" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td><td align="right" style="height: 22px"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="80">&#1605;&#1587;&#1574;&#1608;&#1604; &#1601;&#1606;&#1740; &#1570;&#1586;&#1605;&#1575;&#1610;&#1588;&#1711;&#1575;&#1607;
                                                </td>
                                                <td align="right">
                                                    <asp:TextBox ID="txt_manager" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                                <td align="right"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="80">&#1582;&#1583;&#1605;&#1575;&#1578;
                                                </td>
                                                <td align="right">
                                                    <asp:TextBox ID="Txt_foods" runat="server" CssClass="form-control"
                                                        Height="50px" TextMode="MultiLine" Width="200px"></asp:TextBox>
                                                </td>
                                                <td align="right" dir="ltr"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="80">&#1587;&#1575;&#1593;&#1578; &#1705;&#1575;&#1585;
                                                </td>
                                                <td align="right">
                                                    <asp:TextBox ID="txt_Time" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                                <td align="right" dir="ltr"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="80">&#1578;&#1604;&#1601;&#1606;
                                                </td>
                                                <td align="right">
                                                    <asp:TextBox ID="Txt_tel" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                                <td align="right" dir="ltr"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="80">&#1575;&#1610;&#1605;&#1610;&#1604;
                                                </td>
                                                <td align="right">
                                                    <asp:TextBox ID="txt_email" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                                <td align="right" colspan="1">
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email"
                                                        Display="Dynamic" ErrorMessage="ايميل نامعتیر است" ForeColor="DarkRed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 15px" width="80">&#1608;&#1576; &#1587;&#1575;&#1610;&#1578;
                                                </td>
                                                <td align="right" style="height: 15px">
                                                    <asp:TextBox ID="TXT_website" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                                <td align="right" colspan="1" style="height: 15px"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="80">تصوير
                                                </td>
                                                <td align="right">
                                                    <asp:FileUpload ID="File_Image" runat="server" />
                                                </td>
                                                <td align="right"></td>
                                            </tr>
                                            <tr>
                                                <td align="right" width="80"></td>
                                                <td align="right">حداکثر عرض 400px
                                                </td>
                                                <td align="right"></td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Font-Names="Tahoma" OnClick="Button1_Click"
                                        Text="ثبت شود" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
