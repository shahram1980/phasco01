<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Phasco_UserOnline.Master"
    AutoEventWireup="true" CodeBehind="MakeQuiz.aspx.cs" Inherits="PHASCO_WEB.Quiz.MakeQuiz" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Plc" runat="server">
    <div>
        <table style="direction: rtl; width: 500px;">
            <tr>
                <td style="direction: rtl; width: 100px;">
                    شماره آزمون
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
                        Width="200px" AppendDataBoundItems="true" DataValueField="id" AutoPostBack="True"
                        OnSelectedIndexChanged="DropDownList_Degree_SelectedIndexChanged">
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
                    <td style="width: 160px;">
                        <asp:Label ID="Label_LessonName" runat="server" Text='<%#Eval("LessonName") %>'></asp:Label>
                    </td>
                    <td style="width: 65px;">
                        (<%#Eval("LessonCount")%>)<asp:HiddenField ID="HiddenField_LessonID" runat="server"
                            Value='<%#Eval("id") %>' />
                        <asp:HiddenField ID="HiddenField_TimeToAnswer" Value='<%#Eval("TimeToAnswer") %>'
                            runat="server" />
                    </td>
                    <td style="width: 270px;">
                        <asp:TextBox ID="TextBox_LessonCount" runat="server" Text="0" MaxLength="3" Width="70px"
                            CssClass="txt"></asp:TextBox>
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
    <br />
    <br />
    <table width="498px" border="0" style="direction: rtl;" cellpadding="0" cellspacing="0">
        <tr>
            <td width="230px" align="right" valign="middle" style="direction: rtl; background-color: #d3bf9f;">
                تعداد سوالات انتخابی شما
            </td>
            <td width="70px" align="right" valign="middle" style="background-color: #d3bf9f;">
                <div style="border: 1px solid #B3A48B; color: #666666; font-family: Tahoma; font-size: 12px;
                    margin: 3px 0; width: 66px; height: 20px; padding: 2px; text-align: right; background: url('../images/input-bg.gif') repeat-x scroll">
                    <span style="font-size: 24px; font-weight: bold; color: #CC0000;"><span id="sum">0</span></span>
                </div>
            </td>
            <td width="200px">
            </td>
        </tr>
    </table>
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
                    ImageUrl="~/images/Quiz_make.jpg" ToolTip="ایجاد آزمون" ValidationGroup="Insert" />
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(document).ready(function () {

            //iterate through each textboxes and add keyup
            //handler to trigger sum event
            $(".txt").each(function () {

                $(this).keyup(function () {
                    calculateSum();
                });
            });

        });

        function calculateSum() {

            var sum = 0;
            //iterate through each textboxes and add the values
            $(".txt").each(function () {

                //add only if the value is number
                if (!isNaN(this.value) && this.value.length != 0) {
                    sum += parseFloat(this.value);
                }

            });
            //.toFixed() method will roundoff the final sum to 2 decimal places
            $("#sum").html(sum.toFixed(0));
        }
    </script>
</asp:Content>
