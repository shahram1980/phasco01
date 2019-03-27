<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageLessons.aspx.cs"
    MasterPageFile="~/Template/Phasco01.Master" Inherits="OnlineTest.Admin.ManageLessons" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
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
    <div style="width: 100%; text-align: center; direction: rtl;">
        <h1>
            مدیریت دروس و سوالات</h1>
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div>
                <table style="width: 100%; direction: rtl;">
                    <%--LessonName          LessonName          LessonName          LessonName          --%>
                    <tr>
                        <td style="width: 20%;">
                            نام درس
                        </td>
                        <td style="width: 60%;">
                            <asp:TextBox ID="TextBox_LessonName" runat="server" Width="200px"></asp:TextBox>
                        </td>
                        <td style="width: 20%;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_LessonName"
                                Text="نام درس را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--LessonType              LessonType              LessonType              LessonType              --%>
                    <tr>
                        <td style="width: 20%;">
                            نوع درس
                        </td>
                        <td style="width: 60%;">
                            <asp:DropDownList Width="200px" ID="DropDownList_LessonType" runat="server" DataTextField="LessonType"
                                DataValueField="id" AppendDataBoundItems="true">
                                <asp:ListItem Text="--انتخاب کنید--"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList_LessonType"
                                Text="نوع درس را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" in InitialValue="--انتخاب کنید--"
                                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--LessonCoefficient               LessonCoefficient               LessonCoefficient               --%>
                    <tr>
                        <td style="width: 20%;">
                            ضریب درس
                        </td>
                        <td style="width: 60%;">
                            <asp:TextBox ID="TextBox_LessonCoefficient" runat="server" MaxLength="1" Width="200px"></asp:TextBox>
                        </td>
                        <td style="width: 20%;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_LessonCoefficient"
                                Text="ضریب درس را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox_LessonCoefficient"
                                Text="ضریب درس صحیح نیست" ValidationGroup="Insert" Display="Dynamic" Type="Integer"
                                MaximumValue="5" MinimumValue="1" ErrorMessage="RangeValidator"></asp:RangeValidator>
                        </td>
                    </tr>
                    <%--    
    TimeToAnswer                TimeToAnswer                TimeToAnswer                TimeToAnswer                --%>
                    <tr>
                        <td style="width: 20%;">
                            زمان پاسخگویی به هر سوال
                        </td>
                        <td style="width: 60%;">
                            <asp:TextBox ID="TextBox_TimeToAnswer" runat="server" MaxLength="3" Width="200px"></asp:TextBox>
                        </td>
                        <td style="width: 20%;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_TimeToAnswer"
                                Text="زمان پاسخگویی را مشخص کنید" ValidationGroup="Insert" Display="Dynamic"
                                ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox_TimeToAnswer"
                                Text=" حداقل 30 و حداکثر 180ثانیه، زمان پاسخگویی مجاز نیست" ValidationGroup="Insert"
                                Display="Dynamic" Type="Integer" MaximumValue="180" MinimumValue="30" ErrorMessage="RangeValidator"></asp:RangeValidator>
                        </td>
                    </tr>
                    <%--  Lessondescription                 Lessondescription                 Lessondescription          --%>
                    <tr>
                        <td style="width: 20%;">
                            توضیحات کلی درمورد دس
                        </td>
                        <td style="width: 60%;">
                            <FCKeditorV2:FCKeditor ID="FCKeditor_Lessondescription" runat="server">
                            </FCKeditorV2:FCKeditor>
                        </td>
                        <td style="width: 20%;">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%;">
                        </td>
                        <td style="width: 60%; text-align: center;">
                            <asp:Button ID="ButtonAdd_Lesson" runat="server" Text="افزودن درس" ValidationGroup="Insert"
                                OnClick="ButtonAdd_Lesson_Click" />
                        </td>
                        <td style="width: 20%;">
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <asp:GridView ID="GridView_Lesson" runat="server" AutoGenerateColumns="False" CellPadding="3"
                    CssClass="grd" DataKeyNames="id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                    BorderWidth="1px">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="کد" ReadOnly="True" />
                        <asp:BoundField DataField="LessonName" HeaderText="نام درس" />
                        <asp:BoundField DataField="LessonType" HeaderText="نوع درس" />
                        <asp:BoundField DataField="LessonCoefficient" HeaderText="ضریب درس" />
                        <asp:TemplateField HeaderText="تاریخ آخرین ویرایش">
                            <ItemTemplate>
                                <%#get_farsi_date(Eval("LastModificationDate")) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="حذف">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton_delete" runat="server" CommandArgument='<%#Eval("id")  %>'
                                    OnClientClick="return confirm(&quot;اطلاعات موردنظرحذفشود؟&quot;)" OnCommand="GridRowDelete_Lesson"
                                    ValidationGroup="delete2">حذف درس</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ویرایش">
                            <ItemTemplate>
                                <a href="ManageLessons.aspx?id=<%#Eval("id") %>">مشاهده و ویرایش</a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="مدیریت سوالات">
                            <ItemTemplate>
                                <a href="QuestionsOFaLesson.aspx?status=insert&id=<%#Eval("id") %>">مشاهده </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                </asp:GridView>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table style="width: 100%; direction: rtl;">
                <%--LessonName          LessonName          LessonName          LessonName          --%>
                <tr>
                    <td style="width: 20%;">
                        نام درس
                    </td>
                    <td style="width: 60%;">
                        <asp:TextBox ID="TextBox_LessonName_E" runat="server" Width="200px"></asp:TextBox>
                    </td>
                    <td style="width: 20%;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1_E" runat="server" ControlToValidate="TextBox_LessonName_E"
                            Text="نام درس را مشخص کنید" ValidationGroup="edit" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--LessonType              LessonType              LessonType              LessonType              --%>
                <tr>
                    <td style="width: 20%;">
                        نوع درس
                    </td>
                    <td style="width: 60%;">
                        <asp:DropDownList ID="DropDownList_LessonType_E" Width="200px" runat="server" DataTextField="LessonType"
                            DataValueField="id" AppendDataBoundItems="true">
                            <asp:ListItem Text="--انتخاب کنید--"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td style="width: 20%;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList_LessonType_E"
                            Text="نوع درس را مشخص کنید" ValidationGroup="Insert" Display="Dynamic" in InitialValue="--انتخاب کنید--"
                            ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--LessonCoefficient               LessonCoefficient               LessonCoefficient               --%>
                <tr>
                    <td style="width: 20%;">
                        ضریب درس
                    </td>
                    <td style="width: 60%;">
                        <asp:TextBox ID="TextBox_LessonCoefficient_E" runat="server" MaxLength="1" Width="200px"></asp:TextBox>
                    </td>
                    <td style="width: 20%;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3_E" runat="server" ControlToValidate="TextBox_LessonCoefficient_E"
                            Text="ضریب درس را مشخص کنید" ValidationGroup="edit" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1_E" runat="server" ControlToValidate="TextBox_LessonCoefficient_E"
                            Text="ضریب درس صحیح نیست" ValidationGroup="edit" Display="Dynamic" Type="Integer"
                            MaximumValue="5" MinimumValue="1" ErrorMessage="RangeValidator"></asp:RangeValidator>
                    </td>
                </tr>
                <%-- TimeToAnswer                TimeToAnswer                TimeToAnswer                TimeToAnswer                --%>
                <tr>
                    <td style="width: 20%;">
                        زمان پاسخگویی به هر سوال
                    </td>
                    <td style="width: 60%;">
                        <asp:TextBox ID="TextBox_TimeToAnswer_E" runat="server" MaxLength="3" Width="200px"></asp:TextBox>
                    </td>
                    <td style="width: 20%;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5_E" runat="server" ControlToValidate="TextBox_TimeToAnswer_E"
                            Text="زمان پاسخگویی را مشخص کنید" ValidationGroup="edit" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator2_E" runat="server" ControlToValidate="TextBox_TimeToAnswer_E"
                            Text=" حداقل 30 و حداکثر 180ثانیه، زمان پاسخگویی مجاز نیست" ValidationGroup="edit"
                            Display="Dynamic" Type="Integer" MaximumValue="180" MinimumValue="30" ErrorMessage="RangeValidator"></asp:RangeValidator>
                    </td>
                </tr>
                <%--  Lessondescription                 Lessondescription                 Lessondescription          --%>
                <tr>
                    <td style="width: 20%;">
                        توضیحات کلی درمورد دس
                    </td>
                    <td style="width: 60%;">
                        <FCKeditorV2:FCKeditor ID="FCKeditor_Lessondescription_E" runat="server">
                        </FCKeditorV2:FCKeditor>
                    </td>
                    <td style="width: 20%;">
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;">
                    </td>
                    <td style="width: 60%; text-align: center;">
                        <asp:Button ID="ButtonEdit_Lesson" runat="server" Text="ویرایش درس" ValidationGroup="edit"
                            OnClick="ButtonEdit_Lesson_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button_return" runat="server" Text="بازگشت" OnClick="Button_return_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:HyperLink ID="HyperLink_questions" runat="server">مدیریت سوالات </asp:HyperLink>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label_report" runat="server" Text="" EnableViewState="false"></asp:Label>
                    </td>
                    <td style="width: 20%;">
                    </td>
                </tr>
            </table>
            <table style="width: 99%; direction: rtl;">
                <tr>
                    <td style="width: 99%; padding: 10px;"><asp:ScriptManager 
                            ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                                 مقاطع تحصیلی :
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CheckBoxList ID="CheckBoxList_Degrees" runat="server" DataTextField="DegreeName"
                            RepeatColumns="7" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="1"
                            DataValueField="id">
                        </asp:CheckBoxList>
                        <br />
                        <hr />
                        گروه آموزشی : &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="DropDownList_groups" runat="server" DataValueField="id" AppendDataBoundItems="true"
                            AutoPostBack="true" DataTextField="GroupName" OnSelectedIndexChanged="DropDownList_groups_SelectedIndexChanged">
                            <asp:ListItem Text=""></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
           
                        <asp:CheckBoxList ID="CheckBoxList_Fields" runat="server" DataTextField="FieldName"
                            Visible="false" RepeatColumns="5" RepeatDirection="Horizontal" CellPadding="5"
                            CellSpacing="1" DataValueField="id">
                        </asp:CheckBoxList>
                                 <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                     <ProgressTemplate>
                                         در حال بارگزاری ....
                                     </ProgressTemplate>
                                 </asp:UpdateProgress>
                        </ContentTemplate>
                        </asp:UpdatePanel>
               
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
