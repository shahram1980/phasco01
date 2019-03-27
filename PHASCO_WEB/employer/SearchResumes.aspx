<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="SearchResumes.aspx.cs" Inherits="Rahbina.Job.SearchResumes" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head_Meta">
    <style type="text/css">
        .form-control {
            font-size: 11px;
        }
    </style>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="Plc_Mid">



    <table class="table table-responsive no-border" border="0" dir="rtl">


        <tr>
            <td width="20%">زمينه فعاليت
            </td>
            <td width="30%">

                <asp:DropDownList CssClass="form-control" ID="DropDownList_job_title" runat="server" AppendDataBoundItems="true"
                    AutoPostBack="true" DataTextField="CategoryName" DataValueField="CategoryID"
                    OnSelectedIndexChanged="DropDownList_job_title_SelectedIndexChanged">
                    <asp:ListItem Text="--انتخاب كنيد--" Value=""></asp:ListItem>
                </asp:DropDownList>>
                <asp:DropDownList CssClass="form-control" ID="DropDownList_specialty" runat="server" DataTextField="CategoryName"
                    DataValueField="CategoryID" Enabled="false">
                </asp:DropDownList>

            </td>
            <td width="50%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_job_title0" runat="server"
                    ControlToValidate="DropDownList_job_title" ErrorMessage="RequiredFieldValidator"
                    Text="لطفا زمينه فعاليت را مشخص كنيد"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr>
            <td width="20%">وضعيت تحصيلي
            </td>
            <td width="30%">

                <asp:DropDownList CssClass="form-control" ID="DropDownList_EducationStatus" runat="server">
                    <asp:ListItem Text="مهم نيست"></asp:ListItem>
                    <asp:ListItem Text="دانشجو"></asp:ListItem>
                    <asp:ListItem Text="فارغ اتحصيل"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td width="50%">&nbsp;
            </td>
        </tr>
        <tr>
            <td width="20%">وضعيت نظام وظيفه
            </td>
            <td width="30%">
                <asp:DropDownList CssClass="form-control" ID="DropDownList_servis" runat="server">
                    <asp:ListItem Text="مهم نيست"></asp:ListItem>
                    <asp:ListItem Text="معافيت تحصيلي"></asp:ListItem>
                    <asp:ListItem Text="معافيت پزشكي"></asp:ListItem>
                    <asp:ListItem Text="كفالت موقت"></asp:ListItem>
                    <asp:ListItem Text="كفالت دائم"></asp:ListItem>
                    <asp:ListItem Text="پايان خدمت"></asp:ListItem>
                    <asp:ListItem Text="مشمول"></asp:ListItem>
                    <asp:ListItem Text="در حال خدمت"></asp:ListItem>
                    <asp:ListItem Text="خريد خدمت"></asp:ListItem>
                    <asp:ListItem Text="ساير موارد"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td width="50%">&nbsp;
            </td>
        </tr>
        <tr>
            <td width="20%">وضعيت شغلي
                <asp:Label ID="Label_redStar5" runat="server" Text="*"></asp:Label>
                </asp:Label>
            </td>
            <td width="30%">
                <asp:DropDownList CssClass="form-control" ID="DropDownList_JobStatus" runat="server">
                    <asp:ListItem Text="مهم نيست"></asp:ListItem>
                    <asp:ListItem Text="بيكار"></asp:ListItem>
                    <asp:ListItem Text="شاغل"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td width="50%">&nbsp;
                <asp:Button ID="Button_search" runat="server" CssClass="btn btn-primary" OnClick="Button_search_Click" Text="جستجو" />
            </td>
        </tr>
        <tr>
            <td width="20%" class="style19">&nbsp;
            </td>
            <td width="30%" class="style19"></td>
            <td width="50%" class="style19">&nbsp;
            </td>
        </tr>
    </table>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">

            <div class="shop-widget">

                <h4>
                    <asp:Label ID="Label_search_report" runat="server" Text=""></asp:Label></h4>
                <asp:GridView GridLines="None" ID="GridView_search_result" runat="server" EnableViewState="False"
                    AutoGenerateColumns="False" EnableModelValidation="True"
                    ShowHeader="False" Width="95%">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <table width="100%" border="0" dir="ltr">
                                    <tr>
                                        <td width="90%" align="right" valign="top" dir="rtl">
                                            <a href="UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "UserID")%>">کاربر :
                                                    <%# Eval("UID")%>&nbsp;&nbsp;(
                                                    <%# Eval("Famil")%>
                                                <%# Eval("Name")%>) </a>
                                        </td>
                                        <td width="10%" rowspan="3" align="center" valign="top">
                                            <a href="UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "UserID")%>">
                                                <img src='<%# Images(int.Parse(Eval("Image").ToString()), int.Parse(Eval("UserID").ToString()), int.Parse(Eval("sex").ToString()))%>'
                                                    width="50" />
                                            </a>
                                        </td>
                                    </tr>
                                    <tr align="right" valign="top" dir="rtl">
                                        <td width="90%">
                                            <a href="SearchResumes.aspx?ResumeID=<%# Eval("id") %>&from=home">عنوان :
                                                    <%# Eval("ResumeSubject") %>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr align="right" valign="top">
                                        <td width="90%" dir="rtl">

                                            <a href="SearchResumes.aspx?ResumeID=<%# Eval("id") %>&from=home">دسته تخصصی :
                                                    <%#get_category_name(Eval("CategoryID")) %>
                                                    &nbsp; >&nbsp;
                                                    <%#get_category_name(Eval("CategoryID_Sub")) %>&nbsp;&nbsp; حقوق درخواستی :
                                                    <%# Eval("Requested_Wage")%>&nbsp;تومان تاریخ ارسال :
                                                    <%#GetfarsiDate(Eval("InsertDate")) %>
                                            </a>

                                        </td>
                                    </tr>
                                </table>


                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </asp:View>
        <%--  showing details of resume--%>
        <asp:View ID="View2" runat="server">
            <%--عنوان رزومه--%>

            
            <table class="table table-responsive no-border">
                <tr>
                    <td width="80%" align="right" valign="top">
                        <asp:Label ID="Label_Uid" runat="server"></asp:Label>
                    </td>
                    <td width="20%" align="left" valign="top" dir="rtl">&nbsp;کاربری : </td>
                    <td width="10%" rowspan="8" align="center" valign="top">
                        <asp:Image
                            ID="Image_User_Photo" runat="server" />
                    </td>
                </tr>
                <tr align="center" valign="top">
                    <td width="80%" align="right">
                        <asp:Label ID="Label_Point" runat="server"></asp:Label>
                    </td>
                    <td width="20%" align="left" dir="rtl">امتياز&nbsp; : </td>
                </tr>
                <tr align="center" valign="top">
                    <td width="80%" align="right">
                        <asp:Label ID="Label_Name" runat="server"></asp:Label>
                    </td>
                    <td width="20%" align="left" dir="rtl">نام :</td>
                </tr>
                <tr align="center" valign="top">
                    <td width="80%" align="right">
                        <asp:Label ID="Label_Sex" runat="server"></asp:Label>
                    </td>
                    <td width="20%" align="left" dir="rtl">جنسیت : </td>
                </tr>
                <tr align="center" valign="top">
                    <td width="80%" align="right">
                        <asp:Label ID="Label_Birth" runat="server"></asp:Label>
                    </td>
                    <td width="20%" align="left" dir="rtl">متولد : </td>
                </tr>
                <tr align="center" valign="top">
                    <td width="80%" align="right">
                        <asp:Label ID="Label_Reshte" runat="server"></asp:Label>
                    </td>
                    <td width="20%" align="left" dir="rtl">رشته : </td>
                </tr>
                <tr align="center" valign="top">
                    <td width="80%" align="right">
                        <asp:Label ID="Label_Maghata" runat="server"></asp:Label>
                    </td>
                    <td width="20%" align="left" dir="rtl">&nbsp;تحصیلات : </td>
                </tr>
                <tr align="center" valign="top">
                    <td width="80%" align="right">
                        <asp:Label ID="Label_Citty" runat="server"></asp:Label>
                    </td>
                    <td width="20%" align="left" dir="rtl">شهر : </td>
                </tr>
            </table>
            <table class="table table-responsive no-border rtl-text" >
                
                <tr>
                    <td align="right" valign="top" width="20%">
                        <asp:Label ID="Label_Subject" runat="server" Text="عنوان رزومه"></asp:Label>
                    </td>
                    <td align="right" valign="top" width="80%">
                        <asp:Label ID="Label_Subject2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_nationalNumber" runat="server" Text="شماره ملي"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_nationalNumber2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_service1" runat="server" Text="وضعيت نظام وظيفه"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_service2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_phone" runat="server" Text="تلفن"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_phone2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_mobile" runat="server" Text="موبايل"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_mobile2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_job_status" runat="server" Text="وضعيت شغلي"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_job_status2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_EduStatus" runat="server" Text="وضعيت تحصيلي"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_EduStatus2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_ExpireTime" runat="server" Text="مدت نمايش رزومه">

                        </asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_ExpireTime2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_category4" runat="server" Text="زمينه فعاليت"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_category2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_Subcategory4" runat="server" Text="زمينه تخصصي"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_Subcategory2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_CoOperate_Condition4" runat="server" Text="نحوه همكاري"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_CoOperate_Condition2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Labe_Requested_Wage0" runat="server" Text="حقوق درخواستي">

                        </asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_Requested_Wage2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_pro_abilities" runat="server" Text="توانايي هاي حرفه اي"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_pro_abilities2" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">
                        <asp:Label ID="Label_Explantion4" runat="server" Text="توضيحات"></asp:Label>
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:Label ID="Label_Explantion2" runat="server" Text=""></asp:Label>
                        <asp:HyperLink ID="HyperLink_returnFromDetails" runat="server">بازگشت</asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">
                        <h3>دوره هاي تخصصي</h3>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:GridView ID="GridView_career" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <Columns>
                                <asp:BoundField DataField="career_name" HeaderText="نام دوره" />
                                <asp:BoundField DataField="career_duration" HeaderText="مدت دوره به ماه " />
                                <asp:TemplateField HeaderText="از تاريخ">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_startTime0" runat="server" Text='<%#Mss_Date(Eval("startTime" ))%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="تا تاريخ">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_startTime1" runat="server" Text='<%#Mss_Date(Eval("FinishTime" ))%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Institute_name" HeaderText="نام موسسه" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">
                        <h3>زبان هاي خارجي</h3>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:GridView ID="GridView_languages" runat="server" AutoGenerateColumns="False"
                            BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                            CellPadding="3" CellSpacing="2">
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <Columns>
                                <asp:BoundField DataField="Language_name" HeaderText="زبان خارجي" />
                                <asp:BoundField DataField="Read_Write_skill" HeaderText="مهارت خواندن و نوشتن " />
                                <asp:BoundField DataField="Speaking_skill" HeaderText="مهارت مكالمه" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">&nbsp;
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">
                        <h3>تحصيلات</h3>
                    </td>
                </tr>
                <tr>
                    <td align="right" width="20%" valign="top">&nbsp;
                    </td>
                    <td align="right" width="80%" valign="top">
                        <asp:GridView ID="GridView_edu" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
                            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <Columns>
                                <asp:BoundField DataField="Field" HeaderText="رشته و گرايش" />
                                <asp:BoundField DataField="Last_document" HeaderText="آخرين مدرك تحصيلي " />
                                <asp:BoundField DataField="country" HeaderText="كشور" />
                                <asp:BoundField DataField="City" HeaderText="شهر" />
                                <asp:BoundField DataField="University" HeaderText="دانشگاه" />
                                <asp:TemplateField HeaderText="از تاريخ">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_startTime2" runat="server" Text='<%#Mss_Date(Eval("StartDate" ))%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="تا تاريخ">
                                    <ItemTemplate>
                                        <asp:Label ID="Label_startTime3" runat="server" Text='<%#Mss_Date(Eval("FinishDate" ))%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="average" HeaderText="معدل" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">

            <div class="shop-widget">
                <h4 lang="fa">&#1580;&#1583;&#1740;&#1583; &#1578;&#1585;&#1740;&#1606; &#1585;&#1586;&#1608;&#1605;&#1607; &#1607;&#1575;</h4>
                
                    <asp:Repeater runat="server" ID="RTP_NewestResume">
                        <ItemTemplate>
                        <table class="table table-responsive no-border" style="border-bottom:solid 1px #808080">
                            <tr>
                                <td width="90%" align="right" valign="top" dir="rtl">
                                    <a href="/UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "UserID")%>">کاربر :
                                                    <%# Eval("UID")%>&nbsp;&nbsp;(
                                                    <%# Eval("Famil")%>
                                        <%# Eval("Name")%>) </a>
                                </td>
                                <td width="10%" rowspan="3" align="center" valign="top">
                                    <a href="/UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "UserID")%>">
                                        <img src='<%# Images(int.Parse(Eval("Image").ToString()), int.Parse(Eval("UserID").ToString()), int.Parse(Eval("sex").ToString()))%>'
                                            width="50" />
                                    </a>
                                </td>
                            </tr>
                            <tr align="right" valign="top" dir="rtl">
                                <td width="90%">
                                    <a href="SearchResumes.aspx?ResumeID=<%# Eval("id") %>&from=home">عنوان :
                                                    <%# Eval("ResumeSubject") %>
                                    </a>
                                </td>
                            </tr>
                            <tr align="right" valign="top">
                                <td width="90%" dir="rtl">

                                    <a href="SearchResumes.aspx?ResumeID=<%# Eval("id") %>&from=home">دسته تخصصی :
                                                    <%#get_category_name(Eval("CategoryID")) %>
                                                    &nbsp; >&nbsp;
                                                    <%#get_category_name(Eval("CategoryID_Sub")) %>&nbsp;&nbsp; حقوق درخواستی :
                                                    <%# Eval("Requested_Wage")%>&nbsp;تومان تاریخ ارسال :
                                                    <%#GetfarsiDate(Eval("InsertDate")) %>
                                    </a>

                                </td>
                            </tr>
                              </table>

                        </ItemTemplate>
                    </asp:Repeater>
              
            </div>



        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_codition" runat="server" />
    <asp:HiddenField ID="HiddenField_Category" runat="server" />
    <asp:HiddenField ID="HiddenField_sub_category" runat="server" />
</asp:Content>
