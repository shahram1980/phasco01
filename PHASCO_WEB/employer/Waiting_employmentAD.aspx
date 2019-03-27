<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="Waiting_employmentAD.aspx.cs" Inherits="Rahbina.Job.Waiting_employmentAD" %>

<asp:Content ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:ScriptManager ID="ScriptManger1" runat="server"></asp:ScriptManager>
    <h3>آگهی های غیر فعال و تائید نشده</h3>

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <br />
            <%-- view summary of advertisments--%>
            <asp:GridView ID="GridView_waiting_ad" runat="server" AllowPaging="true" EnableViewState="false"
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
                        DataNavigateUrlFormatString='Waiting_employmentAD.aspx?id={0}' />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:View>
        <%--   view and edit advertisment--%><asp:View ID="View2" runat="server">
            <table class="table no-border table-responsive text-center text-right rtl-text form-group margin-top-30" >
                <tbody>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_job_title" runat="server" Text="زمينه فعاليت">

                            </asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_job_title" runat="server" OnSelectedIndexChanged="DropDownList_job_title_SelectedIndexChanged"
                                DataValueField="CategoryID" DataTextField="CategoryName" AppendDataBoundItems="true"
                                AutoPostBack="true">
                                <asp:ListItem Text="--انتخاب كنيد--" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_job_title" runat="server"
                                ErrorMessage="RequiredFieldValidator" ValidationGroup="company" Text="لطفا يك مورد را انتخاب كنيد"
                                ControlToValidate="DropDownList_job_title"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_specialty" runat="server" Text="زمينه تخصصي">

                            </asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_specialty" runat="server" DataValueField="CategoryID"
                                DataTextField="CategoryName" __designer:wfdid="w1">
                            </asp:DropDownList>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_specialty" runat="server"
                                ErrorMessage="RequiredFieldValidator" ValidationGroup="company" Text="لطفا يك مورد را انتخاب كنيد"
                                ControlToValidate="DropDownList_specialty"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_coname" runat="server" Text="نام شركت / موسسه"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:TextBox CssClass="form-control" ID="TextBox_coname" runat="server" MaxLength="48"></asp:TextBox>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_coname" runat="server" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="company" Text="نام موسسه را مشخص كنيد" ControlToValidate="TextBox_coname"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_call_timeOut" runat="server" Text="مهلت تماس تا"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:TextBox CssClass="form-control" ID="TextBox_call_timeOut" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label2" runat="server" Text="آدرس "></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:TextBox CssClass="form-control" ID="TextBox_address" runat="server" Columns="40"></asp:TextBox>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_state" runat="server" Text="استان محل كار"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">

                            <asp:DropDownList  CssClass="form-control" ID="DropDownList_state" runat="server"
                                AutoPostBack="True" 
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
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_state" runat="server" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="company" Text=" مشخص كنيد" ControlToValidate="DropDownList_state"
                                InitialValue="--انتخاب كنيد--"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_city" runat="server" Text=" شهر محل كار"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_city" runat="server" DataValueField="id" DataTextField="city"
                                __designer:wfdid="w2">
                                <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="company" Text=" مشخص كنيد" ControlToValidate="DropDownList_city"
                                InitialValue="--انتخاب كنيد--"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 19px" dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_education" runat="server" Text="مقطع تحصيلي"></asp:Label>
                        </td>
                        <td style="height: 19px" dir="rtl" valign="top" align="right" width="30%">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_education_step" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="زير ديپلم"></asp:ListItem>
                                <asp:ListItem Text="ديپلم"></asp:ListItem>
                                <asp:ListItem Text="فوق ديپلم"></asp:ListItem>
                                <asp:ListItem Text="ليسانس"></asp:ListItem>
                                <asp:ListItem Text="فوق ليسانس"></asp:ListItem>
                                <asp:ListItem Text="دكترا"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 50%; height: 19px" dir="rtl" valign="top" align="right"></td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label3" runat="server" Text="سال"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:TextBox CssClass="form-control" ID="TextBox_experience" runat="server" MaxLength="2" Columns="2"></asp:TextBox>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator"
                                Text="فقط عدد وارد كنيد" ControlToValidate="TextBox_experience" Type="Double"
                                Operator="DataTypeCheck"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_experience" runat="server" Text="سابقه كار"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%"></td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_gender" runat="server" Text="جنسيت"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_gender" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="مرد"></asp:ListItem>
                                <asp:ListItem Text="زن"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_marriage" runat="server" Text="وضعيت تاهل "></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_marriage" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="مجرد"></asp:ListItem>
                                <asp:ListItem Text="متاهل"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_service" runat="server" Text="وضعيت نظام وضيفه"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_service" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="پايان خدمت"></asp:ListItem>
                                <asp:ListItem Text="معافيت غير پزشكي"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_age" runat="server" Text="حداقل و حداكثر سن"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_age" runat="server">
                                <asp:ListItem Text="مهم نيست"></asp:ListItem>
                                <asp:ListItem Text="بين 20 تا 30 سال"></asp:ListItem>
                                <asp:ListItem Text="بين 30 تا 40 سال "></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_phone" runat="server" Text="تلفن هاي تماس"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:TextBox CssClass="form-control" ID="TextBox_phone" runat="server" Columns="40"></asp:TextBox>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"
                                Text="فقط عدد وارد كنيد" ControlToValidate="TextBox_phone" Type="Double" Operator="DataTypeCheck"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator"
                                Text="مشخص كنيد" ControlToValidate="TextBox_phone" Display="Dynamic"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%">
                            <asp:Label ID="Label_explenation" runat="server" Text="توضيحات"></asp:Label>
                        </td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:TextBox CssClass="form-control" ID="TextBox_explenation" runat="server" Columns="32" Rows="5" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator"
                                Text="مشخص كنيد" ControlToValidate="TextBox_explenation"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%"></td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:Button ID="Button_update_employment_ad" CssClass="btn btn-primary" OnClick="Button_update_employment_ad_Click"
                                runat="server" Text=" اعمال تغييرات"></asp:Button>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right">
                            <a href="Waiting_employmentAD.aspx">بازگشت</a>
                        </td>
                    </tr>
                    <tr>
                        <td dir="rtl" valign="top" align="left" width="20%"></td>
                        <td dir="rtl" valign="top" align="right" width="30%">
                            <asp:Label ID="Label_confirm" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                        </td>
                        <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                    </tr>
                </tbody>
            </table>


        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Label ID="Label_update_report" runat="server" Text="تغييرات شما با موفقيت اعمال شد"></asp:Label>
            <a href="Waiting_employmentAD.aspx">بازگشت</a>
        </asp:View>
    </asp:MultiView>
</asp:Content>
