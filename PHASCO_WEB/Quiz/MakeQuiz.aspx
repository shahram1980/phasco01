<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Master_Phasco.Master"
    AutoEventWireup="true" CodeBehind="MakeQuiz.aspx.cs" Inherits="PHASCO_WEB.Quiz.MakeQuiz" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:Panel ID="pnlQuiz" runat="server" DefaultButton="ImageButton_MakeQuiz">

        <div class="alert alert-warning" id="Alarm_Div" style="direction:rtl;" runat="server">
            <asp:Label ID="Label_Alarm" runat="server"
                Text="کاربر گرامی برای استفاده از این  بخش لازم است ابتدا لاگین کنید!"></asp:Label>
        </div>
        <h3>آزمون اختیاری</h3>
        <div class="text-right">
            <div class="row">
                <div class="form-group col-md-push-6 col-md-6">
                    <label>شماره آزمون</label>
                    <asp:TextBox ID="TextBox_QuizTitle" runat="server" CssClass="form-control input-group-lg" placeholder="شماره آزمون"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="TextBox_QuizTitle" Display="Dynamic"
                        ErrorMessage="RequiredFieldValidator" Text="عنوان آزمون را مشخص کنید"
                        ValidationGroup="Insert"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-push-6 col-md-6">
                    <label>مقطع تحصیلی</label>
                    <asp:DropDownList ID="DropDownList_Degree" runat="server" DataTextField="DegreeName"
                        AppendDataBoundItems="true" DataValueField="id" AutoPostBack="True" CssClass="form-control"
                        OnSelectedIndexChanged="DropDownList_Degree_SelectedIndexChanged">
                        <asp:ListItem Text="--انتخاب کنید--"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList_Degree"
                        Text="مقطع تحصیلی را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" InitialValue="--انتخاب کنید--"
                        ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-push-6 col-md-6">
                    <label>گروه تحصیلی</label>
                    <asp:DropDownList ID="DropDownList_group" runat="server" DataTextField="GroupName"
                        AutoPostBack="true" AppendDataBoundItems="true" DataValueField="id" CssClass="form-control"
                        OnSelectedIndexChanged="DropDownList_group_SelectedIndexChanged">
                        <asp:ListItem Text="--انتخاب کنید--"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList_group"
                        Text="گروه را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" InitialValue="--انتخاب کنید--"
                        ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-push-6 col-md-6">
                    <label>رشته تحصیلی</label>
                    <asp:DropDownList ID="DropDownList_Fields" runat="server" DataTextField="FieldName"
                        AutoPostBack="true" DataValueField="id" OnSelectedIndexChanged="DropDownList_Fields_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList_Fields"
                        Text="رشته را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div>

            <br />
        </div>
        <div class="col-md-6 col-md-push-6">
            <table class="table table-bordered table-hover rtl-text">
                <asp:Repeater ID="Repeater_lessons" runat="server" OnItemCommand="Repeater_lessons_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:Label ID="Label_LessonName" runat="server" Text='<%#Eval("LessonName") %>'></asp:Label>
                            </td>
                            <td>(<%#Eval("LessonCount")%>)<asp:HiddenField ID="HiddenField_LessonID" runat="server"
                                Value='<%#Eval("id") %>' />
                                <asp:HiddenField ID="HiddenField_TimeToAnswer" Value='<%#Eval("TimeToAnswer") %>'
                                    runat="server" />
                            </td>
                            <td>
                                <div class="form-group">
                                    <asp:TextBox ID="TextBox_LessonCount" runat="server" Text="0" MaxLength="3"
                                        CssClass="form-control txt"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="TextBox_LessonCount"
                                        Display="Dynamic" Text="*" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox_LessonCount"
                                        ValidationGroup="Insert" Display="Dynamic" Type="Integer" MinimumValue="0" MaximumValue='<%#Eval("LessonCount")%>'
                                        Text="اصلاح شود" ErrorMessage="RangeValidator"></asp:RangeValidator>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tfoot>
                    <tr>

                        <td colspan="2">تعداد سوالات انتخابی شما</td>
                        <td><span id="sum">0</span></td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <div class="row">
            <div class="form-group col-md-9 col-md-push-3 rtl-text text-right">
                <label>زمان پاسخگویی:</label>
                <asp:RadioButton ID="RadioButton_standard" runat="server" AutoPostBack="true"
                    Text="استاندارد" GroupName="TimeOptions" OnCheckedChanged="RadioButton_standard_CheckedChanged"></asp:RadioButton>
                <asp:RadioButton ID="RadioButton_Infinite" runat="server" Text="نامحدود" AutoPostBack="true"
                    GroupName="TimeOptions" OnCheckedChanged="RadioButton_Infinite_CheckedChanged"></asp:RadioButton>
                <asp:RadioButton ID="RadioButton_Arbitrary" Checked="true" runat="server" Text="دلخواه" AutoPostBack="true"
                    GroupName="TimeOptions" OnCheckedChanged="RadioButton_Arbitrary_CheckedChanged"></asp:RadioButton>

            </div>
            <div id="Td_TimeToAnswer" style="margin-top:35px;" class="form-group  col-md-3 rtl-text text-right" runat="server">
                <label>دقیقه</label>
                <asp:TextBox ID="TextBox_TimeToAnswer" CssClass="form-control" runat="server" MaxLength="3" Text="5"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox_TimeToAnswer"
                    Text="*" Display="Dynamic" ValidationGroup="Insert" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:RangeValidator ID="RangeValidator2" runat="server" Text="حداقل یک دقیقه" ErrorMessage="RangeValidator"
                    ValidationGroup="Insert" Display="Dynamic" Type="Integer" ControlToValidate="TextBox_TimeToAnswer"
                    MinimumValue="1" MaximumValue="1000"></asp:RangeValidator>

            </div>
            <asp:Button ID="ImageButton_MakeQuiz" runat="server" OnClick="Button_MakeQuiz_Click" ValidationGroup="Insert" Text="ثبت و ایجاد آزمون" CssClass="btn btn-primary" />
          
        </div>

    </asp:Panel>
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
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="head_Meta">
</asp:Content>
