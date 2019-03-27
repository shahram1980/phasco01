<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="LabDirectory.aspx.cs" Inherits="PHASCO_WEB.LabDirectory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
    <link href="../Theme/css/jquery.fancybox.min.css" rel="stylesheet" />
    <script src="../Theme/js/jquery.fancybox.min.js"></script>
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">

    <div style="text-align: right">
        <table border="0" style="width: 100%">
            <tr>
                <td align="center" colspan="5" rowspan="1" valign="top">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                style="width: 30%">&nbsp;
                            </td>
                            <td style="width: 70%; text-align: right;">
                                <b>جستجوی آزمایشگاه<br />
                                </b>
                            </td>
                        </tr>
                        <tr>

                            <td colspan="2" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                style="width: 70%">
                                <asp:Panel runat="server" ID="p_" DefaultButton="Button_Find">
                                    <div align="right">
                                        <table class="table no-border form-group" border="0" dir="rtl">
                                            <tr>
                                                <td width="10%">
                                                    <asp:Label ID="Label1" Text='<%$ Resources:Resource, province %>' runat="server" />
                                                </td>
                                                <td width="40%">
                                                    <asp:DropDownList ID="DropDownList_edit_Region" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_edit_Region_SelectedIndexChanged">
                                                        <asp:ListItem Value="0">انتخاب استان</asp:ListItem>
                                                        <asp:ListItem Value="1">آذربایجان شرقی</asp:ListItem>
                                                        <asp:ListItem Value="2">آذربایجان غربی</asp:ListItem>
                                                        <asp:ListItem Value="31">البرز</asp:ListItem>
                                                        <asp:ListItem Value="3">اردبیل</asp:ListItem>
                                                        <asp:ListItem Value="4">اصفهان</asp:ListItem>
                                                        <asp:ListItem Value="5">ایلام</asp:ListItem>
                                                        <asp:ListItem Value="6">بوشهر</asp:ListItem>
                                                        <asp:ListItem Value="7">تهران</asp:ListItem>
                                                        <asp:ListItem Value="8">چهار محال و بختیاری</asp:ListItem>
                                                        <asp:ListItem Value="9">خراسان جنوبی</asp:ListItem>
                                                        <asp:ListItem Value="10">خراسان رضوی</asp:ListItem>
                                                        <asp:ListItem Value="11">خراسان شمالی</asp:ListItem>
                                                        <asp:ListItem Value="12">خورستان</asp:ListItem>
                                                        <asp:ListItem Value="13">زنجان</asp:ListItem>
                                                        <asp:ListItem Value="14">سمنان</asp:ListItem>
                                                        <asp:ListItem Value="15">سیستان و بلوچستان</asp:ListItem>
                                                        <asp:ListItem Value="16">فارس</asp:ListItem>
                                                        <asp:ListItem Value="17">قزوین</asp:ListItem>
                                                        <asp:ListItem Value="18">قم</asp:ListItem>
                                                        <asp:ListItem Value="19">کردستان</asp:ListItem>
                                                        <asp:ListItem Value="20">کرمان</asp:ListItem>
                                                        <asp:ListItem Value="21">کرمانشاه</asp:ListItem>
                                                        <asp:ListItem Value="22">کهکیلویه و بویر احمد</asp:ListItem>
                                                        <asp:ListItem Value="23">گلستان</asp:ListItem>
                                                        <asp:ListItem Value="24">گیلان</asp:ListItem>
                                                        <asp:ListItem Value="25">لرستان</asp:ListItem>
                                                        <asp:ListItem Value="26">مازندران</asp:ListItem>
                                                        <asp:ListItem Value="27">مرکزی</asp:ListItem>
                                                        <asp:ListItem Value="28">هرمزگان</asp:ListItem>
                                                        <asp:ListItem Value="29">همدان</asp:ListItem>
                                                        <asp:ListItem Value="30">یزد</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    <asp:Label ID="Label2" Text='<%$ Resources:Resource, City %>' runat="server" />
                                                </td>
                                                <td width="40%">
                                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_edit_State" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_edit_State_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td width="10%">
                                                    <asp:Label ID="Label3" Text='<%$ Resources:Resource, Region %>' runat="server" />
                                                </td>
                                                <td width="40%">
                                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_REGION_2" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%">
                                                    <asp:Label ID="Label4" Text='<%$ Resources:Resource, Nlab %>' runat="server" />
                                                </td>
                                                <td width="40%">
                                                    <asp:TextBox ID="Txt_Name" CssClass="form-control" runat="server"></asp:TextBox>
                                                </td>

                                            </tr>
                                            <tr>

                                                <td width="10%">
                                                    <asp:Label ID="Label5" Text='<%$ Resources:Resource, Levels %>' runat="server" />
                                                </td>
                                                <td width="40%">
                                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_Starts" runat="server">
                                                        <asp:ListItem Value="0">-----</asp:ListItem>
                                                        <asp:ListItem Value="1">تک ستاره</asp:ListItem>
                                                        <asp:ListItem Value="2">دو ستاره</asp:ListItem>
                                                        <asp:ListItem Value="3">سه ستاره</asp:ListItem>
                                                        <asp:ListItem Value="4">چهار ستاره</asp:ListItem>
                                                        <asp:ListItem Value="5">پنج ستاره</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td width="10%"></td>
                                                <td width="40%">
                                                    <asp:Button ID="Button_Find" runat="server" Text='<%$ Resources:Resource, Search %>'
                                                        OnClick="Button_Find_Click" CssClass="btn btn-primary" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="width: 100%; direction: rtl;">
                                                    <asp:Label ID="LBL_Alram" runat="server" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </asp:Panel>
                            </td>
                        </tr>

                        <tr>
                            <td align="center" colspan="2" dir="rtl" valign="top">
                                <b>جستجو بر اساس حروف الفبا</b>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" dir="rtl" valign="top">

                                <div>
                                    <ul class="pagination-list">
                                        <li><a href="LabDirectory.aspx?alpha=ا" title="ا">ا</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=آ"
                                            title="آ">آ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ب" title="ب">ب</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=پ" title="پ">پ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ت"
                                            title="ت">ت</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ث" title="ث">ث</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ج" title="ج">ج</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=چ"
                                            title="چ">چ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ح" title="ح">ح</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=خ" title="خ">خ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=د"
                                            title="د">د</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ذ" title="ذ">ذ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ر" title="ر">ر</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ز"
                                            title="ز">ز</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ژ" title="ژ">ژ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=س" title="س">س</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ش"
                                            title="ش">ش</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ص" title="ص">ص</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ض" title="ض">ض</a></li>

                                        <li><a href="LabDirectory.aspx?alpha=ط" title="ط">ط</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ظ"
                                            title="ظ">ظ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ع" title="ع">ع</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=غ" title="غ">غ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ف"
                                            title="ف">ف </a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ق" title="ق">ق</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ک" title="ک">ک</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=گ"
                                            title="گ">گ</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ل" title="ل">ل</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=م" title="م">م</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ن"
                                            title="ن">ن</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=و" title="و">و</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ه" title="ه">ه</a></li>
                                        <li><a href="LabDirectory.aspx?alpha=ی"
                                            title="ی">ی</a></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">

            <asp:Panel runat="server" ID="Sup_Lab">
                <div class="shop-widget">
                    <h4>حامیان طرح کنترل کیفی فاسکو </h4>
                    <asp:DataList ID="DataList_QC" runat="server" RepeatColumns="3" EnableViewState="False" CssClass="table table-responsive table-striped table-hover rtl-text">
                        <ItemTemplate>
                            <a href='<%# replaceSiteName( Eval("Url").ToString() )%>' title='<%# Eval("Title") %>'>
                                <%# Eval("Title")%>
                            </a>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </asp:Panel>
            <div class="shop-widget">
                <h4>آزمایشگاه های پیشنهادی</h4>
 
                <asp:DataList ID="data_RND" runat="server" RepeatColumns="3" CCssClass="table table-striped table-responsive ">

                    <ItemTemplate>
                        <a href='LabDirectory.aspx?lid=<%# Eval("autoid") %>&t=آزمایشگاه <%# clean_text(Eval("name").ToString())%>' title="<%# Eval("name") %>">آزمایشگاه&nbsp;<%# Eval("name") %></a>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <p class="rtl-text">
                <asp:Label ID="LBL_GRD" runat="server"></asp:Label>
            </p>
            <div class="text-center margin-top-5">
                <asp:DataGrid CssClass="table table-striped table-responsive no-border rtl-text" ID="dgrdTitles" AllowPaging="True" PageSize="40" PagerStyle-Mode="NumericPages"
                    OnPageIndexChanged="dgrdTitles_PageIndexChanged" runat="Server"
                    AutoGenerateColumns="False" ShowHeader="False"
                    Width="100%" GridLines="None">
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemTemplate>

                                <table border="0" dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />">
                                    <tr>

                                        <td style="width: 100%">

                                            <img src="/Images/star<%# Eval("star") %>.gif" border="0" />
                                            -
                                                                  <a href='LabDirectory.aspx?lid=<%# Eval("autoid") %>&t=آزمایشگاه <%# clean_text(Eval("name").ToString())%>'
                                                                      title="<%# Eval("name") %>">

                                                                      <%# Eval("name")%>
                                                                  </a>
                                            <p style="padding-right: 98px;">
                                                <%# Eval("Address")%>
                                            </p>
                                            <br />

                                            <p style="padding-right: 98px;">
                                                <%# Eval("tel")%>
                                            </p>

                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                    <PagerStyle CssClass="pagination-ys persianumber text-right"
                        PageButtonCount="20" />
                    <AlternatingItemStyle BorderStyle="None" BorderWidth="0px" />
                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                </asp:DataGrid>

                
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <hr align="center" width="100%" />
             <a class="btn btn-default" onclick="goBack()">بازگشت <i class="fa fa-reply"></i></a>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
            <br />
            <asp:Image ID="Image_star" runat="server" />
            <table class="table table-bordered table-responsive rtl-text table-striped" border="0" width="100%" id="table1" dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />"
                style="border-collapse: collapse">

                <tr>
                    <td align="left" style="width: 15%">
                        <asp:Label ID="Label6" Text='<%$ Resources:Resource, NLab %>' runat="server" />
                    </td>

                    <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                        width="80%">
                        <asp:Label ID="LBL_name" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="width: 15%" align="left">
                        <asp:Label ID="Label7" Text='<%$ Resources:Resource, address %>' runat="server" />
                    </td>

                    <td width="80%" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />">
                        <asp:Label ID="LBL_address" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="width: 15%; height: 15px;" align="left">&nbsp;مسول فنی
                    </td>

                    <td width="80%" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                        style="height: 15px">
                        <asp:Label ID="LBL_Manager" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="width: 15%; height: 15px" align="left">
                        <asp:Label ID="Label9" Text='<%$ Resources:Resource, services %>' runat="server" />
                    </td>

                    <td width="80%" style="height: 15px" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />">
                        <asp:Label ID="LBL_Food" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="width: 15%" align="left">
                        <asp:Label ID="Label10" Text='<%$ Resources:Resource, Worktime %>' runat="server" />
                    </td>

                    <td width="80%" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />">
                        <asp:Label ID="LBL_TIme" runat="server"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td style="width: 15%; height: 15px;" align="left">
                        <asp:Label ID="Label11" Text='<%$ Resources:Resource, Tel %>' runat="server" />
                    </td>

                    <td width="80%" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                        style="height: 15px" dir="rtl">
                        <asp:Label ID="LBL_reserv" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 15%; height: 15px">
                        <asp:Label ID="Label12" Text='<%$ Resources:Resource, Email %>' runat="server" />
                    </td>

                    <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                        dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="height: 15px"
                        width="80%">
                        <asp:Label ID="LBL_email" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 15%; height: 15px">
                        <asp:Label ID="Label13" Text='<%$ Resources:Resource, Website %>' runat="server" />
                    </td>

                    <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                        dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="height: 15px"
                        width="80%">
                        <asp:HyperLink ID="HyperLink_Web" Target="_blank" runat="server">
                            <asp:Label ID="LBL_Website" runat="server"></asp:Label>
                        </asp:HyperLink>
                    </td>
                </tr>

                <tr>
                    <td width="100%" colspan="3" align="center" valign="top">
                        <asp:Image ID="Image_Res" runat="server" BorderStyle="None" BorderWidth="0px" />
                    </td>
                </tr>
            </table>

            <div class="shop-widget">
                <h4>تصاویر آزمایشگاه
                </h4>

                <asp:DataList ID="DataList_Gallary" runat="server" CellPadding="3" RepeatColumns="5" Width="100%">
                    <ItemTemplate>


                        <a class="thumbnail" data-fancybox="gallery" data-caption="<%# Eval("comment")%>" href='http://phasco.com/phascoupfile/Dir_Gallery/b<%# image_Check(Eval("id").ToString())%>'>
                            <img <%--alt="Highslide JS"--%> src='http://phasco.com/phascoupfile/Dir_Gallery/s<%# image_Check(Eval("id").ToString())%>'
                                title="<%# Eval("comment")%>">
                            <p class="text-center">
                                <%# Eval("comment")%>
                            </p>
                        </a>



                    </ItemTemplate>

                </asp:DataList>
                <script>
                    $('.fancybox').fancybox({
                        beforeShow: function () {
                            this.title = this.title + " - " + $(this.element).data("caption");
                        }
                    });
                </script>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
