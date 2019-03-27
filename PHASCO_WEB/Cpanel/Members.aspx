<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    Codebehind="Members.aspx.cs" Inherits="phasco.Cpanel.Members" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script language="C#" runat="server">
        public string Date_Fa(DateTime val)
        {
            string ret_ = "";
            System.Globalization.PersianCalendar pc = new System.Globalization.PersianCalendar();
            DateTime Gettime = Convert.ToDateTime(val);

            ret_ = pc.GetYear(Gettime).ToString() + "/" + pc.GetMonth(Gettime).ToString() + "/" + pc.GetDayOfMonth(Gettime).ToString();
            return ret_;
        }
        public string condition(string con)
        {
            if (con.Trim() == "yes") return "کاربر فعال";
            if (con.Trim() == "no") return "<font color='#FF0000'>غیر فعال</font>";
            return "نا مشخص";
        }
 
    </script>

    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="right" style="width: 33%" valign="top">
                        </td>
                        <td align="right" style="width: 33%" valign="top">
                        </td>
                        <td align="right" style="width: 33%" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 33%" valign="top">
                                                وضعیت :</td>
                        <td align="right" style="width: 33%" valign="top">
                                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                                                    Font-Size="X-Small" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                    <asp:ListItem Value="0">انتخاب وضعيت</asp:ListItem>
                                                    <asp:ListItem Value="1">کاربران فعال</asp:ListItem>
                                                    <asp:ListItem Value="2">کاربران جدید</asp:ListItem>
                                                </asp:DropDownList></td>
                        <td align="right" style="width: 33%" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 33%" valign="top">
                        </td>
                        <td align="right" style="width: 33%" valign="top">
                            <asp:LinkButton ID="LinkButton_UserGroup" runat="server" OnClick="LinkButton_UserGroup_Click">گروه کاربران</asp:LinkButton></td>
                        <td align="right" style="width: 33%" valign="top">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl" style="width: 100%">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="right" style="width: 100%">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr>
                                            <td align="left" style="width: 40%">
                                                </td>
                                            <td align="right" style="width: 60%">
                                                </td>
                                        </tr>
                                        <tr>
                                            <td align="left" style="width: 40%; height: 16px;">
                                            </td>
                                            <td align="right" style="width: 60%; height: 16px;">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 100%">
                                    <asp:GridView ID="GridView_Member" runat="server" AutoGenerateColumns="False" Width="98%"
                                        BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
                                        CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="GridView_Member_PageIndexChanging" PageSize="25">
                                        <Columns>
                                            <asp:BoundField DataField="name" HeaderText="نام " />
                                            <asp:BoundField DataField="famil" HeaderText="فامیل" />
                                            <asp:BoundField DataField="uid" HeaderText="نام کاربری" />
                                            <asp:TemplateField HeaderText="تاریخ ثبت نام">
                                                <ItemTemplate>
                                                    <%# Date_Fa(Convert.ToDateTime(Eval("LoginDateEn"))) %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="وضعیت">
                                                <ItemTemplate>
                                                <%# condition(Eval("active").ToString())%>
                                                    &nbsp; &nbsp;&nbsp;
                                                    [<asp:LinkButton ID="LinkButton_Change_Condotion" 
                                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' 
                                                    runat="server" OnCommand="LinkButton_Change_Condotion_Command">تغییر وضعیت</asp:LinkButton>]
                                                    
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="حذف و ويرايش">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButton_Edit"  CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                    runat="server" OnCommand="LinkButton_Edit_Command">ويرايش</asp:LinkButton>&nbsp;
                                                    :&nbsp;
                                                    <asp:LinkButton ID="LinkButton_Delete" OnClientClick="return confirm('برای خذف این کاربر اطمینان دارید')" runat="server" ForeColor="Red" 
                                                    CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                    OnCommand="LinkButton_Delete_Command">حذف</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="#CCCCCC" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                    
                    
                    <table border="0" width="577" id="table28" style="border-collapse: collapse; font-family:Tahoma, Verdana, sans-serif; font-size:11px"   dir="rtl">
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			&nbsp;</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			<span lang="fa"> 
			نام کاربری
 
		 
			</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
                <asp:TextBox ID="TextBox_uid" runat="server" Enabled="False" Font-Names="Tahoma"
                    Font-Size="X-Small" Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px"><font face="Tahoma" size="2">
			<span lang="fa">نام رمز</span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
                <asp:TextBox ID="TextBox_Pass" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px"><font face="Tahoma" size="2">
			<span lang="fa">تکرار نام رمز</span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
                <asp:TextBox ID="TextBox_Pass2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 15px;"></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 15px;" width="402" colspan="2">
			</td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px"><font face="Tahoma" size="2">
			<span lang="fa">نام </span></font>
			<span lang="fa"><font color="#FF0000" face="Tahoma" size="2">*</font></span></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
                <asp:TextBox ID="TextBox_Name" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px"><font face="Tahoma" size="2">
			<span lang="fa">نام خانوادگی </span></font>
			<span lang="fa"><font color="#FF0000" face="Tahoma" size="2">*</font></span></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
                <asp:TextBox ID="TextBox_Famil" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">

			<font face="Tahoma" size="2">
			<span lang="fa">تاریخ تولد</span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
			<font face="Tahoma" size="2"><span lang="fa">روز :<asp:TextBox ID="TextBox_age" runat="server"
                Font-Names="Tahoma" Font-Size="X-Small" Width="15%"></asp:TextBox>
            </span></font><font face="Tahoma" size="2"><span lang="fa">&nbsp;ماه : 
                <asp:TextBox ID="TextBox_age1" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="15%"></asp:TextBox></span></font><font face="Tahoma" size="2"><span lang="fa">&nbsp; سال :
                <asp:TextBox ID="TextBox_age2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="15%"></asp:TextBox></span></font></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">

			&nbsp;</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
	 </td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px"><font face="Tahoma" size="2">
			<span lang="fa">محل تولد</span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
                <asp:TextBox ID="TextBox_BirthLoc" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">

				<font face="Tahoma" size="2"><span lang="fa">
				کشور</span></font>

			</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2"> 
                <asp:TextBox ID="TextBox_Country" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">

				استان</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2"> 
                <asp:TextBox ID="TextBox_State" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">

				شهر</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2"> 
                <asp:TextBox ID="TextBox_City" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			نام مؤسسه</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2"> 
                <asp:TextBox ID="TextBox_OrgName" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			نام مدير يا مسئول فنی</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2"> 
                <asp:TextBox ID="TextBox_OrgPosition" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 65px;"><font face="Tahoma" size="2">

							<span lang="fa"><font size="1">جنسیت</font></span></font><font size="1">
	
			
			</font>
						
			 
						
			</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 65px;" width="402" colspan="2">
			

			<span lang="fa"></span><font face="Tahoma">
			<span lang="fa"><font size="2">
                <asp:RadioButtonList ID="RadioButtonList_Sex" runat="server">
                    <asp:ListItem Value="m">مرد</asp:ListItem>
                    <asp:ListItem Value="f">زن</asp:ListItem>
                </asp:RadioButtonList></font></span></font></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
		
				<font face="Tahoma" size="2"><span lang="fa"><font size="1">تاهل</font></span></font><font size="1">
				</font>
			
			
			</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
	 

	<span lang="fa"></span>
			
			<span lang="fa"><font size="2">
                <asp:RadioButtonList ID="RadioButtonList_Marriage" runat="server">
                    <asp:ListItem Value="s">مجرد</asp:ListItem>
                    <asp:ListItem Value="m">متاهل</asp:ListItem>
                </asp:RadioButtonList></font></span></td>
		</tr>
		<tr>
			<td width="171" align="justify" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px"><font face="Tahoma" size="2">
						<span lang="fa"><font size="1">تحصيلات</font></span></font><font face="Tahoma" size="1">&nbsp;
			</font>
			<span lang="fa"><font color="#FF0000" face="Tahoma" size="2">*</font></span></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">
                <asp:TextBox ID="TextBox_Studies" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			<font face="Tahoma" size="2"><span lang="fa"><font size="1">رشته 
			تحصيلی</font></span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">&nbsp;<asp:TextBox ID="TextBox_Studies1" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			<font face="Tahoma" size="1">زمينه فعاليت مؤسسه</font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2"> 
