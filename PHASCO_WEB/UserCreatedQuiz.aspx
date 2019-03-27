<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Phasco_UserOnline.Master"
    CodeBehind="UserCreatedQuiz.aspx.cs" Inherits="OnlineTest.user.UserCreatedQuiz" %>

<asp:Content ID="content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" language="javascript">

        function countdown() {
            //      s== document.getElementById('<%=Label_second.ClientID%>').innerHTML;
            try {
                seconds = document.getElementById('<%=Label_second.ClientID%>').innerHTML;

                if (seconds > 0) {
                    document.getElementById('<%=Label_second.ClientID%>').innerHTML = seconds - 1;
                    setTimeout("countdown()", 1000);
                }
                else {
                    minutes = document.getElementById('<%=Label_minute.ClientID%>').innerHTML;
                    if (minutes > 0) {
                        document.getElementById('<%=Label_second.ClientID%>').innerHTML = 60;
                        document.getElementById('<%=Label_minute.ClientID%>').innerHTML = minutes - 1;
                        setTimeout("countdown()", 0);
                    }
                    else {
                        hour = document.getElementById('<%=Label_hour.ClientID%>').innerHTML;
                        if (hour > 0) {

                            document.getElementById('<%=Label_minute.ClientID%>').innerHTML = 60;
                            hour = document.getElementById('<%=Label_hour.ClientID%>').innerHTML = hour - 1;
                            setTimeout("countdown()", 0);
                        }
                        else {

                            //toggleAlert();
                            // window.location = 'MyQuiz.aspx';
                            document.getElementById('<%=Button_submit.ClientID%>').click();

                        }
                    }
                }
            }
            catch (Er) {

            }
        }

        setTimeout("countdown()", 1000);
        ////////////////////////good sample to do this: http://www.tek-tips.com/viewthread.cfm?qid=1127331&page=1
        function toggleAlert() {

            toggleDisabled(document.getElementById("DIV_Quiz"));
        }
        function toggleDisabled(el) {
            try {
                el.disabled = el.disabled ? false : true;
            }
            catch (E) { }
            if (el.childNodes && el.childNodes.length > 0) {
                for (var x = 0; x < el.childNodes.length; x++) {
                    toggleDisabled(el.childNodes[x]);
                }
            }
        }
        function EnableDIV() {
            var _div = document.getElementById("DIV_Quiz");
            _div.disabled = true;
        }
 
    </script>
    <style type="text/css">
        .td_Resul_quiz
        {
            background: maroon;
            color: #ffffff;
            width: 16%;
            direction: rtl;
            vertical-align: top;
            text-align: center;
        }
        .td_Resul2_quiz
        {
            text-align: center;
            width: 16%;
            direction: rtl;
            vertical-align: top;
            border: 1px solid #cfbc9c;
        }
        .tabel_Resul_quiz
        {
            border: 1px solid #cfbc9c;
            width: 100%;
            direction: rtl;
        }
        
        .tabel_Resul2_quiz
        {
            border: 1px solid #cfbc9c;
            width: 250px;
            direction: rtl;
            float: right;
        }
        
        .td_BOxPointright_quiz
        {
            text-align: center;
            width: 150px;
            direction: rtl;
            vertical-align: top;
            border: 1px solid #cfbc9c;
        }
        .td_BOxPointleft_quiz
        {
            text-align: center;
            width: 100px;
            direction: ltr;
            vertical-align: top;
            border: 1px solid #cfbc9c;
        }
    </style>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="Plc" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:Panel runat="server" ID="Panel_Quiz" DefaultButton="Button_submit">
                <div style="width: 800px;" id="DIV_Quiz">
                    <table style="width: 100%; direction: rtl; color: Blue;">
                        <tr>
                            <td valign="middle">
                                شماره آزمون
                            </td>
                            <td valign="middle">
                                <asp:Label ID="Label_QuizTitle" runat="server" Text=""></asp:Label>
                            </td>
                            <td valign="middle">
                                زمان پاسخگویی به سوالات آزاد
                            </td>
                            <td valign="middle">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Quiz_clock.jpg" />
                                <span id="Label_second" runat="server"></span>&nbsp;:&nbsp; <span id="Label_minute"
                                    runat="server"></span>&nbsp;:&nbsp; <span id="Label_hour" runat="server"></span>
                            </td>
                        </tr>
                    </table>
                    <hr style="color: Navy;" />
                    <asp:HiddenField ID="HiddenField_RowNumber" runat="server" Value="0" />
                    <asp:Repeater ID="Repeater_Lessons" runat="server">
                        <ItemTemplate>
                            <table dir="rtl" style="width: 100%; direction: rtl; color: Navy;">
                                <tr>
                                    <td style="width: 10%; direction: rtl; vertical-align: top;">
                                        درس
                                    </td>
                                    <td style="width: 18%; direction: rtl;">
                                        <%#Eval("LessonName")%>
                                    </td>
                                    <td style="width: 18%; direction: rtl;">
                                        از سوال
                                    </td>
                                    <td style="width: 18%; direction: rtl;">
                                        <asp:Label ID="Label_StartIndex" runat="server" Text='<%#Eval("StartIndex") %>'></asp:Label>
                                    </td>
                                    <td style="width: 18%; direction: rtl;">
                                        تا سوال
                                    </td>
                                    <td style="width: 18%; direction: rtl;">
                                        <asp:Label ID="Label_EndIndex" runat="server" Text='<%#Eval("EndIndex") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:Repeater ID="Repeater_questions" runat="server">
                                            <ItemTemplate>
                                                <table dir="rtl" style="width: 100%; direction: rtl; border: 1px solid #cfbc9c">
                                                    <tr>
                                                        <td style="width: 5%; direction: rtl; vertical-align: top;">
                                                            <b>
                                                                <%#GetRowNumber()%>.</b>
                                                        </td>
                                                        <td style="width: 95%; direction: rtl;">
                                                            <%#Eval("QuestionBody")%>
                                                            <asp:Label ID="Label_QuestionID" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                                            <br />
                                                            <br />
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 100%; text-align: right; direction: rtl;">
                                                                        <asp:RadioButton ID="RadioButton_SwitchBody1" runat="server" Text="1" GroupName="switch" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; text-align: right; direction: rtl;">
                                                                        <asp:RadioButton ID="RadioButton_SwitchBody2" runat="server" Text="2" GroupName="switch" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; text-align: right; direction: rtl;">
                                                                        <asp:RadioButton ID="RadioButton_SwitchBody3" runat="server" Text="3" GroupName="switch" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; text-align: right; direction: rtl;">
                                                                        <asp:RadioButton ID="RadioButton_SwitchBody4" runat="server" Text="4" GroupName="switch" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <SeparatorTemplate>
                                                <hr />
                                            </SeparatorTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <SeparatorTemplate>
                            <div style="width: 100%; background-color: Maroon; height: 3px;">
                            </div>
                        </SeparatorTemplate>
                    </asp:Repeater>
                </div>
                <div style="width: 100%; text-align: center; padding: 20 0 20 0;">
                    <asp:Button ID="Button_submit" runat="server" Text="ارسال پاسخ ها" OnClick="Button_submit_Click"   />
                    <br />
                    <br />
                </div>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="tabel_Resul2_quiz">
                <tr>
                    <td class="td_BOxPointright_quiz">
                        تعداد کل سوالات
                    </td>
                    <td class="td_BOxPointleft_quiz">
                        <asp:Label ID="Label_all" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_BOxPointright_quiz">
                        تعداد پاسخ های صحیح
                    </td>
                    <td class="td_BOxPointleft_quiz">
                        <asp:Label ID="Label_True" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_BOxPointright_quiz">
                        تعداد پاسخ های غلط
                    </td>
                    <td class="td_BOxPointleft_quiz">
                        <asp:Label ID="Label_False" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_BOxPointright_quiz">
                        میانگین درصد
                    </td>
                    <td class="td_BOxPointleft_quiz">
                        <asp:Label ID="Label_average" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="td_BOxPointright_quiz">
                        امتیاز
                    </td>
                    <td class="td_BOxPointleft_quiz">
                        <asp:Label ID="Label_Point" runat="server" Font-Bold="True" ForeColor="#993333"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="tabel_Resul_quiz">
                <tr>
                    <td class="td_Resul_quiz">
                        نام درس
                    </td>
                    <td class="td_Resul_quiz">
                        ضریب درس
                    </td>
                    <td class="td_Resul_quiz">
                        تعداد پاسخ های صحیح
                    </td>
                    <td class="td_Resul_quiz">
                        تعداد پاسخ های غلط
                    </td>
                    <td class="td_Resul_quiz">
                        تعداد کل سوالات
                    </td>
                    <td class="td_Resul_quiz">
                        نمره درس
                    </td>
                </tr>
            </table>
            <asp:Repeater ID="Repeater_results" runat="server">
                <ItemTemplate>
                    <table class="tabel_Resul_quiz">
                        <tr>
                            <td class="td_Resul2_quiz">
                                <%#Eval("LessonName")%>
                                <asp:HiddenField ID="HiddenField_StartIndex" runat="server" Value='<%#Eval("StartIndex") %>' />
                                <asp:HiddenField ID="HiddenField_EndIndex" runat="server" Value='<%#Eval("EndIndex") %>' />
                            </td>
                            <td class="td_Resul2_quiz">
                                <asp:Label ID="Label_LessonCoefficient" runat="server" Text='<%#Eval("LessonCoefficient") %>'></asp:Label>
                            </td>
                            <td class="td_Resul2_quiz">
                                <asp:Label ID="Label_True" runat="server" Text=""></asp:Label>
                            </td>
                            <td class="td_Resul2_quiz">
                                <asp:Label ID="Label_False" runat="server" Text=""></asp:Label>
                            </td>
                            <td class="td_Resul2_quiz">
                                <asp:Label ID="Label_all" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="text-align: center; width: 16%; direction: ltr; vertical-align: top; border: 1px solid #cfbc9c;">
                                <asp:Label ID="Label_Grade" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SeparatorTemplate>
                    <div style="width: 100%; background-color: Maroon; height: 3px;">
                    </div>
                </SeparatorTemplate>
            </asp:Repeater>
            <br />
            <br />
            <asp:HyperLink ID="HyperLink_answers" runat="server" Enabled="False" Visible="False">مشاهده پاسخنامه</asp:HyperLink>
        </asp:View>
    </asp:MultiView>
</asp:Content>
