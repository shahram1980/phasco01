<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscAdvanceSearch.ascx.cs"
    Inherits="BiztBiz.UC.uscAdvanceSearch" %>
<%@ Register Assembly="JQControls" Namespace="JQControls" TagPrefix="jq" %>
<%--<%@ Register src="~/UI/uscAdvertisement.ascx" tagname="uscAdvertisement" tagprefix="uc6" %>--%>


<div class="input-group rtl-text" id="adv-search">
    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control adv-search-text" placeholder="جستجو"></asp:TextBox>


    <div class="input-group-btn">
        <div class="btn-group" role="group">
            <div class="dropdown dropdown-lg search-dropdown">
                <button type="button" class="btn btn-default dropdown-toggle" id="dropdownToggle" aria-expanded="false">
                    <span class="caret"></span>
                    جستجوی پیشرفته  
                </button>



                <script>
                    $("#<%= txtSearch.ClientID %>").keypress(function (e) {
                        if (e.keyCode === 13) {
                            e.preventDefault(); $('#<%= btnSearch.ClientID %>').trigger("click");
                            return false;
                        }
                    });

                    $('#dropdownToggle').click(function (event) {
                        $(this).parent().toggleClass('open');
                    });

                    $('body').click(function (e) {
                        if (!$('search-dropdown').is(e.target)
                            && $('search-dropdown').has(e.target).length === 0
                            && $('.open').has(e.target).length === 0
                        ) {
                            $('search-dropdown').removeClass('open');
                        }
                    });
                </script>
                <div class="dropdown-menu dropdown-menu-right" role="menu">
                    <div class="form-horizontal" role="form">


                        <div class="form-group">
                            <label class="control-label col-sm-3" for="filter">جستجو بر اساس</label>


                            <div class="col-sm-9">
                                <asp:DropDownList ID="rblSearchSection" CssClass="form-control searchType" runat="server">
                                    <asp:ListItem Text="تمام بخش ها" Value="0" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="محصولات" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="درخواست ها" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="شرکت ها" Value="3"></asp:ListItem>
                                </asp:DropDownList>


                            </div>


                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-3" for="filter">ترکیب جستجو</label>

                            <div class="col-sm-9">
                                <asp:DropDownList ID="rdbListSearchType" runat="server" CssClass="form-control searchType">

                                    <asp:ListItem Value="1" Text=" 'OR' در صورت وجود هر یک از کلمات نتیجه بازگردانده می شود ."
                                        Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="2" Text=" 'AND' در صورتی که همه کلمات در جمله موجود باشد نتیجه بازگردانده می شود."></asp:ListItem>
                                    <asp:ListItem Value="3" Text="در صورتی که جمله مورد جستجو عیناً یافت شود نتیجه بازگردانده می شود."></asp:ListItem>
                                </asp:DropDownList>
                            </div>





                        </div>
                        <p class="pull-right">
                            محل جستجو
                        </p>
                        <div class="clearfix"></div>
                        <div class="form-group">
                            <div class="col-sm-3">

                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="chkSearchCategory" runat="server" />
                                        دسته بندی :
                                    </label>
                                </div>
                            </div>

                            <div class="col-sm-9">
                                <asp:DropDownList ID="ddlSearchCategory" runat="server" CssClass="form-control searchType">
                                </asp:DropDownList>
                            </div>

                        </div>




                        <div class="form-group">
                            <div class="col-sm-3">
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="chkState" runat="server" />

                                        شهر :
                                    </label>
                                </div>

                            </div>

                            <div class="col-sm-4">
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control searchType">
                                </asp:DropDownList>

                            </div>
                            <div class="col-sm-4">

                                <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
                                    ScriptMode="Release">
                                </ajaxToolkit:ToolkitScriptManager>
                                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                    <ProgressTemplate>
                                        <asp:Literal ID="Literal00102" runat="server" Text="<%$ Resources:Resource, Loading %>" />
                                        ...
                                    </ProgressTemplate>
                                </asp:UpdateProgress>

                                <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                                    Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/bazar/Services/BiztBizServices.asmx"
                                    ServiceMethod="GetState" />
                                <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control searchType">
                                </asp:DropDownList>
                                <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                                    ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                                    ServicePath="~/bazar/Services/BiztBizServices.asmx" Category="City" />
                            </div>

                        </div>



                        <div class="form-group">
                            <div class="col-sm-3">
                                <div class="checkbox">
                                    <label>
                                        <asp:CheckBox ID="chkDate" runat="server" />

                                        محدوده زمانی جستجو :
                                    </label>
                                </div>
                            </div>
                           
                            <div class="col-sm-4">
                                <jq:JQDatePicker ID="jqFromDate" ButtonImage="/Bazar/images/Calendar.png"
                                    ShowSelectButton="true" IsRTL="true" runat="server" ChangeMonth="true" ChangeYear="true"
                                    Regional="fa"  CssClass="form-control searchType"></jq:JQDatePicker>
                            </div>
                            <div class="col-sm-4">
                                <jq:JQDatePicker ID="jqToDate" ButtonImage="/Bazar/images/Calendar.png"
                                    ShowSelectButton="true" IsRTL="true" runat="server" ChangeMonth="true" ChangeYear="true"
                                    Regional="fa" CssClass="form-control searchType"></jq:JQDatePicker>
                            </div>
                             <style>

                                .hasDatepicker {
                                    width:85% !important;
                                    float:right;
                                }
                                .ui-datepicker-trigger {
                                    float:right;
                                }
                            </style>
                        </div>
                     
                        <asp:Button ID="btnAdvanceSearch" runat="server" OnClick="btnSearch_Click" Text="جستجو" CssClass="btn btn-primary btn-block" />

                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-primary" id="btnSearch" runat="server" onserverclick="btnSearch_Click" validationgroup="SearchAdvance" style="margin-top: 0px;">
                <span class="fa fa-search" aria-hidden="true"></span>
            </button>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSearch"
                ValidationGroup="SearchAdvance" Display="Dynamic"></asp:RequiredFieldValidator>


        </div>
    </div>
</div>

<div class="rtl-text">
    <p class="margin-bottom-5">آخرین جستجوها : </p>
    <ul class="tag-widget-list">
        <asp:Repeater ID="repLastSearchResult" runat="server">
            <ItemTemplate>
                <li><a
                    href='<%#Eval("SearchUrl")%>'>
                    <%#Eval("SearchWord")%></a></li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>

</div>

