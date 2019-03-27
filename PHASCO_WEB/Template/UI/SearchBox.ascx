<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchBox.ascx.cs" Inherits="PHASCO_WEB.Template.UI.SearchBox" %>

<div class="input-group rtl-text" id="adv-search">
    <input type="text" class="form-control adv-search-text" id="txtSearch" runat="server" placeholder="جستجو" />
    <div class="input-group-btn">
        <div class="btn-group" role="group">
            <div class="dropdown dropdown-lg search-dropdown">
                <button type="button" class="btn btn-default dropdown-toggle" id="dropdownToggle" style="height: 40px;" aria-expanded="false"><span class="caret"></span></button>


                <div class="dropdown-menu dropdown-menu-right" role="menu">
                    <div class="form-horizontal col-md-12" role="form">
                        <div class="form-group">
                            <label for="filter">جستجو بر اساس</label>
                            <select class="form-control searchType" style="width: 85%" runat="server" id="searchType">
                                <option  value="0" selected>تمامی موضوعات</option>
                                <option value="4">اخبار</option>
                                <option value="6">آزمایشگاه</option>
                                <option value="5">اطلس ها</option>
                                <option value="10">بانک سوالات</option>
                                <option value="2">بلاگ</option>
                                <option value="8">پرسش و پاسخ</option>
                                <option value="9">کار و کاریابی</option>
                                <option value="7">کاربران</option>
                                <option value="1">مقالات</option>
                                <option value="3">ویدئو ها</option>
                                <%--<option value="4">Most commented</option>--%>
                            </select>

                            <script>

                                var count = 0;
                                $('#dropdownToggle').on('click', function (event) {
                                    $(this).parent().toggleClass('open');
                                });

                                $('body').on('click', function (e) {
                                    count = 0;
                                    if (!$('.search-dropdown').is(e.target)
                                        && $('.search-dropdown').has(e.target).length === 0
                                        && $('.open').has(e.target).length === 0
                                    ) {
                                        $('.search-dropdown').removeClass('open');
                                    }
                                });

                                $("#<%Response.Write(txtSearch.ClientID);%>").keypress(function (e) {
                                    //event.stopPropagation();
                                    //event.preventDefault();
                                    var code = e.which ? e.which : e.keyCode;
                                    if (13 === code && $("#<%Response.Write(txtSearch.ClientID);%>").val()) {
                                        event.preventDefault();
                                        $("#<%Response.Write(btnSearch.ClientID);%>").click();
                                    }
                                    else return;

                                })


                                $(document).keyup(function (e) {

                                    var code = e.which ? e.which : e.keyCode;
                                    count++;
                                    if (27 === code && count > 1) {
                                        event.preventDefault();
                                        $('.search-dropdown').removeClass('open');
                                        count = 0;
                                    }
                                    else return;

                                })
                            </script>
                        </div>
                    </div>
                </div>
            </div>

            <button type="button" class="btn btn-primary search-btn" id="btnSearch" runat="server" onserverclick="btnSearch_Click" style="margin-top: 0px;"><span class="fa fa-search" aria-hidden="true"></span></button>
        </div>
    </div>
</div>
