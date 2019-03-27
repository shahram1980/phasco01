<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="Jobs.aspx.cs" Inherits="PHASCO_WEB.Jobs" %>

<asp:Content ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="Plc_Mid">

    <h3>کار و کار یابی </h3>

    <div class="alert alert-info">
        <p>
            کاربران محترم می توانند با توجه به جایگاه خود (کارجو یا کارفرما) بخش مورد نظر خود
        را تکمیل و از امکانات این بخش استفاده نمایند.
        </p>
    </div>

    <div class="alert alert-danger" runat="server" id="Wrap_Not_Login">
        <p>
            <asp:Label runat="server" ID="Lbl_Not_Login" />
        </p>
    </div>

    <div class="col-md-6 col-xs-12 rtl-text text-right">
        <fieldset>
            <legend>کارجویان
            </legend>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_insert" runat="server" NavigateUrl="~/Job/InsertResume.aspx">درج رزومه جديد</asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_enabled" runat="server" NavigateUrl="~/Job/EnabledResumes.aspx">ليست رزومه هاي فعال</asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_expired" runat="server" NavigateUrl="~/Job/DisabledResumes.aspx">ليست رزومه هاي منقضي شده و غير فعال</asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_waiting" runat="server" NavigateUrl="~/Job/Waiting_Resumes.aspx">ليست رزومه هاي در انتظار</asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_search_AD" runat="server" NavigateUrl="~/Job/SearchEmploymentAD.aspx?from=search">جستجوي فرصت هاي شغلي</asp:HyperLink>
            </div>
        </fieldset>
    </div>

    <div class="col-md-6 col-xs-12 rtl-text text-right mobile-margin-top-5">

        <fieldset>
            <legend>کارفرمایان</legend>

            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_CompanyInfo" runat="server" NavigateUrl="~/employer/CompanyInfo.aspx">
        اطلاعات كارفرما</asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_employment" runat="server" NavigateUrl="~/employer/employment.aspx">
        درج ظرفيت شغلي</asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_Waiting_employmentAD" runat="server" NavigateUrl="~/employer/Waiting_employmentAD.aspx">
        مشاهده آگهي هاي غير فعال و تائيد نشده </asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_Enabled_employmentAD" runat="server" NavigateUrl="~/employer/Enabled_employmentAD.aspx">
       مشاهده آگهي هاي فعال و تائيد شده</asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>
                <asp:HyperLink EnableViewState="false" ID="HyperLink_Disabled_EmploymentAD" runat="server" NavigateUrl="~/employer/Disabled_EmploymentAD.aspx">
       مشاهده آگهي هاي غير فعال و منقضي شده</asp:HyperLink>
            </div>
            <div class="Menu_Emp">
                <i class="fa fa-arrow-left"></i>

                <a href="employer/SearchResumes.aspx?from=home">جستجوی کارجو</a>
            </div>
        </fieldset>
    </div>
    <div class="margin-top-30"></div>
    <div class="col-md-6 col-xs-12">
        <div class="shop-widget">

            <h4>جدیدترین رزومه های کارجویان</h4>

            <asp:Repeater runat="server" ID="RTP_NewestResume">
                <ItemTemplate>
                    <table class="table table-responsive no-border table-sm" width="100%" border="0" dir="ltr">
                        <tr>
                            <td width="90%" align="right" valign="top" dir="rtl">
                                <a href="UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "UserID")%>">کاربر :
                                                    <%# Eval("UID")%>&nbsp;&nbsp;
                                                    <%# Eval("Famil")%>
                                    <%# Eval("Name")%>  </a>
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
                                <a href="employer/SearchResumes.aspx?ResumeID=<%# Eval("id") %>&from=home">عنوان :
                                                    <%# Eval("ResumeSubject") %>
                                </a>
                            </td>
                        </tr>
                        <tr align="right" valign="top">
                            <td width="90%" dir="rtl">

                                <a href="employer/SearchResumes.aspx?ResumeID=<%# Eval("id") %>&from=home">دسته تخصصی :
                                                    <%#get_category_name(Eval("CategoryID")) %>
                                                    &nbsp; >&nbsp;
                                                    <%#get_category_name(Eval("CategoryID_Sub")) %>&nbsp;&nbsp; حقوق درخواستی :
                                                    <%# Eval("Requested_Wage")%>&nbsp;تومان تاریخ ارسال :
                                                      <div style="direction: ltr">
                                                          <%#GetfarsiDate(Eval("InsertDate")) %>
                                </a></div>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="col-md-6 col-xs-12">
        <div class="shop-widget">

            <h4>جدیدترین فرصت های شغلی</h4>

            <asp:Repeater runat="server" ID="Repeater_employmen">
                <ItemTemplate>
                    <table class="table table-sm no-border" width="100%" border="0" dir="ltr">
                        <tr>
                            <td width="90%" align="right" valign="top" dir="rtl">
                                <%--  <a title=" <%# Eval("Name")%> &nbsp; <%# Eval("Famil")%>" href="UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "UserID")%>">کاربر :
                                                    <%# Eval("UID")%>
                                                    
                                </a>--%>
                                <%# Eval("Company_name")%>

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
                                <a href="job/SearchEmploymentAD.aspx?id=<%# Eval("id") %>&from=home">عنوان :
                                                    <%# Eval("Required_specialty") %>
                                </a>
                            </td>
                        </tr>
                        <tr align="right" valign="top">
                            <td width="90%" dir="rtl">

                                <a href="job/SearchEmploymentAD.aspx?id=<%# Eval("id") %>&from=home">دسته تخصصی :
                                                   <%#get_category_name(Eval("CategoryID")) %>
                                                    &nbsp; >&nbsp;
                                                    <%#get_category_name(Eval("SubCategoryID")) %>
                                    <br />
                                    تاریخ ارسال :
                                                      <div style="direction: ltr">
                                                          <%#GetfarsiDate(Eval("insertionDate")) %>
                                </a></div>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
  
</asp:Content>
