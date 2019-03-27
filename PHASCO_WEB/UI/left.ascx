<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="left.ascx.cs" Inherits="phasco_webproject.UI.left" %>

<script language="C#" runat="server">

    public string Mss_Date(string date)
    {
        DateTime dtm = new DateTime();
        dtm = Convert.ToDateTime(date);
        Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

        return sunDate.Weekday.ToString();
    }
    public string Set_Image(int image)
    {
        if (image == 1) return "\\phascoupfile\\Userphoto\\" + image + ".jpg";
        else if (image == 0) return "\\phascoupfile\\Userphoto\\Nopic.jpg";
        return "\\phascoupfile\\Userphoto\\Nopic.jpg";
    }

    public string Counter()
    {
        int count = int.Parse(HiddenField_Counter.Value.ToString());
        count = count + 1;
        HiddenField_Counter.Value = count.ToString();
        if (count <= 3)
        { return "<img src='/images/Phascp_Icon_Users.jpg' title='برترین کابران' /> : "; }
        return count.ToString() + " : ";
    }
</script>
<script lang="javascript">
    function popUp1(N) {


        //$("#modal-body").load(N);
        //$("#popup-modal").modal("show");
        newWindow = window.open(N, 'popUp', 'toolbar=no,menubar=no,resizable=yes,scrollbars=yes,status=no,location=no,width=800,height=600');
    }
</script>

<%--<div class="shop-widget">
    <h4>تبلیغات</h4>

    <ul class="widget-item">
        <li>
            <object
                classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,260,0"
                id="phasco-standard-4"
                width="100%">
                <param name="movie" value="\phascoupfile\BrandFlash\phasco-standard-4.swf">
                <param name="bgcolor" value="#FFFFFF">
                <param name="quality" value="high">
                <param name="seamlesstabbing" value="false">
                <param name="allowscriptaccess" value="samedomain">
                <embed
                    type="application/x-shockwave-flash"
                    pluginspage="http://www.adobe.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
                    name="pharmed-1"
                    width="232" height="182"
                    src="\phascoupfile\BrandFlash\phasco-standard-4.swf"
                    bgcolor="#FFFFFF"
                    quality="high"
                    seamlesstabbing="false"
                    allowscriptaccess="samedomain">
                    <noembed>
          </noembed>
                </embed>
            </object>
        </li>
        <li>
            <object width="100%" data="\phascoupfile\BrandFlash\PhascoBanner1.swf"></object>
        </li>
        <li>
            <object
                classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,260,0"
                id="phasco-standard-4" width="100%">
                <param name="movie" value="\phascoupfile\BrandFlash\phasco-standard-4.swf">
                <param name="bgcolor" value="#FFFFFF">
                <param name="quality" value="high">
                <param name="seamlesstabbing" value="false">
                <param name="allowscriptaccess" value="samedomain">
                <embed
                    type="application/x-shockwave-flash"
                    pluginspage="http://www.adobe.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"
                    name="pharmed-1"
                    width="100%"
                    src="\phascoupfile\BrandFlash\phasco-standard-4.swf"
                    bgcolor="#FFFFFF"
                    quality="high"
                    seamlesstabbing="false"
                    allowscriptaccess="samedomain">
                    <noembed>
          </noembed>
                </embed>
            </object>
        </li>
        <li>
            <object width="100%" data="\phascoupfile\BrandFlash\PhascoBanner1.swf"></object>

        </li>
        <li>
            <a title="دستگاه اتو آنالايزر الايزا و كمولومينسنس|ThunderBolt full automated ELISA & CLIA Proccessor System" href="http://phasco.com/Video/watch.aspx?Vid=187&t=%D8%AF%D8%B3%D8%AA%DA%AF%D8%A7%D9%87%20%D8%A7%D8%AA%D9%88%20%D8%A2%D9%86%D8%A7%D9%84%D8%A7%D9%8A%D8%B2%D8%B1%20%D8%A7%D9%84%D8%A7%D9%8A%D8%B2%D8%A7%20%D9%88%20%D9%83%D9%85%D9%88%D9%84%D9%88%D9%85%D9%8A%D9%86%D8%B3%D9%86%D8%B3|ThunderBolt%20ELISA%20&%20CLIA%20Proccessor%20System">
                <img alt="دستگاه اتو آنالايزر الايزا و كمولومينسنس|ThunderBolt full automated ELISA & CLIA Proccessor System" src="/images/ADV/ThunderBolt.jpg" />
            </a>
        </li>

        <li>
            <a href="bazar/">
                <img alt="بازار بزگ خدمات و ملزومات آزمایشگاهی و پزشکی" src="/images/ADV/banner-bazar.jpg" />
            </a>
        </li>

        <li>
            <a href="\RealTimeBook.aspx">
                <img src="/images/ADV/RealTime.jpg" />
            </a>
        </li>

    </ul>

</div>--%>

<div class="shop-widget">
    <h4>هیئت علمی سایت فاسکو</h4>
    <ul class="widget-item">
        <li>
            <h6><a href="/AllTopUser.aspx?upu=true">اعضاء هیئت علمی سایت
            </a></h6>
        </li>


    </ul>
