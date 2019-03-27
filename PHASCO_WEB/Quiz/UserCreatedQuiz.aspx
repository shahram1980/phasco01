<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Phasco_UserOnline.Master"
    AutoEventWireup="true" CodeBehind="UserCreatedQuiz.aspx.cs" Inherits="PHASCO_WEB.Quiz.UserCreatedQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    

    <script type="text/javascript">
        var running = [];  // create an array for assoc array use
        // This function will check whether the event for the 'data'
        // has already been initiated. If it has, ignore it; otherwise,
        // run the timer().
        function runTimer(data) {
            if (!running[data]) {  // not running yet, go for it
                running[data] = 1;  // arbitrary value
                timer(data);

            }
        }
        // real count down (both read & write)
        function timer(data) {
            dat = document.getElementById(data);
            if (dat) {
                var time = (dat.innerHTML).toString().split(":");
                var done = false;
                if (time.length != 3) {  // incorrect time format
                    done = true;
                    alert('null');
                }
                else {
                    // convert string to integer
                    time[0] = parseInt(time[0], 10)
                    time[1] = parseInt(time[1], 10)
                    time[2] = parseInt(time[2], 10)
                    // attempt to decrease the time
                    if (time[2] > 0) { time[2]--; }
                    else {
                        time[2] = 59;
                        if (time[1] > 0) { time[1]--; }
                        else {
                            time[1] = 59;
                            if (time[0] > 0) { time[0]--; }
                            else {
                                done = true;
                                running[data] = null;
                                //alert('test');
                                EndTimeAndRedirect();
                                //renderStack();
                            }
                        }
                    }
                }
                if (!done) {
                    var outTime = "" + ((time[0] < 10) ? "0" : "") + time[0]
                    outTime += ":" + ((time[1] < 10) ? "0" : "") + time[1]
                    outTime += ":" + ((time[2] < 10) ? "0" : "") + time[2]
                    dat.innerHTML = outTime
                    setTimeout("timer('" + data + "')", 1000);
                }
                else { dat.innerHTML = "00:00:00" }
            }
        }

        function EndTimeAndRedirect() {
            $('#<%=Button_submit.ClientID %>').attr('disabled', 'disabled');
            GetUserAnswer();
            $('.QuizrdbSwich').attr('disabled', 'disabled');
            CallServer($('#UserQuestionAnswer').val(), "");
        }

        function ReceiveServerData(retValue) {
            window.location = 'UserCreatedQuiz.aspx?QuizID=' + retValue + '&status=result';
        }

    </script>
    <script type="text/javascript">
        $(document).ready(function () {

        });

        function GetUserAnswer() {
            var questioncount = $('.question tr td').length;
            //alert($('.question tr td')[12].getElementsByTagName('span')[0].innerHTML); //.innerHTML);
            var QuestionUserAnswer = '';
            for (var i = 0; i < questioncount; i++) {
                if (i % 6 == 0) {
                    var questionID = $('.question tr td')[i].getElementsByTagName('span')[0].innerHTML;
                }
                if (i % 6 == 1) {
                    var answer = 0;
                    if ($('.question tr td')[i].getElementsByTagName('td')[0].getElementsByTagName('input')[0].checked)
                        answer = 1;
                    if ($('.question tr td')[i].getElementsByTagName('td')[1].getElementsByTagName('input')[0].checked)
                        answer = 2;
                    if ($('.question tr td')[i].getElementsByTagName('td')[2].getElementsByTagName('input')[0].checked)
                        answer = 3;
                    if ($('.question tr td')[i].getElementsByTagName('td')[3].getElementsByTagName('input')[0].checked)
                        answer = 4;
                }
                if (i % 6 == 5) {
                    QuestionUserAnswer += questionID + ':' + answer + ',';
                }
            }
            QuestionUserAnswer += '0:0';
            $('#UserQuestionAnswer').val(QuestionUserAnswer);
            //alert(QuestionUserAnswer);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Plc" runat="server">
    <input type="hidden" id="UserQuestionAnswer" />
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:Panel runat="server" ID="Panel_Quiz" DefaultButton="Button_submit">
                <div style="width: 800px;" id="DIV_Quiz">
                    <table class="table table-responsive  rtl-text">
                        <tr>
                            <td>شماره آزمون
                            </td>
                            <td>
                                <asp:Label ID="Label_QuizTitle" runat="server" Text=""></asp:Label>
                            </td>
                            <td align="left">زمان پاسخگویی
                            </td>
                            <td>
                                <i class="fa fa-clock-o"></i>
                                <div id="box1">
                                    <asp:Literal runat="server" ID="literal_Time" />
                                </div>

                            </td>
                        </tr>
                    </table>
                    
                    <asp:HiddenField ID="HiddenField_RowNumber" runat="server" Value="0" />
                    <asp:Repeater ID="Repeater_Lessons" runat="server">
                        <ItemTemplate>
                            <table class="table table-responsive  rtl-text">
                                <tr>
                                    <td style="width: 10%;  vertical-align: top;">درس
                                    </td>
                                    <td style="width: 18%; ">
                                        <%#Eval("LessonName")%>
                                    </td>
                                    <td style="width: 18%; ">از سوال
                                    </td>
                                    <td style="width: 18%; ">
                                        <asp:Label ID="Label_StartIndex" runat="server" Text='<%#Eval("StartIndex") %>'></asp:Label>
                                    </td>
                                    <td style="width: 18%;">تا سوال
                                    </td>
                                    <td style="width: 18%;">
                                        <asp:Label ID="Label_EndIndex" runat="server" Text='<%#Eval("EndIndex") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:Repeater ID="Repeater_questions" runat="server">
                                            <ItemTemplate>
                                                <table  class="table table-responsive rtl-text question">
                                                    <tr>
                                                        <td style="width: 10%; direction: rtl; vertical-align: top;">
                                                            <%#GetRowNumber()%>
                                                            <asp:Label ID="Label_QuestionID" runat="server" Text='<%#Eval("id") %>' CssClass="lblQuestion"></asp:Label>
                                                        </td>
                                                        <td style="width: 90%; direction: rtl;">
                                                            <%#Eval("QuestionBody")%>
                                                            <br />
                                                            <br />
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 100%; text-align: right; direction: rtl;">
                                                                        <asp:RadioButton ID="RadioButton_SwitchBody1" runat="server" Text="1" GroupName="switch"
                                                                            CssClass="QuizrdbSwich" />
                                                                        <asp:Label ID="lblSwitchBody1" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; text-align: right; direction: rtl;">
                                                                        <asp:RadioButton ID="RadioButton_SwitchBody2" runat="server" Text="2" GroupName="switch"
                                                                            CssClass="QuizrdbSwich" />
                                                                        <asp:Label ID="lblSwitchBody2" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; text-align: right; direction: rtl;">
                                                                        <asp:RadioButton ID="RadioButton_SwitchBody3" runat="server" Text="3" GroupName="switch"
                                                                            CssClass="QuizrdbSwich" />
                                                                        <asp:Label ID="lblSwitchBody3" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; text-align: right; direction: rtl;">
                                                                        <asp:RadioButton ID="RadioButton_SwitchBody4" runat="server" Text="4" GroupName="switch"
                                                                            CssClass="QuizrdbSwich" />
                                                                        <asp:Label ID="lblSwitchBody4" runat="server"></asp:Label>
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
                       
                    </asp:Repeater>
                </div>
                <div style="width: 100%; text-align: center; padding: 20px 0 20px 0;">
                    <asp:Button ID="Button_submit" runat="server" Text="ارسال پاسخ ها" CssClass="btn btn-primary" OnClick="Button_submit_Click" />

                </div>
            </asp:Panel>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="table table-responsive table-bordered table-striped rtl-text">
                <tr>
                    <td>کل سوالات
                    </td>
                    <td>
                        <asp:Label ID="Label_all" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>پاسخ های صحیح
                    </td>
                    <td>
                        <asp:Label ID="Label_True" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>پاسخ های غلط
                    </td>
                    <td>
                        <asp:Label ID="Label_False" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>میانگین درصد
                    </td>
                    <td>
                        <asp:Label ID="Label_average" runat="server" Text=""></asp:Label>
                        %
                    </td>
                </tr>
                <tr>
                    <td>امتیاز
                    </td>
                    <td>
                        <asp:Label ID="Label_Point" runat="server" Font-Bold="True" ForeColor="#993333"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="tabel_Resul_quiz">
            </table>
            <asp:Repeater ID="Repeater_results" runat="server">
                <ItemTemplate>
                    <table class="table table-bordered table-condensed table-responsive rtl-text">
                        <thead>
                            <th class="td_Resul_quiz">نام درس
                                </th>
                                <th class="td_Resul_quiz">ضریب درس
                                </th>
                                <th class="td_Resul_quiz">تعداد پاسخ های صحیح
                                </th>
                                <th class="td_Resul_quiz">تعداد پاسخ های غلط
                                </th>
                                <th class="td_Resul_quiz">تعداد کل سوالات
                                </th>
                                <th class="td_Resul_quiz">نمره درس
                                </th>
                        </thead>
                        <tr>
                            <td >
                                <%#Eval("LessonName")%>
                                <asp:HiddenField ID="HiddenField_StartIndex" runat="server" Value='<%#Eval("StartIndex") %>' />
                                <asp:HiddenField ID="HiddenField_EndIndex" runat="server" Value='<%#Eval("EndIndex") %>' />
                            </td>
                            <td >
                                <asp:Label ID="Label_LessonCoefficient" runat="server" Text='<%#Eval("LessonCoefficient") %>'></asp:Label>
                            </td>
                            <td >
                                <asp:Label ID="Label_True" runat="server" Text=""></asp:Label>
                            </td>
                            <td >
                                <asp:Label ID="Label_False" runat="server" Text=""></asp:Label>
                            </td>
                            <td >
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
