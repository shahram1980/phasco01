<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Searchbox.ascx.cs" Inherits="BiztBiz.Template.Searchbox" %>

    <table style="width: 100%" cellspacing="0" cellpadding="0" class="style2">
        <tr>
            <td class="center-align" valign="top">
                <table class="parent-search-content">
                    <tr>
                        <td>
                            <table style="width: 100%">
                                <tr>
                                
                                    <td valign="bottom" style="text-align:center;">
                                        <img alt="" src="../../images/logo.jpg" />
                                    </td>
                             
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 10px">
                            <div class="search-form">   
                                      <table border="0" width="100%" dir="rtl" cellpadding="0" style="border-collapse: collapse">
	<tr>
		<td width="70%" align="left"> <input style="width: 400px;" name="Text_search" type="text" runat="server" id="TXT_Find" /></td>
		<td align="right" width="30%"><asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/search.png"
                                        OnClick="ImageButton1_Click" TabIndex="1" CausesValidation="False" /></td>
	</tr>
</table>  
                                </div>
                        
                       
                                 
                        
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    