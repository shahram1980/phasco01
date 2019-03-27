<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="UploadVideo.aspx.cs" MasterPageFile="~/Template/Master_Phasco.Master"
    Inherits="PHASCO_WEB.Video.UploadVideo" %>

<%@ Register Src="~/UI/Membership.ascx" TagName="Membership" TagPrefix="uc1" %>
<%@ Register Src="~/UI/left.ascx" TagName="left" TagPrefix="uc2" %>
<%@ Register Src="~/Template/UI/TopMenu.ascx" TagName="TopMenu" TagPrefix="uc6" %>
<%@ Register Src="~/UI/NewsFlash.ascx" TagName="NewsFlash" TagPrefix="uc3" %>
<%@ Register Src="~/UI/footer.ascx" TagName="footer" TagPrefix="uc4" %>
<%@ Register Src="~/UI/header.ascx" TagName="header" TagPrefix="uc5" %>
<%@ Register Src="~/Template/UI/googlesearch.ascx" TagName="googlesearch" TagPrefix="uc7" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head_Meta" runat="server">

    <link rel="Stylesheet" type="text/css" href="Upload_scripts/uploadify.css" />
    <script type="text/javascript" src="Upload_scripts/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="Upload_scripts/jquery.uploadify.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" language="JavaScript" src="Javaloading/progress.js"></script>
    <script type="text/javascript">
        hs.registerOverlay({
            overlayId: 'closebutton',
            position: 'top right',
            fade: 2
        });

        hs.graphicsDir = 'Java_High_Slide/graphics/';
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Plc_Mid" runat="server">
    <!-- Start of StatCounter Code -->
    <script type="text/javascript" lang="javascript">
        var sc_project = 2148620;
        var sc_invisible = 1;
        var sc_partition = 19;
        var sc_security = "8d4ac34d";
        var sc_remove_link = 1;
    </script>
    <!-- End of StatCounter Code -->
    <!-- --------------------------- New Theme Styles ------------------------------- -->
    <script type="text/javascript" src="js/ajaxtabs.js"></script>
    <script type="text/javascript">
        var billboardeffects = ["GradientWipe(GradientSize=1.0 Duration=0.7)", "Inset", "Iris", "Pixelate(MaxSquare=5 enabled=false)", "RadialWipe", "RandomBars", "Slide(slideStyle='push')", "Spiral", "Stretch", "Strips", "Wheel", "ZigZag"]

        var tickspeed = 6000
        var effectduration = 2000
        var hidecontent_from_legacy = 1

        var filterid = Math.floor(Math.random() * billboardeffects.length)

        document.write('<style type="text/css">\n')
        if (document.getElementById)
            document.write('.billcontent{display:none;\n' + 'filter:progid:DXImageTransform.Microsoft.' + billboardeffects[filterid] + '}\n')
        else if (hidecontent_from_legacy)
            document.write('#contentwrapper{display:none;}')
        document.write('</style>\n')

        var selectedDiv = 0
        var totalDivs = 0

        function contractboard() {
            var inc = 0
            while (document.getElementById("billboard" + inc)) {
                document.getElementById("billboard" + inc).style.display = "none"
                inc++
            }
        }

        function expandboard() {
            var selectedDivObj = document.getElementById("billboard" + selectedDiv)
            contractboard()
            if (selectedDivObj.filters) {
                if (billboardeffects.length > 1) {
                    filterid = Math.floor(Math.random() * billboardeffects.length)
                    selectedDivObj.style.filter = "progid:DXImageTransform.Microsoft." + billboardeffects[filterid]
                }
                selectedDivObj.filters[0].duration = effectduration / 1000
                selectedDivObj.filters[0].Apply()
            }
            selectedDivObj.style.display = "block"
            if (selectedDivObj.filters)
                selectedDivObj.filters[0].Play()
            selectedDiv = (selectedDiv < totalDivs - 1) ? selectedDiv + 1 : 0
            setTimeout("expandboard()", tickspeed)
        }

        function startbill() {
            while (document.getElementById("billboard" + totalDivs) != null)
                totalDivs++
            if (document.getElementById("billboard0").filters)
                tickspeed += effectduration
            expandboard()
        }

        if (window.addEventListener)
            window.addEventListener("load", startbill, false)
        else if (window.attachEvent)
            window.attachEvent("onload", startbill)
        else if (document.getElementById)
            window.onload = startbill
    </script>
    <!-- --------------------------- New Theme Styles ------------------------------- -->

    <table class="table table-responsive no-border">
        <tr>
            <td style="height: 700px;">
                <div style="padding: 5px 50px 0 0px; color: #fff; background: transparent url('/images/Video_UploadForm_Title.jpg') no-repeat scroll right top; height: 61px; width: 100%; direction: rtl;" runat="server" id="Div_Top_Alarm" visible="false">
                    کاربر گرامی وقت به خیر،
                                                    <br />
                    لطفاً تا پایان کار آپلود فایل
                                                    تان صبر کنید .&nbsp; پس از اتمام آپلود ویدئو و حذف شدن کادر
                                                    آپلود بر روی دکمه ثبت&nbsp;ویدئو کلیک نمائید .
                </div>
                <table class="table table-responsive no-border" dir="rtl" style="float: right;">
                    <tr>
                        <td style="height: 48px;">
                            <h3>آپلود ویدئو
                            </h3>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 10px; height: 452px; vertical-align: top; text-align: right;">

                            <asp:MultiView ID="MultiView1" runat="server">
                                <asp:View ID="View1" runat="server">
                                    <table class="table"  >
                                        <tr>
                                            <td>
                                                <div class="alert alert-warning" runat="server" id="alarmAgree">
                                                    <asp:Label runat="server" ID="Label_alarmAgree"></asp:Label>

                                                </div>
                                                <br />
                                                <p>
                                                    &nbsp;طی این توافقنامه شما متعهد می شوید که&nbsp; محتوای ویدئو ارسالی تان، از نوع موارد&nbsp;
                                                                    ذکر شده در زیر <span class="style19"><strong>نمی باشد</strong></span> :
                                                </p>
                                                <ul>
                                                    <li>ترسناک و رعب انگيز نمی باشد</li>
                                                    <li>دلخراش و غير اخلاقي نمی باشد</li>
                                                    <li>پوشش کم و نامناسب و مستهجن&nbsp; نمی باشد</li>
                                                    <li>اهانت آمیز به شخص، گروه و قوم خاصی&nbsp; نمی باشد</li>
                                                    <li>سياسي نمی باشد</li>
                                                </ul>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:CheckBox ID="CheckBox_Agree" runat="server"
                                                    Text="شرایط و قوانین بالا را مطالعه کرده و قبول دارم" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button runat="server" ID="ImageButton_agrement_NextLevel"
                                                Text="فرم آپلود ویدئو" CssClass="btn btn-primary"
                                                    OnClick="ImageButton_agrement_NextLevel_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View2" runat="server">

                                    <table class="table form-group" cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">

                                        <tr>
                                            <td style="width: 10%; text-align: left;"></td>
                                            <td style="width: 70%; text-align: right;">
                                                <asp:Label runat="server" ID="Lable_Alaram" />

                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="width: 10%; text-align: left;">نام کلیپ :
                                            </td>
                                            <td style="width: 70%; text-align: right;">
                                                <div class="input-bg-normal">
                                                    <asp:TextBox ID="TextBox_VideoName" runat="server" CssClass="Video-Upload-input-item form-control"></asp:TextBox>
                                                </div>
                                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                                    *
                                                </div>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                                                    ControlToValidate="TextBox_VideoName" Display="Dynamic" Text="باید تکمیل گردد"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 10%; text-align: left;">توضیحات کوتاه :
                                            </td>
                                            <td style="width: 70%; text-align: right;">
                                                <div class="multiinput-bg-normal">
                                                    <asp:TextBox ID="TextBox_VideoDescription" runat="server" TextMode="MultiLine" CssClass="multiinput-item form-control"></asp:TextBox>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 10%; text-align: left;">گروه :
                                            </td>
                                            <td style="width: 70%; text-align: right;">
                                                <asp:DropDownList ID="DropDownList_CategorieID" runat="server" DataSourceID="SqlDataSource1"
                                                    DataTextField="Categorie_Name" DataValueField="ID" CssClass="log-login-ddl-item">
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Phasco_NetConnectionString1 %>"
                                                    SelectCommand="SELECT [Categorie_Name], [ID] FROM [tblVideoCategorie]"></asp:SqlDataSource>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 10%; text-align: left;">کلمات کلیدی :
                                            </td>
                                            <td style="width: 70%; text-align: right;">

                                                <div class="input-bg-normal">
                                                    <asp:TextBox ID="TextBox_VideoTag" runat="server" CssClass="Video-Upload-input-item form-control"></asp:TextBox>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 10%; text-align: left;">تصویر پیش نمایش :
                                            </td>
                                            <td style="width: 70%; text-align: right;">
                                                <div class="fileupload-bg-normal">
                                                    <asp:FileUpload ID="FileUpload_Photo" runat="server" CssClass="fileupload-item form-control" />
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="width: 10%; text-align: left; vertical-align: top;">انتخاب ویدئو برای آپلود&nbsp; :</td>
                                            <td style="width: 70%; text-align: right;">
                                                <div style="padding: 5px">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="fileupload-item form-control" />
                                                    <asp:TextBox ID="txtNameVideo" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="width: 20%; text-align: left;">&nbsp;
                                            </td>
                                            <td style="width: 70%; text-align: right;">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 20%; text-align: left;"></td>
                                            <td style="width: 70%; text-align: right;">

                                                <asp:ImageButton ID="ImageButton_Nexttocomplete" runat="server"
                                                    ImageUrl="~\images\Video_UploadForm_Submit.jpg"
                                                    OnClick="Button_Nexttocomplete_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </asp:View>
                                <asp:View ID="View3" runat="server">
                                    <div class="alert alert-success">
                                        آپلود ویدئو با موفقیت انجام شد.<br />
                                        <br />
                                        کاربر گرامی وقت به خیر ،<br />
                                        ضمن تشکر و قدردانی از مشارکت تان در ارسال ویدئو،
                                                    به اطلاع می رساند که ویدئو دریافتی از شما پس از بررسی و تائید توسط admin سایت<br />
                                        برای عموم به نمایش در خواهد آمد.<br />
                                        <br />
                                        <br />
                                        علمی تر و با انگیزه تر باشید .<br />
                                        واحد انفورماتیک فاسکو<br />
                                    </div>

                                </asp:View>
                            </asp:MultiView>
                        </td>
                    </tr>
                </table>

                <div style="display: none">
                </div>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        $(window).load(
        function () {
            $("#<%=FileUpload1.ClientID %>").fileUpload({
                'uploader': 'Upload_scripts/uploader.swf',
                'cancelImg': 'Upload_scripts/cancel.png',
                'buttonText': 'Browse Files',
                'script': 'Upload.ashx?Name=' + document.getElementById('<%=txtNameVideo.ClientID%>').value,
                'folder': 'uploads',
                'fileDesc': 'Video Files',
                'fileExt': '*.flv',
                'multi': true,
                'auto': true
            });
        }
);
    </script>
</asp:Content>
