<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true" CodeBehind="InsertResume.aspx.cs" Inherits="Rahbina.Job.InsertResume" %>

<asp:Content ContentPlaceHolderID="head_Meta" ID="content1" runat="server"></asp:Content>

<asp:Content ContentPlaceHolderID="Plc_Mid" ID="content2" runat="server">


    <asp:ScriptManager runat="server" ID="ScriptMnager1"></asp:ScriptManager>
     <a class="btn btn-default" onclick="goBack()">بازگشت <i class="fa fa-reply"></i></a>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
    
    <div class="shop-widget">


        <h4>درج رزومه جدید</h4>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">

                <table class="table no-border table-responsive text-center text-right rtl-text form-group margin-top-30">
                    <%--Subject--%>

                    <tr>
                        <td>
                            <asp:Label ID="Label_Subject" runat="server" Text="عنوان رزومه">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="TextBox_Subject" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Subject" ControlToValidate="TextBox_Subject"
                                Text="لطفا عنوان رزومه خود را مشخص كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <%--nationalNumber--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_nationalNumber" runat="server" Text="شماره ملي">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_nationalNumber" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_nationalNumber" ControlToValidate="TextBox_nationalNumber"
                                Text="لطفا شماره ملي خود را وارد كنيد" Display="Dynamic"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server"
                                Operator="DataTypeCheck" Type="Double" Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_nationalNumber"
                                ErrorMessage="CompareValidator"></asp:CompareValidator>
                        </td>
                    </tr>
                    <%--servis--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_servis" runat="server" Text="وضعيت نظام وظيفه">

                            </asp:Label>
                        </td>
                        <td>
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
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_service" ControlToValidate="DropDownList_servis"
                                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--phone--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_phone" runat="server" Text="تلفن">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="TextBox_phone" runat="server" MaxLength="11"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_phone" ControlToValidate="TextBox_phone"
                                Text="لطفا تلفن خود را وارد كنيد" Display="Dynamic"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" runat="server"
                                Operator="DataTypeCheck" Type="Double" Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_phone"
                                ErrorMessage="CompareValidator"></asp:CompareValidator>
                        </td>
                    </tr>
                    <%--mobile--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_mobile" runat="server" Text="موبايل">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_mobile" runat="server" MaxLength="11"></asp:TextBox>
                        </td>
                        <td>
                            <asp:CompareValidator ID="CompareValidator_mobile" runat="server"
                                Operator="DataTypeCheck" Type="Double" Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_mobile"
                                ErrorMessage="CompareValidator"></asp:CompareValidator>
                        </td>
                    </tr>
                    <%--JobStatus--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_JobStatus" runat="server" Text="وضعيت شغلي">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList_JobStatus" runat="server">
                                <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                <asp:ListItem Text="بيكار"></asp:ListItem>
                                <asp:ListItem Text="شاغل"></asp:ListItem>

                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_JobStatus" ControlToValidate="DropDownList_JobStatus"
                                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--EducationStatus--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_EducationStatus" runat="server" Text="وضعيت تحصيلي">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_EducationStatus" runat="server">
                                <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                <asp:ListItem Text="دانشجو"></asp:ListItem>
                                <asp:ListItem Text="فارغ اتحصيل"></asp:ListItem>

                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DropDownList_EducationStatus"
                                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--ExpireTime--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_ExpireTime" runat="server" Text="مدت نمايش رزومه">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_ExpireTime" runat="server">
                                <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                <asp:ListItem Text="10"></asp:ListItem>
                                <asp:ListItem Text="20"></asp:ListItem>
                                <asp:ListItem Text="30"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="Label_ExpireTime2" runat="server" Text="روز"></asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_ExpireTime" ControlToValidate="DropDownList_ExpireTime"
                                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--category--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_category" runat="server" Text="زمينه فعاليت">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_category" runat="server" AutoPostBack="true"
                                AppendDataBoundItems="true"
                                DataTextField="CategoryName" DataValueField="CategoryID"
                                OnSelectedIndexChanged="DropDownList_category_SelectedIndexChanged"
                                OnTextChanged="DropDownList_category_TextChanged">
                                <asp:ListItem Text="--انتخاب كنيد--" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_category" ControlToValidate="DropDownList_category"
                                Text="لطفا يك مورد را انتخاب كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--Subcategory--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_Subcategory" runat="server" Text="زمينه تخصصي">

                            </asp:Label>
                        </td>
                        <td>

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList CssClass="form-control" ID="DropDownList_Subcategory" runat="server" DataTextField="CategoryName" DataValueField="CategoryID">
                                    </asp:DropDownList>

                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownList_category" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Subcategory" ControlToValidate="DropDownList_Subcategory"
                                Text="لطفا يك مورد را انتخاب كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--CoOperate_Condition--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="نحوه همكاري">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="DropDownList_CoOperate_Condition" runat="server">
                                <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                                <asp:ListItem Text="پاره وقت"></asp:ListItem>
                                <asp:ListItem Text="تمام وقت"></asp:ListItem>

                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_CoOperate_Condition" ControlToValidate="DropDownList_CoOperate_Condition"
                                InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--Requested_Wage--%>
                    <tr>
                        <td>
                            <asp:Label ID="Labe_Requested_Wage" runat="server" Text="حقوق درخواستي">

                            </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="TextBox_Requested_Wage" runat="server" MaxLength="15"></asp:TextBox>
                            <asp:Label ID="Label5" runat="server" Text="تومان"></asp:Label>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_Requested_Wage" ControlToValidate="TextBox_Requested_Wage"
                                Text="لطفا حقوق درخواستي خود را خود را مشخص كنيد" Display="Dynamic"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator_Requested_Wage" runat="server"
                                Operator="DataTypeCheck" Type="Double" Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_Requested_Wage"
                                ErrorMessage="CompareValidator"></asp:CompareValidator>
                        </td>
                    </tr>
                    <%--pro_abilities--%>

                    <tr>
                        <td>
                            <asp:Label ID="Label_pro_abilities" runat="server" Text="توانايي هاي حرفه اي"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="TextBox_pro_abilities" runat="server" TextMode="MultiLine" Columns="30" Rows="5"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator_pro_abilities" ControlToValidate="TextBox_pro_abilities"
                                Text="خلاصه اي از توانايي هاي خود را بيان كنيد"
                                runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <%--Explantion--%>
                    <tr>
                        <td>
                            <asp:Label ID="Label_Explantion" runat="server" Text="توضيحات"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox_Explantion" runat="server" TextMode="MultiLine" Columns="30" Rows="5"></asp:TextBox>

                        </td>
                        <td></td>
                    </tr>
                    <%--\\\\////--%>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="Button_insert_resume" CssClass="btn btn-primary" runat="server" Text="ثبت رزومه"
                                OnClick="Button_insert_resume_Click" />
                        </td>
                        <td></td>
                    </tr>
                </table>

            </asp:View>


        </asp:MultiView>


    </div>

</asp:Content>
