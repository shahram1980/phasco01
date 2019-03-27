<%@ Page Language="C#"  MasterPageFile="~/Template/CompanyDeteil.Master" AutoEventWireup="true" CodeBehind="Factory.aspx.cs" Inherits="PHASCO_Shopping.C_p.Factory" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
 

<SCRIPT LANGUAGE="JavaScript">
function popUp(URL) {
day = new Date();
id = day.getTime();
eval("page" + id + " = window.open(URL, '" + id + "', 'toolbar=0,scrollbars=0,location=0,statusbar=0,menubar=0,resizable=1,width=450,height=450');");
}
</script>


</asp:Content>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="direction">
        <table class="style1">
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, The_Total_Area_of_Factory %>" />
                </td>
                <td class="td_register_de">
                  <asp:Label ID="Label_Area_Factory" runat="server"></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, Factory_Address %>" />
                </td>
                <td class="td_register_de">
                    <asp:Label ID="TextBox_Factory_Address" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, Year_built %>" />
                </td>
                <td class="td_register_de">
                    <asp:Label ID="TextBox_Year_built" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Resource, production_staf_numbers %>" />
                </td>
                <td class="td_register_de">
                                 <asp:Label ID="Label_production_staf" runat="server"></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, RD_staff_numbers %>" />
                </td>
                <td class="td_register_de">
                <asp:Label ID="Label_RD_staff" runat="server"></asp:Label>
                    
                </td>
            </tr>
            <tr>
                <td class="td_register">
             
                    <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource, Photo %>" />
                    
                </td>
                <td class="td_register_de">
                   <A runat="server" id="Image_Photo_java" >
                    <asp:Image ID="Image_Photo" runat="server" />
                    </A>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                &nbsp;
                </td>
                <td class="td_register_de">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource, Materials_Components_Introduction %>" />
                </td>
                <td class="td_register_de">
                    <asp:Label ID="TextBox_Materials_Components" runat="server" TextMode="MultiLine"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource, Materials_Components_Photo %>" />
                </td>
                <td class="td_register_de">
                <A runat="server" id="Image_photo_Materials_Components_java" >
                    <asp:Image ID="Image_photo_Materials_Components" runat="server" Width="16px" />
                    </A>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                &nbsp;
                </td>
                <td class="td_register_de">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource, Machinery_Equipment_Introduction %>" />
                </td>
                <td class="td_register_de">
                    <asp:Label ID="TextBox_Machinery_Equipment" runat="server" TextMode="MultiLine"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource, Machinery_Equipment_photo %>" />
                </td>
                <td class="td_register_de">
                 <A runat="server" id="Image_photo_Machinery_Equipment_java" >
                    <asp:Image ID="Image_photo_Machinery_Equipment" runat="server" />
                    </A>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                &nbsp;
                </td>
                <td class="td_register_de">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource, Production_Process_Introduction %>" />
                </td>
                <td class="td_register_de">
                    <asp:Label ID="TextBox_Production_Process" runat="server" TextMode="MultiLine"></asp:Label>
                </td>
             </tr>
            <tr>
                <td class="td_register">
                    <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Production_Process_photo %>" />
                </td>
                <td class="td_register_de">
                <A runat="server" id="Image_photo_Production_Process_java" >
                    <asp:Image ID="Image_photo_Production_Process" runat="server" />
                    </A>
                </td>
            </tr>
            <tr>
                <td class="td_register">
                &nbsp; 
                </td>
                <td class="td_register_de">
                    &nbsp;</td>
            </tr>
        </table>
    </div>

</asp:Content>