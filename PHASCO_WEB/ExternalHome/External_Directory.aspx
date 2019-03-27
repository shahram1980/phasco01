<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="External_Directory.aspx.cs" Inherits="phasco_webproject.ExternalHome.External_Directory" %>

<%@ Register Assembly="RadComboBox.Net2" Namespace="Telerik.WebControls" TagPrefix="radC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
        <link rel="stylesheet" type="text/css" href="../CSS/main-final.css" />
            <script language="JavaScript">
      function toggle(id) {
            var state = document.getElementById(id).style.display;
            if (state == 'none') {
                  document.getElementById(id).style.display = 'block';
            } else {
                  document.getElementById(id).style.display = 'none';
            }
      }
</script>
    <style type="text/css">
        a
        {
            font-size: 10px;
            color: maroon;
        }
        a:hover
        {
            color: #a5a5a5;
            text-decoration: underline;
        }
        a:link, a:visited
        {
            color: #a5a5a5;
            text-decoration: none;
        }
    </style>
</head>
<body dir="ltr"  style="background-color:#FCF0D5;" onload="toggle('load')">
<div id="load">
  <img src="../images/CalBiotech_Adv.jpg"  align="left" />
  در حال بارگزاری ..
  </div>
    <form id="form1" runat="server">
 
        <div style="text-align: right">
            <table border="0" style="width: 90%">
                <tr>
                    <td align="center" colspan="5" rowspan="1" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                    style="width: 30%">
                                </td>
                                <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                    style="width: 70%">
                                    <div align="right">
                                        <table border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                                            <tr>
                                                <td width="10%">
                                             <asp:Label ID="Label1" Text='<%$ Resources:Resource, province %>' runat="server" /></td>
                                                <td width="23%">
     <asp:DropDownList ID="DropDownList_edit_Region" runat="server" Font-Size="X-Small" Font-Names="Tahoma"
                                                                AutoPostBack="True" 
                                                                OnSelectedIndexChanged="DropDownList_edit_Region_SelectedIndexChanged">
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
                                                            </asp:DropDownList></td>
                                                <td width="10%">
                                                    &nbsp;<asp:Label ID="Label2" Text='<%$ Resources:Resource, City %>' runat="server" /></td>
                                                <td width="23%">
                                                    &nbsp;<asp:DropDownList ID="DropDownList_edit_State" runat="server" Font-Names="Tahoma"
                                                    Font-Size="X-Small" Width="155px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_edit_State_SelectedIndexChanged">
                                                </asp:DropDownList></td>
                                                <td width="10%">
                                                    &nbsp;<asp:Label ID="Label3" Text='<%$ Resources:Resource, Region %>' runat="server" /></td>
                                                <td width="23%">
                                                    &nbsp;<asp:DropDownList ID="DropDownList_REGION_2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                    Width="155px">
                                                </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td width="10%">
                                                    &nbsp;<asp:Label ID="Label4" Text='<%$ Resources:Resource, Nlab %>' runat="server" /></td>
                                                <td width="23%">
                                                    &nbsp;<asp:TextBox ID="Txt_Name" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                    Width="150px"></asp:TextBox></td>
                                                <td width="10%">
                                                    &nbsp;<asp:Label ID="Label5" Text='<%$ Resources:Resource, Levels %>' runat="server" /></td>
                                                <td width="23%">
                                                &nbsp;<asp:DropDownList ID="DropDownList_Starts" runat="server">
                                                    <asp:ListItem Value="0">-----</asp:ListItem>
                                                    <asp:ListItem Value="1">تک ستاره</asp:ListItem>
                                                    <asp:ListItem Value="2">دو ستاره</asp:ListItem>
                                                    <asp:ListItem Value="3">سه ستاره</asp:ListItem>
                                                    <asp:ListItem Value="4">چهار ستاره</asp:ListItem>
                                                    <asp:ListItem Value="5">پنج ستاره</asp:ListItem>
                                                </asp:DropDownList></td>
                                                <td width="10%">
                                                    &nbsp;</td>
                                                <td width="23%">
                                                    &nbsp;<asp:Button ID="Button_Find" runat="server" Text='<%$ Resources:Resource, Search %>'
                                                    OnClick="Button_Find_Click" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" style="width: 100%">
                                                <asp:Label ID="LBL_Alram" runat="server" ForeColor="Red"></asp:Label></td>
                                            </tr>
                                        </table>
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
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="text-align: center">
                    <table border="0" style="width: 100%">
                        <tr>
                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                valign="top">
                                <br />
                                <asp:Label ID="LBL_GRD" runat="server"></asp:Label>
                                <hr width="100%" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="text-align: center">
                                    <table border="0" style="width: 100%">
                                        <tr>
                                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                                colspan="2" valign="top">
                                                &nbsp;<asp:DataGrid ID="dgrdTitles" runat="Server" AllowPaging="True" AutoGenerateColumns="False"
                                                    BackColor="#D6C8AC" BackImageUrl="~/images/bg-bo-1.jpg" BorderColor="#999999"
                                                    BorderStyle="None" BorderWidth="0px" CellPadding="3" ForeColor="Black" GridLines="Vertical"
                                                    OnPageIndexChanged="dgrdTitles_PageIndexChanged" PagerStyle-BorderColor="beige"
                                                    PagerStyle-Mode="NumericPages" PageSize="40" ShowHeader="False" Width="100%">
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="#D6C8AC" />
                                                    <PagerStyle BackColor="#B8AB92" BorderColor="RoyalBlue" BorderStyle="Solid" BorderWidth="1px"
                                                        Font-Names="Verdana" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False"
                                                        ForeColor="White" HorizontalAlign="Center" Mode="NumericPages" PageButtonCount="20"
                                                        VerticalAlign="Middle" />
                                                    <AlternatingItemStyle BackColor="#F3E5CA" BorderStyle="None" BorderWidth="0px" />
                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <table border="0" dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />">
                                                                    <tr>
                                                                        <td>
                                                                            <img border="0" src='Images/star<%# Eval("star") %>.jpg' />
                                                                        </td>
                                                                        <td>
                                                                            <a target="_parent" href='../LabDirectory.aspx?lid=<%#DataBinder.Eval(Container,"DataItem.autoid","{0}") %>'>
                                                                                جزئیات ...</a>
                                                                          </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Satate"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="<%$ Resources:Resource,  nameF %>"></asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            &nbsp;
        </asp:MultiView> 
     
    </form>
</body>
</html>
