<%@ Page Language="C#"  MasterPageFile="~/Template/Office.Master" AutoEventWireup="true" CodeBehind="company_profile.aspx.cs" Inherits="PHASCO_Shopping.MyPHASCO_Shopping.company_profile1" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style1" dir='<asp:Literal ID="Literal0023" runat="server" Text="<%$ Resources:Resource, dir %>" />'>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal001" runat="server" Text="<%$ Resources:Resource, Company_Name %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Company_Name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:Resource, Company_Logo %>" />
            </td>
            <td class="td_register_de">
                <asp:FileUpload ID="FileUpload_Logo" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td class="td_register_de">
                <asp:Image ID="Image_Logo" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:Resource, CompanyCompany_Address_Name %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Company_Address" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:Resource, State_Province %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_State_Province" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:Resource, City %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_City" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:Resource, Zip_Postal_Code %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Zip" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:Resource, Total_Staff %>" />
            </td>
            <td class="td_register_de">
                <asp:DropDownList ID="DropDownList_Total_Staff" runat="server">
                    <asp:ListItem Text="-- Please Select --" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Less Than 5 People" Value="1"></asp:ListItem>
                    <asp:ListItem Text="5-10 People" Value="2"></asp:ListItem>
                    <asp:ListItem Text="11-50 People" Value="3"></asp:ListItem>
                    <asp:ListItem Text="51-100 People" Value="4"></asp:ListItem>
                    <asp:ListItem Text="101-200 People" Value="5"></asp:ListItem>
                    <asp:ListItem Text="201-500 People" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Above 500 People" Value="7"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:Resource, registered_capital  	 %>" />
            </td>
            <td class="td_register_de">
                <asp:DropDownList ID="DropDownList_Reg" runat="server">
                    <asp:ListItem Text="-- Please Select --" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Less than US$ 100 Thousands" Value="Less than US$ 100 Thousands">
                    </asp:ListItem>
                    <asp:ListItem Text="US$ 101 Thousands - US$ 500 Thousands" Value="US$ 101 Thousands - US$ 500 Thousands">
                    </asp:ListItem>
                    <asp:ListItem Text="US$ 501 Thousands - US$ 1 Million" Value="US$ 501 Thousands - US$ 1 Million">
                    </asp:ListItem>
                    <asp:ListItem Text="US$1 Million - US$ 2.5 Million" Value="US$ 1 Million - US$ 2.5 Million">
                    </asp:ListItem>
                    <asp:ListItem Text="US$2.5 Million - US$ 5 Million" Value="US$ 2.5 Million - US$ 5 Million">
                    </asp:ListItem>
                    <asp:ListItem Text="US$5 Million - US$10 Million" Value="US$ 5 Million - US$ 10 Million">
                    </asp:ListItem>
                    <asp:ListItem Text="US$10 Million - US$50 Million" Value="US$ 10 Million - US$ 50 Million">
                    </asp:ListItem>
                    <asp:ListItem Text="Above US$50 Million" Value="Above US$50 Million">Above US$50 Million</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:Resource, year_Established  	   	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_year_Established" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:Resource, Website	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Company_Website" runat="server">http://</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:Resource, Business_Type %>" />
            </td>
            <td class="td_register_de">
                <asp:CheckBoxList ID="CheckBoxList_Business_Typent" runat="server">
                    <asp:ListItem Text="<%$ Resources:Resource, Agent %>" Value="<%$ Resources:Resource, Agent %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Buying_Office %>" Value="<%$ Resources:Resource, Buying_Office %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Distributor_Wholesaler %>" Value="<%$ Resources:Resource, Distributor_Wholesaler %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, finance_travel_etc %>" Value="<%$ Resources:Resource, finance_travel_etc %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Government_ministry %>" Value="<%$ Resources:Resource, Government_ministry %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Manufacturer %>" Value="<%$ Resources:Resource, Manufacturer %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Trade_Company %>" Value="<%$ Resources:Resource, Trade_Company %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Agent %>" Value="<%$ Resources:Resource, Agent %>"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:Resource, Services	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Services" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:Resource, Company_Introduction	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Company_Introduction" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:Resource, Main_Markets	 %>" />
            </td>
            <td class="td_register_de">
                <asp:CheckBoxList ID="CheckBoxList_Main_Marketsnt" runat="server">
                    <asp:ListItem Text="<%$ Resources:Resource, North_America %>" Value="<%$ Resources:Resource, North_America %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, South_America %>" Value="<%$ Resources:Resource, South_America %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Western_Europe %>" Value="<%$ Resources:Resource, Western_Europe %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Eastern_Europe %>" Value="<%$ Resources:Resource, Eastern_Europe %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Eastern_Asia %>" Value="<%$ Resources:Resource, Eastern_Asia %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Southeast_Asia %>" Value="<%$ Resources:Resource, Southeast_Asia %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Middle_East %>" Value="<%$ Resources:Resource, Middle_East %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Africa %>" Value="<%$ Resources:Resource, Africa %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Oceania %>" Value="<%$ Resources:Resource, Oceania %>"></asp:ListItem>
                    <asp:ListItem Text="<%$ Resources:Resource, Worldwide %>" Value="<%$ Resources:Resource, Worldwide %>"></asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:Resource, annual_sales	 %>" />
            </td>
            <td class="td_register_de">
                <asp:DropDownList ID="DropDownList_annual_sales" runat="server">
                    <asp:ListItem Text="-- Please Select --" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="Less than US$ 1 Million" Value="Less than US$ 1 Million"></asp:ListItem>
                    <asp:ListItem Text="US$ 1 Million - US$ 2.5 Million" Value="US$ 1 Million - US$ 2.5 Million"></asp:ListItem>
                    <asp:ListItem Text="US$ 2.5 Million - US$ 5 Million" Value="US$ 2.5 Million - US$ 5 Million"></asp:ListItem>
                    <asp:ListItem Text="US$ 5 Million - US$ 10 Million" Value="US$ 5 Million - US$ 10 Million"></asp:ListItem>
                    <asp:ListItem Text="US$ 10 Million - US$ 50 Million" Value="US$ 10 Million - US$ 50 Million"></asp:ListItem>
                    <asp:ListItem Text="US$ 50 Million - US$ 100 Million" Value="US$ 50 Million - US$ 100 Million"></asp:ListItem>
                    <asp:ListItem Text="Above US$ 100 Million" Value="Above US$ 100 Million"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                %<asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:Resource, exports	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_exports" runat="server">0</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:Resource, Advertisement	 %>" />
            </td>
            <td class="td_register_de">
                <asp:TextBox ID="TextBox_Advertisementdress" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="td_register">
                &nbsp;
            </td>
            <td>
                <asp:ImageButton ID="ImageButton_Create" runat="server" ImageUrl="<%$ Resources:Resource, Submit_Img %>"
                    OnClick="ImageButton_Create_Click" Style="height: 16px" />
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>