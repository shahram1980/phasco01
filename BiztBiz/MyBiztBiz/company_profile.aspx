<%@ Page Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    EnableEventValidation="false" CodeBehind="company_profile.aspx.cs" Inherits="BiztBiz.MyBiztBiz.company_profile" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderContent" runat="server">
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

            //            if (jQuery.url.attr("file") == "company_profile.aspx" && jQuery.url.param("CompanyProfileNotComplate") == "1") {
            //                $('#companyProfileComplate').css("display", "block");
            //            }
        });
    </script>

     <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
        <div style="clear: both; float: right; margin: 5px 0">
        <div style="float: right; background: transparent url('../images/cp-frame2-top.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000; height: 35px; font-weight: bold">
            <div id="divCompany" class="cp-tab-bg">
                <asp:HyperLink ID="lnkCompany" runat="server" Text="پروفایل شرکت" NavigateUrl="~/MyBiztBiz/company_profile.aspx"></asp:HyperLink>
            </div>
            <div id="divBranch" class="cp-tab-bg">
                <asp:HyperLink ID="lnkCompanyBranch" runat="server" Text="شعب شرکت" NavigateUrl="~/MyBiztBiz/Company_Branch.aspx?PageView=0"></asp:HyperLink>
            </div>
            <div id="divNewBranch" class="cp-tab-bg">
                <asp:HyperLink ID="lnkNewBranch" runat="server" Text="شعب جدید" NavigateUrl="~/MyBiztBiz/Company_Branch.aspx?PageView=1"></asp:HyperLink>
            </div>
        </div>
        <div style="background: transparent url('../images/cp-frame2-mid.jpg') repeat-y scroll center top;
            width: 611px; float: right; color: #000;">
            <table style="margin: 5px;">
                <tr>
                    <td class="td_register_de" colspan="2" style="padding-right: 30px;">
                        <div id="companyProfileComplate" runat="server" style="width: 400px; height: auto;
                            background: #F7D9DD; margin: 15px; float: right; font: bold 11px tahoma; color: #DC1733;
                            padding: 10px;">
                            برای ارسال محصول ابتدا باید اطلاعات مربوط به شرکت را کامل نمایید.
                        </div>
                    </td>
                </tr>
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
                        <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, Company_Name %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="input-bg-normal">
                            <asp:TextBox ID="TextBox_Company_Name" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                        </div>
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="register"
                            ControlToValidate="TextBox_Company_Name" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:Resource, Company_Logo %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="fileupload-bg-normal">
                            <asp:FileUpload ID="FileUpload_Logo" runat="server" CssClass="fileupload-item" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        &nbsp;
                    </td>
                    <td class="td_register_de">
                        <asp:Image ID="Image_Logo" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, CompanyCompany_Address_Name %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="input-bg-normal">
                            <asp:TextBox ID="TextBox_Company_Address" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                        </div>
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="register"
                            ControlToValidate="TextBox_Company_Address" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        استان / شهر
                    </td>
                    <td class="td_register_de">
                        <div class="ddl-bg-normal">
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="log-login-ddl-item">
                            </asp:DropDownList>
                        </div>
                        <ajaxToolkit:CascadingDropDown ID="cddState" runat="server" TargetControlID="ddlState"
                            Category="State" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                            ServiceMethod="GetState" />
                        <div class="ddl-bg-normal">
                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="log-login-ddl-item">
                            </asp:DropDownList>
                        </div>
                        <ajaxToolkit:CascadingDropDown ID="ccdCity" runat="server" TargetControlID="ddlCity"
                            ParentControlID="ddlState" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetCityForState"
                            ServicePath="~/Services/BiztBizServices.asmx" Category="City" />
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Zip_Postal_Code %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="input-bg-normal">
                            <asp:TextBox ID="TextBox_Zip" runat="server" CssClass="log-login-input-item" MaxLength="11"></asp:TextBox>
                        </div>
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="register"
                            ControlToValidate="TextBox_Zip" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--  <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource, Total_Staff %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="ddl-bg-normal">
                            <asp:DropDownList ID="DropDownList_Total_Staff" runat="server" CssClass="log-login-ddl-item">
                                <asp:ListItem Text="لطفاً انتخاب کنید" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="کمتر از 5 نفر" Value="1"></asp:ListItem>
                                <asp:ListItem Text="5 تا 10 نفر" Value="2"></asp:ListItem>
                                <asp:ListItem Text="11 تا 50 نفر" Value="3"></asp:ListItem>
                                <asp:ListItem Text="51 تا 100 نفر" Value="4"></asp:ListItem>
                                <asp:ListItem Text="101 تا 200 نفر" Value="5"></asp:ListItem>
                                <asp:ListItem Text="201 تا 500 نفر" Value="6"></asp:ListItem>
                                <asp:ListItem Text="بالای 500 نفر" Value="7"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>--%>
                <%-- <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource, registered_capital  	 %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="ddl-bg-normal">
                            <asp:DropDownList ID="DropDownList_Reg" runat="server" CssClass="log-login-ddl-item">
                                <asp:ListItem Text="-- Please Select --" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Less than US$ 100 Thousands" Value="Less than US$ 100 Thousands">
                                </asp:ListItem>
                                <asp:ListItem Text="US$ 101 Thousands - US$ 500 Thousands" Value="US$ 101 Thousands - US$ 500 Thousands">
                                </asp:ListItem>
                                <asp:ListItem Text="US$ 501 Thousands - US$ 1 Million" Value="US$ 501 Thousands - US$ 1 Million">
                                </asp:ListItem>
                                <asp:ListItem Text="US$1 Million - US$ 2.5 Million" Value="US$ 1 Million - US$ 2.5 Million">
                                </asp:ListItem>
                                <asp:ListItem Text="US$2.5 Million - US$ 5 Million" Value="US$ 2.5 Million - US$ 5 Million">
                                </asp:ListItem>
                                <asp:ListItem Text="US$5 Million - US$10 Million" Value="US$ 5 Million - US$ 10 Million">
                                </asp:ListItem>
                                <asp:ListItem Text="US$10 Million - US$50 Million" Value="US$ 10 Million - US$ 50 Million">
                                </asp:ListItem>
                                <asp:ListItem Text="Above US$50 Million" Value="Above US$50 Million">Above US$50 Million</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>--%>
                <%-- <tr>
            <td class="td_register">
                <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource, year_Established  	   	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_year_Established" runat="server"></asp:TextBox>
            </td>
        </tr>--%>
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource, Website	 %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="input-bg-normal">
                            <asp:TextBox ID="TextBox_Company_Website" runat="server" CssClass="log-login-input-item">http://</asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource, Category %>" />
                    </td>
                    <td class="td_register_de">
                       
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <asp:Literal ID="Literal00102" runat="server" Text="<%$ Resources:Resource, Loading %>" />
                                ...
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        <div class="ddl-bg-normal">
                            <asp:DropDownList ID="DropDownList_Cat1" runat="server" CssClass="log-login-ddl-item">
                            </asp:DropDownList>
                        </div>
                        <ajaxToolkit:CascadingDropDown ID="ccdCat1" runat="server" TargetControlID="DropDownList_Cat1"
                            Category="Category" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                            ServiceMethod="GetCategory" />
                        <div class="ddl-bg-normal">
                            <asp:DropDownList ID="DropDownList_Cat2" runat="server" CssClass="log-login-ddl-item">
                            </asp:DropDownList>
                        </div>
                        <ajaxToolkit:CascadingDropDown ID="ccdCat2" runat="server" TargetControlID="DropDownList_Cat2"
                            ParentControlID="DropDownList_Cat1" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSubCategory"
                            ServicePath="~/Services/BiztBizServices.asmx" Category="SubCategory" />
                        <div class="ddl-bg-normal">
                            <asp:DropDownList EnableViewState="false" ID="DropDownList_Cat3" runat="server" CssClass="log-login-ddl-item">
                            </asp:DropDownList>
                        </div>
                        <ajaxToolkit:CascadingDropDown ID="ccdCat3" runat="server" TargetControlID="DropDownList_Cat3"
                            ParentControlID="DropDownList_Cat2" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSub2Category"
                            ServicePath="~/Services/BiztBizServices.asmx" Category="Sub2Category" />
                        <input type="button" id="btnAddGroup" onclick="AddToList();" value="اضافه" title="اضافه"
                            name="btnAddGroup" />
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        دسته بندی های انتخاب شده
                    </td>
                    <td class="td_register_de">
                        <div class="listbox-bg-normal">
                            <asp:ListBox ID="lstGroup" runat="server" SelectionMode="Multiple" CssClass="listbox-item">
                            </asp:ListBox>
                        </div>
                        <input id="listGroup" runat="server" type="hidden" />
                        <input type="button" id="btnRemoveGroup" onclick="DeleteGroup();" value="حذف" title="حذف"
                            name="btnRemoveGroup" />
                        <input type="button" id="btnRemoveAllGroup" onclick="RemoveAllOptions();" value="حذف همه"
                            title="حذف همه" name="btnRemoveAllGroup" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <script language="javascript" type="text/javascript">
                            function AddToList() {
                                var limitcount = <%=CompanyCategoryLimited %>;
                                 var grouplist = document.getElementById('<%= lstGroup.ClientID %>');
                                if(limitcount > grouplist.options.length)
                                {
                                    var ddlID = document.getElementById("ContentPlaceHolderContent_ccdCat3_ClientState");
                                    var myArr = ddlID.value.split(":");
                                    var ddlvalue = myArr[0];
                                    var ddltext = myArr[3];

                                    var flag = true;
                                    for (var i = 0; i < grouplist.options.length; i++) {
                                        if (grouplist.options[i].value == ddlvalue)
                                            flag = false;
                                    }

                                    if (flag)
                                    {
                                        if (ddlvalue.length > 0 && ddltext.length > 0) {
                                            var opt = document.createElement("option");

                                            // Add an Option object to Drop Down/List Box
                                            document.getElementById('<%= lstGroup.ClientID %>').options.add(opt);

                                            // Assign text and value to Option object
                                            opt.text = ddltext;
                                            opt.value = ddlvalue;
                                        }
                                        }
                               }
                               else
                               {
                               alert("تعداد بیشتری دسته بندی نمی توانید انتخاب کنید");
                               }

                            }

                            function DeleteGroup() {
                                var grouplist = document.getElementById('<%= lstGroup.ClientID %>');
                                var listlengh = grouplist.options.length;
                                for (i = listlengh - 1; i >= 0; i--) {
                                    if (grouplist.options[i].selected)
                                        grouplist.remove(i);
                                }
                            }

                            function RemoveAllOptions() {
                                var selectbox = document.getElementById('<%= lstGroup.ClientID %>');
                                var i;
                                for (i = selectbox.options.length - 1; i >= 0; i--) {
                                    selectbox.remove(i);
                                }
                            }

                            function SelectFromList() {
                                var grouplist = document.getElementById('<%= lstGroup.ClientID %>');
                                var hdflist = document.getElementById('<%= listGroup.ClientID %>');
                                var listlengh = grouplist.options.length;
                                hdflist.value += "0,";
                                for (var i = 0; i < listlengh; i++) {
                                    hdflist.value += grouplist.options[i].value;
                                    hdflist.value += ",";
                                }
                                hdflist.value += "0";
                            }
                        </script>
                    </td>
                </tr>
                <%-- <tr>
            <td class="td_register">
                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource, Business_Type %>" />
            </td>
            <td class="td_register_de">
                <asp:CheckBoxList ID="CheckBoxList_Business_Typent" runat="server">
                    <asp:ListItem Text="<%$ Resources:Resource, Agent %>" Value="<%$ Resources:Resource, Agent %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Buying_Office %>" Value="<%$ Resources:Resource, Buying_Office %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Distributor_Wholesaler %>" Value="<%$ Resources:Resource, Distributor_Wholesaler %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, finance_travel_etc %>" Value="<%$ Resources:Resource, finance_travel_etc %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Government_ministry %>" Value="<%$ Resources:Resource, Government_ministry %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Manufacturer %>" Value="<%$ Resources:Resource, Manufacturer %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Trade_Company %>" Value="<%$ Resources:Resource, Trade_Company %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Agent %>" Value="<%$ Resources:Resource, Agent %>"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>--%>
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource, Services	 %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="multiinput-bg-normal">
                            <asp:TextBox ID="TextBox_Services" runat="server" TextMode="MultiLine" CssClass="multiinput-item"></asp:TextBox>
                        </div>
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="register"
                            ControlToValidate="TextBox_Services" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Company_Introduction	 %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="multiinput-bg-normal">
                            <asp:TextBox ID="TextBox_Company_Introduction" runat="server" TextMode="MultiLine"
                                CssClass="multiinput-item"></asp:TextBox>
                        </div>
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="register"
                            ControlToValidate="TextBox_Company_Introduction" Display="Dynamic">این فیلد تکمیل نشده</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <%--<tr>
            <td class="td_register">
                <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Resource, Main_Markets	 %>" />
            </td>
            <td class="td_register_de">
                <asp:CheckBoxList ID="CheckBoxList_Main_Marketsnt" runat="server">
                    <asp:ListItem Text="<%$ Resources:Resource, North_America %>" Value="<%$ Resources:Resource, North_America %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, South_America %>" Value="<%$ Resources:Resource, South_America %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Western_Europe %>" Value="<%$ Resources:Resource, Western_Europe %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Eastern_Europe %>" Value="<%$ Resources:Resource, Eastern_Europe %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Eastern_Asia %>" Value="<%$ Resources:Resource, Eastern_Asia %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Southeast_Asia %>" Value="<%$ Resources:Resource, Southeast_Asia %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Middle_East %>" Value="<%$ Resources:Resource, Middle_East %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Africa %>" Value="<%$ Resources:Resource, Africa %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Oceania %>" Value="<%$ Resources:Resource, Oceania %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Worldwide %>" Value="<%$ Resources:Resource, Worldwide %>"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>--%>
                <%-- <tr>
                    <td class="td_register">
                        <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Resource, annual_sales	 %>" />
                    </td>
                    <td class="td_register_de">
                        <div class="ddl-bg-normal">
                            <asp:DropDownList ID="DropDownList_annual_sales" runat="server" CssClass="log-login-ddl-item">
                                <asp:ListItem Text="-- Please Select --" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Less than US$ 1 Million" Value="Less than US$ 1 Million"></asp:ListItem>
                                <asp:ListItem Text="US$ 1 Million - US$ 2.5 Million" Value="US$ 1 Million - US$ 2.5 Million"></asp:ListItem>
                                <asp:ListItem Text="US$ 2.5 Million - US$ 5 Million" Value="US$ 2.5 Million - US$ 5 Million"></asp:ListItem>
                                <asp:ListItem Text="US$ 5 Million - US$ 10 Million" Value="US$ 5 Million - US$ 10 Million"></asp:ListItem>
                                <asp:ListItem Text="US$ 10 Million - US$ 50 Million" Value="US$ 10 Million - US$ 50 Million"></asp:ListItem>
                                <asp:ListItem Text="US$ 50 Million - US$ 100 Million" Value="US$ 50 Million - US$ 100 Million"></asp:ListItem>
                                <asp:ListItem Text="Above US$ 100 Million" Value="Above US$ 100 Million"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </td>
                </tr>--%>
                <%--<tr>
            <td class="td_register">
                %<asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:Resource, exports	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_exports" runat="server">0</asp:TextBox>
            </td>
        </tr>--%>
                <%-- <tr>
            <td class="td_register">
                <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:Resource, Advertisement	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Advertisementdress" runat="server"></asp:TextBox>
            </td>
        </tr>--%>
                <tr>
                    <td class="td_register">
                        نوع فعالیت
                    </td>
                    <td class="td_register_de">
                        <div style="float: right">
                            <asp:CheckBoxList ID="chkBusinessType" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                                CssClass="defaultP">
                            </asp:CheckBoxList>
                        </div>
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        رسته کاربری
                    </td>
                    <td class="td_register_de">
                        <div style="float: right">
                            <asp:CheckBoxList ID="chkUsageType" runat="server" RepeatColumns="3" RepeatDirection="Horizontal"
                                CssClass="defaultP">
                            </asp:CheckBoxList>
                        </div>
                        <div style="float: right; color: Red; font: bold 12px tahoma; margin-top: 6px;">
                            *</div>
                    </td>
                </tr>
                <tr>
                    <td class="td_register_de" colspan="2">
                        برند هایی که شرکت در آنها فعالیت می کند
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                    </td>
                    <td class="td_register_de">
                        <table>
                            <tr>
                                <td>
                                    نوع برند
                                </td>
                                <td class="td_register_de">
                                    نام شرکت
                                </td>
                            </tr>
                            <tr>
                                <td class="td_register">
                                    <div class="input-bg-normal">
                                        <asp:TextBox ID="txtBrandTypeOne" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                    </div>
                                </td>
                                <td class="td_register_de">
                                    <div class="input-bg-normal">
                                        <asp:TextBox ID="txtBrandNameOne" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_register">
                                    <div class="input-bg-normal">
                                        <asp:TextBox ID="txtBrandTypeTwo" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                    </div>
                                </td>
                                <td class="td_register_de">
                                    <div class="input-bg-normal">
                                        <asp:TextBox ID="txtBrandNameTwo" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_register">
                                    <div class="input-bg-normal">
                                        <asp:TextBox ID="txtBrandTypeThree" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                    </div>
                                </td>
                                <td class="td_register_de">
                                    <div class="input-bg-normal">
                                        <asp:TextBox ID="txtBrandNameThree" runat="server" CssClass="log-login-input-item"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="td_register">
                        &nbsp;
                    </td>
                    <td>
                        <asp:Button ID="ImageButton_Create" runat="server" SkinID="btnNormal" OnClientClick="SelectFromList();"
                            OnClick="ImageButton_Create_Click" Text="ثبت اطلاعات" ValidationGroup="register" />
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right">
            <img alt="" height="22" src="../images/cp-frame2-down.jpg" width="611" />
        </div>
    </div>
        </asp:View>
                <asp:View ID="View2" runat="server">
                <center>
                    <div ID="companyProfileComplate0" runat="server" 
                        style="width: 400px; height: auto; background: #F7D9DD; margin: 15px; float: right; font: bold 11px tahoma; color: #DC1733; padding: 10px;">
                  
                        اطلاعات شرکت با موفقیت ثبت شد
                    </div></center>
        </asp:View>
    </asp:MultiView>
     
    
</asp:Content>
