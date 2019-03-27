<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Site_user.Master"
    CodeBehind="MakeQuiz.aspx.cs" Inherits="OnlineTest.user.MakeQuiz" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="Plc" runat="server">
    <div>
        <table style="direction: rtl; width: 500px;">
            <tr>
                <td style="direction: rtl; width: 100px;">
                    عنوان آزمون
                </td>
                <td style="direction: rtl; width: 200px;">
                    <asp:TextBox ID="TextBox_QuizTitle" runat="server" MaxLength="99" Width="200px"></asp:TextBox>
                </td>
                <td style="direction: rtl; width: 200px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_QuizTitle"
                        Text="عنوان آزمون را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="direction: rtl; width: 100px;">
                    مقطع تحصیلی
                </td>
                <td style="direction: rtl; width: 200px;">
                    <asp:DropDownList ID="DropDownList_Degree" runat="server" DataTextField="DegreeName"
                        Width="200px" AppendDataBoundItems="true" DataValueField="id">
                        <asp:ListItem Text="--انتخاب کنید--"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="direction: rtl; width: 200px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList_Degree"
                        Text="مقطع تحصیلی را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" InitialValue="--انتخاب کنید--"
                        ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="direction: rtl; width: 100px;">
                    گروه تحصیلی
                </td>
                <td style="direction: rtl; width: 200px;">
                    <asp:DropDownList ID="DropDownList_group" runat="server" DataTextField="GroupName"
                        AutoPostBack="true" AppendDataBoundItems="true" DataValueField="id" Width="200px"
                        OnSelectedIndexChanged="DropDownList_group_SelectedIndexChanged">
                        <asp:ListItem Text="--انتخاب کنید--"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="direction: rtl; width: 200px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList_group"
                        Text="گروه را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" InitialValue="--انتخاب کنید--"
                        ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="direction: rtl; width: 100px;">
                    رشته تحصیلی
                </td>
                <td style="direction: rtl; width: 200px;">
                    <asp:DropDownList ID="DropDownList_Fields" runat="server" DataTextField="FieldName"
                        AutoPostBack="true" DataValueField="id" Width="200px" OnSelectedIndexChanged="DropDownList_Fields_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td style="direction: rtl; width: 200px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList_Fields"
                        Text="رشته را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <asp:Repeater ID="Repeater_lessons" runat="server" OnItemCommand="Repeater_lessons_ItemCommand">
        <ItemTemplate>
            <table dir="rtl" style="width: 500px;">
                <tr>
                    <td style="width: 150px;">
                        <asp:Label ID="Label_LessonName" runat="server" Text='<%#Eval("LessonName") %>'></asp:Label>
                        &nbsp;&nbsp; (&nbsp;<%#Eval("LessonCount")%>&nbsp;)<asp:HiddenField ID="HiddenField_LessonID"
                            runat="server" Value='<%#Eval("id") %>' />
                        <asp:HiddenField ID="HiddenField_TimeToAnswer" Value='<%#Eval("TimeToAnswer") %>'
                            runat="server" />
                    </td>
                    <td style="width: 350px;">
                        <asp:TextBox ID="TextBox_LessonCount" runat="server" Text="0" MaxLength="3" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBox_LessonCount"
                            Display="Dynamic" Text="*" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox_LessonCount"
                            ValidationGroup="Insert" Display="Dynamic" Type="Integer" MinimumValue="0" MaximumValue='<%#Eval("LessonCount")%>'
                            Text="اصلاح شود" ErrorMessage="RangeValidator"></asp:RangeValidator>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:Repeater>
    <hr />
    <table dir="rtl">
        <tr>
            <td>
                زمان پاسخگویی
                <br />
                <br />
                <table>
                    <tr>
                        <td style="width: 100px;">
                            <asp:RadioButton ID="RadioButton_standard" runat="server" Checked="true" AutoPostBack="true"
                                Text="استاندارد" GroupName="TimeOptions" OnCheckedChanged="RadioButton_standard_CheckedChanged">
                            </asp:RadioButton>
                        </td>
                        <td style="width: 100px;">
                            <asp:RadioButton ID="RadioButton_Infinite" runat="server" Text="نامحدود" AutoPostBack="true"
                                GroupName="TimeOptions" OnCheckedChanged="RadioButton_Infinite_CheckedChanged">
                            </asp:RadioButton>
                        </td>
                        <td style="width: 100px;">
                            <asp:RadioButton ID="RadioButton_Arbitrary" runat="server" Text="دلخواه" AutoPostBack="true"
                                GroupName="TimeOptions" OnCheckedChanged="RadioButton_Arbitrary_CheckedChanged">
                            </asp:RadioButton>
                        </td>
                        <td id="Td_TimeToAnswer" runat="server" visible="false">
                            <asp:TextBox ID="TextBox_TimeToAnswer" runat="server" Width="60px" MaxLength="3"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox_TimeToAnswer"
                                Text="*" Display="Dynamic" ValidationGroup="Insert" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" Text="حداقل یک دقیقه" ErrorMessage="RangeValidator"
                                ValidationGroup="Insert" Display="Dynamic" Type="Integer" ControlToValidate="TextBox_TimeToAnswer"
                                MinimumValue="1" MaximumValue="1000"></asp:RangeValidator>
                            &nbsp; دقیقه
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 100px;">
            </td>
            <td>
                <asp:ImageButton ID="ImageButton_MakeQuiz" runat="server" OnClick="Button_MakeQuiz_Click"
                    ImageUrl="~/Images2/1066.png" Width="58" Height="70" ToolTip="ایجاد آزمون" ValidationGroup="Insert" />
            </td>
        </tr>
    </table>
</asp:Content>
