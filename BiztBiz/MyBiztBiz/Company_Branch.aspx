<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="Company_Branch.aspx.cs" Inherits="BiztBiz.MyBiztBiz.Company_Branch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            if (jQuery.url.attr("file") == "company_profile.aspx") {
                $('#divCompany').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.attr("file") == "Company_Branch.aspx" && jQuery.url.param("PageView") == "0") {
                $('#divBranch').addClass("cp-tab-bg-active");
            }

            if (jQuery.url.attr("file") == "Company_Branch.aspx" && jQuery.url.param("PageView") == "1") {
                $('#divNewBranch').addClass("cp-tab-bg-active");
            }
        });
    </script>
    <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px; font-weight: bold">
            <div id="divCompany" class="cp-tab-bg">
                <asp:HyperLink ID="lnkCompany" runat="server" Text="پروفایل شرکت" NavigateUrl="~/MyBiztBiz/company_profile.aspx"></asp:HyperLink>
            </div>
            <div id="divBranch" class="cp-tab-bg">
                <asp:HyperLink ID="HyperLink1" runat="server" Text="شعب شرکت" NavigateUrl="~/MyBiztBiz/Company_Branch.aspx?PageView=0"></asp:HyperLink>
            </div>
            <div id="divNewBranch" class="cp-tab-bg">
                <asp:HyperLink ID="lnkNewBranch" runat="server" Text="شعب جدید" NavigateUrl="~/MyBiztBiz/Company_Branch.aspx?PageView=1"></asp:HyperLink>
            </div>
        </div>
        <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000;">
            <asp:MultiView ID="muvCompanyBranch" runat="server">
                <asp:View ID="vwBranchList" runat="server">
                    <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
                        width: 611px; float: right; color: #000;">
                        <div style="height: 41px; background: transparent url('../images/cp-bg-title-news.jpg') repeat-x scroll center top;
                            border: 1px #9999ff solid; clear: both; margin: 10px 10px 0 10px; color: #666699;">
                            <span style="margin: 10px 15px 10px 0; float: right; width: 40px">ردیف</span> <span
                                style="margin: 10px; float: right; width: 130px">نام شعبه</span> <span style="margin: 10px;
                                    float: right; width: 240px">آدرس شعبه</span> <span style="margin: 10px; float: right;
                                        width: 70px">عملیات</span>
                        </div>
                        <div style="float: right; background: #fff; margin-right: 10px;">
                            <asp:Repeater ID="repCompanyBranch" runat="server">
                                <ItemTemplate>
                                    <div style="height: 40px; clear: both;" class="newsList">
                                        <span style="margin: 10px 20px 10px 0; float: right; width: 40px">
                                            <%#(((RepeaterItem)Container).ItemIndex+1).ToString() %></span> <span style="margin: 10px;
                                                float: right; width: 130px">
                                                <%#Eval("BranchName")%></span> <span style="margin: 10px; float: right; width: 270px">
                                                    <%# Eval("BranchAdress")%></span><span style="margin: 10px; float: right; width: 70px">
                                                        <asp:ImageButton ID="lnkEdit" runat="server" SkinID="btnEdit" CommandArgument='<%#Eval("CompanyBranchID") %>'
                                                            OnCommand="lnkEdit_Command"></asp:ImageButton>
                                                        <asp:ImageButton ID="lnkDelete" runat="server" SkinID="btnDelete" CommandArgument='<%#Eval("CompanyBranchID") %>'
                                                            OnCommand="lnkDelete_Command"></asp:ImageButton>
                                                    </span>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $('.newsList').mouseover(function () {
                                    $(this).toggleClass("repeaterover");
                                }).mouseout(function () {
                                    $(this).toggleClass("repeaterover");
                                });

                            });
                    
                        </script>
                    </div>
                </asp:View>
                <asp:View ID="vwBranchDetails" runat="server">
                    <table style="margin: 5px;">
                        <tr>
                            <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                                <div id="divMessage" runat="server" visible="false" style="width: 400px; height: 20px;
                                    padding: 7px; margin: 5px 15px; font: bold 11px tahoma; float: right; border: 1px solid #3c3c3c;">
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                نام شعبه
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="txtBranchName" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="register"
                                    ControlToValidate="txtBranchName" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <%--  <tr>
                            <td class="td_register">
                                کد شعبه
                            </td>
                            <td class="td_register_de">
                                <div class="input-bg-normal">
                                    <asp:TextBox ID="txtBranchCode" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>--%>
                        <tr>
                            <td class="td_register">
                                آدرس شعبه
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="txtBranchAdress" runat="server" TextMode="MultiLine" CssClass="multiinput-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                                    ControlToValidate="txtBranchAdress" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                شماره تلفن های شعبه
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="txtBranchTel" runat="server" TextMode="MultiLine" CssClass="multiinput-item"></asp:TextBox>
                                </div>
                                <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                                    *</div>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="register"
                                    ControlToValidate="txtBranchTel" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                                توضیح
                            </td>
                            <td class="td_register_de">
                                <div class="multiinput-bg-normal">
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="multiinput-item"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_register">
                            </td>
                            <td class="td_register_de">
                                <asp:Button ID="ImageButton_Create" runat="server" SkinID="btnNormal" OnClick="ImageButton_Create_Click"
                                    Text="ثبت اطلاعات" ValidationGroup="register" />
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="vwShowAlert" runat="server">
                    <table>
                        <tr>
                            <td style="width: 400px; height: 100px; padding: 15px;">
                                <asp:Label ID="lblAlert" runat="server" ForeColor="Red" Text="ابتدا اطلاعات مربوط به شرکت را از بخش پروفایل شرکت کامل کرده و سپس اطلاعات مربوط به شعب را وارد نمایید . "></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:View>
            </asp:MultiView>
        </div>
        <div style="float: right">
            <img alt="" height="22" src="../images/cp-frame2-down.jpg" width="611" />
        </div>
    </div>
</asp:Content>
