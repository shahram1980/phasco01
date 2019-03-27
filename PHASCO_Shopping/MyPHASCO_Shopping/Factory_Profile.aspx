<%@ Page Language="C#"  MasterPageFile="~/Template/Office.Master" AutoEventWireup="true" CodeBehind="Factory_Profile.aspx.cs" Inherits="PHASCO_Shopping.MyPHASCO_Shopping.Factory_Profile1" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="direction">
        <table class="style1">
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, The_Total_Area_of_Factory %>" />
                </td>
                <td class="td_register_de">
                    <asp:DropDownList ID="DropDownList_Area_Factory" runat="server">
                        <asp:ListItem Value="-1">--Please Select--</asp:ListItem>
                        <asp:ListItem Value="Below 1,000 square meters">Below 1,000 square meters</asp:ListItem>
                        <asp:ListItem Value="1,000-3,000 square meters">1,000-3,000 square meters</asp:ListItem>
                        <asp:ListItem Value="3,000-5,000 square meters">3,000-5,000 square meters</asp:ListItem>
                        <asp:ListItem Value="5,000-10,000 square meters">5,000-10,000 square meters</asp:ListItem>
                        <asp:ListItem Value="10,000-30,000 square meters">10,000-30,000 square meters </asp:ListItem>
                        <asp:ListItem Value="30,000-50,000 square meters">30,000-50,000 square meters</asp:ListItem>
                        <asp:ListItem Value="50,000-100,000 square meters">50,000-100,000 square meters</asp:ListItem>
                        <asp:ListItem Value="Above 100,000 square meters">Above 100,000 square meters</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, Factory_Address %>" />
                </td>
                <td class="td_register_de">
                    <asp:TextBox ID="TextBox_Factory_Address" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Year_built %>" />
                </td>
                <td class="td_register_de">
                    <asp:TextBox ID="TextBox_Year_built" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Resource, production_staf_numbers %>" />
                </td>
                <td class="td_register_de">
                    <asp:DropDownList ID="DropDownList_production_staf" runat="server">
                        <asp:ListItem Value="-1">-- Please Select --</asp:ListItem>
                        <asp:ListItem Value="Less Than 5 People">Less Than 5 People</asp:ListItem>
                        <asp:ListItem Value="5-10 People">5-10 People</asp:ListItem>
                        <asp:ListItem Value="11-50 People">11-50 People</asp:ListItem>
                        <asp:ListItem Value="51-100 People">51-100 People</asp:ListItem>
                        <asp:ListItem Value="101-200 People">101-200 People</asp:ListItem>
                        <asp:ListItem Value="201-500 People">201-500 People</asp:ListItem>
                        <asp:ListItem Value="Above 500 People">Above 500 People</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, RD_staff_numbers %>" />
                </td>
                <td class="td_register_de">
                    <asp:DropDownList ID="DropDownList_RD_staff" runat="server">
                        <asp:ListItem Value="-1">-- Please Select --</asp:ListItem>
                        <asp:ListItem Value="Less Than 5 People">Less Than 5 People</asp:ListItem>
                        <asp:ListItem Value="5-10 People">5-10 People</asp:ListItem>
                        <asp:ListItem Value="11-50 People">11-50 People</asp:ListItem>
                        <asp:ListItem Value="51-100 People">51-100 People</asp:ListItem>
                        <asp:ListItem Value="101-200 People">101-200 People</asp:ListItem>
                        <asp:ListItem Value="201-500 People">201-500 People</asp:ListItem>
                        <asp:ListItem Value="Above 500 People">Above 500 People</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource, Photo %>" />
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
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource, Materials_Components_Introduction %>" />
                </td>
                <td class="td_register_de">
                    <asp:TextBox ID="TextBox_Materials_Components" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource, Materials_Components_Photo %>" />
                </td>
                <td class="td_register_de">
                    <asp:FileUpload ID="FileUpload_photo_Materials_Components" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    &nbsp;
                </td>
                <td class="td_register_de">
                    <asp:Image ID="Image_photo_Materials_Components" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource, Machinery_Equipment_Introduction %>" />
                </td>
                <td class="td_register_de">
                    <asp:TextBox ID="TextBox_Machinery_Equipment" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource, Machinery_Equipment_photo %>" />
                </td>
                <td class="td_register_de">
                    <asp:FileUpload ID="FileUpload_photo_Machinery_Equipment" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    &nbsp;
                </td>
                <td class="td_register_de">
                    <asp:Image ID="Image_photo_Machinery_Equipment" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource, Production_Process_Introduction %>" />
                </td>
                <td class="td_register_de">
                    <asp:TextBox ID="TextBox_Production_Process" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Production_Process_photo %>" />
                </td>
                <td class="td_register_de">
                    <asp:FileUpload ID="FileUpload_photo_Production_Process" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    &nbsp;
                </td>
                <td class="td_register_de">
                    <asp:Image ID="Image_photo_Production_Process" runat="server" />
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
                    &nbsp;
                </td>
                <td class="td_register_de">
                    <asp:ImageButton ID="ImageButton_Insert" ImageUrl="<%$ Resources:Resource, Submit_Img %>"
                        runat="server" OnClick="ImageButton1_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .style1
        {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</asp:Content>