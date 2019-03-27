<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Master_Phasco.Master"
    CodeBehind="SearchEmploymentAD.aspx.cs" Inherits="Rahbina.Job.SearchEmploymentAD" %>

<asp:Content ContentPlaceHolderID="head_Meta" ID="content1" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" ID="content2" runat="server">
     <asp:ScriptManager runat="server" ID="ScriptMnager1"></asp:ScriptManager>
    <a class="btn btn-default" onclick="goBack()">بازگشت <i class="fa fa-reply"></i></a>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
    
    <div class="shop-widget">

                <h4>گزینه های جستجوی کارفرما</h4>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            
             
<table class="table no-border table-responsive text-center text-right rtl-text form-group margin-top-30">
                <tr>
                    <td style="padding-right: 30px;">
                        <table dir="rtl" style="text-align: right;width:100%;direction:rtl;">
                            <%--job title--%>
                            <tr>
                                <td>
                                     زمينه فعاليت

                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_job_title" runat="server" AutoPostBack="true"
                                        AppendDataBoundItems="true" DataTextField="CategoryName" DataValueField="CategoryID"
                                        OnSelectedIndexChanged="DropDownList_job_title_SelectedIndexChanged">
                                        <asp:ListItem Text="--انتخاب كنيد--" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator_job_title" ControlToValidate="DropDownList_job_title"
                                            Text="لطفا زمينه فعاليت را مشخص كنيد" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                    </td>
                                </td>
                            </tr>
                            <%--required specialty--%>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_specialty" runat="server" Text="زمينه تخصصي">

                                    </asp:Label>
                                </td>
                                <td>
                                     
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                        <ProgressTemplate>
                                            لطفا صبر کنید ...
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                              
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="DropDownList_specialty" Enabled="false" runat="server" DataTextField="CategoryName"
                                                DataValueField="CategoryID">
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="DropDownList_job_title" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <%--education step--%>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_education" runat="server" Text="مقطع تحصيلي"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_education_step" runat="server">
                                        <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                        <asp:ListItem Text="زير ديپلم"></asp:ListItem>
                                        <asp:ListItem Text="ديپلم"></asp:ListItem>
                                        <asp:ListItem Text="فوق ديپلم"></asp:ListItem>
                                        <asp:ListItem Text="ليسانس"></asp:ListItem>
                                        <asp:ListItem Text="فوق ليسانس"></asp:ListItem>
                                        <asp:ListItem Text="دكترا"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <%--gender--%>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_gender" runat="server" Text="جنسيت"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_gender" runat="server">
                                        <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                        <asp:ListItem Text="مرد"></asp:ListItem>
                                        <asp:ListItem Text="زن"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <%--marriage status--%>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_marriage" runat="server" Text="وضعيت تاهل "></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_marriage" runat="server">
                                        <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                        <asp:ListItem Text="مجرد"></asp:ListItem>
                                        <asp:ListItem Text="متاهل"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <%--service status--%>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_service" runat="server" Text="وضعيت نظام وضيفه"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_service" runat="server">
                                        <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                        <asp:ListItem Text="پايان خدمت"></asp:ListItem>
                                        <asp:ListItem Text="معافيت غير پزشكي"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <%--state--%>
                            <tr>
                                <td>
                                    <asp:Label ID="Label_state" runat="server" Text="استان محل كار"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_state" runat="server">
                                        <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                        <asp:ListItem Text="آذربایجان شرقی"></asp:ListItem>
                                        <asp:ListItem Text="آذربایجان غربی"></asp:ListItem>
                                        <asp:ListItem Text="اردبیل"></asp:ListItem>
                                        <asp:ListItem Text="اصفهان"></asp:ListItem>
                                        <asp:ListItem Text="ایلام"></asp:ListItem>
                                        <asp:ListItem Text="بوشهر"></asp:ListItem>
                                        <asp:ListItem Text="تهران"></asp:ListItem>
                                        <asp:ListItem Text="چهار محال و بختیاری"></asp:ListItem>
                                        <asp:ListItem Text="خراسان جنوبی"></asp:ListItem>
                                        <asp:ListItem Text="خراسان رضوی"></asp:ListItem>
                                        <asp:ListItem Text="خراسان شمالی"></asp:ListItem>
                                        <asp:ListItem Text="خورستان"></asp:ListItem>
                                        <asp:ListItem Text="زنجان"></asp:ListItem>
                                        <asp:ListItem Text="سمنان"></asp:ListItem>
                                        <asp:ListItem Text="سیستان و بلوچستان"></asp:ListItem>
                                        <asp:ListItem Text="فارس"></asp:ListItem>
                                        <asp:ListItem Text="قزوین"></asp:ListItem>
                                        <asp:ListItem Text="قم"></asp:ListItem>
                                        <asp:ListItem Text="کردستان"></asp:ListItem>
                                        <asp:ListItem Text="کرمان"></asp:ListItem>
                                        <asp:ListItem Text="کرمانشاه"></asp:ListItem>
                                        <asp:ListItem Text="کهکیلویه و بویر احمد"></asp:ListItem>
                                        <asp:ListItem Text="گلستان"></asp:ListItem>
                                        <asp:ListItem Text="گیلان"></asp:ListItem>
                                        <asp:ListItem Text="لرستان"></asp:ListItem>
                                        <asp:ListItem Text="مازندران"></asp:ListItem>
                                        <asp:ListItem Text="مرکزی"></asp:ListItem>
                                        <asp:ListItem Text="هرمزگان"></asp:ListItem>
                                        <asp:ListItem Text="همدان"></asp:ListItem>
                                        <asp:ListItem Text="یزد"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <%--\\\\\\\////////--%>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="Button_search" runat="server" Text="جستجو" OnClick="Button_search_Click" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
