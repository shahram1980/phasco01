<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="QuestionsBank.aspx.cs" Inherits="PHASCO_WEB.QuestionsBank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:MultiView ID="muvQuestionsBank" runat="server">
        <asp:View ID="vwQuestionsBank" runat="server">
            <table style="width: 100%; padding: 10px; text-align: right;">
                <tr>
                    <td style="padding: 15px; font: bold tahoma 12px;">
                        <h3>بانک سوالات</h3>
                        <hr />
                        علوم آزمایشگاهی و میکروبیولوژی
                    </td>
                </tr>
                <tr>
                    <td style="padding: 15px; font: normal tahoma 11px;">
                        <asp:Repeater ID="repLessons" runat="server">
                            <ItemTemplate>
                                <div style="float: right; width: 200px; padding: 10px; margin: 2px; border: 1px dotted #c9c9c9; height: 60px; direction: rtl;">
                                    <a href='QuestionsBank.aspx?mode=QuestionsList&LessonID=<%#Eval("LessonID")%>'>
                                        <%#Eval("LessonName")%>
                                    </a>
                                    <br />
                                    مقطع:
                                    <%#Eval("DegreeName")%>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>

            <div class="shop-widget">
                <h4>نمونه ای از سوالات</h4>
                <ul class="widget-item faq article">
                    <asp:Repeater ID="repQuestions" runat="server">
                        <ItemTemplate>
                            <li>

                                <h6 class="text-right">
                                    <i class="fa fa-question-circle-o pull-right"></i>
                                    <asp:Literal ID="ltrQuestions" runat="server" Text='<%#Eval("QuestionBody")%>'></asp:Literal>
                                </h6>

                                <p>
                                    <i class="fa fa-book"></i>
                                    <i class="pull-right"><%#Eval("LessonName")%>  </i>
                                    <i class="seprator margin-left-5 margin-right-5 ">| </i>
                                    <i class="fa fa-reply"></i>
                                    <i class="pull-right"><%#Eval("DegreeName")%></i>
                                </p>

                                <span class="button-wrapper">
                                    <a class="read-more" href='QuestionsBank.aspx?mode=QuestionsDetails&QuestionID=<%#Eval("QuestionID")%>'><i class="fa fa-arrow-left"></i>مشاهده</a>
                                </span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </asp:View>
        <asp:View ID="vwQuestionsList" runat="server">

            <div class="shop-widget">
                <h4>نمونه ای از سوالات</h4>
                <ul class="widget-item faq article">
                    <asp:Repeater ID="repQuestionsList" runat="server">
                        <ItemTemplate>
                            <li>
                                  <a href='QuestionsBank.aspx?mode=QuestionsDetails&QuestionID=<%#Eval("QuestionID")%>'>

                                    <h6 class="text-right">
                                       <%#Eval("QuestionBody")%>
                                    </h6>
                                </a>

                                <p>
                                    <i class="fa fa-book"></i>
                                    <i class="pull-right"><%#Eval("LessonName")%>  </i>
                                    <i class="seprator margin-left-5 margin-right-5 ">| </i>
                                    <i class="fa fa-reply"></i>
                                    <i class="pull-right"><%#Eval("DegreeName")%></i>
                                </p>

                                <span class="button-wrapper">
                                    <a class="read-more" href='QuestionsBank.aspx?mode=QuestionsDetails&QuestionID=<%#Eval("QuestionID")%>'><i class="fa fa-arrow-left"></i>مشاهده</a>
                                </span>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </asp:View>
        <asp:View ID="vwQuestionDetails" runat="server">
            <table class="table table-responsive no-border">
                <tr>
                    <td style="padding: 15px; font: bold tahoma 12px;"></td>
                </tr>
                <tr>
                    <td style="padding: 15px; font: normal tahoma 11px; direction: rtl;">

                        <asp:Repeater ID="RepQuestionDetails" runat="server">
                            <ItemTemplate>
                                <asp:Panel runat="server" ID="panel_Qu" GroupingText='<%#Eval("LessonName")%>'>
                                    <div>
                                        <i class="fa fa-book"></i>
                                        <b>درس:<%#Eval("LessonName")%>| مقطع:<%#Eval("DegreeName")%></b><br />
                                        <br />
                                        <br />

                                        <b>
                                            <i class="fa fa-question"></i>

                                            <asp:Literal ID="ltrQuestions" runat="server" Text='<%#Eval("QuestionBody")%>'></asp:Literal></b>
                                        <br />
                                        <br />

                                        <asp:Repeater ID="repQuestionAnswer" runat="server" DataSource='<%#GetAnswerQuestion(Eval("QuestionID").ToString())%>'>

                                            <ItemTemplate>
                                                <%#Eval("SwitchNumber")%>
                                            )
                                            <asp:Literal ID="ltrQuestionsAnswer" runat="server" Text='<%#Eval("SwitchBody")%>'></asp:Literal>
                                                <br />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
