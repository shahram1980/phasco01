<%@ Page Title="" Language="C#" MasterPageFile="~/Bazar/Template/HomeBiztbiz.Master" AutoEventWireup="true" CodeBehind="ads.aspx.cs" Inherits="PHASCO_WEB.Bazar.ads" %>
<%@ Register Src="~/Bazar/UC/uscLastProduct.ascx" TagName="uscLastProduct" TagPrefix="uc1" %>
<%@ Register src="UC/uscInvite.ascx" tagname="uscInvite" tagprefix="uc2" %>
<%@ Register src="UC/uscInviteHome.ascx" tagname="uscInviteHome" tagprefix="uc5" %>
<%--<%@ Register src="../UI/uscAdvertisement.ascx" tagname="uscAdvertisement" tagprefix="uc6" %>--%>
<%@ Register Src="~/Bazar/UC/uscLastNews.ascx" TagName="uscLastNews" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscHomeCategory.ascx" TagName="uscHomeCategory" TagPrefix="uc4" %>
<%@ Register Src="~/Bazar/UC/uscAdvanceSearch.ascx" TagName="uscAdvanceSearch" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscRightCatHome.ascx" TagName="uscRightCatHome" TagPrefix="uc3" %>
<%@ Register Src="~/Bazar/UC/uscRegisterHome.ascx" TagName="uscRegisterHome" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
<table style="width: 1070px;" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 200px; vertical-align: top;">
                <table style="width: 195px">
               
                    <tr>
                        <td style="padding:0 0 5px 0;">
                            <uc3:uscRightCatHome ID="uscRightCatHome1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 0; padding-right: 3px;">
                            <uc3:uscRegisterHome ID="uscRegisterHome1" runat="server" />
                        </td>
                    </tr>
              
                
                    <tr>
                        <td style="padding: 5px 0; padding-left: 5px;">
                    
                            <uc5:uscInviteHome ID="uscInviteHome1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 0; padding-left: 5px;">
                            <table cellpadding="0" cellspacing="0" style="width: 190px; float: left">
                                <tr>
                                    <td style="background: transparent url('/Bazar/images/pi-pro-fram-3-top-right.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="/Bazar/images/new-fame-2-top-right.jpg" width="25" />
                                    </td>
                                    <td style="background: transparent url('/Bazar/images/new-fame-2-top-mid.jpg') repeat-x scroll center top;
                                        color: #3333ff; text-align: right;">
                                        <span class="frame-title2">مزایای ثبت نام در فاسکو</span>
                                    </td>
                                    <td style="background: transparent url('/Bazar/images/pi-pro-fram-3-top-left.jpg') no-repeat scroll center top;
                                        width: 25px; height: 34px">
                                        <img alt="" height="35" src="/Bazar/images/new-fame-2-top-left.jpg" width="25" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background: transparent url('/Bazar/images/pi-pro-fram-3-down-right.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid;">
                                        &nbsp;
                                    </td>
                                    <td style="background: #f9f9f9; color: #0196b4; text-align: right; line-height: 17px;
                                        border-bottom: 2px #ccc solid; padding-bottom: 10px;">
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="/Bazar/images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;font-size:12px;">
                                            عضو یکی از تخصصی ترین وب سایتهای صنعت پزشکی و آزمایشگاهی می شوید.
                                        </div>
                                        <div style="width: 135px; height: 10px; float: right; clear: both;">
                                        </div>
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="/Bazar/images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;font-size:12px;">
                                            کلیه محصولات خود را به همراه توضیحات و جزئیات به راحتی آگهی نمائید.
                                        </div>
                                        <div style="width: 135px; height: 10px; float: right; clear: both;">
                                        </div>
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="/Bazar/images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;font-size:12px;">
                                            صفحه مربوط به خود را در اینترنت داشته باشید .
                                        </div>
                                        <div style="width: 135px; height: 10px; float: right; clear: both;">
                                        </div>
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="/Bazar/images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;font-size:12px;">
                                            به سادگی وارد تجارت الکترونیک شده و طیف گسترده تر و وسیع تری از مشتریان را جذب نمائید
                                            .
                                        </div>
                                        <div style="width: 135px; height: 10px; float: right; clear: both;">
                                        </div>
                                        <div style="float: right; width: 4px; padding: 6px 0 0 3px;">
                                            <img src="/Bazar/images/arrow.png" alt="" width="4" height="7" />
                                        </div>
                                        <div style="float: right; width: 130px;text-align:justify;font-size:12px;">
                                            شرکت یا فروشگاه خود را در موتورهای جستجو نظیر گوگل و یاهو ببینید و به همگان معرفی
                                            نمائید.
                                        </div>
                                    </td>
                                    <td style="background: transparent url('/Bazar/images/pi-pro-fram-3-down-left.jpg') repeat-y scroll center top;
                                        width: 25px; height: 34px; border-bottom: 2px #ccc solid">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align: top;padding-top:0px;direction:rtl;text-align:right;">
          
                <table style="border-width: 1px 0px; border-top-style: solid; border-bottom-style: solid; border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231); outline: 0px; font-weight: normal; font-style: normal; font-size: 12px; font-family: Tahoma, Arial, Geneva, Helvetica, sans-serif; vertical-align: baseline; margin: 30px 0px 15px; padding: 0px; border-collapse: separate; border-spacing: 0px; width: 95%; color: rgb(0, 0, 0); font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
                    <tbody style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <th colspan="5" 
                                style="border: 0px; outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(119, 119, 119); line-height: 18px; text-align: right; direction: rtl; background-color: rgb(246, 246, 246); ">
                                هزینه آگهی براساس کلیک و نمایش</th>
                        </tr>
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <td class="fa" colspan="5" 
                                style="border-width: 1px 0px 0px; border-top-style: solid; border-top-color: rgb(231, 231, 231); outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(68, 68, 68); line-height: 18px; text-align: right; direction: rtl; ">
                                <div class="notes" 
                                    style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px 10px 0px 0px; ">
                                    <ol style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; list-style: decimal inside; ">
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            آگهی ها به 
                                            سه صورت بر اساس کلیک و نمایش&nbsp; و تاریخ محاسبه می شود. </li>
                                        
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            بدیهی است شما باید یکی از روش های نمایش آگهی را انتخاب نمایید. در صورتی که شما 
                                            مطمئن هستید محصول مورد تبلیغ شما طرفداران زیادی بین کاربران این سایت خواهد داشت، 
                                            روش بر اساس نمایش&nbsp; و در غیر این صورت روش بر اساس کلیک را&nbsp; به شما توصیه می کنیم.</li>
                                     
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            نرخ آگهی بسته به شرایط تغییر می‌کند و ثابت نمی باشد. لطفاً قبل از ارسال درخواست، با ایمیل <a href="mailto:advertise@phasco.com">advertise@phasco.com</a> 
                                            مکاتبه و مشاوره نمائید.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            حداقل مبلغ سفارش آگهی صد و پنجاه هزار تومان می باشد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            برای آگهی هایی که بدلیل مرتبط نبودن و خاص بودن مورد آگهی شده تعداد کلیک بسیار 
                                            پایینی میگیرند امکان تمدید به روش بر پایه کلیک مقدور نمی باشد.</li>
                                    </ol>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table style="border-width: 1px 0px; border-top-style: solid; border-bottom-style: solid; border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231); outline: 0px; font-weight: normal; font-style: normal; font-size: 12px; font-family: Tahoma, Arial, Geneva, Helvetica, sans-serif; vertical-align: baseline; margin: 30px 0px 15px; padding: 0px; border-collapse: separate; border-spacing: 0px; width:95%; color: rgb(0, 0, 0); font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
                    <tbody style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <th colspan="5" 
                                style="border: 0px; outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(119, 119, 119); line-height: 18px; text-align: right; direction: rtl; background-color: rgb(246, 246, 246); ">
                                اگهی بر اساس تعداد کلیک</th>
                        </tr>
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <td class="fa" colspan="5" 
                                style="border-width: 1px 0px 0px; border-top-style: solid; border-top-color: rgb(231, 231, 231); outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(68, 68, 68); line-height: 18px; text-align: right; direction: rtl; ">
                                <div class="notes" 
                                    style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px 10px 0px 0px; ">
                                    <ol style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; list-style: decimal inside; ">
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            هزینه این نوع آگهی بر اساس موضوع آگهی تغییر می نماید.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            در این نوع آگهی شما میتوانید، یک بنر&nbsp; یا 
                                            یک متن تبلیغاتی برای&nbsp; آگهی سایت / محصول / خدمت خود 
                                            استفاده نمایید.</li>
                                       
                                    </ol>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table style="border-width: 1px 0px; border-top-style: solid; border-bottom-style: solid; border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231); outline: 0px; font-weight: normal; font-style: normal; font-size: 12px; font-family: Tahoma, Arial, Geneva, Helvetica, sans-serif; vertical-align: baseline; margin: 30px 0px 15px; padding: 0px; border-collapse: separate; border-spacing: 0px; width: 95%; color: rgb(0, 0, 0); font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
                    <tbody style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <th colspan="5" 
                                style="border: 0px; outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(119, 119, 119); line-height: 18px; text-align: right; direction: rtl; background-color: rgb(246, 246, 246); ">
                                آگهی بر اساس تعداد نمایش</th>
                        </tr>
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <td class="fa" colspan="5" 
                                style="border-width: 1px 0px 0px; border-top-style: solid; border-top-color: rgb(231, 231, 231); outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(68, 68, 68); line-height: 18px; text-align: right; direction: rtl; ">
                                <div class="notes" 
                                    style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px 10px 0px 0px; ">
                                    <ol style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; list-style: decimal inside; ">
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            تعداد نمایش تا حد امکان فقط برای کاربران فعال محاسبه می‌شود. بر خلاف روش معمول 
                                            محاسبه تعداد نمایش، در این حالت بین 50% تا 80% نمایش‌های بیهوده حذف می‌شوند و در 
                                            شمارش تعداد نمایش محاسبه نمی‌شوند. کاربر فعال، کاربری‌است که در زمان نمایش آگهی، 
                                            صفحه فاسکو را روی صفحات دیگر باز کرده و در حال مشاهده صفحه می‌باشد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            تعداد نمایش آگهی شما در هر روز نباید کمتر از 5&nbsp;هزار بار باشد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            در صورت نیاز شما میتوانید درخواست لاگ سرور مربوط به بنر تبلیغاتی خود را داشته 
                                            باشید.</li>
                                    </ol>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table style="border-width: 1px 0px; border-top-style: solid; border-bottom-style: solid; border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231); outline: 0px; font-weight: normal; font-style: normal; font-size: 12px; font-family: Tahoma, Arial, Geneva, Helvetica, sans-serif; vertical-align: baseline; margin: 30px 0px 15px; padding: 0px; border-collapse: separate; border-spacing: 0px; width: 95%; color: rgb(0, 0, 0); font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
                    <tbody style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <th colspan="5" 
                                style="border: 0px; outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(119, 119, 119); line-height: 18px; text-align: right; direction: rtl; background-color: rgb(246, 246, 246); ">
                                نوع و مشخصات تبلیغات و استانداردهای فنی</th>
                        </tr>
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <td class="fa" colspan="5" 
                                style="border-width: 1px 0px 0px; border-top-style: solid; border-top-color: rgb(231, 231, 231); outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(68, 68, 68); line-height: 18px; text-align: right; direction: rtl; ">
                                <div class="notes" 
                                    style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px 10px 0px 0px; ">
                                    <ol style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; list-style: decimal inside; ">
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            با توجه به سادگی سایت فاسکو، نمایش آگهی‌ها به صورت تصویر 
                                            و متن ثابت امکان‌پذیر می 
                                            باشد.</li>
                               
                                         
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            محل نمایش آگهی بسته به درخواست آگهی دهنده و تائید مدیر سایت تعیین می شود.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            ابعاد آگهی&nbsp;با توجه محل نمایش و از سوی مدیر سایت به اطلاع می رسد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            فرمت تصویر فقط باید در قالب PNG و&nbsp; JPEG باشد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            حجم فایل نهایی باید حداکثر 
                                            30  کیلوبایت باشد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            برای تبلیغ بر اساس تعداد کلیک، امکان قرار دادن شماره تلفن بر روی تبلیغ وجود 
                                            دارد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            امکان نمایش آگهی در روز و یا ساعات مورد نظر شما وجود دارد.</li>
                                    </ol>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table style="border-width: 1px 0px; border-top-style: solid; border-bottom-style: solid; border-top-color: rgb(231, 231, 231); border-bottom-color: rgb(231, 231, 231); outline: 0px; font-weight: normal; font-style: normal; font-size: 12px; font-family: Tahoma, Arial, Geneva, Helvetica, sans-serif; vertical-align: baseline; margin: 30px 0px 15px; padding: 0px; border-collapse: separate; border-spacing: 0px; width: 95%; color: rgb(0, 0, 0); font-variant: normal; letter-spacing: normal; line-height: 20px; orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); ">
                    <tbody style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <th colspan="5" 
                                style="border: 0px; outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(119, 119, 119); line-height: 18px; text-align: right; direction: rtl; background-color: rgb(246, 246, 246); ">
                                قوانین و شرایط پذیرش آگهی در فاسکو</th>
                        </tr>
                        <tr style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                            <td class="fa" colspan="5" 
                                style="border-width: 1px 0px 0px; border-top-style: solid; border-top-color: rgb(231, 231, 231); outline: 0px; font-weight: 400; font-style: inherit; font-size: 12px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 8px 10px; color: rgb(68, 68, 68); line-height: 18px; text-align: right; direction: rtl; ">
                                <div class="notes" 
                                    style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px 10px 0px 0px; ">
                                    <ol style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; list-style: decimal inside; ">
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            برای درج آگهی پس از ارسال اطلاعات خواسته شده&nbsp; به 
                                            ایمیل&nbsp; <a href="mailto:advertise@phasco.com">advertise@phasco.com</a>، در صورت تأیید آگهی، شماره 
                                            حساب برای واریز هزینه&nbsp;آگهی و مراحل بعدی، توسط ایمیل برای شما ارسال می شود.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            فاسکو پس از بررسی، تنها آگهی‌هایی را که در چهارچوب قوانین بین‌المللی و داخلی 
                                            باشند را می‌پذیرد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            ماهیت سایت از هنگام سفارش آگهی نباید تغییر کند و در صورت ایجاد هر گونه تغییر 
                                            خارج از چهارچوب قوانین، فاسکو از ادامه نمایش آگهی خودداری می‌نماید.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            فاسکو مسئولیتی در مقابل محتوای آگهی درج شده از قبیل: متن، تصویر و غیره ندارد.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            در صورت صدور دستور قضایی یا اخطار توسط نهادهای مربوطه&nbsp;مبنی بر حذف آگهی، سایت خود 
                                            را موظف به اجرا می‌داند و در صورت بروز خسارت مسئولیتی متوجه سایت فاسکو نخواهد 
                                            بود.</li>
                                        <li style="border: 0px; outline: 0px; font-weight: inherit; font-style: inherit; font-size: 10px; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; ">
                                            لطفاً قوانین، شرایط و استانداردهای فاسکو برای درج آگهی را کامل و دقیق مطالعه 
                                            نمایید، چرا که پرداخت وجه آگهی به معنی پذیرش تمامی شرایط از سوی سفارش دهنده آگهی 
                                            می‌باشد و در صورتی که به موجب عدم رعایت موارد فوق، آگهی حذف شود، فاسکو در قبال 
                                            عودت وجه هیچگونه مسئولیتی نخواهد داشت.</li>
                                    </ol>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <br />
 
            </td>
        </tr>
    </table>
</asp:Content>
