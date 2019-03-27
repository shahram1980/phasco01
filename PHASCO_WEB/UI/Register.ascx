<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="phasco_webproject.UI.Register" %>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
<div style="text-align: center">
    <table border="0" cellpadding="0" cellspacing="0" dir="rtl" style="width: 90%">
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_Uid"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
             <asp:Label ID="UserNameLabel" runat="server" Text="<%$ Resources:Resource, R_username %>" ></asp:Label>
             
             </td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Uid" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Pass"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
                <asp:Label ID="Label1" runat="server"  Text="<%$ Resources:Resource, R_Pass %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Pass" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:Label ID="Label2" runat="server"  Text="<%$ Resources:Resource, R_rPass %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                &nbsp;<asp:TextBox ID="TextBox_Pass2" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
            </td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
            </td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox_Pass"
                    ControlToValidate="TextBox_Pass2" ErrorMessage="Password did not mach" 
                    Text="<%$ Resources:Resource, R_err_confirm_Password %>"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:Label ID="Label3" runat="server"  Text="<%$ Resources:Resource, R_Intro %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Intro" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:Label ID="Label4" runat="server"  Text="<%$ Resources:Resource, R_Firstname %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="Textbox_FirstName" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:Label ID="Label5" runat="server"  Text="<%$ Resources:Resource, R_Lastname %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_LastName" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
            </td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                </td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
            </td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:Label ID="Label6" runat="server"  Text="<%$ Resources:Resource, R_Birthday %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="rtl" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:Resource, R_Birthday_Day %>"></asp:Label>
                :
                <asp:TextBox ID="TextBox_Day" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="30px"></asp:TextBox>
                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:Resource, R_Birthday_Month %>"></asp:Label>
                :
                <asp:TextBox ID="TextBox_Month" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="30px"></asp:TextBox>
                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:Resource, R_Birthday_Year %>"></asp:Label>
                :
                <asp:TextBox ID="TextBox_Years" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                    Width="30px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:Label ID="Label7" runat="server"  Text="<%$ Resources:Resource, R_BirthDayLocation %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_B_Locate" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:Label ID="Label8" runat="server"  Text="<%$ Resources:Resource, R_country %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Country" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox_State"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
                <asp:Label ID="Label9" runat="server"  Text="<%$ Resources:Resource, R_State %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_State" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_City"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
                <asp:Label ID="Label10" runat="server"  Text="<%$ Resources:Resource, R_City %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_City" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox_OrgName"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
                <asp:Label ID="Label11" runat="server"  Text="<%$ Resources:Resource, R_Lab_Name %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_OrgName" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox_OrgPosition"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
                <asp:Label ID="Label12" runat="server"  Text="<%$ Resources:Resource, R_Manager %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_OrgPosition" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%" valign="top">
                <asp:Label ID="Label13" runat="server"  Text="<%$ Resources:Resource, R_SEX %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="top">
                :</td>
            <td align="right" dir="rtl" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:RadioButtonList ID="RadioButtonList_Sex" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="m" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="f"></asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%" valign="top">
                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:Resource, R_Marride %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="top">
                :</td>
            <td align="right" dir="rtl" style="width: 70%" title="WIDTH: 65%" valign="top">
            <asp:RadioButtonList ID="RadioButtonList_Marriage" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Value="s" Selected="True"></asp:ListItem>
                <asp:ListItem Value="m"></asp:ListItem>
            </asp:RadioButtonList></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%" valign="top">
                <asp:Label ID="Label14" runat="server"  Text="<%$ Resources:Resource, R_Study %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="rtl" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:DropDownList ID="DropDownList_Studies" runat="server" Font-Names="Tahoma">
                    <asp:ListItem Text="<%$ Resources:Resource, R_Study01 %>" Value="<%$ Resources:Resource, R_Study01 %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, R_Study02 %>" Value="<%$ Resources:Resource, R_Study02 %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, R_Study03 %>" Value="<%$ Resources:Resource, R_Study03 %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, R_Study04 %>" Value="<%$ Resources:Resource, R_Study04 %>"></asp:ListItem>
                    <asp:ListItem  Text="<%$ Resources:Resource, R_Study05 %>" Value="<%$ Resources:Resource, R_Study05 %>"></asp:ListItem>
                    <asp:ListItem  Text="<%$ Resources:Resource, R_Study06 %>" Value="<%$ Resources:Resource, R_Study06 %>"></asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%" valign="top">
                <asp:Label ID="Label15" runat="server"  Text="<%$ Resources:Resource, R_r_Study %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Studies_R" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%" valign="top">
                <asp:Label ID="Label16" runat="server"  Text="<%$ Resources:Resource, R_Example %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="top">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Example" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Height="80px" TextMode="MultiLine" Width="250px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%" valign="top">
                <asp:Label ID="Label17" runat="server"  Text="<%$ Resources:Resource, R_Visit_Phasco %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="top">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Favorites" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Height="80px" Width="250px" TextMode="Password"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox_Tel"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
                <asp:Label ID="Label18" runat="server"  Text="<%$ Resources:Resource, R_tel %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Tel" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Resource, R_Mobile %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Mobile" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%; height: 19px;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_Email"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:Resource, R_Email %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%;" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%; height: 19px" title="WIDTH: 65%" valign="top">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox_Email"
                    Display="Dynamic" ErrorMessage="Invalid email address" Text="<%$ Resources:Resource, R_err_Email %>"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp;
                <asp:TextBox ID="TextBox_Email" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%; height: 20px">
                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:Resource, R_fax %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%; height: 20px" valign="middle">
            </td>
            <td align="right" dir="ltr" style="width: 70%; height: 20px" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Fax" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%; height: 20px;">
                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Resource, R_Websitge %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%; height: 20px;" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%; height: 20px;" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_WEbSite" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox_Address"
                    Display="Dynamic" ErrorMessage="please enter email " Text="*"></asp:RequiredFieldValidator>
                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Resource, R_Address %>"></asp:Label></td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
                :</td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:TextBox ID="TextBox_Address" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                    Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                </td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
            </td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
            </td>
        </tr>
        <tr>
            <td align="left" dir="rtl" style="width: 30%">
                </td>
            <td align="center" dir="ltr" style="width: 5%" valign="middle">
            </td>
            <td align="right" dir="ltr" style="width: 70%" title="WIDTH: 65%" valign="top">
                <asp:Button ID="Button_Submit" runat="server" Text="<%$ Resources:Resource, R_Submit %>" OnClick="Button_Submit_Click" /></td>
        </tr>
    </table>
</div>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td align="center" style="width: 100%">
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 100%">
                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:Resource, R_err_Final_Massge %>"></asp:Label></td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>
