<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscHomeCategory.ascx.cs"
    Inherits="BiztBiz.UC.uscHomeCategory" %>

<div class="tabs-widget widget">
    <ul class="menu-links">


        <li id="company" style="width: 33%; height: 40px;">
            <a href="#company" id="CompanyList" class="companyactive">فهرست شرکتها و فروشگاهها</a>
        </li>
        <li id="request" style="width: 33%; height: 40px;">
            <a href="#request" id="RequestList" class="requestactive">درخواست خرید</a>
        </li>

        <li id="product" style="width: 33%; height: 40px;">
            <a href="#product" id="ProductList" class="Productactive">محصولات</a>
        </li>
    </ul>
    <div class="tab-box" style="overflow: hidden">
        <div class="tab-content active" style="display: block;">
            <div id="CategoryList">
                <asp:Literal ID="ltrCategoryList" runat="server"></asp:Literal>
                <div id="Container" class="container">
                </div>
            </div>
        </div>
    </div>
   
</div>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script lang="javascript" type="text/javascript">
    $(document).ready(function () {
        $.cookie('SearchSection', '1', { path: '/' });

        $('#ProductList').click(function () {
            $.cookie('SearchSection', '1', { path: '/' });
            $(this).removeClass('Productnotactive');
            $(this).addClass('Productactive');
            $('#RequestList').addClass('requestnotactive');
            $('#CompanyList').addClass('companynotactive');
            $('.h-tab-con-p1-t').css('color', '#0099cc');
            $('.h-tab-con-p1-item').css('color', '#0099cc');
            $('.buimg').attr('src', 'images/site/bu-ico1.jpg');
            return false;
        });

        $('#RequestList').click(function () {
            $.cookie('SearchSection', '2', { path: '/' });
            $(this).removeClass('requestnotactive');
            $(this).addClass('requestactive');
            $('#ProductList').addClass('Productnotactive');
            $('#CompanyList').addClass('companynotactive');
            $('.h-tab-con-p1-t').css('color', '#eea100');
            $('.h-tab-con-p1-item').css('color', '#eea100');
            $('.buimg').attr('src', 'images/site/b1-1.jpg');
            return false;
        });

        $('#CompanyList').click(function () {
            $.cookie('SearchSection', '3', { path: '/' });
            $(this).removeClass('companynotactive');
            $(this).addClass('companyactive');
            $('#ProductList').addClass('Productnotactive');
            $('#RequestList').addClass('requestnotactive');
            $('.h-tab-con-p1-t').css('color', '#A4E24D');
            $('.h-tab-con-p1-item').css('color', '#A4E24D');
            $('.buimg').attr('src', 'images/site/bu-ico4.jpg');
            return false;
        });

        if ($.cookie('SearchSection') == '1') {
            $('#ProductList').removeClass('Productnotactive');
            $('#ProductList').addClass('Productactive');
            $('#RequestList').addClass('requestnotactive');
            $('#CompanyList').addClass('companynotactive');
            $('.h-tab-con-p1-t').css('color', '#0099cc');
            $('.h-tab-con-p1-item').css('color', '#0099cc');
            $('.buimg').attr('src', 'images/site/bu-ico1.jpg');
        }

        if ($.cookie('SearchSection') == '2') {
            $('#RequestList').removeClass('requestnotactive');
            $('#ProductList').addClass('Productnotactive');
            $('#RequestList').addClass('requestactive');
            $('#CompanyList').addClass('companynotactive');
            $('.h-tab-con-p1-t').css('color', '#eea100');
            $('.h-tab-con-p1-item').css('color', '#eea100');
            $('.buimg').attr('src', 'images/site/b1-1.jpg');
        }

        if ($.cookie('SearchSection') == '3') {
            $('#CompanyList').removeClass('companynotactive');
            $('#ProductList').addClass('Productnotactive');
            $('#RequestList').addClass('requestnotactive');
            $('#CompanyList').addClass('companyactive');
            $('.h-tab-con-p1-t').css('color', '#A4E24D');
            $('.h-tab-con-p1-item').css('color', '#A4E24D');
            $('.buimg').attr('src', 'images/site/bu-ico4.jpg');
        }

        $('.categoryList').mouseover(function () {
            setTimeout('ShowContent()', 400);
            var height = $(this).parent().height();
            var pos = $(this).offset();
            $("#Container").css({ "left": (pos.left - 200) + "px", "top": (pos.top + height) + "px" });

            var cid = $(this).attr('rel');

            $.ajax({
                type: "POST",
                url: "Services/BiztBizServices.asmx/GetCategoryList",
                data: "{'catid': '" + cid + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    BuildTable(msg.d);
                }
            });
        });

        $('#Container').mouseleave(function () {
            $(this).css('visibility', 'hidden');
        });



    });

    function ShowContent() {
        $('#Container').css('visibility', 'visible');
    }

    function BuildTable(msg) {
        var table = '';
        var catarr = msg.split(",");


        for (var i = 0; i < catarr.length; i++) {
            if (catarr[i] != "") {
                var cat = catarr[i];
                var catar = cat.split(":");
                var row = '<li style="float: right; margin: 4px;width:43%;text-align:right;"><a href="Category.aspx?CategoryID=' + catar[0] + '&Level=1&ValuePath=' + catar[0] + '"\>' +
                    catar[1] + '</a></li>';

                table += row;
            }


        }

        $('#Container').html(table);
    }

</script>
