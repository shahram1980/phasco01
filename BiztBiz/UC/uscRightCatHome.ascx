<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="uscRightCatHome.ascx.cs"
    Inherits="BiztBiz.UC.uscRightCatHome" %>
<style type="text/css">
    ol, ul, li
    {
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-weight: inherit;
        font-style: inherit;
        font-size: 12px;
        font-family: inherit;
        vertical-align: baseline;
    }
    ol, ul
    {
        list-style: none;
    }
    .home-menu-col
    {
        float: right;
        width: 190px;
    }
    .home-menu
    {
    }
    
    .home-menu ul
    {
        background: #fefefe;
    }
    .home-menu li
    {
        position: relative;
        padding: 5px 13px 5px 0;
        background: #fafafa url(images/arrow.gif) no-repeat 5px center;
        width: 175px;
        border-left: solid 1px #d1d1d1;
        border-right: solid 1px #d1d1d1;
        z-index: 11;
    }
    .home-menu a
    {
        color: #444;
    }
    .home-menu li:hover
    {
        padding: 5px 13px 5px 0;
        border: solid 1px #B7B6BA;
        border-left-color: #e8e8e8;
        background-color: #e8e8e8;
    }
    .home-menu li:hover ul
    {
        display: block;
        top: -1px;
        right: 189px;
        position: absolute;
        background: url(images/menu_sub.png) no-repeat left -5px;
    }
    .home-menu li ul
    {
        display: none;
        border-bottom: none;
    }
    .home-menu li ul li
    {
        border: none;
        background: none;
        width: 217px;
    }
    .home-menu li ul li:hover
    {
        border: none;
        padding: 5px 13px 5px 0;
        background: none;
    }
    .home-menu li.home-menu-last, .home-menu li.home-menu-last:hover
    {
        background: url(images/menu_sub.png) no-repeat left 5px;
    }
</style>
<table style="width: 190px" cellpadding="0" cellspacing="0">
    <tr>
        <td style="background: transparent url('images/new-t1-header.jpg') no-repeat scroll center top;
            height: 27px; color: #5a5a5a; text-align: right; padding-right: 10px">
            دسته بندی ها
        </td>
    </tr>
    <tr>
        <td style="color: #00aaca; text-align: right; background: transparent url('images/new-fram-bg.jpg') repeat-y scroll center top;
            padding: 5px">
            <div class="home-menu-col">
                <div class="home-menu">
                    <ul>
                        <asp:Literal ID="ltrCategoryList" runat="server"></asp:Literal>
                    </ul>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td style="background: transparent url('images/new-frame-do.jpg') no-repeat scroll center top;
            height: 6px; padding-right: 10px">
        </td>
    </tr>
</table>
