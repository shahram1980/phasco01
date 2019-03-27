<%@ Page Language="C#"  MasterPageFile="~/Template/Office.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="PHASCO_Shopping.MyPHASCO_Shopping.Contact" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<table border="0" width="100%" class="direction">
	<tr>
		<td width="30%" >
            <img src="../images/tel.jpg" />
        </td>
		<td width="70%"  > 
        </td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal103291" Text="<%$ Resources:Resource, Tel %>" runat="server" />&nbsp;1</td>
		<td width="70%"  class="Contact_Form_Align"><asp:TextBox ID="TextBox_teloffice1" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal1" Text="<%$ Resources:Resource, Tel %>" runat="server" />&nbsp;2</td>
		<td width="70%"  class="Contact_Form_Align"><asp:TextBox ID="TextBox_teloffice2" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal2" Text="<%$ Resources:Resource, Tel %>" runat="server" />&nbsp;3</td>
		<td width="70%"  class="Contact_Form_Align"><asp:TextBox ID="TextBox_teloffice3" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal3" Text="<%$ Resources:Resource, Tel %>" runat="server" />&nbsp;4</td>
		<td width="70%"  class="Contact_Form_Align"><asp:TextBox ID="TextBox_teloffice4" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal4" Text="<%$ Resources:Resource, Tel %>" runat="server" />&nbsp;5</td>
		<td width="70%"  class="Contact_Form_Align"><asp:TextBox ID="TextBox_teloffice5" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align">&nbsp;</td>
		<td width="70%" class="Contact_Form_Align">&nbsp;</td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal5" Text="<%$ Resources:Resource, Fax %>" runat="server" />&nbsp;1</td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_faxoffice1" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal6" Text="<%$ Resources:Resource, Fax %>" runat="server" />&nbsp;2</td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_faxoffice2" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal7" Text="<%$ Resources:Resource, Fax %>" runat="server" />&nbsp;3</td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_faxoffice3" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align">&nbsp;</td>
		<td width="70%" class="Contact_Form_Align">&nbsp;</td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal8" Text="<%$ Resources:Resource, Support_Email %>" runat="server" /></td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_Email_Support" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal9" Text="<%$ Resources:Resource, Sales_Email %>" runat="server" /></td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_Email_Sales" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal10" Text="<%$ Resources:Resource, Manager_Email %>" runat="server" /></td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_Email_Manager" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align">&nbsp;</td>
		<td width="70%" class="Contact_Form_Align">&nbsp;</td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal11" Text="<%$ Resources:Resource, CompanyCompany_Address_Name %>" runat="server" />&nbsp;1</td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_Address1" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal12" Text="<%$ Resources:Resource, CompanyCompany_Address_Name %>" runat="server" />&nbsp;2</td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_Address2" 
                runat="server"></asp:TextBox>
        </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align">&nbsp;</td>
		<td width="70%" class="Contact_Form_Align">&nbsp;</td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal13" Text="<%$ Resources:Resource, Website %>" runat="server" /></td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_website" 
                runat="server">http://www.</asp:TextBox>
            </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal14" Text="<%$ Resources:Resource, Zip_Postal_Code %>" runat="server" /></td>
		<td width="70%" class="Contact_Form_Align"><asp:TextBox ID="TextBox_zipcode" 
                runat="server"></asp:TextBox>
            </td>
	</tr>
    	<tr>
		<td width="30%" class="Contact_Form_Align"><asp:Literal ID="Literal15" Text="<%$ Resources:Resource, Description %>" runat="server" /></td>
		<td width="70%" class="Contact_Form_Align">
            <asp:TextBox ID="TextBox_Description" runat="server" 
                TextMode="MultiLine"></asp:TextBox>
            </td>
	</tr>

        	<tr>
		<td width="30%" class="Contact_Form_Align">&nbsp;</td>
		<td width="70%" class="Contact_Form_Align">
            <asp:Button ID="Button_Submit" runat="server" 
                Text="<%$ Resources:Resource, Submit %>" onclick="Button_Submit_Click"   />
            
            </td>
	</tr>
</table>

</asp:Content>