<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    Inherits="Rahbina.Job.EnabledResumes" %>

<asp:Content ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">
    <asp:ScriptManager ID="ScriptManger1" runat="server"></asp:ScriptManager>
    <h3>لیست رزومه های فعال</h3>
      <a class="btn btn-default" onclick="goBack()">بازگشت <i class="fa fa-reply"></i></a>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <asp:GridView ID="GridView_Enabeled_resumes" runat="server" CssClass="table table-bordered table-striped table-responsive"
                AutoGenerateColumns="False" Width="100%">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
                <Columns>
                    <asp:BoundField DataField="ResumeSubject" HeaderText="عنوان رزومه"></asp:BoundField>
                    <asp:TemplateField HeaderText="تاريخ درج">
                        <ItemTemplate>
                            <asp:Label ID="Label_insertDate" runat="server" Text='<%#GetfarsiDate(Eval("InsertDate")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="تاريخ انقضاء">
                        <ItemTemplate>
                            <asp:Label ID="Label_Expire_Date" runat="server" Text='<%#GetfarsiDate(Eval("Expire_Date")) %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="گزينه ها">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink_Options" runat="server" NavigateUrl='<%#Set_URL(Eval("id"),Eval("CategoryID")) %>'>مشاهده و ويرايش</asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510"></FooterStyle>
                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510"></PagerStyle>
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White"></HeaderStyle>
            </asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <table  class="table table-responsive table-striped form-group" style="width: 100%" border="0">
                        <tbody>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Subject" runat="server" ErrorMessage="RequiredFieldValidator"
                                        Text="لطفا عنوان رزومه خود را مشخص كنيد" ControlToValidate="TextBox_Subject"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:TextBox CssClass="form-control" ID="TextBox_Subject" runat="server"></asp:TextBox>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_Subject" runat="server" Text="عنوان رزومه"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator"
                                        Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_nationalNumber" Type="Double"
                                        Operator="DataTypeCheck"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_nationalNumber" runat="server"
                                        ErrorMessage="RequiredFieldValidator" Text="لطفا شماره ملي خود را وارد كنيد"
                                        ControlToValidate="TextBox_nationalNumber" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:TextBox CssClass="form-control" ID="TextBox_nationalNumber" runat="server" MaxLength="10"></asp:TextBox>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_nationalNumber" runat="server" Text="شماره ملي"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_service" runat="server" ErrorMessage="RequiredFieldValidator"
                                        Text="لطفا يك مورد را انتخاب كنيد" ControlToValidate="DropDownList_servis" InitialValue="--انتخاب كنيد--"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_servis" runat="server">
                                        <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                        <asp:ListItem Text="معافيت تحصيلي"></asp:ListItem>
                                        <asp:ListItem Text="معافيت پزشكي"></asp:ListItem>
                                        <asp:ListItem Text="كفالت موقت"></asp:ListItem>
                                        <asp:ListItem Text="كفالت دائم"></asp:ListItem>
                                        <asp:ListItem Text="پايان خدمت"></asp:ListItem>
                                        <asp:ListItem Text="مشمول"></asp:ListItem>
                                        <asp:ListItem Text="در حال خدمت"></asp:ListItem>
                                        <asp:ListItem Text="خريد خدمت"></asp:ListItem>
                                        <asp:ListItem Text="ساير موارد"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_servis" runat="server" Text="وضعيت نظام وظيفه"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"
                                        Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_phone" Type="Double"
                                        Operator="DataTypeCheck"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_phone" runat="server" ErrorMessage="RequiredFieldValidator"
                                        Text="لطفا تلفن خود را وارد كنيد" ControlToValidate="TextBox_phone" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:TextBox ID="TextBox_phone" runat="server" MaxLength="11"></asp:TextBox>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_phone" runat="server" Text="تلفن"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:CompareValidator ID="CompareValidator_mobile" runat="server" ErrorMessage="CompareValidator"
                                        Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_mobile" Type="Double"
                                        Operator="DataTypeCheck"></asp:CompareValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_mobile" runat="server" ErrorMessage="RequiredFieldValidator"
                                        Text="لطفا موبايل خود را وارد كنيد" ControlToValidate="TextBox_mobile" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:TextBox CssClass="form-control" ID="TextBox_mobile" runat="server" MaxLength="11"></asp:TextBox>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_mobile" runat="server" Text="موبايل"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_JobStatus" runat="server"
                                        ErrorMessage="RequiredFieldValidator" Text="لطفا يك مورد را انتخاب كنيد" ControlToValidate="DropDownList_JobStatus"
                                        InitialValue="--انتخاب كنيد--"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_JobStatus" runat="server" AppendDataBoundItems="true">
                                        <asp:ListItem Text="بيكار"></asp:ListItem>
                                        <asp:ListItem Text="شاغل"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_JobStatus" runat="server" Text="وضعيت شغلي"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                                        Text="لطفا يك مورد را انتخاب كنيد" ControlToValidate="DropDownList_EducationStatus"
                                        InitialValue="--انتخاب كنيد--"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_EducationStatus" runat="server" AppendDataBoundItems="true">
                                        <asp:ListItem Text="دانشجو"></asp:ListItem>
                                        <asp:ListItem Text="فارغ اتحصيل"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_EducationStatus" runat="server" Text="وضعيت تحصيلي"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:Label ID="Label_ExpireTime" runat="server" Text="مدت نمايش رزومه"></asp:Label>
                                    <asp:Label ID="Label_ExpireTime3" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="Label_ExpireTime2" runat="server" Text="روز"></asp:Label>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left"></td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_category" runat="server" ErrorMessage="RequiredFieldValidator"
                                        Text="لطفا يك مورد را انتخاب كنيد" ControlToValidate="DropDownList_category"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_category" runat="server" AppendDataBoundItems="true"
                                        OnSelectedIndexChanged="DropDownList_category_SelectedIndexChanged" DataValueField="CategoryID"
                                        DataTextField="CategoryName" AutoPostBack="true">
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_category" runat="server" Text="زمينه فعاليت"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Subcategory" runat="server"
                                        ErrorMessage="RequiredFieldValidator" Text="لطفا يك مورد را انتخاب كنيد" ControlToValidate="DropDownList_Subcategory"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>
                                            <asp:DropDownList CssClass="form-control" ID="DropDownList_Subcategory" runat="server" DataValueField="CategoryID"
                                                DataTextField="CategoryName" __designer:wfdid="w3">
                                            </asp:DropDownList>
                                            <asp:Label ID="Label1" runat="server" Text="Label" __designer:wfdid="w4"></asp:Label>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="DropDownList_category"></asp:AsyncPostBackTrigger>
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_Subcategory" runat="server" Text="زمينه تخصصي"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_CoOperate_Condition" runat="server"
                                        ErrorMessage="RequiredFieldValidator" Text="لطفا يك مورد را انتخاب كنيد" ControlToValidate="DropDownList_CoOperate_Condition"
                                        InitialValue="--انتخاب كنيد--"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_CoOperate_Condition" runat="server">
                                        <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                        <asp:ListItem Text="پاره وقت"></asp:ListItem>
                                        <asp:ListItem Text="تمام وقت"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label4" runat="server" Text="نحوه همكاري">
                                        <asp:Label ID="Labe_redStar12" runat="server" Text="*"></asp:Label>
                                    </asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_Requested_Wage" runat="server"
                                        ErrorMessage="RequiredFieldValidator" Text="لطفا حقوق درخواستي خود را خود را مشخص كنيد"
                                        ControlToValidate="TextBox_Requested_Wage" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator_Requested_Wage" runat="server" ErrorMessage="CompareValidator"
                                        Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_Requested_Wage" Type="Double"
                                        Operator="DataTypeCheck"></asp:CompareValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:TextBox CssClass="form-control" ID="TextBox_Requested_Wage" runat="server" MaxLength="15"></asp:TextBox>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label5" runat="server" Text="تومان"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:Label ID="Labe_Requested_Wage" runat="server" Text="حقوق درخواستي">
                                        <asp:Label ID="Labe_redStar13" runat="server" Text="*"></asp:Label>
                                    </asp:Label>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left"></td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator_pro_abilities" runat="server"
                                        ErrorMessage="RequiredFieldValidator" Text="خلاصه اي از توانايي هاي خود را بيان كنيد"
                                        ControlToValidate="TextBox_pro_abilities"></asp:RequiredFieldValidator>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:TextBox CssClass="form-control" ID="TextBox_pro_abilities" runat="server" Rows="5" Columns="30" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_pro_abilities" runat="server" Text="توانايي هاي حرفه اي"></asp:Label><asp:Label
                                        ID="Label3" runat="server" Text="*"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right"></td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:TextBox ID="TextBox_Explantion" runat="server" Rows="5" Columns="30" TextMode="MultiLine"></asp:TextBox>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left">
                                    <asp:Label ID="Label_Explantion" runat="server" Text="توضيحات"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%" dir="rtl" valign="top" align="right">
                                    <asp:HyperLink ID="HyperLink_Enabled_to_complete" runat="server">ويرايش اطلاعات تكميلي رزومه</asp:HyperLink>
                                </td>
                                <td style="width: 30%" dir="rtl" align="right">
                                    <asp:Button  CssClass="btn btn-primary" ID="Button_update_resume" OnClick="Button_update_resume_Click" runat="server"
                                        Text="اعمال تغييرات در رزومه"></asp:Button>
                                </td>
                                <td style="width: 20%" dir="ltr" valign="top" align="left"></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div style="text-align: center" class="InstedOfTable">
                &nbsp;
            </div>
        </asp:View>
        <asp:View ID="View3" runat="server">
            <asp:Label ID="Label2" runat="server" Text="رزومه شما با موفقيت تغيير يافت"></asp:Label>
            <asp:HyperLink ID="HyperLink_continue" runat="server" NavigateUrl="~/Job/EnabledResumes.aspx">ادامه</asp:HyperLink>
        </asp:View>
    </asp:MultiView>
</asp:Content>
