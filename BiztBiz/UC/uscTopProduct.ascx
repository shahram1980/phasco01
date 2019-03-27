<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscTopProduct.ascx.cs"
    Inherits="BiztBiz.UC.uscTopProduct" %>
<%@ Register Assembly="JQControls" Namespace="JQControls" TagPrefix="jq" %>
<table cellpadding="0" cellspacing="0" style="width: 1000px; margin: 5px">
    <tr>
        <td>
            <img src="/images/top-search-frame.png" alt="" width="1000" height="7" />
        </td>
    </tr>
    <tr>
        <td style="border-left: 1px solid #e5e5e5; border-right: 1px solid #e5e5e5; padding: 5px 0;">
            <div style="float: right; width: 680px; margin-top: 25px;">
                <table class="p-search">
                    <tr>
                        <td>
                            <div class="p-search-frame">
                                <asp:Panel ID="pnlAdvSearch" runat="server" DefaultButton="btnSearch">
                                    <div class="p-search-input-bg">
                                        <asp:TextBox ID="txtSearch" runat="server" CssClass="h-search-input-item" MaxLength="100"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSearch" runat="server" ControlToValidate="txtSearch"
                                            ValidationGroup="SearchAdvance" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="h-search-input-b">
                                        <asp:ImageButton ID="btnSearch" runat="server" OnClick="btnSearch_Click" Height="42px"
                                            Width="114px" ImageUrl="~/images/site/b-search.jpg" />
                                    </div>
                                    <div style="float: right; width: 70px; text-align: center;">
                                        <a id="AdvanceSearchs" href="#" style="color: #01D1F2;">
                                            <img alt="" height="16" src="<%= ImgSiteFolder %>new-icon-top-search.jpg" width="16"
                                                style="vertical-align: middle; padding-left: 5px;" />
                                            <br />
                                            جستجوی پیشرفته</a>
                                    </div>
                                </asp:Panel>
                                <div class="h-search-adv-b">
                                    <asp:RadioButtonList ID="rblSearchSection" runat="server" ForeColor="#0098b2" RepeatColumns="4"
                                        RepeatDirection="Horizontal" CssClass="defaultP">
                                        <%--<asp:ListItem Text="همه ی بخشها" Value="0"></asp:ListItem>--%>
                                        <asp:ListItem Text="محصولات" Value="1" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="درخواست ها" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="شرکت ها" Value="3"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <%--<a id="AdvanceSearchs" href="#">
                            <img alt="" height="20" src="<%= ImgSiteFolder %>icon-search.jpg" width="20" style="vertical-align: middle;
                                padding-left: 5px;" />جستجوی پیشرفته</a>--%></div>
                                <%-- <div class="h-search-adv-b">
                                    <a id="AdvanceSearchs" href="#">
                                        <img alt="" height="20" src="<%= ImgSiteFolder %>icon-search.jpg" width="20" />جستجوی
                                        پیشرفته</a></div>--%>
                                <div class="p-search-last-item">
                                    <span style="font: bold 12px tahoma; color: #0091AA;">جستجو ها : </span>
                                    <asp:Repeater ID="repLastSearchResult" runat="server">
                                        <ItemTemplate>
                                            <span><a style="text-decoration: underline; color: #01D1F2" href='<%#Eval("SearchUrl")%>'>
                                                <%#Eval("SearchWord")%></a></span>,
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <span style="color: #01D1F2">...</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div style="float: right; width: 20px; margin: 20px 2px">
                <img alt="" height="87" src="/images/pi-pro-doter.jpg" width="18" /></div>
            <div style="float: right; margin: 10px 2px; margin-top: 25px;">
                <a href="<%= SiteFolder %>Default.aspx" style="cursor: pointer; text-decoration: none;">
                    <img alt="" height="72" src="/images/logo-news.jpg" width="259" /></a></div>
            <div style="float: right; width: 850px; padding-right: 100px; display: none;" id="AdvanceSearch">
                <div class="h-search-adv-frame-left">
                </div>
                <div class="h-search-adv-frame-mid">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 430px">
                                <div class="h-search-adv-frame1-left">
                                </div>
                                <div class="h-bg-mid-search-box">
                                    <span style="color: #ff6600; font-weight: bold; float: right">ترکیب جستجو</span>
                                    <div style="float: right; text-align: right; font: 11px tahoma; color: #993300;">
                                        <asp:RadioButtonList ID="rdbListSearchType" runat="server" CssClass="defaultP" CellPadding="0"
                                            CellSpacing="0">
                                            <asp:ListItem Value="1" Text=" 'OR' در صورت وجود هر یک از کلمات نتیجه بازگردانده می شود ."
                                                Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="2" Text=" 'AND' در صورتی که همه کلمات در جمله مو جود باشد نتیجه بازگردانده می شود."></asp:ListItem>
                                            <asp:ListItem Value="3" Text="در صورتی که جمله مورد جستجو عیناً یافت شود نتیجه بازگردانده می شود."></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="h-search-adv-frame1-right">
                                </div>
                            </td>
                            <td>
                                <div class="h-search-adv-frame1-left">
                                </div>
                                <div class="h-search-adv-frame1-mid">
                                    <span class="h-search-adv-frame1-bold">محل جستجو</span>
                                    <div style="float: right; text-align: right; font: 11px tahoma; color: #993300;">
                                        <div style="float: right;">
                                            <asp:CheckBox ID="chkSearchCategory" runat="server" Text="بخش : " CssClass="defaultP" />
                                        </div>
                                        <div class="ddl-bg-normal">
                                            <asp:DropDownList ID="ddlSearchCategory" runat="server" CssClass="log-login-ddl-item">
                                            </asp:DropDownList>
                                        </div>
                                        <%--<script type="text/javascript" language="javascript">
                                                $(document).ready(function () {
                                                    $("#<%=ddlSearchSection.ClientID %>").msDropDown({ mainCSS: 'dd2' });
                                                })

                                            </script>--%>
                                        <br />
                                        <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
                                            ScriptMode="Release">
                                        </ajaxToolkit:ToolkitScriptManager>
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                            <ProgressTemplate>
                                                <asp:Literal ID="Literal00102" runat="server" Text="<%$ Resources:Resource, Loading %>" />
                                                ...
                                            </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        <br />
                                        <div style="float: right;">
                                            <asp:CheckBox ID="chkState" runat="server" Text=" شهر : " CssClass="defaultP" />
                                        </div>
                                        <div class="ddl-bg-normal">
                                            <asp:DropDownList ID="ddlState" runat="server" CssClass="log-login-ddl-item">
                                            </asp:DropDownList>
                                        </div>
                                        <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                            Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                                            ServiceMethod="GetState" />
                                        <div class="ddl-city-bg-normal">
                                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="ddl-city-item">
                                            </asp:DropDownList>
                                        </div>
                                        <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                                            ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                                            ServicePath="~/Services/BiztBizServices.asmx" Category="City" />
                                    </div>
                                </div>
                                <div class="h-search-adv-frame1-right">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="h-search-adv-date">
                        <div class="h-search-adv-date-right">
                        </div>
                        <div class="h-search-adv-date-mid">
                            <span class="h-search-adv-frame1-bold">
                                <asp:CheckBox ID="chkDate" runat="server" Text="محدوده زمانی جستجو : " CssClass="defaultP" /></span>
                            <div class="h-search-adv-date-text">
                                <div style="float: right;">
                                    از تاریخ
                                </div>
                                <div class="jq-bg-normal">
                                    <jq:JQDatePicker ID="jqFromDate" Font-Names="Tahoma" ButtonImage="/images/Calendar.png"
                                        ShowSelectButton="true" IsRTL="true" runat="server" ChangeMonth="true" ChangeYear="true"
                                        Regional="fa" CssClass="log-login-jq-item"></jq:JQDatePicker>
                                </div>
                            </div>
                            <div class="h-search-adv-date-text">
                                <div style="float: right;">
                                    تا تاریخ :
                                </div>
                                <div class="jq-bg-normal">
                                    <jq:JQDatePicker ID="jqToDate" Font-Names="Tahoma" ButtonImage="/images/Calendar.png"
                                        ShowSelectButton="true" IsRTL="true" runat="server" ChangeMonth="true" ChangeYear="true"
                                        Regional="fa" CssClass="log-login-jq-item"></jq:JQDatePicker>
                                </div>
                            </div>
                        </div>
                        <div class="h-search-adv-date-left">
                        </div>
                    </div>
                    <div style="float: right; width: 110px; padding: 3px; padding-right: 10px;">
                        <asp:ImageButton ID="btnAdvanceSearch" runat="server" OnClick="btnSearch_Click" Height="34px"
                            Width="103px" ImageUrl="~/images/site/b-adv-search.png" />
                    </div>
                </div>
                <div class="h-search-adv-frame-right">
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <img src="/images/bottom-search-frame.png" alt="" width="1000" height="7" />
        </td>
    </tr>
</table>
