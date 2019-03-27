<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Phasco_UserOnline.Master"
    AutoEventWireup="true" CodeBehind="MyQuiz.aspx.cs" Inherits="PHASCO_WEB.Quiz.MyQuiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Plc" runat="server">
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView_MyQuiz" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered rtl-text">
                    <Columns>
                        <asp:BoundField HeaderText="عنوان آزمون" DataField="QuizTitle" />
                        <asp:BoundField HeaderText="درصد میانگین" DataField="QuizScore" />
                        <asp:TemplateField HeaderText="تاريخ">
                            <ItemTemplate>
                                <asp:Label ID="Label_Date" runat="server" Text='<%#get_farsi_date(Eval("CreationDate")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="مقطع تحصیلی" DataField="DegreeName" />
                        <asp:BoundField HeaderText="رشته" DataField="FieldName" />
                        <asp:TemplateField HeaderText="مشاهده">
                            <ItemTemplate>
                                <a href="MyQuiz.aspx?status=workbook&QuizID=<%#Eval("id") %>">کارنامه</a> &nbsp;&nbsp|
                                <%#Set_ViewPasokhname(Eval("QuizTitle"), Eval("id"))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <table class="table table-responsive table-bordered table-striped rtl-text">
                    <tr>
                        <td>تعداد کل سوالات
                        </td>
                        <td>
                            <asp:Label ID="Label_all" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>تعداد پاسخ های صحیح
                        </td>
                        <td>
                            <asp:Label ID="Label_True" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>تعداد پاسخ های غلط
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
                <table>
                </table>
                <table class="table table-bordered table-responsive table-striped rtl-text">
                    <thead>
                        <tr>
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
                        </tr>
                    </thead>
                    <asp:Repeater ID="Repeater_results" runat="server">
                        <ItemTemplate>
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
                                <td style="text-align: center; width: 16%;">
                                    <asp:Label ID="Label_Grade" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </ItemTemplate>

                    </asp:Repeater>
                </table>

                <asp:HyperLink ID="HyperLink_return" runat="server" CssClass="btn btn-primary" NavigateUrl="~/Quiz/MyQuiz.aspx">بازگشت</asp:HyperLink>

            </asp:View>
            <asp:View ID="View3" runat="server">
                <div >
                    <table class="table  rtl-text">
                        <tr>
                            <td>عنوان آزمون
                            </td>
                            <td>
                                <asp:Label ID="Label_QuizTitle" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <hr />
                    <asp:HiddenField ID="HiddenField_RowNumber" runat="server" Value="0" />
                    <asp:Repeater ID="Repeater_Lessons" runat="server">
                        <ItemTemplate>
                            <table class="rtl-text table table-responsive">
                                <tr>
                                    <td style="width: 10%; direction: rtl; vertical-align: top;">درس
                                    </td>
                                    <td style="width: 18%; direction: rtl;">
                                        <%#Eval("LessonName")%>
                                    </td>
                                    <td style="width: 18%; direction: rtl;">از سوال
                                    </td>
                                    <td style="width: 18%; direction: rtl;">
                                        <asp:Label ID="Label_StartIndex" runat="server" Text='<%#Eval("StartIndex") %>'></asp:Label>
                                    </td>
                                    <td style="width: 18%; direction: rtl;">تا سوال
                                    </td>
                                    <td style="width: 18%; direction: rtl;">
                                        <asp:Label ID="Label_EndIndex" runat="server" Text='<%#Eval("EndIndex") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <table class="table table-responsive rtl-text">
                                <tr>
                                    <td>
                                        <asp:Repeater ID="Repeater_questions" runat="server">
                                            <ItemTemplate>
                                                <table dir="rtl" style="width: 100%; direction: rtl;">
                                                    <tr>
                                                        <td style="width: 10%; direction: rtl; vertical-align: top;">
                                                            <%#GetRowNumber()%>
                                                        </td>
                                                        <td style="width: 90%; direction: rtl;">
                                                            <%#Eval("QuestionBody")%>
                                                            <asp:HiddenField ID="HiddenField_QuestionID" runat="server" Value='<%#Eval("id") %>' />
                                                            <br />
                                                            <br />
                                                            <asp:Label ID="Label_answer1" runat="server" Text=""></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label_answer2" runat="server" Text=""></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label_answer3" runat="server" Text=""></asp:Label>
                                                            <br />
                                                            <asp:Label ID="Label_answer4" runat="server" Text=""></asp:Label>
                                                            <br />
                                                            <table class="table">
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right; direction: rtl;">گزینه صحیح
                                                                    </td>
                                                                    <td style="width: 200px; text-align: right; direction: rtl;">
                                                                        <asp:Label ID="Label_CorrectSwitch" runat="server" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right; direction: rtl;">پاسخ کاربر
                                                                    </td>
                                                                    <td style="width: 200px; text-align: right; direction: rtl;">
                                                                        <asp:Label ID="Label_UserSwitch" runat="server" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right; direction: rtl;">پاسخ تشریحی
                                                                    </td>
                                                                    <td style="width: 200px; text-align: right; direction: rtl;">
                                                                        <asp:Label ID="Label_QuestionAnatomicalResponse" runat="server" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            
                                        </asp:Repeater>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        
                    </asp:Repeater>
                </div>
                <div style="width: 100%; text-align: center; padding: 20px 0 20px 0;">
                    <asp:HyperLink ID="HyperLink_return2" runat="server" CssClass="btn btn-primary" NavigateUrl="~/Quiz/MyQuiz.aspx">بازگشت</asp:HyperLink>
                  
                </div>
             
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
