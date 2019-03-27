<%@ Page Language="C#"  MasterPageFile="~/Template/Office.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="PHASCO_Shopping.MyPHASCO_Shopping.EditProduct1" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table dir='<asp:Literal ID="Literal15005" runat="server" Text="<%$ Resources:Resource, Dir %>" />'>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, Product_Name %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Produc_Name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, Product_Keywords %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Product_Keywords" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal103" runat="server" Text="<%$ Resources:Resource, Photo %>" />
            </td>
            <td  class="td_register_de">
                <asp:FileUpload ID="FileUpload_Photo" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;</td>
            <td  class="td_register_de">
                <asp:Image ID="Image_Photo" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, Category %>" />
            </td>
            <td  class="td_register_de">
           
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="style1">
                            <tr>
                                <td>
                                    <asp:Label ID="Label_Cat_Current" runat="server"></asp:Label>
                                    &nbsp;&nbsp;
                                    [<asp:CheckBox ID="CheckBox_Change_cat" runat="server" 
                                        Text="<%$ Resources:Resource, chage %>" AutoPostBack="True" 
                                        oncheckedchanged="CheckBox_Change_cat_CheckedChanged" />]
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="DropDownList_Cat1" runat="server" AutoPostBack="True" 
                                        OnSelectedIndexChanged="DropDownList_Cat1_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:DropDownList ID="DropDownList_Cat2" runat="server" AutoPostBack="True" 
                                        onselectedindexchanged="DropDownList_Cat2_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <br />
                                    <asp:DropDownList ID="DropDownList_Cat3" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
               
                <br />
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <asp:Literal ID="Literal00102" runat="server" Text="<%$ Resources:Resource, Loading %>" />
                        ...
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Specialty_of_Product %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Specialty_Product" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td  class="td_register_de">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Resource, Specifications %>" />
            </td>
            <td  class="td_register_de">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Place_of_Origin %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Place_Origin" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource,  Product_Brand %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Product_Brand" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource,  Model_Number %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Model_Number" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Resource,  User_Defined_Attributes %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Defined_Attributes" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource,  Description %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Description" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register_de" colspan="2">
                <h3>
                    Product Trade Information
                </h3>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource,  Terms_of_Payment %>" />
            </td>
            <td  class="td_register_de">
                <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td width="50%">
                            <asp:CheckBoxList ID="CheckBoxList_Terms_Payment" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem>L/C</asp:ListItem>
                                <asp:ListItem>D/A</asp:ListItem>
                                <asp:ListItem>T/T</asp:ListItem>
                                <asp:ListItem>M/T</asp:ListItem>
                                <asp:ListItem>D/D</asp:ListItem>
                                <asp:ListItem>Cash</asp:ListItem>
                                <asp:ListItem>D/P</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                        <td width="50%">
                            <asp:TextBox ID="TextBox_Terms_Payment" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource,  Minimum_Order %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Minimum_Order" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource,  Supply_Ability %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Supply_Ability" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource,  Delivery_Time %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Delivery_Time" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Resource,  Packaging %>" />
            </td>
            <td  class="td_register_de">
                <asp:TextBox ID="TextBox_Packaging" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td  class="td_register_de">
                <asp:Button ID="Button_Edit" runat="server" Text="<%$ Resources:Resource,  Submit %>"
                    OnClick="Button_Edit_Click" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td  class="td_register_de">
            <td>
                &nbsp;
                <asp:HiddenField ID="HiddenField_current_Groupid" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;</td  class="td_register_de">
            <td>
                &nbsp;</td>
        </tr>
    </table>

            <div style="text-align: center">
                <table border="0" width="100%" dir='<asp:Literal ID="Literal1500s5" runat="server" Text="<%$ Resources:Resource, Dir %>" />'
                    cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="20%">
                            <asp:Literal runat="server" ID="litphotos011" Text="<%$ Resources:Resource, Photo %>" />
                        </td>
                        <td width="80%">
                            <asp:FileUpload ID="FileUpload_Image_Big" runat="server" />
                            <asp:Button ID="Button_Images" runat="server" Font-Names="Tahoma" OnCommand="Button_Images_Command"
                                Text="<%$ Resources:Resource, Send %>" />
                        </td>
                    </tr>
                    <tr>
                        <td width="20%">
                            &nbsp;
                        </td>
                        <td width="80%">
                            <asp:Label ID="LBL_Alarm" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:DataList ID="DataList_Gallary" runat="server" RepeatColumns="5">
                                <ItemTemplate>
                                    <div style="text-align: center">
                                        <table border="1" cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td style="width: 100%">
                                                    <table border="0" style="width: 100%">
                                                        <tr>
                                                            <td align="center" style="width: 100%">
                                                                <img src='ProductGallery/s<%# Eval("small")%>' border="0" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 100%">
                                                                <asp:LinkButton ID="LinkButton_Delete0" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.Autoid","{0}") %>'
                                                                    Font-Names="Tahoma" Font-Size="Small" Font-Underline="False" OnClientClick="return confirm('Are you sure you want to delete?')"
                                                                    OnCommand="LinkButton_Delete_Command">
                                                                    <asp:Literal ID="literaldeltegallery01" runat="server" Text="<%$ Resources:Resource, Delete %>" />
                                                                </asp:LinkButton></td></tr></table></td></tr></table></div></ItemTemplate></asp:DataList></td></tr></table></caption></div></asp:Content><asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>

</asp:Content>
