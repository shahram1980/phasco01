<%@ Page Language="C#" MasterPageFile="~/Template/MAin.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="PHASCO_Shopping.Register" %>
<%@ Register Assembly="dotNetFreak.WebControls.FormShield" Namespace="dotNetFreak.WebControls"
    TagPrefix="dnf" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:multiview id="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" dir='<asp:Literal ID="LiteralLast_dir00215" Text="<%$ Resources:Resource, dir %>"  runat="server" />' style="width: 400">
                <tr>
                    <td align='<asp:Literal ID="Literal1013" Text="<%$ Resources:Resource, align %>"  runat="server" />' colspan="2" dir="rtl" style="width: 100%; height: 40px" valign="top">
                        <asp:Label ID="lbl_Alarm" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal1008" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%; height: 20px" valign="top">
           
<asp:Literal ID="LiteralLast_UId" Text="<%$ Resources:Resource, UId %>"  runat="server" />&nbsp; :
                        </td>
                    <td align='<asp:Literal ID="Literal1014" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%; height: 20px" valign="top">
                        <asp:TextBox ID="TextBox_uid" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox_uid"
                            ErrorMessage="<%$ Resources:Resource, UID_not_entered %>" ForeColor="Maroon"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal1009" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%; height: 20px" valign="top">
                    </td>
                    <td align='<asp:Literal ID="Literal1015" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%; height: 20px" valign="top">
                        
                        
                        <asp:Literal ID="Literal1Enter_Englishname" Text="<%$ Resources:Resource, Enter_Englishname %>"  runat="server" />&nbsp; :
                        </td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10010" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                    <asp:Literal ID="LiteralPassword00363" Text="<%$ Resources:Resource, Password %>"  runat="server" />&nbsp; :
                       </td>
                    <td align='<asp:Literal ID="Literal1016" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Pass" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            TextMode="Password" Width="40%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox_Pass"
                            ErrorMessage="<%$ Resources:Resource, Password_not_entered %>" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10011" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                         
                        <asp:Literal ID="LiteralConfirm_Password0033" Text="<%$ Resources:Resource, Confirm_Password %>"  runat="server" />&nbsp; :
                        </td>
                    <td align='<asp:Literal ID="Literal1017" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Pass2" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" TextMode="Password" Width="40%"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox_Pass"
                            ControlToValidate="TextBox_Pass2" ErrorMessage="<%$ Resources:Resource, password_doesn_match %>"
                            ForeColor="DarkRed"></asp:CompareValidator></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10012" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%; height: 19px;" valign="top">
                         
                        
                        <asp:Literal ID="Literal1Name" Text="<%$ Resources:Resource, Name %>"  runat="server" />&nbsp; :
                        </td>
                    <td align='<asp:Literal ID="Literal10108" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%; height: 19px;" valign="top">
                        <asp:TextBox ID="TextBox_Name" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox_Name"
                            ErrorMessage="<%$ Resources:Resource, password_doesn_match %>" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10013" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                         
                          <asp:Literal ID="LiteralFamily01" Text="<%$ Resources:Resource, Family %>"  runat="server" />&nbsp; :
                    </td>
                    <td align='<asp:Literal ID="Literal1018" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Famil" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox_Famil"
                            ErrorMessage="<%$ Resources:Resource, Family_not_entered %>" ForeColor="Maroon"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10014" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                        
                         <asp:Literal ID="Literal1Father_Name003" Text="<%$ Resources:Resource, Father_Name %>"  runat="server" />&nbsp; :
                    </td>
                    <td align='<asp:Literal ID="Literal1019" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Father" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10017" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                         
                        <asp:Literal ID="Literal1sex003" Text="<%$ Resources:Resource, sex %>"  runat="server" />&nbsp; :
                    </td>
                    <td align='<asp:Literal ID="Literal101" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:RadioButtonList ID="RadioButtonList_sex" runat="server" Width="30%">
                            <asp:ListItem Selected="True" Value="0" Text="<%$ Resources:Resource, male %>" >
                            </asp:ListItem>
                            <asp:ListItem Value="1" Text="<%$ Resources:Resource, female %>">
                            
                            </asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10018" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                         
                        <asp:Literal ID="Literal1Date_of_birth" Text="<%$ Resources:Resource, Date_of_birth %>"  runat="server" />&nbsp; :
                    </td>
                    <td align='<asp:Literal ID="Literal102" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:DropDownList ID="cmbDay" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                            Width="50px">
                            <asp:ListItem Text="01" Value="1"></asp:ListItem>
                            <asp:ListItem Text="02" Value="2"></asp:ListItem>
                            <asp:ListItem Text="03" Value="3"></asp:ListItem>
                            <asp:ListItem Text="04" Value="4"></asp:ListItem>
                            <asp:ListItem Text="05" Value="5"></asp:ListItem>
                            <asp:ListItem Text="06" Value="6"></asp:ListItem>
                            <asp:ListItem Text="07" Value="7"></asp:ListItem>
                            <asp:ListItem Text="08" Value="8"></asp:ListItem>
                            <asp:ListItem Text="09" Value="9"></asp:ListItem>
                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                            <asp:ListItem Text="11" Value="11"></asp:ListItem>
                            <asp:ListItem Text="12" Value="12"></asp:ListItem>
                            <asp:ListItem Text="13" Value="13"></asp:ListItem>
                            <asp:ListItem Text="14" Value="14"></asp:ListItem>
                            <asp:ListItem Text="15" Value="15"></asp:ListItem>
                            <asp:ListItem Text="16" Value="16"></asp:ListItem>
                            <asp:ListItem Text="17" Value="17"></asp:ListItem>
                            <asp:ListItem Text="18" Value="18"></asp:ListItem>
                            <asp:ListItem Text="19" Value="19"></asp:ListItem>
                            <asp:ListItem Text="20" Value="20"></asp:ListItem>
                            <asp:ListItem Text="21" Value="21"></asp:ListItem>
                            <asp:ListItem Text="22" Value="22"></asp:ListItem>
                            <asp:ListItem Text="23" Value="23"></asp:ListItem>
                            <asp:ListItem Text="24" Value="24"></asp:ListItem>
                            <asp:ListItem Text="25" Value="25"></asp:ListItem>
                            <asp:ListItem Text="26" Value="26"></asp:ListItem>
                            <asp:ListItem Text="27" Value="27"></asp:ListItem>
                            <asp:ListItem Text="28" Value="28"></asp:ListItem>
                            <asp:ListItem Text="29" Value="29"></asp:ListItem>
                            <asp:ListItem Text="30" Value="30"></asp:ListItem>
                            <asp:ListItem Text="31" Value="31"></asp:ListItem>
                        </asp:DropDownList><asp:DropDownList ID="cmbMonth" runat="server" Font-Names="Tahoma"
                            Font-Size="X-Small" Width="50px">
                            <asp:ListItem Text="فروردين" Value="1"></asp:ListItem>
                            <asp:ListItem Text="ارديبهشت" Value="2"></asp:ListItem>
                            <asp:ListItem Text="خرداد" Value="3"></asp:ListItem>
                            <asp:ListItem Text="تير" Value="4"></asp:ListItem>
                            <asp:ListItem Text="مرداد" Value="5"></asp:ListItem>
                            <asp:ListItem Text="شهريور" Value="6"></asp:ListItem>
                            <asp:ListItem Text="مهر" Value="7"></asp:ListItem>
                            <asp:ListItem Text="آبان" Value="8"></asp:ListItem>
                            <asp:ListItem Text="آذز" Value="9"></asp:ListItem>
                            <asp:ListItem Text="دي" Value="10"></asp:ListItem>
                            <asp:ListItem Text="بهمن" Value="11"></asp:ListItem>
                            <asp:ListItem Text="اسفند" Value="12"></asp:ListItem>
                        </asp:DropDownList><asp:DropDownList ID="cmbYear" runat="server" Font-Names="Tahoma"
                            Font-Size="X-Small" Width="57px">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10019" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
        

                         <asp:Literal ID="Literal1Website" Text="<%$ Resources:Resource, Website %>"  runat="server" />&nbsp; :
                    </td>
                    <td align='<asp:Literal ID="Literal103" Text="<%$ Resources:Resource, align %>"  runat="server" />' dir="ltr" style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Website" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10020" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%; height: 20px" valign="top">
                       
                        <asp:Literal ID="Literal1Manager_Email" Text="<%$ Resources:Resource, Manager_Email %>"  runat="server" />&nbsp; :
                        </td>
                    <td align='<asp:Literal ID="Literal104" Text="<%$ Resources:Resource, align %>"  runat="server" />' dir="ltr" style="width: 80%; height: 20px" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox_Email"
                            ErrorMessage="<%$ Resources:Resource, Manager_Email %>" ForeColor="Maroon">
                            
                            
                            </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox_Email"
                            Display="Dynamic" ErrorMessage="<%$ Resources:Resource, Not_Valid_Email %>"
                            ForeColor="DarkRed" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="TextBox_Email" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10021" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                          
                         <asp:Literal ID="Literal1Tel" Text="<%$ Resources:Resource, Tel %>"  runat="server" />&nbsp; :
                    </td>
                    <td align='<asp:Literal ID="Literal105" Text="<%$ Resources:Resource, align %>"  runat="server" />' dir="ltr" style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Tel" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal1001" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                       
                        <asp:Literal ID="Literal1CompanyCompany_Address_Name" Text="<%$ Resources:Resource, CompanyCompany_Address_Name %>"  runat="server" />&nbsp; :
                    </td>
                    <td align='<asp:Literal ID="Literal106" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Address" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Width="40%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal1002" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                    <asp:Literal ID="Literal1Description" Text="<%$ Resources:Resource, Description %>"  runat="server" />&nbsp; :
                        
                    </td>
                    <td align='<asp:Literal ID="Literal107" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:TextBox ID="TextBox_Description" runat="server" BackColor="white" BorderColor="white"
                            Font-Names="Tahoma" Font-Size="X-Small" Height="30px" TextMode="MultiLine" Width="60%"></asp:TextBox></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal1003" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                       
                         
                        <asp:Literal ID="Literal1introduction" Text="<%$ Resources:Resource, introduction %>"  runat="server" />&nbsp; :
                        </td>
                    <td align='<asp:Literal ID="Literal108" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:TextBox ID="TextBox_IntriId" runat="server" BackColor="white" 
                                    BorderColor="white" Font-Names="Tahoma" Font-Size="X-Small" Width="150px"></asp:TextBox>
                                <asp:LinkButton ID="LinkButton_IntoCheck" runat="server" BorderStyle="None" 
                                    CausesValidation="False" onclick="LinkButton_IntoCheck_Click">

                                       <asp:Literal ID="Literal1Who_is" Text="<%$ Resources:Resource, Who_is %>"  runat="server" />&nbsp; :
                                    </asp:LinkButton><asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                    <ProgressTemplate>
                                      <asp:Literal ID="Literal1Pending" Text="<%$ Resources:Resource, Pending %>"  runat="server" />&nbsp; :

                                         ...</ProgressTemplate></asp:UpdateProgress><asp:Label ID="Label_Intro_Alarm" runat="server" ForeColor="#CC0000"></asp:Label></ContentTemplate></asp:UpdatePanel></td></tr><tr>
                    <td align='<asp:Literal ID="Literal1004" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%; height: 19px" valign="top">
                    <asp:Literal ID="Literal1Enter_security" Text="<%$ Resources:Resource, Enter_security %>"  runat="server" />&nbsp; : </td><td align='<asp:Literal ID="Literal109" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%; height: 19px" valign="top">
                        <asp:TextBox ID="TextBox_Code" runat="server" BackColor="white" BorderColor="white" Font-Names="Tahoma"
                            Font-Size="X-Small" Width="40%"></asp:TextBox><asp:HiddenField ID="HiddenField_Intro" runat="server" Value="0" />
                    </td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal1005" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%; height: 19px" valign="top">
                    </td>
                    <td align='<asp:Literal ID="Literal1010" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%; height: 19px" valign="top">
                     <dnf:FormShield ID="FormShield1" runat="server" ImageBorderColor="Transparent" ImageBorderStyle="None"
                    NoiseColor="255, 128, 128" NoiseColor2="LightBlue" NoiseLevel="30" TextEffect="FontAngleWarp"
                    Width="224px"><RefreshIcon AlternateText="Refresh" /><SoundIcon AlternateText="Listen" Visible="False" /><HelpIcon AlternateText="Please enter the characters shown on the image" Visible="False" /></dnf:FormShield>
                     
                     </td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal10063" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%; height: 19px" valign="top">
                    </td>
                    <td align='<asp:Literal ID="Literal1011" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%; height: 19px" valign="top">
                        <asp:Button ID="Button_insert" runat="server" BackColor="Gray" Font-Names="Tahoma"
                            Font-Size="XX-Small" ForeColor="WhiteSmoke" OnClick="Button_insert_Click" Text="  ثبت شود  " /></td>
                </tr>
                <tr>
                    <td align='<asp:Literal ID="Literal1007" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 20%" valign="top">
                    </td>
                    <td align='<asp:Literal ID="Literal1012" Text="<%$ Resources:Resource, align %>"  runat="server" />' style="width: 80%" valign="top">
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="center" style="width: 100%" dir="rtl">
                      <asp:Literal ID="Literal10MSS_After_REg12" Text="<%$ Resources:Resource, MSS_After_REg %>"  runat="server" /></td></tr></table></asp:View></asp:multiview></asp:Content>