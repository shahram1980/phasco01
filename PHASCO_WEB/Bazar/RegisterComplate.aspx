<%@ Page Title="" Language="C#" MasterPageFile="~/bazar/Template/Biztbiz.Master"
    AutoEventWireup="true" EnableEventValidation="false" CodeBehind="RegisterComplate.aspx.cs"
    Inherits="BiztBiz.RegisterComplate" %>

<%@ Register Assembly="dotNetFreak.WebControls.FormShield" Namespace="dotNetFreak.WebControls"
    TagPrefix="dnf" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
        ScriptMode="Release">
    </ajaxToolkit:ToolkitScriptManager>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="col-md-6 col-md-offset-3 pull-right padd25 boxshadow margin-top-15" style="padding-top: 25px;">
                <h3>تکمیل فرم ثبت نام </h3>

                <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px; padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </div>

                <div class="form-horizontal margin-bottom-5">
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right">نوع فعالیت :</label>
                        <asp:RadioButtonList ID="rdbListUserTypes" RepeatLayout="Flow" runat="server" RepeatColumns="4" RepeatDirection="Horizontal"
                            CssClass="col-sm-9 text-right rtl-text radio-list">
                            <asp:ListItem Text="فروشنده" Value="1"></asp:ListItem>
                            <asp:ListItem Text="خریدار" Value="2"></asp:ListItem>
                            <asp:ListItem Text="هردو" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <style>
                        .radio-list label {
                        }

                        .radio-list input {
                            margin-left: 5px;
                            margin-right: 15px !important;
                        }
                    </style>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">ایمیل تجاری:</label>
                        <div class="col-sm-9 col-xs-12">
                            <asp:TextBox ID="TextBox_Uid_Email" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">نام  : *</label>
                        <div class="col-sm-9 col-xs-12">
                            <asp:TextBox ID="TextBox_Name" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <%--  <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                        *
                    </div>--%>
                        <span class="help-block">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Family"
                                ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                        </span>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">نام خانوادگی : *</label>
                        <div class="col-sm-9 col-xs-12">
                            <asp:TextBox ID="TextBox_Family" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <%--  <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                        *
                    </div>--%>
                        <span class="help-block">
                            <asp:RequiredFieldValidator  ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox_Family"
                                ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                        </span>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">شهر : </label>
                        <div class="col-sm-9 col-xs-12">
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/bazar/Services/BiztBizServices.asmx"
                                ServiceMethod="GetState" />
                            <div class="col-sm-6">
                                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                                ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                                ServicePath="~/bazar/Services/BiztBizServices.asmx" Category="City" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right">زمینه اصلی فعالیت: *</label>
                        <div class="col-sm-9  col-xs-12">

                            <asp:DropDownList ID="DropDownList_Indus" runat="server" CssClass="log-login-ddl-item">
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">شماره تلفن : *</label>
                        <div class="col-sm-9  col-xs-12">
                            <asp:TextBox ID="TextBox_Tel_A_Number" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div style="float: right;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox_Tel_A_Number"
                                ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">شماره فکس : *</label>
                        <div class="col-sm-9 col-xs-12">
                            <asp:TextBox ID="TextBox_Fax" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div style="float: right;">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Fax"
                                ValidationGroup="complateRegister" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">شماره همراه : *</label>
                        <div class="col-sm-9 col-xs-12">
                            <asp:TextBox ID="TextBox_Mobile" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">آدرس : </label>
                        <div class="col-sm-9 col-xs-12">
                            <input class="form-control" name="Text3" type="text" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label pull-right rtl-text">وب سایت :</label>
                        <div class="col-sm-9 col-xs-12">
                            <input class="form-control" name="Text3" type="text" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <asp:CheckBox ID="CheckBox1" CssClass="rtl-text text-right" runat="server" Text="شرایط ثبت نام را قبول دارم *" />
                    </div>
                    <div id="div1" class="col-md-6 rtl-text" style="height: 150px; overflow: auto;">
                        <div style="direction: rtl; text-align: justify;">
                            <p>
                                شرایط و مقررات استفاده از بازار فاسکو برای بازديدکنندگان، اعضاء و كاربران وب‌سایت
                        فاسكو :
                        <br />
                                <br />
                                1. ‌سایت فاسکو دات کام/بازار (phasco.com/bazar)، که از این پس سایت فاسكو خوانده
                        می‌شود، محلی برای ایجاد صفحات و نمایش اطلاعات و مشخصات فني و كاربردي محصولات، خدمات
                        و توانمندي هاي کاربران بوده و سايت فاسكو هیچگونه مسوولیتی در قبال صحت و درستي محتویات
                        صفحات و نمایش اطلاعات و مشخصات فني و كاربردي محصولات، خدمات و توانمندي هاي کاربران
                        ندارد و بازدیدکنندگان باید قبل از انجام هرگونه استفاده و معامله، شخصاً نسبت به تایید
                        و اخذ اطلاعات از روش های متعارف اقدام نمايند.<br />
                                <br />
                                &nbsp;2. هر کسب‌و‌کاري فقط می تواند یک حساب کاربری در سايت بازار فاسکو داشته باشد،
                        چنانچه بیش از یک حساب کاربری برای یک کسب‌و‌کار ثبت شود، حساب‌های جدیدتر بدون اطلاع
                        قبلي حذف خواهند شد.
                        <br />
                                <br />
                                3. ‌سایت فاسکو دات کام/بازار (phasco.com/bazar)تابع قوانین و مقررات کشور جمهوری
                        اسلامی ایران بوده و اطلاعات وارد شده توسط اعضاء و كاربران که مغایر با این قوانین
                        تشخیص داده شود بدون اطلاع قبلی حذف یا مسدود خواهد شد.<br />
                                <br />
                                &nbsp;4. ارسال هرگونه پیام غیر تجاری، سياسي، غير اخلاقي یا نامرتبط توسط اعضاء و
                        كاربران سايت فاسكو در امکانات بازار غیر مجاز و غير قانوني بوده و بازار فاسکو تمامی
                        پیام‌های ارسالی را بررسی و بدون اطلاع قبلي حذف می‌نماید.<br />
                                <br />
                                &nbsp;5. با دریافت پیام و آگهي هاي اطلاع رساني و بازرگاني از طرف 
	سایت فاسکو موافقت می‌کنم.<br />

                                <br />
                                &nbsp;6. تنها کسب‌و‌کارهای قانونی، مجاز و ثبت شده می‌توانند در سايت بازار فاسکو
                        عضو شوند و در صورت ضرورت و تشخيص سايت بازار فاسكو تصویر مدارک شغلی و تائيديه محصولات
                        از كاربران اخذ مي نمايد.
                      <br />
                                <br />
                                &nbsp;
                         7. اعضاء و كاربران با ایجاد حساب کاربری به نام یک کسب‌و‌کار
                        تایید می‌کند که به عنوان نماینده تام الاختيار آن کسب‌و‌کار اجازه ثبت اطلاعات را
                        در سايت بازار فاسكو دارند و مسئوليت عدم توجه به مالكيت هاي حقوقي و مادي آن كسب و
                        كار را شخصاً بر عهده مي گيرد و خسارت هاي ناشي از اين بي توجهي را شخصاً برعهده و
                        متقبل مي شوند.<br />
                                <br />
                                &nbsp;8. اعضاء و كاربران مسئول مستقیم اطلاعات ارسالی و وارد شده در سایت می‌باشند
                        و مسئوليت هرگونه شکایت و اعتراض در مورد محتوای اطلاعات از جمله (و نه محدود به) نادیده
                        گرفتن مالکیت معنوی (CopyRight) یا اصول اخلاقی را بطور كامل و صددرصد بر عهده مي گيرند
                        و شخصاً پاسخگو مي باشند.<br />
                                <br />
                                &nbsp;9. صاحبان کسب‌و‌کارها نیز می‌توانند به صورت کتبی درخواست تملک حساب کاربری
                        ایجاد شده به نامشان را بنمایند، در این صورت بازار فاسکو صحت ادعا را تلفنی تایید
                        خواهد نمود.<br />
                                <br />
                                &nbsp;10. درج شماره حساب بانکی در اطلاعات کسب‌و‌کار‌ها به هیچ صورتی مجاز نمی‌باشد.<br />
                                <br />
                                &nbsp;11. حفاظت از رمز عبور سایت فاسكو بر عهده خود اعضاء و كاربران می‌باشد و سایت
                        فاسكو هيچگونه مسوولیتی در مورد سوء استفاده از نام کاربری و رمز عبور اعضاء و كاربران
                        را بر عهده ندارد.<br />
                                <br />
                                &nbsp;12. اطلاعات وارده یا ویرایش شده توسط اعضاء و كاربران بلافاصله در سایت به روز
                        رساني و نمایش داده می‌شود ولی برای نمایش در نتیجه جستجوها و همچنین صفحه اول سایت
                        باید بوسیله مدیران سایت تایید گردد.<br />
                                <br />
                                &nbsp;13. سایت فاسكو هيچگونه تعهدی برای نگهداری اطلاعات و فایل‌ها بر روی سرور خود
                        ندارد و در شرایط خاص يا پيش بيني نشده ممکن است اطلاعات و فایل‌های اعضاء و كاربران
                        بدون اطلاع قبلی حذف گردند.<br />
                                <br />
                                &nbsp;14. اطلاعات و فایل‌های ذخیره شده اعضاء و كاربران که ناقض قوانین سایت باشند،
                        بدون اطلاع قبلی حذف می‌شوند.<br />
                                <br />
                                &nbsp;15. حساب‌های اعضاء و كاربران که مورد سوء استفاده یا دست کاری قرار گیرند، بدون
                        اطلاع قبلی حذف می‌شوند.<br />
                                <br />
                                &nbsp;16. محصولات یا خدماتی که فروش، عرضه یا تبلیغ آنها نیاز به مجوز قانونی دارد
                        از جمله (و نه محدود به) محصولات بهداشتی، در صورتی تایید می‌گردند که تصویر مجوز مربوطه
                        در قسمت تصاویر آنها ثبت شود.<br />
                                <br />
                                &nbsp;17. آگهی محصولات یا خدمات زیر در سایت تایید نمی‌شوند:
                            </p>
                            <ul>
                                <li>محصولات یا خدماتی که فروش، مصرف یا ارائه آنها مغایر قوانین جمهوری اسلامی ایران باشند
                                </li>
                                <li>آگهی‌هایی که به طور واضح به محصول و یا خدمات اشاره نمی‌کنند</li>
                                <li>محصولاتی که به طور آشکارا قوانین مالکیت معنوی (کپی رایت) را نقض کرده باشند</li>
                                <li>بازی‌های رایانه ای که در ایران تولید نشده باشند</li>
                                <li>فیلم، سریال و موسیقی، حتی با مجوز</li>
                                <li>محصولات زناشویی، حتی با مجوز</li>
                                <li>آگهی فروش مستقیم هر نوع دارو حتی گیاهی</li>
                                <li>فروش پایان‌نامه یا پروژه انجام شده دانشجویی</li>
                            </ul>
                            <br />
                            <br />
                            18. سایت ممکن است تغییراتی در شرایط و مقررات استفاده (Terms of Use) اعمال کند که
                    در این صورت، کاربران سایت از طریق اعلان در سایت از این تغییرات آگاه خواهند شد.
                        </div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="form-group">
                        <asp:Button ID="ImageButton_CreateAccount" Text="ثبت اطلاعات" runat="server" CssClass="btn btn-primary pull-left" OnClick="ImageButton_CreateAccount_Click" ValidationGroup="complateRegister" />

                    </div>

                </div>

            </div>







        </asp:View>
        <asp:View ID="View2" runat="server">
            <table cellpadding="0" class="style5">
                <tr>
                    <td align="center">
                        <img alt="" height="155" src="images/haer-reg.jpg" width="872" />
                    </td>
                </tr>
                <tr>
                    <td class="style6"></td>
                </tr>
                <tr>
                    <td align="center">
                        <table cellpadding="0" style="width: 880px;">
                            <tr>
                                <td style="width: 640px;">
                                    <img alt="" src="images/welreg.JPG" />
                                </td>
                                <td style="width: 240px; vertical-align: middle;">
                                    <p align="center">
                                        <font face="Tahoma" size="2"><b>با تشکر<br>
                                            <br>
                                        </b>&nbsp;ثبت نام شما با موفقیت انجام شد<br>
                                            خواهشمند است با <a href="/bazar/MyBiztBiz/">ورود به دفتر کار </a>اطلاعات خود را
                                            کاملتر نمائید. </font>
                                    </p>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
            کاربر گرامی اطلاعات تجاری شما پیدا نشد. جهت پیگیری و راه اندازی یک پیام به کاربر
            "admin" سایت بزنید و درخواست فعال سازی نمائید.
        </asp:View>
    </asp:MultiView>
</asp:Content>