</itemtemplate>
            </fieldset>
            <br />
            <br />
            <asp:Label ID="Label_search_report" runat="server" Text=""></asp:Label>
            <br />
            <center>
                <asp:GridView ID="GridView_search_result" runat="server" AllowPaging="True" EnableViewState="false"
                    PagerSettings-FirstPageText="صفحه اول" PagerSettings-LastPageText="صفحه آخر"
                    PagerSettings-NextPageText=" صفحه بعد" PagerSettings-PreviousPageText="صفحه قبل"
                    PageSize="5" PagerSettings-Mode="NextPreviousFirstLast" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GridView_search_result_PageIndexChanging"
                    Width="95%">
                    <PagerSettings FirstPageText="صفحه اول" LastPageText="صفحه آخر" NextPageText=" صفحه بعد"
                        PreviousPageText="صفحه قبل"></PagerSettings>
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField HeaderText="نام شركت" DataField="Company_name" />
                        <asp:TemplateField HeaderText="تاريخ درج آگهي">
                            <ItemTemplate>
                                <asp:Label ID="Label_date" runat="server" Text='<%#Mss_Date(Eval("insertionDate")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="زمينه فعاليت" DataField="JobTitle" />
                        <asp:BoundField HeaderText="زمينه تخصصي" DataField="Required_specialty" />
                        <asp:BoundField HeaderText=" مقطع تحصيلي" DataField="Edu_step" />
                        <asp:TemplateField HeaderText="استان محل فعاليت">
                            <ItemTemplate>
                                <asp:Label ID="Label_state" runat="server" Text='<%#evaluateState(Eval("_state")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField Text="جزئيات بيشتر" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/job/SearchEmploymentAD.aspx?id={0}&from=search" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </center>
        </asp:View>
        <%--view details of employment advertisment--%><asp:View ID="View2" runat="server">
            <div style="text-align: center">
                <table class="table table-responsive table-striped" style="width: 100%" border="0">
                    <tbody>
                        <tr>
                            <td style="width: 80%" dir="rtl" valign="top" align="right">
                                &nbsp;<asp:Label ID="Label_jobtitle2" runat="server" Text="">

                                </asp:Label>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                                زمينه فعاليت 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%;  dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_required_specialty2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%; valign="top" align="left">
                                زمينه تخصصي 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%" dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_coname2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                                نام شركت / موسسه 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%; dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_insertDate2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%;  valign="top" align="left">
                                تاريخ درج آگهي 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%"  valign="top" align="right">
                                <asp:Literal ID="Label_call_timeOut2" runat="server" Text=""></asp:Literal>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                                مهلت تماس تا 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%; dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_address2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 80%;  valign="top" align="left">
                                آدرس 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%" dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_state2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                                 استان محل كار 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%;  dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_city2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 80%; valign="top" align="left">
                              شهر محل كار 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%" dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_education2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                              مقطع تحصيلي 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%; dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_experience2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%;  valign="top" align="left">
                               سابقه كار 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%" dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_gender2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                                 جنسيت 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%;  dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_marriage2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 80%; valign="top" align="left">
                                وضعيت تاهل 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%" dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_service2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                               وضعيت نظام وضيفه 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 20%; dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_age2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%;  valign="top" align="left">
                              حداقل و حداكثر سن 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%" dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_phone2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                                تلفن هاي تماس 
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%;  dir="rtl" valign="top" align="right">
                                <asp:Label ID="Label_explenation2" runat="server" Text=""></asp:Label>
                            </td>
                            <td style="width: 80%;  valign="top" align="left">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 80%" dir="rtl" valign="top" align="right">
                                <asp:HyperLink ID="HyperLink_return" runat="server">بازگشت</asp:HyperLink>
                            </td>
                            <td style="width: 20%" valign="top" align="left">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <%--job title--%><div class="InstedOfTable">
            </div>
            <div class="InstedOfTable">
                &nbsp;</div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <fieldset dir="rtl" style="width: 100%; text-align: right;">
                <legend>جديدترين فرصت هاي شغلي </legend>
                <asp:GridView ID="GridView_recent_ADs" runat="server" EnableViewState="false" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
                        <asp:BoundField HeaderText="نام شركت" DataField="Company_name" />
                        <asp:TemplateField HeaderText="تاريخ درج آگهي">
                            <ItemTemplate>
                                <asp:Label ID="Label_date" runat="server" Text='<%#GetfarsiDate(Eval("insertionDate")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="زمينه فعاليت" DataField="JobTitle" />
                        <asp:BoundField HeaderText="زمينه تخصصي" DataField="Required_specialty" />
                        <asp:BoundField HeaderText=" مقطع تحصيلي" DataField="Edu_step" />
                        <asp:TemplateField HeaderText="استان محل فعاليت">
                            <ItemTemplate>
                                <asp:Label ID="Label_state" runat="server" Text='<%#evaluateState(Eval("_state")) %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:HyperLinkField Text="جزئيات بيشتر" DataNavigateUrlFields="id" DataNavigateUrlFormatString="~/job/SearchEmploymentAD.aspx?id={0}&from=home" />
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <br />
                <asp:HyperLink ID="HyperLink_return2Main" runat="server">بازگشت</asp:HyperLink>
            </fieldset>
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_codition" runat="server" />
    </div>
</asp:Content>