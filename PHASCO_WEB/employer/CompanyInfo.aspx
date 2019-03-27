<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Master_Phasco.Master"
    CodeBehind="CompanyInfo.aspx.cs" Inherits="Rahbina.Job.JobCapacity" %>

<asp:Content ContentPlaceHolderID="head_Meta" ID="content1" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" ID="content2" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptMnager1"></asp:ScriptManager>
 
    <div class="shop-widget">

        <h4>اطلاعات کارفرما</h4>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View3" runat="server">

                <table class="table no-border table-responsive text-center text-right rtl-text form-group margin-top-10">
                    <tbody>
                        <tr>
                            <td colspan="3">
                                <div class="alert alert-danger">
                                    كارفرماي گرامي شما اطلاعات خود را ثبت نكرده ايد . لطفا فرم زير را تكميل كنيد
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">نام شركت&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_coname" runat="server" MaxLength="48"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_coname" runat="server" ControlToValidate="TextBox_coname"
                                    ErrorMessage="RequiredFieldValidator" Text="نام موسسه را مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">نوع شركت&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:DropDownList ID="DropDownList_coType" runat="server" __designer:wfdid="w1">
                                    <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                    <asp:ListItem Text="خصوصي"></asp:ListItem>
                                    <asp:ListItem Text="دولتي"></asp:ListItem>
                                    <asp:ListItem Text="نيمه دولتي"></asp:ListItem>
                                    <asp:ListItem Text="نهاد انقلابي"></asp:ListItem>
                                    <asp:ListItem Text="تعاوني"></asp:ListItem>
                                    <asp:ListItem Text="ساير"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_coType" runat="server" ControlToValidate="DropDownList_coType"
                                    ErrorMessage="RequiredFieldValidator" InitialValue="--انتخاب كنيد--" Text="نوع موسسه را مشخص كنيد"
                                    ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">سال تاسيس&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:DropDownList ID="DropDownList_year" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator_regNo" runat="server"
                                ControlToValidate="TextBox_regNo" ErrorMessage="RequiredFieldValidator" Text="شماره ثبت موسسه را مشخص كنيد"
                                ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">شماره ثبت&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_regNo" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">حوزه فعاليت&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_ActivityScope" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator_ActivityScope" runat="server"
                                ControlToValidate="TextBox_ActivityScope" ErrorMessage="RequiredFieldValidator"
                                Text="حوزه فعاليت موسسه را مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">نام بالاترين مقام مسئول&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_High_resp_name" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidatorHigh_resp_name" runat="server"
                                ControlToValidate="TextBox_High_resp_name" ErrorMessage="RequiredFieldValidator"
                                Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">سمت بالاترين مقام مسئول&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_High_resp_Role" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator_High_resp_Role" runat="server"
                                ControlToValidate="TextBox_High_resp_Role" ErrorMessage="RequiredFieldValidator"
                                Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">نام شخص رابط&#160;&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_Link_person_name" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator_Link_person_name" runat="server"
                                ControlToValidate="TextBox_Link_person_name" ErrorMessage="RequiredFieldValidator"
                                Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">سمت شخص رابط&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_Link_person_role" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator_Link_person_role" runat="server"
                                ControlToValidate="TextBox_Link_person_role" ErrorMessage="RequiredFieldValidator"
                                Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">استان&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:DropDownList ID="DropDownList_state" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                                    Font-Size="X-Small" OnSelectedIndexChanged="DropDownList_state_SelectedIndexChanged">
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
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator_state" runat="server"
                                ControlToValidate="DropDownList_state" ErrorMessage="RequiredFieldValidator"
                                InitialValue="--انتخاب كنيد--" Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">شهر&#160;&#160;&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:DropDownList ID="DropDownList_city" runat="server" __designer:wfdid="w2" DataTextField="satate"
                                    DataValueField="id">
                                    <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList_city"
                                ErrorMessage="RequiredFieldValidator" InitialValue="--انتخاب كنيد--" Text=" مشخص كنيد"
                                ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">آدرس&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_address" runat="server" Columns="25" Rows="5" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;<asp:RequiredFieldValidator ID="RequiredFieldValidator_address" runat="server"
                                ControlToValidate="TextBox_address" ErrorMessage="RequiredFieldValidator" Text=" مشخص كنيد"
                                ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">كد پستي&#160;
                            </td>
                            <td align="right" dir="ltr" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_postalcode" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox_postalcode"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_postalcode" runat="server"
                                    ControlToValidate="TextBox_postalcode" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">صندوق پستي&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_postal_box" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_postal_box" runat="server"
                                    ControlToValidate="TextBox_postal_box" Display="Dynamic" ErrorMessage="RequiredFieldValidator"
                                    Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تلفن&#160;&#160;
                            </td>
                            <td align="right" dir="ltr" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_phone" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="TextBox_phone"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_phone" runat="server" ControlToValidate="TextBox_phone"
                                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">موبايل&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_mobile" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_mobile" runat="server" ControlToValidate="TextBox_mobile"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">فكس&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_fax" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_fax" runat="server" ControlToValidate="TextBox_fax"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_fax" runat="server" ControlToValidate="TextBox_fax"
                                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">پست الكترونيك&#160;
                            </td>
                            <td align="right" dir="ltr" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_email" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator_email" runat="server"
                                    ControlToValidate="TextBox_email" ErrorMessage="RegularExpressionValidator" Text="پست الكترونيك معتبر نيست"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="company"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator_email" runat="server" ControlToValidate="TextBox_email"
                                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" Text=" مشخص كنيد" ValidationGroup="company"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">وب سايت&#160;
                            </td>
                            <td align="right" dir="ltr" valign="top" width="30%">
                                <asp:Label ID="Label_web2" runat="server" Text="http://"></asp:Label>
                                <asp:TextBox ID="TextBox_web" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">ماموريت&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_duty" runat="server" Columns="25" Rows="5" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">چشم انداز&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_vision" runat="server" Columns="25" Rows="5" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">اطلاعات عمومي&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_public_info" runat="server" Columns="25" Rows="5" TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تركيب جنسيت پرسنل&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">&#160;
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد آقايان&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_men" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox_men"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد خانم ها
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_women" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="TextBox_women"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد دكترا&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_Dr" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_Dr" runat="server" ControlToValidate="TextBox_Dr"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد فوق ليسانس&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_post_lisans" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_post_lisans" runat="server" ControlToValidate="TextBox_post_lisans"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد ليسانس&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_lisans" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_lisans" runat="server" ControlToValidate="TextBox_lisans"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد فوق ديپلم&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_Post_diploma" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_Post_diploma" runat="server" ControlToValidate="TextBox_Post_diploma"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد ديپلم&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_diploma" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_diploma" runat="server" ControlToValidate="TextBox_diploma"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد زير ديپلم&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_under_diploma" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_under_diploma" runat="server" ControlToValidate="TextBox_under_diploma"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تركيب تحصيلات پرسنل&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%"></td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد سهامداران&#160;&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_stockholders" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator_stockholders" runat="server" ControlToValidate="TextBox_stockholders"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">نوع مالكيت&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:DropDownList ID="DropDownList_ownershipType" runat="server">
                                    <asp:ListItem Text="شخصي"></asp:ListItem>
                                    <asp:ListItem Text="استيجاري"></asp:ListItem>
                                    <asp:ListItem Text="اهدائي"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">نوع كاربري&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_usage" runat="server" MaxLength="49"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">تعداد شعب يا ادارات&#160;
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_branch" runat="server" MaxLength="3"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%">
                                <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="TextBox_branch"
                                    ErrorMessage="CompareValidator" Operator="DataTypeCheck" Text="لطفا فقط عدد وارد كنيد"
                                    Type="Double" ValidationGroup="company"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%">عضو نظام صنفي / اتحاديه / انجمن
                            </td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:TextBox ID="TextBox_union" runat="server"></asp:TextBox>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" valign="top" width="20%"></td>
                            <td align="right" dir="rtl" valign="top" width="30%">
                                <asp:Button ID="Button_insert_CoInfo" runat="server" OnClick="Button_insert_CoInfo_Click"
                                    Text="درج اطلاعات شركت" ValidationGroup="company"></asp:Button>
                                <asp:Button ID="Button_update_CoInfo" runat="server" OnClick="Button_update_CoInfo_Click"
                                    Text="ویرایش اطلاعات شركت" ValidationGroup="company"></asp:Button>
                            </td>
                            <td align="right" dir="rtl" valign="top" width="50%"></td>
                        </tr>
                    </tbody>
                </table>
                <%--company name--%>
                <%--company type--%>
            </asp:View>
            <asp:View ID="view2" runat="server">
                <asp:Label ID="label_continue" Text="" runat="server"></asp:Label>
                <a href="employer.aspx">ادامه</a>
            </asp:View>
            <%--edit an existing profile--%>
        </asp:MultiView>
    </div>
</asp:Content>