&nbsp;<asp:TextBox ID="TextBox_Example" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Height="45px" TextMode="MultiLine" Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 45px;">
			<font face="Tahoma" size="1">نحوه آشنايی با شرکت فاسکو<br/>
&nbsp;</font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 45px;" width="402" colspan="2"> 
&nbsp;<asp:TextBox ID="TextBox_Favorites" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Height="45px" TextMode="MultiLine" Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td align="left" valign="top" colspan="3" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			&nbsp;</td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 15px;">
			<font face="Tahoma" size="2"><span lang="fa"><font size="1">تلفن 
			ثابت</font></span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 15px;" width="402" colspan="2">&nbsp;<asp:TextBox ID="TextBox_tel" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			<font face="Tahoma" size="2"><span lang="fa"><font size="1">تلفن 
			همراه</font></span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">&nbsp;<asp:TextBox ID="TextBox_Mobile" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			<font face="Tahoma" size="2"><span lang="fa"><font size="1">آدرس پست 
			الکترونيک</font></span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">&nbsp;<asp:TextBox ID="TextBox_Email" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 22px;">
			<font face="Tahoma" size="2"><span lang="fa"><font size="1">آدرس وب 
			سایت</font></span></font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 22px;" width="402" colspan="2">&nbsp;<asp:TextBox ID="TextBox_Site" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			<font size="1" face="Tahoma">آدرس محل سکونت / کار</font></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">&nbsp;<asp:TextBox ID="TextBox_address" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			نمابر</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">&nbsp;<asp:TextBox ID="TextBox_Fax" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="justify" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			کد اشتراک</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="402" colspan="2">&nbsp;<asp:TextBox ID="TextBox_Zipcode" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></td>
		</tr>
		<tr>
			<td width="171" align="left" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
                گروه :&nbsp;</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="53">
                <asp:DropDownList ID="DropDownList_Member_Group" runat="server" Font-Names="Tahoma"
                    Font-Size="X-Small">
                </asp:DropDownList></td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="347">
			&nbsp;</td>
		</tr>
		<tr>
			<td width="171" align="left" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px">
			کد اشتراک</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px" width="400" colspan="2">
			<font face="Tahoma">
                <asp:TextBox ID="TextBox_User_No" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="60%"></asp:TextBox></font></td>
			</tr>
		<tr>
			<td width="171" align="left" valign="top" style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 21px;">
			&nbsp;</td>
			<td style="font-family: Tahoma, Verdana, sans-serif; font-size: 11px; height: 21px;" width="402" colspan="2"> 
                <asp:Button ID="Button_Apply" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    OnClick="Button_Apply_Click" Text="ثبت شود" />
                <asp:Button ID="Button_Cancle" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    OnClick="Button_Cancle_Click" Text="انصراف" /></td>
		</tr>
	</table>
                    </asp:View>
                    <asp:View ID="View3" runat="server">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="right" dir="rtl" style="width: 40%; height: 13px">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr>
                                            <td align="right" dir="rtl" style="width: 40%">
                                                &nbsp; &nbsp; نام گروه :</td>
                                            <td align="right" dir="rtl" style="width: 60%">
                                                <asp:TextBox ID="TextBox_GroupName" runat="server" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td align="right" dir="rtl" style="width: 40%">
                                                &nbsp; &nbsp; درجه گروه :</td>
                                            <td align="right" dir="rtl" style="width: 60%">
                                                <asp:DropDownList ID="DropDownList_Levels" runat="server" Font-Names="Tahoma" Font-Size="X-Small">
                                                    <asp:ListItem>1</asp:ListItem>
                                                    <asp:ListItem>2</asp:ListItem>
                                                    <asp:ListItem>3</asp:ListItem>
                                                    <asp:ListItem>4</asp:ListItem>
                                                    <asp:ListItem>5</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td align="right" dir="rtl" style="width: 40%">
                                            </td>
                                            <td align="right" dir="rtl" style="width: 60%">
                                                <asp:Button ID="Button_Level_Insert" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                    OnClick="Button_Level_Insert_Click" Text="ثبت شود" /></td>
                                        </tr>
                                    </table>
                                </td>
                                <td align="right" dir="rtl" style="width: 60%; height: 13px" valign="top">
                                    <asp:GridView ID="GridView_Levels" runat="server" AutoGenerateColumns="False" BackColor="White"
                                        BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black"
                                        GridLines="Vertical" Width="100%">
                                        <FooterStyle BackColor="#CCCCCC" />
                                        <Columns>
                                            <asp:BoundField DataField="GroupName" HeaderText="عنوان" />
                                            <asp:BoundField DataField="SecureLevel" HeaderText="درجه" />
                                        </Columns>
                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="#CCCCCC" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" dir="rtl" style="width: 40%">
                                </td>
                                <td align="right" dir="rtl" style="width: 60%" valign="top">
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView></td>
        </tr>
    </table>
    <asp:HiddenField ID="HiddenField_Edit_Id" runat="server" />
</asp:Content>
