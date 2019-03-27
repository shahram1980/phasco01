<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master"AutoEventWireup="true" CodeBehind="UserManager.aspx.cs" Inherits="phasco_webproject.Cpanel.UserManager" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script language="C#" runat="server">
        public string Active_Mode(int Mode)
        {
            if (Mode == 1) return "<font color=#0000FF>غير فعال</font>";
            if (Mode == 0) return "<b><font color=#FF0000>فعال</font></b>";
            return "نامشخص";
        }
        public string Sex_Mode(int Mode)
        {
            if (Mode == 0) return "مرد";
            if (Mode == 1) return "زن";
            return "نامشخص";
        }
        public string Banner_View(int Allow, int id)
        {
            string image_Rollover = "";
            if (Allow == 1)
                image_Rollover = "<a href='#' class='thumbnail' ><img src='Images/images.gif' border='0' /><span><img src='../phascoupfile/Userphoto/" + id.ToString() + ".jpg' /><br /></span></a>";
            return image_Rollover;
        }
        public string Set_Point(string id,string point)
        {
            string ret_ = "";

            ret_ = "<a href='" + "javascript:popUp(&#39addpoint.aspx?id=" + id + "&#39)" + "'>" + point + "-/+</a>";
           
            return ret_;
        }

        public string Set_PT(string id)
        {
            string ret_ = "";

            ret_ = "<a href='" + "javascript:popUp(&#39UserPTlist.aspx?id=" + id + "&#39)" + "'>PT List</a>";

            return ret_;
        }

        public string Set_LI(string id)
        {
            string ret_ = "";

            ret_ = "<a href='" + "javascript:popUp(&#39UserLogList.aspx?id=" + id + "&#39)" + "'>LI List</a>";

            return ret_;
        }
    </script>
    <table border="0" cellspacing="0"  style="width: 100%">
        <tr>
            <td  class="style8">
                <a href="TPLidt_Daily.aspx">لیست امتیازات دیرو و امروز
            </a>
            <br />
    <asp:Label ID="Label_Alarm" runat="server" Font-Bold="True"></asp:Label></td>
        </tr>
        <tr>
            <td align="center" dir="rtl"  style="width: 100%; height: 15px">
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl" style="width: 100%; height: 50px">
         
                <asp:Panel ID="Panel_Edit" runat="server" Height="350" Visible="False" Width="100%">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="right" colspan="2" dir="rtl" style="width: 100%; height: 40px" valign="top">
                            &nbsp;<strong>کد کاربری : [ </strong>
                            <asp:Label ID="LBL_UserId" runat="server" Font-Bold="True"></asp:Label><strong> ]</strong></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%;" valign="top">
                            نام کاربری :
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:TextBox ID="TextBox_uid" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="40%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%;" valign="top">
                            نام رمز :
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Pass" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                TextMode="Password" Width="40%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            نام :</td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Name" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="40%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%;" valign="top">
                            نام خانوادگی :
                        </td>
                        <td align="right" style="width: 80%;" valign="top">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Famil" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="40%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            نام پدر :
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Father" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="40%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            جنسیت :
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                            <asp:RadioButtonList ID="RadioButtonList_sex" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">مرد</asp:ListItem>
                                <asp:ListItem Value="1">زن</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            وب سایت :
                        </td>
                        <td align="right" style="width: 80%" valign="top" dir="ltr">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Website" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="40%"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            ایمیل :
                        </td>
                        <td align="right" style="width: 80%" valign="top" dir="ltr">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Email" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="40%"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%;" valign="top">
                            تلفن :
                        </td>
                        <td align="right" style="width: 80%;" valign="top" dir="ltr">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Tel" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="40%"></asp:TextBox>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            آدرس :
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Address" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="40%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            توضيحات :
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:TextBox ID="TextBox_Description" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Height="30px" TextMode="MultiLine" Width="60%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            معرف :</td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:TextBox ID="TextBox_IntriId" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                Width="60%"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            تاریخ ثبت نام :</td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:Label ID="Label_RegisterDate" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            آخرین مراجعه&nbsp; :
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:Label ID="Label_LastDate" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            حالت کاربر :</td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:Label ID="Label_UserMode" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                            طبقه امنیتی :</td>
                        <td align="right" style="width: 80%" valign="top">
                            &nbsp;
                            <asp:Image ID="Image_role" runat="server" />
                            &nbsp;
                            <asp:DropDownList ID="DropDownList_User_Role" runat="server" Font-Names="Tahoma"
                                Font-Size="X-Small">
                                <asp:ListItem Value="0">نامشخص</asp:ListItem>
                                <asp:ListItem Value="1">گروه 1</asp:ListItem>
                                <asp:ListItem Value="2">گروه 2</asp:ListItem>
                                <asp:ListItem Value="3">گروه 3</asp:ListItem>
                                <asp:ListItem Value="4">گروه 4</asp:ListItem>
                                <asp:ListItem Value="5">گروه هیائت علمی</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                            <asp:Button ID="Button_Edit" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                OnClick="Button_Edit_Click" Text="ويرايش شود" />
                            <asp:Button ID="Button_Edit_Cancle" runat="server" Font-Names="Tahoma" Font-Size="XX-Small" Text="انصراف" OnCommand="Button_Edit_Cancle_Command" /></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 20%" valign="top">
                        </td>
                        <td align="right" style="width: 80%" valign="top">
                        </td>
                    </tr>
                </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl" style="width: 100%; height: 35px">
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl" style="width: 100%; height: 15px">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="right" style="width: 10%" valign="top">
                            جستجو :</td>
                        <td align="right" style="width: 20%" valign="top">
                            <asp:TextBox ID="TextBox_Search" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                Width="168px"></asp:TextBox></td>
                        <td align="right" style="width: 60%" valign="top">
                            <asp:RadioButtonList ID="RadioButtonList_Search_Mode" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">نمايش کل کاربران</asp:ListItem>
                                <asp:ListItem Selected="True" Value="1">نام کاربری</asp:ListItem>
                                <asp:ListItem Value="2">کد کاربری</asp:ListItem>
                                <asp:ListItem Value="3">ايميل</asp:ListItem>
                            </asp:RadioButtonList></td>
                        <td align="right" style="width: 10%" valign="top" colspan="2">
                            <asp:Button ID="Button_Search" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                OnClick="Button_Search_Click" Text="پيدا کن" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" dir="rtl" style="width: 100%; height: 15px">
                <asp:GridView ID="Grid_Users" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" Width="100%" PageSize="25" AllowPaging="True" OnPageIndexChanging="Grid_Users_PageIndexChanging">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="کد کاربری" />
                        <asp:BoundField DataField="Uid" HeaderText="نام کاربری" />
                        <asp:BoundField DataField="name" HeaderText="نام نام خانوادگی" />
                        <asp:TemplateField HeaderText="جنسیت">
                        <ItemTemplate>
                        <%# Sex_Mode(Convert.ToInt32(Eval("sex").ToString()))%>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Email" HeaderText="ایمیل" />
                        <asp:TemplateField HeaderText="وضعيت">
                            <ItemTemplate>
                                [<asp:LinkButton ID="LinkButton_ChangeModeUser" runat="server" Font-Bold="True" ForeColor="Red"
                                    OnCommand="LinkButton_ChangeModeUser_Command"  
                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'>تغيير وضعيت
                                    </asp:LinkButton>]
                                    <%# Active_Mode(Convert.ToInt32(Eval("UserActive").ToString()))%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تصویر">
                            <ItemTemplate>
                                <%# Banner_View(Convert.ToInt32(Eval("Image")),Convert.ToInt32(Eval("id"))) %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نمايش ، ويرايش">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton_EditUser" runat="server" 
                                CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                OnCommand="LinkButton_EditUser_Command">ويرايش</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="امتیاز">
                            <ItemTemplate>
                            <%# Set_Point(Eval("id").ToString(), Eval("point").ToString())%>
                        
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="PT">
                            <ItemTemplate>
                            <%# Set_PT(Eval("id").ToString())%>
                        
                            </ItemTemplate>
                        </asp:TemplateField>

                              <asp:TemplateField HeaderText="LI">
                            <ItemTemplate>
                            <%# Set_LI(Eval("id").ToString())%>
                        
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle BackColor="#EFF3FB" />
                    <EditRowStyle BackColor="#2461BF" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 100%">
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="HiddenField_UserId" runat="server" />
    <asp:HiddenField ID="HiddenField_Mode_Search" runat="server" />
</asp:Content>