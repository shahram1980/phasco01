<%@ Page Language="C#" MasterPageFile="~/Template/Office.Master" AutoEventWireup="true"
    CodeBehind="EditProduct.aspx.cs" Inherits="BiztBiz.MyBiztBiz.EditProduct" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table dir='<asp:Literal ID="Literal15005" runat="server" Text="<%$ Resources:Resource, Dir %>" />'>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, Product_Name %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Produc_Name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:Resource, Product_Keywords %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Product_Keywords" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal103" runat="server" Text="<%$ Resources:Resource, Photo %>" />
            </td>
            <td class="td_register_de">
                <asp:FileUpload ID="FileUpload_Photo" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td class="td_register_de">
                <asp:Image ID="Image_Photo" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, Category %>" />
            </td>
            <td class="td_register_de">
                <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="server" LoadScriptsBeforeUI="False"
                    ScriptMode="Release">
                </ajaxToolkit:ToolkitScriptManager>
                <br />
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <asp:Literal ID="Literal00102" runat="server" Text="<%$ Resources:Resource, Loading %>" />
                        ...
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <br />
                <asp:DropDownList ID="DropDownList_Cat1" runat="server" CssClass="txtjobsmall">
                </asp:DropDownList>
                <ajaxToolkit:CascadingDropDown ID="ccdCat1" runat="server" TargetControlID="DropDownList_Cat1"
                    Category="Category" PromptText="لطفاً انتخاب کنید" ServicePath="~/Services/BiztBizServices.asmx"
                    ServiceMethod="GetCategory" />
                <asp:DropDownList ID="DropDownList_Cat2" runat="server" CssClass="txtjobsmall">
                </asp:DropDownList>
                <ajaxToolkit:CascadingDropDown ID="ccdCat2" runat="server" TargetControlID="DropDownList_Cat2"
                    ParentControlID="DropDownList_Cat1" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSubCategory"
                    ServicePath="~/Services/BiztBizServices.asmx" Category="SubCategory" />
                <asp:DropDownList ID="DropDownList_Cat3" runat="server" CssClass="txtjobsmall">
                </asp:DropDownList>
                <ajaxToolkit:CascadingDropDown ID="ccdCat3" runat="server" TargetControlID="DropDownList_Cat3"
                    ParentControlID="DropDownList_Cat2" PromptText="لطفاً انتخاب کنید" ServiceMethod="GetSub2Category"
                    ServicePath="~/Services/BiztBizServices.asmx" Category="Sub2Category" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Specialty_of_Product %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Specialty_Product" runat="server" Height="150px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td class="td_register_de">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Resource, Specifications %>" />
            </td>
            <td class="td_register_de">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Place_of_Origin %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Place_Origin" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource,  Product_Brand %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Product_Brand" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource,  Model_Number %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Model_Number" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Resource,  User_Defined_Attributes %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Defined_Attributes" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource,  Description %>" />
            </td>
            <td class="td_register_de">
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
            <td class="td_register_de">
                <asp:CheckBoxList ID="CheckBoxList_Terms_Payment" runat="server" RepeatDirection="Horizontal"
                    RepeatColumns="4">
                </asp:CheckBoxList>
                <%--     <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td width="50%">
                            <asp:CheckBoxList ID="CheckBoxList_Terms_Payment" runat="server" RepeatDirection="Horizontal"
                                RepeatColumns="4">
                            </asp:CheckBoxList>
                        </td>
                        <td width="50%">
                            <asp:TextBox ID="TextBox_Terms_Payment" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>--%>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                نحوه ارسال
            </td>
            <td class="td_register_de">
                <asp:CheckBoxList ID="CheckBoxList_SendMode" runat="server" RepeatDirection="Horizontal"
                    RepeatColumns="4">
                </asp:CheckBoxList>
                <%--  <table cellpadding="0" cellspacing="0" class="style1">
                    <tr>
                        <td width="50%">
                            <asp:CheckBoxList ID="CheckBoxList_SendMode" runat="server" RepeatDirection="Horizontal"
                                RepeatColumns="4">
                            </asp:CheckBoxList>
                        </td>
                        <td width="50%">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>--%>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource,  Minimum_Order %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Minimum_Order" runat="server"></asp:TextBox>
            </td>
        </tr>
        <%-- <tr>
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
        </tr>--%>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td class="td_register_de">
                <asp:Button ID="Button_Edit" runat="server" Text="<%$ Resources:Resource,  Submit %>"
                    OnClick="Button_Edit_Click" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td class="td_register_de">
                &nbsp;
                <asp:HiddenField ID="HiddenField_current_Groupid" runat="server" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
