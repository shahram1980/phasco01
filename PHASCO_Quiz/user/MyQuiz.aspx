<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyQuiz.aspx.cs" MasterPageFile="~/Template/Site_user.Master"
    Inherits="OnlineTest.user.MyQuiz" %>

<asp:Content ID="content1" ContentPlaceHolderID="head_Meta" runat="server">
    <style type="text/css">
        .grd
        {
            width: 100%;
            direction: rtl;
        }
    </style>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="Plc" runat="server">
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:GridView ID="GridView_MyQuiz" runat="server" AutoGenerateColumns="False" CssClass="grd"
                    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px"
                    CellPadding="4">
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
                                &nbsp;&nbsp <a href="MyQuiz.aspx?status=answers&QuizID=<%#Eval("id") %>">دفترچه پاسخ</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="width: 800px;">
                    <table style="width: 250px; direction: rtl; text-align: right; color: Navy;">
                        <tr>
                            <td style="width: 150px;">
                                تعداد کل سوالات
                            </td>
                            <td style="width: 100px;">
                                <asp:Label ID="Label_all" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;">
                                تعداد پاسخ های صحیح
                            </td>
                            <td style="width: 100px;">
                                <asp:Label ID="Label_True" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;">
                                تعداد پاسخ های غلط
                            </td>
                            <td style="width: 100px;">
                                <asp:Label ID="Label_False" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 150px;">
                                میانگین درصد
                            </td>
                            <td style="width: 100px;">
                                <asp:Label ID="Label_average" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <hr />
                <hr />
                <table dir="rtl" style="width: 100%; direction: rtl; color: Blue;">
                    <tr>
                        <td style="width: 16%; direction: rtl; vertical-align: top;">
                            نام درس
                        </td>
                        <td style="width: 16%; direction: rtl; vertical-align: top;">
                            ضریب درس
                        </td>
                        <td style="width: 16%; direction: rtl;">
                            تعداد پاسخ های صحیح
                        </td>
                        <td style="width: 16%; direction: rtl;">
                            تعداد پاسخ های غلط
                        </td>
                        <td style="width: 16%; direction: rtl;">
                            تعداد کل سوالات
                        </td>
                        <td style="width: 16%; direction: rtl;">
                            نمره درس
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Repeater ID="Repeater_results" runat="server">
                    <ItemTemplate>
                        <table dir="rtl" style="width: 100%; direction: rtl;">
                            <tr>
                                <td style="width: 16%; direction: rtl; vertical-align: top;">
                                    <%#Eval("LessonName")%>
                                    <asp:HiddenField ID="HiddenField_StartIndex" runat="server" Value='<%#Eval("StartIndex") %>' />
                                    <asp:HiddenField ID="HiddenField_EndIndex" runat="server" Value='<%#Eval("EndIndex") %>' />
                                </td>
                                <td style="width: 16%; direction: rtl;">
                                    <asp:Label ID="Label_LessonCoefficient" runat="server" Text='<%#Eval("LessonCoefficient") %>'></asp:Label>
                                </td>
                                <td style="width: 16%; direction: rtl;">
                                    <asp:Label ID="Label_True" runat="server" Text=""></asp:Label>
                                </td>
                                <td style="width: 16%; direction: rtl;">
                                    <asp:Label ID="Label_False" runat="server" Text=""></asp:Label>
                                </td>
                                <td style="width: 16%; direction: rtl;">
                                    <asp:Label ID="Label_all" runat="server" Text=""></asp:Label>
                                </td>
                                <td style="width: 16%; direction: rtl;">
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
                <asp:HyperLink ID="HyperLink_return" runat="server" NavigateUrl="~/user/MyQuiz.aspx">بازگشت</asp:HyperLink>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images2/return.png" Height="50px"
                    Width="50px" />
            </asp:View>
            <asp:View ID="View3" runat="server">
                <div style="width: 800px;">
                    <table style="width: 100%; direction: rtl; color:Blue">
                        <tr>
                            <td>
                                عنوان آزمون
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
                            <table dir="rtl" style="width: 100%; direction: rtl; color:Navy;">
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
                                                            <table style="width: 100%; color:Navy;">
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right; direction: rtl;">
                                                                        گزینه صحیح
                                                                    </td>
                                                                    <td style="width: 200px; text-align: right; direction: rtl;">
                                                                        <asp:Label ID="Label_CorrectSwitch" runat="server" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right; direction: rtl;">
                                                                        پاسخ کاربر
                                                                    </td>
                                                                    <td style="width: 200px; text-align: right; direction: rtl;">
                                                                        <asp:Label ID="Label_UserSwitch" runat="server" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right; direction: rtl;">
                                                                        پاسخ تشریحی
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
                <div style="width:100%; text-align:center; padding:20 0 20 0;">
                 <asp:HyperLink ID="HyperLink_return2" runat="server" NavigateUrl="~/user/MyQuiz.aspx">بازگشت</asp:HyperLink>
                 <asp:Image ID="Image2" runat="server" ImageUrl="~/Images2/return.png" Height="50px"
                    Width="50px" />
                </div>
               <br />
               <br />
               
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
