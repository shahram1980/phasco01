<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="Enabled_employmentAD.aspx.cs" Inherits="Rahbina.Job.Enabled_employmentAD" %>

<asp:Content ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:ScriptManager ID="ScriptManger1" runat="server"></asp:ScriptManager>
    <h3>آگهی های فعال و تائید شده</h3>

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <br />

            <asp:GridView ID="GridView_enabled_ad" runat="server" AllowPaging="true" EnableViewState="false"
                PagerSettings-FirstPageText="صفحه اول" PagerSettings-LastPageText="صفحه آخر"
                PagerSettings-NextPageText=" صفحه بعد" PagerSettings-PreviousPageText="صفحه قبل"
                PageSize="5" PagerSettings-Mode="NextPreviousFirstLast" AutoGenerateColumns="False"
                BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px"
                CellPadding="3" CellSpacing="2" OnPageIndexChanging="GridView_waiting_ad_PageIndexChanging"
                Width="100%">
                <PagerSettings FirstPageText="صفحه اول" LastPageText="صفحه آخر" Mode="NextPreviousFirstLast"
                    NextPageText=" صفحه بعد" PreviousPageText="صفحه قبل" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <Columns>
                    <asp:TemplateField HeaderText="عنوان شغلي">
                        <ItemTemplate>
                            <asp:Label ID="Label_JobTitle" runat="server" Text='<%#get_category_name(Eval("jobTitle")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تخصص مورد نياز">
                        <ItemTemplate>
                            <asp:Label ID="Label_JobTitle" runat="server" Text='<%#get_category_name(Eval("Required_specialty")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاريخ درج">
                        <ItemTemplate>
                            <asp:Label ID="Label_insert_Date" runat="server" Text='<%#GetfarsiDate(Eval("insertionDate")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:HyperLinkField HeaderText="گزينه ها" Text="مشاهده و ويرايش" DataNavigateUrlFields="id"
                        DataNavigateUrlFormatString='Enabled_employmentAD.aspx?id={0}' />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:View>
        <%--   view and edit advertisment--%><asp:View ID="View2" runat="server">
            <table style="width: 100%" border="0" style="border-collapse: collapse" cellpadding="0">
                <tbody>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_job_title" runat="server"
                                ErrorMessage="RequiredFieldValidator" ValidationGroup="company" Text="لطفا يك مورد را انتخاب كنيد"
                                ControlToValidate="DropDownList_job_title"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:DropDownList ID="DropDownList_job_title" runat="server" OnSelectedIndexChanged="DropDownList_job_title_SelectedIndexChanged"
                                DataValueField="CategoryID" DataTextField="CategoryName" AppendDataBoundItems="true"
                                AutoPostBack="true">
                                <asp:ListItem Text="--انتخاب كنيد--" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">
                            <asp:Label ID="Label_job_title" runat="server" Text="زمينه فعاليت">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_specialty" runat="server"
                                ErrorMessage="RequiredFieldValidator" ValidationGroup="company" Text="لطفا يك مورد را انتخاب كنيد"
                                ControlToValidate="DropDownList_specialty"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="DropDownList_specialty" runat="server" DataValueField="CategoryID"
                                        DataTextField="CategoryName" __designer:wfdid="w1">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownList_job_title"></asp:AsyncPostBackTrigger>
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">زمينه تخصصي
                        </td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_coname" runat="server" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="company" Text="نام موسسه را مشخص كنيد" ControlToValidate="TextBox_coname"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:TextBox ID="TextBox_coname" runat="server" MaxLength="48"></asp:TextBox>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">نام شركت / موسسه
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:TextBox ID="TextBox_call_timeOut" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">مهلت تماس تا
                        </td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:TextBox ID="TextBox_address" runat="server" Columns="40"></asp:TextBox>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">آدرس
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_state" runat="server" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="company" Text=" مشخص كنيد" ControlToValidate="DropDownList_state"
                                InitialValue="--انتخاب كنيد--"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:DropDownList ID="DropDownList_state" runat="server" AutoPostBack="True"
                                Font-Names="Tahoma" Font-Size="X-Small"
                                OnSelectedIndexChanged="DropDownList_state_SelectedIndexChanged">
                                <asp:ListItem Value="0">انتخاب استان</asp:ListItem>
                                <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
                                <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
                                <asp:ListItem Value="31">البرز</asp:ListItem>
                                <asp:ListItem Value="3">اردبیل</asp:ListItem>
                                <asp:ListItem Value="4">اصفهان</asp:ListItem>
                                <asp:ListItem Value="5">ایلام</asp:ListItem>
                                <asp:ListItem Value="6">بوشهر</asp:ListItem>
                                <asp:ListItem Value="7">تهران</asp:ListItem>
                                <asp:ListItem Value="8">چهار محال و بختیاری</asp:ListItem>
                                <asp:ListItem Value="9">خراسان جنوبی</asp:ListItem>
                                <asp:ListItem Value="10">خراسان رضوی</asp:ListItem>
                                <asp:ListItem Value="11">خراسان شمالی</asp:ListItem>
                                <asp:ListItem Value="12">خورستان</asp:ListItem>
                                <asp:ListItem Value="13">زنجان</asp:ListItem>
                                <asp:ListItem Value="14">سمنان</asp:ListItem>
                                <asp:ListItem Value="15">سیستان و بلوچستان</asp:ListItem>
                                <asp:ListItem Value="16">فارس</asp:ListItem>
                                <asp:ListItem Value="17">قزوین</asp:ListItem>
                                <asp:ListItem Value="18">قم</asp:ListItem>
                                <asp:ListItem Value="19">کردستان</asp:ListItem>
                                <asp:ListItem Value="20">کرمان</asp:ListItem>
                                <asp:ListItem Value="21">کرمانشاه</asp:ListItem>
                                <asp:ListItem Value="22">کهکیلویه و بویر احمد</asp:ListItem>
                                <asp:ListItem Value="23">گلستان</asp:ListItem>
                                <asp:ListItem Value="24">گیلان</asp:ListItem>
                                <asp:ListItem Value="25">لرستان</asp:ListItem>
                                <asp:ListItem Value="26">مازندران</asp:ListItem>
                                <asp:ListItem Value="27">مرکزی</asp:ListItem>
                                <asp:ListItem Value="28">هرمزگان</asp:ListItem>
                                <asp:ListItem Value="29">همدان</asp:ListItem>
                                <asp:ListItem Value="30">یزد</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">استان محل كار
                        </td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="company" Text=" مشخص كنيد" ControlToValidate="DropDownList_city"
                                InitialValue="--انتخاب كنيد--"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="DropDownList_city" runat="server" DataValueField="id" DataTextField="satate"
                                        __designer:wfdid="w2">
                                        <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownList_state"></asp:AsyncPostBackTrigger>
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">شهر محل كار
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right">
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
                        <td style="width: 20%" dir="rtl" align="left">مقطع تحصيلي
                        </td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator"
                                Text="فقط عدد وارد كنيد" ControlToValidate="TextBox_experience" Type="Double"
                                Operator="DataTypeCheck"></asp:CompareValidator>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:TextBox ID="TextBox_experience" runat="server" MaxLength="2" Columns="2"></asp:TextBox>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">سال
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right">&nbsp;</td>
                        <td style="width: 20%" dir="rtl" align="left">&nbsp;</td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:DropDownList ID="DropDownList_gender" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="مرد"></asp:ListItem>
                                <asp:ListItem Text="زن"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">جنسيت
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:DropDownList ID="DropDownList_marriage" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="مجرد"></asp:ListItem>
                                <asp:ListItem Text="متاهل"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">وضعيت تاهل
                        </td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:DropDownList ID="DropDownList_service" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="پايان خدمت"></asp:ListItem>
                                <asp:ListItem Text="معافيت غير پزشكي"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">وضعيت نظام وضيفه
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:DropDownList ID="DropDownList_age" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="بين 20 تا 30 سال"></asp:ListItem>
                                <asp:ListItem Text="بين 30 تا 40 سال "></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">حداقل و حداكثر سن
                        </td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"
                                Text="فقط عدد وارد كنيد" ControlToValidate="TextBox_phone" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"
                                Text="مشخص كنيد" ControlToValidate="TextBox_phone" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:TextBox ID="TextBox_phone" runat="server" Columns="40"></asp:TextBox>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">تلفن هاي تماس
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator"
                                Text="مشخص كنيد" ControlToValidate="TextBox_explenation"></asp:RequiredFieldValidator>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:TextBox ID="TextBox_explenation" runat="server" Columns="32" Rows="5" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left">توضيحات
                        </td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right">
                            <asp:HyperLink ID="HyperLink_return" runat="server"
                                NavigateUrl="Enabled_employmentAD.aspx" EnableViewState="False">بازگشت</asp:HyperLink>
                        </td>
                        <td style="width: 30%" dir="rtl" align="right">
                            <asp:Button ID="Button_update_employment_ad" OnClick="Button_update_employment_ad_Click"
                                runat="server" Text=" اعمال تغييرات"></asp:Button>
                        </td>
                        <td style="width: 20%" dir="rtl" align="left"></td>
                    </tr>
                    <tr>
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right"></td>
                        <td style="width: 20%" dir="rtl" align="left"></td>
                    </tr>
                    <tr class="TD_Job">
                        <td style="width: 50%" dir="rtl" align="right"></td>
                        <td style="width: 30%" dir="rtl" align="right"></td>
                        <td style="width: 20%" dir="rtl" align="left"></td>
                    </tr>
                </tbody>
            </table>
            <%--job title--%><div class="InstedOfTable">
                &nbsp;
            </div>
            <div class="InstedOfTable">
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Label ID="Label_update_report" runat="server" Text="تغييرات شما با موفقيت اعمال شد"></asp:Label>
            <asp:HyperLink ID="HyperLink_return2" runat="server" NavigateUrl="Enabled_employmentAD.aspx">بازگشت</asp:HyperLink>
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_date" runat="server" />
</asp:Content>