</div>
<div class="shop-widget">
    <h4>معرفی سایت به دوستان</h4>
    <div class="price-range contact-form">
        <div class="text-input">
            <div class="float-input">

                <asp:TextBox ID="txtEmail" runat="server" placeholder="آدرس ایمیل"></asp:TextBox>
                <span><i class="fa fa-envelope"></i></span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ValidationGroup="Invite"
                    ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>

            </div>

            <div>

                <asp:Button ID="SendEmail" CssClass="full-width" runat="server" OnClick="SendEmail_Click" Text="ارسال شود"
                    ValidationGroup="name" /><br />
                <asp:Label runat="server" ID="lbl_Alaram" ForeColor="Maroon" />


            </div>
        </div>
    </div>
</div>

<script>
    $("#<%= txtEmail.ClientID %>").keyup(function (event) {
        if (event.keyCode == 13) {
            $("#<%= SendEmail.ClientID %>").click();
        }
    });
</script>
<div class="shop-widget">
    <h4>جستجوی دوستان و کاربران </h4>
    <div class="price-range contact-form">
        <div class="text-input">
            <div class="float-input">
                <asp:TextBox ID="txt_name" runat="server" placeholder="نام کاربری یا نام و نام خانوادگی"></asp:TextBox>

            </div>

            <div>
                <asp:Button ID="btn_search" CssClass="full-width" runat="server" OnClick="btn_search_Click"
                    Text="جستجو" ValidationGroup="name" />



            </div>
        </div>
    </div>
</div>
<script>
    $("#<%= txt_name.ClientID %>").keyup(function (event) {
        if (event.keyCode == 13) {
            $("#<%= btn_search.ClientID %>").click();
        }
    });
</script>

<div class="shop-widget">
    <h4>برترین کاربران</h4>
    <ul class="widget-item">
        <li>
            <h6><a href="/UserRating.aspx">جدول رده بندی
                                        برترین کاربران </a>
            </h6>
        </li>
       <%-- <li>
            <h6><a href="javascript:popUp1('Userpoint.aspx')">نحوه امتیاز 
                                    گیری در رقابت علمی فاسکو </a></h6>
        </li>
        <li>
            <h6><a href="/artpro.aspx">شرایط پذیرش مقالات
            </a></h6>
        </li>--%>


    </ul>
</div>


<%--<div class="shop-widget">
    <h4>محصولات فاسکو</h4>
    <ul class="widget-item">
        <li>
            <h6><a href="http://phasco.com/pdf/GSD-ThunderBolt-Catalogue.pdf" target="_blank">كاتالوگ دستگاه اتوآنالایزر كمي لومينسنس و الایزا Thunderbolt</a>

            </h6>
        </li>

        <li>
            <h6><a href="javascript:popUp1('/Biokit.htm')">مشخصات&nbsp;
                                        کیت های&nbsp; BIOKIT</a></h6>
        </li>
        <li>
            <h6><a href="javascript:popUp1('/CALBIOTECH.htm')" title="مشخصات  CALBIOTECH  صفحه اول">مشخصات&nbsp; کیت های CALBIOTECH </a></h6>
        </li>
        <li>
            <h6><a href="javascript:popUp1('/Viroimmun1.htm')" title="مشخصات  VIRO-IMMUN صفحه اول">مشخصات&nbsp; کیت های VIRO-IMMUN</a></h6>

        </li>
    </ul>
</div>--%>



<div class="shop-widget">
    <h4>چاپ فرم های آزمایشگاهی</h4>
    <ul class="widget-item">
        <li>
            <h6><a href="javascript:popUp1('/ch2.htm')" title="مشخصات  VIRO-IMMUN صفحه اول">فرم ثبت دمای انکوباتور</a>
            </h6>
        </li>
        <li>
            <h6><a href="javascript:popUp1('/ch1.htm')">فرم هدایت الکتریکی آب مقطر </a>
            </h6>
        </li>
        <li>
            <h6><a href="javascript:popUp1('/ch3.htm')" title="مشخصات  CALBIOTECH  صفحه اول">فرم ثبت
                                        دمای یخچال </a></h6>
        </li>

    </ul>
</div>
<%--<div class="shop-widget">
    <h4>برترين كاربران دهمین دوره رقابت فاسكو</h4>

    <ul class="widget-item">


        <asp:Repeater ID="Repeater_Top_User" runat="server" EnableViewState="false">
            <ItemTemplate>

                <li>
                    <h6><i class="fa fa-user margin-left-5"></i><a href="/UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>"><%#DataBinder.Eval(Container.DataItem, "Uid")%> (امتیاز
        <%#DataBinder.Eval(Container.DataItem, "Point")%>)</a>
                </li>
                </h6>
            </ItemTemplate>
        </asp:Repeater>


        <li>
            <h6><a href="/AllTopUser.aspx">لیست کامل برترین های فاسکو</a></h6>
        </li>
    </ul>
</div>--%>

<div id="popup-modal" class="modal fade" role="dialog">

    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
            </div>
            <div class="modal-body" id="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
            </div>
        </div>
    </div>
</div>

<asp:HiddenField ID="HiddenField_Counter" runat="server" Value="0" />
