<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Master_Phasco.Master" CodeBehind="DisabledResumes.aspx.cs" Inherits="Rahbina.Job.DisabledResumes" %>

<asp:Content ContentPlaceHolderID="head_Meta" runat="server" ID="content1">
</asp:Content>

<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server" ID="content2">
      <a class="btn btn-default" onclick="goBack()">بازگشت <i class="fa fa-reply"></i></a>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script>
    
    <h3>رزومه های منقضی شده و غیر فعال

    </h3>

    <asp:ScriptManager ID="ScriptMnager1" runat="server"></asp:ScriptManager>
    <asp:MultiView ID="MultiView1" runat="server">

        <asp:View ID="View1" runat="server">
            <asp:GridView ID="GridView_Enabeled_resumes" runat="server"
                PagerSettings-FirstPageText="صفحه اول" PagerSettings-LastPageText="صفحه آخر" PagerSettings-NextPageText=" صفحه بعد"
                PagerSettings-PreviousPageText="صفحه قبل" PageSize="5"
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84"
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <Columns>
                    <asp:BoundField HeaderText="عنوان رزومه" DataField="ResumeSubject" />
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
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
        </asp:View>

        <asp:View ID="View2" runat="server">

            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Subject" ControlToValidate="TextBox_Subject"
                    Text="لطفا عنوان رزومه خود را مشخص كنيد"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>

            <div class="InstedOfTable">
                <asp:TextBox ID="TextBox_Subject" runat="server"></asp:TextBox>
            </div>

            <div class="InstedOfTable">
                <asp:Label ID="Label_Subject" runat="server" Text="عنوان رزومه"></asp:Label>
            </div>
            <br />
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_nationalNumber" ControlToValidate="TextBox_nationalNumber"
                    Text="لطفا شماره ملي خود را وارد كنيد" Display="Dynamic"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    Operator="DataTypeCheck" Type="Double" Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_nationalNumber"
                    ErrorMessage="CompareValidator"></asp:CompareValidator>
            </div>

            <div class="InstedOfTable">
                <asp:TextBox ID="TextBox_nationalNumber" runat="server" MaxLength="10"></asp:TextBox>
            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_nationalNumber" runat="server" Text="شماره ملي"></asp:Label>
            </div>

            <br />
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_service" ControlToValidate="DropDownList_servis"
                    InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>

            <div class="InstedOfTable">
                <asp:DropDownList ID="DropDownList_servis" runat="server">
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

            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_servis" runat="server" Text="وضعيت نظام وظيفه"></asp:Label>
            </div>



            <br />
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_phone" ControlToValidate="TextBox_phone"
                    Text="لطفا تلفن خود را وارد كنيد" Display="Dynamic"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server"
                    Operator="DataTypeCheck" Type="Double" Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_phone"
                    ErrorMessage="CompareValidator"></asp:CompareValidator>
            </div>

            <div class="InstedOfTable">
                <asp:TextBox ID="TextBox_phone" runat="server" MaxLength="11"></asp:TextBox>
            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_phone" runat="server" Text="تلفن"></asp:Label>
            </div>

            <br />
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_mobile" ControlToValidate="TextBox_mobile"
                    Text="لطفا موبايل خود را وارد كنيد" Display="Dynamic"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator_mobile" runat="server"
                    Operator="DataTypeCheck" Type="Double" Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_mobile"
                    ErrorMessage="CompareValidator"></asp:CompareValidator>
            </div>

            <div class="InstedOfTable">
                <asp:TextBox ID="TextBox_mobile" runat="server" MaxLength="11"></asp:TextBox>
            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_mobile" runat="server" Text="موبايل"></asp:Label>
            </div>

            <br />
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_JobStatus" ControlToValidate="DropDownList_JobStatus"
                    InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>

            <div class="InstedOfTable">
                <asp:DropDownList ID="DropDownList_JobStatus" runat="server" AppendDataBoundItems="true">

                    <asp:ListItem Text="بيكار"></asp:ListItem>
                    <asp:ListItem Text="شاغل"></asp:ListItem>

                </asp:DropDownList>

            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_JobStatus" runat="server" Text="وضعيت شغلي"></asp:Label>
            </div>

            <br />
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="DropDownList_EducationStatus"
                    InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>

            <div class="InstedOfTable">
                <asp:DropDownList ID="DropDownList_EducationStatus" runat="server" AppendDataBoundItems="true">

                    <asp:ListItem Text="دانشجو"></asp:ListItem>
                    <asp:ListItem Text="فارغ اتحصيل"></asp:ListItem>

                </asp:DropDownList>

            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_EducationStatus" runat="server" Text="وضعيت تحصيلي"></asp:Label>
            </div>
            <br />
            <div class="InstedOfTable">
            </div>

            <div class="InstedOfTable">

                <asp:DropDownList ID="DropDownList_ExpireTime" runat="server">

                    <asp:ListItem Text="10"></asp:ListItem>
                    <asp:ListItem Text="20"></asp:ListItem>
                    <asp:ListItem Text="30"></asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label_ExpireTime2" runat="server" Text="روز"></asp:Label>

            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_ExpireTime" runat="server" Text="مدت نمايش رزومه"></asp:Label>
            </div>

            <br />
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_category" ControlToValidate="DropDownList_category"
                    Text="لطفا يك مورد را انتخاب كنيد"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>
            <div class="InstedOfTable">

                <asp:DropDownList ID="DropDownList_category" runat="server" AutoPostBack="true"
                    AppendDataBoundItems="true"
                    DataTextField="CategoryName" DataValueField="CategoryID" OnSelectedIndexChanged="DropDownList_category_SelectedIndexChanged">
                </asp:DropDownList>




            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_category" runat="server" Text="زمينه فعاليت"></asp:Label>
            </div>
            <br />

            <div class="InstedOfTable">


                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Subcategory" ControlToValidate="DropDownList_Subcategory"
                    Text="لطفا يك مورد را انتخاب كنيد"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>
            <div class="InstedOfTable">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DropDownList_Subcategory" runat="server" DataTextField="CategoryName" DataValueField="CategoryID">
                        </asp:DropDownList>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownList_category" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label_Subcategory" runat="server" Text="زمينه تخصصي"></asp:Label>
            </div>

            <br />
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_CoOperate_Condition" ControlToValidate="DropDownList_CoOperate_Condition"
                    InitialValue="--انتخاب كنيد--" Text="لطفا يك مورد را انتخاب كنيد"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>

            <div class="InstedOfTable">
                <asp:DropDownList ID="DropDownList_CoOperate_Condition" runat="server">
                    <asp:ListItem Text="--انتخاب كنيد--"></asp:ListItem>
                    <asp:ListItem Text="پاره وقت"></asp:ListItem>
                    <asp:ListItem Text="تمام وقت"></asp:ListItem>

                </asp:DropDownList>


            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Label4" runat="server" Text="نحوه همكاري">
                    <asp:Label ID="Labe_redStar12" runat="server" Text="*"></asp:Label>
                </asp:Label>
            </div>
            <div class="InstedOfTable">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_Requested_Wage" ControlToValidate="TextBox_Requested_Wage"
                    Text="لطفا حقوق درخواستي خود را خود را مشخص كنيد" Display="Dynamic"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator_Requested_Wage" runat="server"
                    Operator="DataTypeCheck" Type="Double" Text="لطفا فقط عدد وارد كنيد" ControlToValidate="TextBox_Requested_Wage"
                    ErrorMessage="CompareValidator"></asp:CompareValidator>
            </div>

            <div class="InstedOfTable">
                <asp:TextBox ID="TextBox_Requested_Wage" runat="server" MaxLength="15"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" Text="تومان"></asp:Label>
            </div>
            <div class="InstedOfTable">
                <asp:Label ID="Labe_Requested_Wage" runat="server" Text="حقوق درخواستي">
                    <asp:Label ID="Labe_redStar13" runat="server" Text="*"></asp:Label>
                </asp:Label>
            </div>

            <br />
            <br />
            <div class="InstedOfTable" style="height: 120px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator_pro_abilities" ControlToValidate="TextBox_pro_abilities"
                    Text="خلاصه اي از توانايي هاي خود را بيان كنيد"
                    runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </div>

            <div class="InstedOfTable" style="height: 120px;">
                <asp:TextBox ID="TextBox_pro_abilities" runat="server" TextMode="MultiLine" Columns="30" Rows="5"></asp:TextBox>
            </div>
            <div class="InstedOfTable" style="height: 120px;">
                <asp:Label ID="Label_pro_abilities" runat="server" Text="توانايي هاي حرفه اي"></asp:Label>
                <asp:Label ID="Label3" runat="server" Text="*"></asp:Label>

            </div>
            <br />
            <div class="InstedOfTable" style="height: 120px;">
            </div>

            <div class="InstedOfTable" style="height: 120px;">
                <asp:TextBox ID="TextBox_Explantion" runat="server" TextMode="MultiLine" Columns="30" Rows="5"></asp:TextBox>
            </div>
            <div class="InstedOfTable" style="height: 120px;">
                <asp:Label ID="Label_Explantion" runat="server" Text="توضيحات"></asp:Label>
            </div>
            <div class="InstedOfTable">
                <asp:HyperLink ID="HyperLink_Disabled_to_complete" runat="server">ويرايش اطلاعات تكميلي رزومه</asp:HyperLink>
            </div>
            <div class="InstedOfTable" style="text-align: center;">
                <asp:Button ID="Button_update_resume" runat="server"
                    Text="اعمال تغييرات در رزومه" OnClick="Button_update_resume_Click" />

            </div>
        </asp:View>

        <asp:View ID="View3" runat="server">
            <asp:Label ID="Label2" runat="server" Text="رزومه شما با موفقيت تغيير يافت"></asp:Label>
            <asp:HyperLink ID="HyperLink_continue" runat="server" NavigateUrl="~/Job/DisabledResumes.aspx">ادامه</asp:HyperLink>
        </asp:View>

    </asp:MultiView>

</asp:Content>
