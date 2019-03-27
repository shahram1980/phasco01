<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DirHome.ascx.cs" Inherits="phasco.UI.DirHome" %>
<%@ Register Assembly="RadComboBox.Net2" Namespace="Telerik.WebControls" TagPrefix="radC" %>


        <div style="text-align: right">
            <table border="0" style="width: 100%">
                <tr>
                    <td align="center" colspan="5" rowspan="1" valign="top">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr>
                                <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                    style="width: 30%">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr>
                                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                                dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="width: 70%">
                                                <asp:Label ID="Label1" Text='<%$ Resources:Resource, province %>' runat="server" /></td>
                                            <td style="width: 5%">
                                            </td>
                                            <td align="left" style="width: 70%">
                                                <asp:DropDownList ID="DropDownList_edit_Region" runat="server" AutoPostBack="True"
                                                    OnSelectedIndexChanged="DropDownList_edit_Region_SelectedIndexChanged" Font-Names="Tahoma"
                                                    Font-Size="X-Small" Width="155px">
                                                    <asp:ListItem Value="1" Text='<%$ Resources:Resource, s1 %>'></asp:ListItem>
                                                    <asp:ListItem Value="2" Text='<%$ Resources:Resource, s2 %>'></asp:ListItem>
                                                    <asp:ListItem Value="3" Text='<%$ Resources:Resource, s3 %>'></asp:ListItem>
                                                    <asp:ListItem Value="4" Text='<%$ Resources:Resource, s4 %>'></asp:ListItem>
                                                    <asp:ListItem Value="5" Text='<%$ Resources:Resource, s5 %>'></asp:ListItem>
                                                    <asp:ListItem Value="6" Text='<%$ Resources:Resource, s6 %>'></asp:ListItem>
                                                    <asp:ListItem Value="7" Text='<%$ Resources:Resource, s7 %>'></asp:ListItem>
                                                    <asp:ListItem Value="8" Text='<%$ Resources:Resource, s8 %>'></asp:ListItem>
                                                    <asp:ListItem Value="9" Text='<%$ Resources:Resource, s9 %>'></asp:ListItem>
                                                    <asp:ListItem Value="10" Text='<%$ Resources:Resource, s10 %>'></asp:ListItem>
                                                    <asp:ListItem Value="11" Text='<%$ Resources:Resource, s11 %>'></asp:ListItem>
                                                    <asp:ListItem Value="12" Text='<%$ Resources:Resource, s12 %>'></asp:ListItem>
                                                    <asp:ListItem Value="13" Text='<%$ Resources:Resource, s13 %>'></asp:ListItem>
                                                    <asp:ListItem Value="14" Text='<%$ Resources:Resource, s14 %>'></asp:ListItem>
                                                    <asp:ListItem Value="15" Text='<%$ Resources:Resource, s15 %>'></asp:ListItem>
                                                    <asp:ListItem Value="16" Text='<%$ Resources:Resource, s16 %>'></asp:ListItem>
                                                    <asp:ListItem Value="17" Text='<%$ Resources:Resource, s17 %>'></asp:ListItem>
                                                    <asp:ListItem Value="18" Text='<%$ Resources:Resource, s18 %>'></asp:ListItem>
                                                    <asp:ListItem Value="19" Text='<%$ Resources:Resource, s19 %>'></asp:ListItem>
                                                    <asp:ListItem Value="20" Text='<%$ Resources:Resource, s20 %>'></asp:ListItem>
                                                    <asp:ListItem Value="21" Text='<%$ Resources:Resource, s21 %>'></asp:ListItem>
                                                    <asp:ListItem Value="22" Text='<%$ Resources:Resource, s22 %>'></asp:ListItem>
                                                    <asp:ListItem Value="23" Text='<%$ Resources:Resource, s23 %>'></asp:ListItem>
                                                    <asp:ListItem Value="24" Text='<%$ Resources:Resource, s24 %>'></asp:ListItem>
                                                    <asp:ListItem Value="25" Text='<%$ Resources:Resource, s25 %>'></asp:ListItem>
                                                    <asp:ListItem Value="26" Text='<%$ Resources:Resource, s26 %>'></asp:ListItem>
                                                    <asp:ListItem Value="27" Text='<%$ Resources:Resource, s27 %>'></asp:ListItem>
                                                    <asp:ListItem Value="28" Text='<%$ Resources:Resource, s28 %>'></asp:ListItem>
                                                    <asp:ListItem Value="29" Text='<%$ Resources:Resource, s29 %>'></asp:ListItem>
                                                    <asp:ListItem Value="30" Text='<%$ Resources:Resource, s30 %>'></asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                                dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="width: 70%">
                                                <asp:Label ID="Label2" Text='<%$ Resources:Resource, City %>' runat="server" /></td>
                                            <td style="width: 5%">
                                            </td>
                                            <td align="left" style="width: 70%">
                                                <asp:DropDownList ID="DropDownList_edit_State" runat="server" Font-Names="Tahoma"
                                                    Font-Size="X-Small" Width="155px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_edit_State_SelectedIndexChanged">
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                                dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="width: 70%;">
                                                <asp:Label ID="Label3" Text='<%$ Resources:Resource, Region %>' runat="server" /></td>
                                            <td style="width: 5%; height: 18px">
                                            </td>
                                            <td align="left" style="width: 70%;">
                                                <asp:DropDownList ID="DropDownList_REGION_2" runat="server" Font-Names="Tahoma" Font-Size="X-Small"
                                                    Width="155px">
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                                dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="width: 70%;
                                                height: 13px;">
                                                <asp:Label ID="Label4" Text='<%$ Resources:Resource, Nlab %>' runat="server" /></td>
                                            <td style="width: 5%; height: 13px;">
                                            </td>
                                            <td align="left" style="width: 70%; height: 13px;">
                                                <asp:TextBox ID="Txt_Name" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                                                    Width="150px"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                                dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="width: 70%">
                                                <asp:Label ID="Label5" Text='<%$ Resources:Resource, Levels %>' runat="server" />
                                          </td>
                                            <td style="width: 5%">
                                            </td>
                                            <td align="left" style="width: 70%">
                                            <radC:RadComboBox ID="RadComboBox2" Skin="WindowsXP" SkinsPath="~/RadControls/ComboBox/Skins"
                                                    Width="100%" ExpandEffect="ZigZag" runat="server">
                                  
                                                    <ItemTemplate>
                                                        <img src='images/<%# DataBinder.Eval(Container, "Attributes['ImagePath']") %>' alt="" />
                                                    </ItemTemplate>
                                                    <Items>
                                                        <radC:RadComboBoxItem ImagePath="../images/star0.gif" Font-Names="TAHOMA" Text="----------"
                                                            Value="0" runat="server" />
                                                        <radC:RadComboBoxItem ImagePath="../images/star1.gif" Font-Names="TAHOMA" Text="يک ستاره" Value="1"
                                                            runat="server" />
                                                        <radC:RadComboBoxItem ImagePath="../images/star2.gif" Font-Names="TAHOMA" Text="دو ستاره" Value="2"
                                                            runat="server" />
                                                        <radC:RadComboBoxItem ImagePath="../images/star3.gif" Font-Names="TAHOMA" Text="سه ستاره" Value="3"
                                                            runat="server" />
                                                        <radC:RadComboBoxItem ImagePath="../images/star4.gif" Font-Names="TAHOMA" Text="چهار ستاره"
                                                            Value="4" runat="server" />
                                                        <radC:RadComboBoxItem ImagePath="../images/star5.gif" Font-Names="TAHOMA" Text="پنج ستاره"
                                                            Value="5" runat="server" />
                                                    </Items>
                                                </radC:RadComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3">
                                                <asp:Label ID="LBL_Alram" runat="server" ForeColor="Red"></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                                dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="width: 70%">
                                            </td>
                                            <td style="width: 5%">
                                            </td>
                                            <td align="left" style="width: 70%">
                                                <asp:Button ID="Button_Find" runat="server" Text='<%$ Resources:Resource, Search %>'
                                                    OnClick="Button_Find_Click" Font-Names="Tahoma" Font-Size="X-Small" /></td>
                                        </tr>
                                    </table>
                                </td>
                                <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                    style="width: 70%">
                                    <img src="Images/banner.jpg" /></td>
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
                                            <td>
                                                <asp:DataGrid ID="dgrdTitles" AllowPaging="True" PageSize="40" PagerStyle-Mode="NumericPages"
                                                    PagerStyle-BorderColor="beige" OnPageIndexChanged="dgrdTitles_PageIndexChanged"
                                                    CellPadding="3" runat="Server" AutoGenerateColumns="False" ShowHeader="False"
                                                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="0px"
                                                    ForeColor="Black" GridLines="Vertical" BackImageUrl="~/images/bg-bo-1.jpg" Width="100%">
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <table border="0" dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />">
                                                                    <tr>
                                                                        <td>
                                                                            <img src="Images/star<%# Eval("star") %>.jpg" border="0" />
                                                                        </td>
                                                                        <td>
                                                                            <asp:LinkButton ID="Link_View" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.autoid","{0}") %>'
                                                                                runat="server" OnCommand="Link_View_Command" Text='<%$ Resources:Resource,  Details%>'></asp:LinkButton>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Satate"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField='<%$ Resources:Resource,  nameF%>'></asp:BoundColumn>
                                                    </Columns>
                                                    <PagerStyle BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" Font-Size="Small"
                                                        ForeColor="White" HorizontalAlign="Center" Position="TopAndBottom" VerticalAlign="Middle"
                                                        BackColor="#D9470E" Mode="NumericPages" Font-Names="Verdana" Font-Strikeout="False"
                                                        Font-Underline="False" PageButtonCount="20" />
                                                    <FooterStyle BackColor="#CCCCCC" />
                                                    <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                    <AlternatingItemStyle BackColor="#F3D3C6" BorderStyle="None" BorderWidth="0px" />
                                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle HorizontalAlign="Right" VerticalAlign="Top" />
                                                </asp:DataGrid>
                                                
                                                </td>
                                            <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                                                style="width: 150px" valign="top">
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <hr align="center" width="100%" />
                <table border="0" width="100%" id="table1" dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />"
                    style="border-collapse: collapse">
                    <tr>
                        <td colspan="3">
                            <table border="0" width="100%" id="table2" style="border-collapse: collapse">
                                <tr>
                                    <td colspan="1" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />">
                                        <asp:LinkButton ID="Link_Back" Text='<%$ Resources:Resource,  Back %>' runat="server"
                                            OnClick="Link_Back_Click"></asp:LinkButton><br />
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="30">
                                        <asp:Image ID="Image_star" runat="server"></asp:Image></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 15%">
                            <asp:Label ID="Label6" Text='<%$ Resources:Resource, NLab %>' runat="server" />
                        </td>
                        <td align="center" style="width: 5%">
                            :</td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            width="80%">
                            <asp:Label ID="LBL_name" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 15%">
                        </td>
                        <td align="center" style="width: 5%">
                        </td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            width="80%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%" align="left">
                            <asp:Label ID="Label7" Text='<%$ Resources:Resource, address %>' runat="server" /></td>
                        <td align="center" style="width: 5%">
                            :</td>
                        <td width="80%" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />">
                            <asp:Label ID="LBL_address" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 15%; height: 15px">
                        </td>
                        <td align="center" style="width: 5%; height: 15px">
                        </td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            style="height: 15px" width="80%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; height: 15px;" align="left">
                            <asp:Label ID="Label8" Text='<%$ Resources:Resource, address1 %>' runat="server" />
                        </td>
                        <td align="center" style="width: 5%; height: 15px;">
                            :</td>
                        <td width="80%" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            style="height: 15px">
                            <asp:Label ID="LBL_Manager" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 15%; height: 15px">
                        </td>
                        <td align="center" style="width: 5%; height: 15px">
                        </td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            style="height: 15px" width="80%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; height: 15px" align="left">
                            <asp:Label ID="Label9" Text='<%$ Resources:Resource, services %>' runat="server" /></td>
                        <td align="center" style="width: 5%; height: 15px">
                            :</td>
                        <td width="80%" style="height: 15px" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />">
                            <asp:Label ID="LBL_Food" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 15%">
                        </td>
                        <td align="center" style="width: 5%">
                        </td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            width="80%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%" align="left">
                            <asp:Label ID="Label10" Text='<%$ Resources:Resource, Worktime %>' runat="server" /></td>
                        <td align="center" style="width: 5%">
                            :</td>
                        <td width="80%" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />">
                            <asp:Label ID="LBL_TIme" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 15%; height: 15px">
                        </td>
                        <td align="center" style="width: 5%; height: 15px">
                        </td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            style="height: 15px" width="80%">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; height: 15px;" align="left">
                            <asp:Label ID="Label11" Text='<%$ Resources:Resource, Tel %>' runat="server" />
                        </td>
                        <td align="center" style="width: 5%; height: 15px;">
                            :</td>
                        <td width="80%" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            style="height: 15px" dir="rtl">
                            <asp:Label ID="LBL_reserv" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 15%; height: 15px">
                            <asp:Label ID="Label12" Text='<%$ Resources:Resource, Email %>' runat="server" /></td>
                        <td align="center" style="width: 5%; height: 15px">
                            :</td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="height: 15px"
                            width="80%">
                            <asp:Label ID="LBL_email" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="left" style="width: 15%; height: 15px">
                            <asp:Label ID="Label13" Text='<%$ Resources:Resource, Website %>' runat="server" /></td>
                        <td align="center" style="width: 5%; height: 15px">
                            :</td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />" style="height: 15px"
                            width="80%">
                            <asp:HyperLink ID="HyperLink_Web" Target="_blank" runat="server">
                                <asp:Label ID="LBL_Website" runat="server"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 15%; height: 15px;" align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />">
                        </td>
                        <td align="<asp:Literal Text='<%$ Resources:Resource,  align %>'  runat='server' />"
                            style="width: 5%; height: 15px;">
                        </td>
                        <td width="80%" style="height: 15px">
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" colspan="3" align="center" valign="top">
                            <asp:Image ID="Image_Res" runat="server" BorderStyle="None" BorderWidth="0px" /></td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>


   <div style="text-align: center">
            <table border="0" style="width: 100%">
                <tr>
                    <td align="center" style="text-align: center">
                        <img src="../Images/LOAD.GIF" /></td>
                </tr>
                <tr>
                    <td align="center" dir="<asp:Literal Text='<%$ Resources:Resource, dir %>'  runat='server' />">
                        <asp:Label ID="Label14" Text='<%$ Resources:Resource, wait %>' runat="server" />
                    </td>
                </tr>
            </table>
        </div>


 

 