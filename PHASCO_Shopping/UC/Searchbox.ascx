<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Searchbox.ascx.cs" Inherits="PHASCO_Shopping.Template.Searchbox" %>
     <link type="text/css" href="js/jquery.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#postbarnavigate2').click(function () {
                if ($('#imgdown').attr('src') == 'js/updown.jpg') {
                    $('#divPostBar2').slideToggle(400);
                    $('#divattach').slideToggle(100);
                    $('#imgdown').attr('src', 'js/updown.jpg');
                }
                else {
                    $('#divPostBar2').slideToggle(400);
                    setTimeout(divattachToggle, 200);
                    $('#imgdown').attr('src', 'js/updown.jpg');
                }

                return false;
            });

            function divattachToggle() {
                $('#divattach').slideToggle(200);
            }
        });
    </script>
    <div>

    
<table border="0" width="100%" style="border-collapse: collapse">
	<tr>
		<td width="50%">
        <input style="width: 200px;" name="Text_search" type="text" runat="server" id="TXT_Find" />
         </td>
		<td width="25%"> <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/search.png"
OnClick="ImageButton1_Click" TabIndex="1" /></td>
		<td width="25%"><a href="#" id="postbarnavigate2" style="text-decoration: none; ">
                        جستجو پیشرفته</a></td>
	</tr>
</table>


</div>
    <div>
        <div >
            <div style="display: none;" id="divPostBar2" class="post-bar-mid">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

<table border="0" width="100%" style="border-collapse: collapse"  dir='<asp:Literal ID="Literaltopadv101" Text="<%$ Resources:Resource, dir %>" runat="server" />'>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td style="padding-right:5px;text-align:right;">
                        <asp:DropDownList ID="DropDownList_Cat1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Cat1_SelectedIndexChanged">
                        </asp:DropDownList>&nbsp;&gt;
                        <asp:DropDownList ID="DropDownList_Cat2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList_Cat2_SelectedIndexChanged">
                        </asp:DropDownList>&nbsp;&gt;
                        <asp:DropDownList ID="DropDownList_Cat3" runat="server">
                        </asp:DropDownList>
                        
                        
                        
                        
                        
                        </td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div>
                <div style="margin: 0pt 0pt 0pt 80px; width: 100px; height: 6px;">
                   </div>
            </div>
        </div>
    </div>
    </a>

            
    