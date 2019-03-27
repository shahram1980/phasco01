<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Template/admin.Master"AutoEventWireup="true" CodeBehind="ArticleMain.aspx.cs" Inherits="phasco.Cpanel.ArticleMain" %>

<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>



<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
         
         			<table border="0" width="95%" id="table88" dir="rtl">
                         <tr>
                             <td colspan="3">
                                 <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                     <tr>
                                         <td align="left" dir="rtl" style="width: 20%">
                                             &#1593;&#1606;&#1608;&#1575;&#1606; &#1580;&#1583;&#1740;&#1583; :
                                         </td>
                                         <td align="right" dir="rtl" style="width: 60%">
                                             <asp:TextBox ID="Txt_Title" runat="server" CssClass="TxtClass" Width="90%"></asp:TextBox></td>
                                         <td align="right" style="width: 20%">
                                             <asp:Button ID="Button_Insert" runat="server" Text="ثبت" Font-Names="Tahoma" Width="50px" OnClick="Button_Insert_Click" /></td>
                                     </tr>
                                 </table>
                             </td>
                         </tr>
				<tr>
					<td width="742" colspan="3">
					<asp:GridView ID="GRD_LIST" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" Width="746px"
					 OnRowCancelingEdit="GRD_LIST_RowCancelingEdit" 
					 OnRowEditing="GRD_LIST_RowEditing" 
					 DataKeyNames="id"
					  OnRowUpdating="GRD_LIST_RowUpdating" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                        <FooterStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="کد">
                                <ItemStyle Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SubJect" HeaderText="عنوان" >
                                <ItemStyle Width="65%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="زيرگروه">
                                <ItemStyle Width="10%" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton_Subject" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                        OnCommand="LinkButton_Subject_Command">زیرگروه</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="حذف">
                                <ItemStyle Width="10%" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                        OnCommand="LinkButton_Delete_Command">حذف</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ويرايش" ShowEditButton="True"  UpdateText="بروز شود" HeaderText="ویرايش" >
                                <ItemStyle Width="10%" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        </asp:GridView>
                    </td>
				</tr>
			</table>
         
         </asp:View>
        <asp:View ID="View2" runat="server"><table border="0" width="95%" id="Table1" dir="rtl">
            <tr>
                <td colspan="3">
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" dir="rtl" style="width: 20%; height: 24px">
                            </td>
                            <td align="right" dir="rtl" style="width: 60%; height: 24px">
                                <asp:LinkButton ID="LinkButton_Back_TO_Level1" runat="server" OnClick="LinkButton_Back_TO_Level1_Click">برگشت به سرگروهها</asp:LinkButton></td>
                            <td align="right" style="width: 20%; height: 24px">
                            </td>
                        </tr>
                        <tr>
                            <td align="left" dir="rtl" style="width: 20%; height: 24px;">
                                عنوان جدید :
                            </td>
                            <td align="right" dir="rtl" style="width: 60%; height: 24px;">
                                <asp:TextBox ID="TextBox_title_Level2" runat="server" CssClass="TxtClass" Width="90%"></asp:TextBox></td>
                            <td align="right" style="width: 20%; height: 24px;">
                                <asp:Button ID="Button_Insert_Level2" runat="server" Text="ثبت" Font-Names="Tahoma" Width="50px" OnClick="Button_Insert_Level2_Click" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td width="742" colspan="3" align="right">
                    
                    <asp:GridView ID="GridView_Level2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" Width="746px"
					 OnRowCancelingEdit="GridView_Level2_RowCancelingEdit" 
					 OnRowEditing="GridView_Level2_RowEditing" 
					 DataKeyNames="id"
					  OnRowUpdating="GridView_Level2_RowUpdating" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                        <FooterStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="کد">
                                <ItemStyle Width="5%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SubJect" HeaderText="عنوان" >
                                <ItemStyle Width="65%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="مقاله جدید">
                                <ItemStyle Width="10%" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton_New_article" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                        OnCommand="LinkButton_New_article_Command">مقاله جدید</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="لیست مقالات">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton_List_article" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                        OnCommand="LinkButton_List_article_Command">لیست مقلات</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="حذف">
                                <ItemStyle Width="10%" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton_Delete_Level2" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                        OnCommand="LinkButton_Delete_Level2_Command">حذف</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField CancelText="انصراف" DeleteText="حذف" EditText="ويرايش" ShowEditButton="True"  UpdateText="بروز شود" HeaderText="ویرايش" >
                                <ItemStyle Width="10%" />
                            </asp:CommandField>
                        </Columns>
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    </asp:GridView>
                    
                </td>
            </tr>
        </table>
        </asp:View>
        <asp:View ID="View3" runat="server">
        		<table border="0" width="100%" id="table123" dir="rtl">
					<tr>
						<td>
<font size="2" color="#808080">&#1593;&#1606;&#1608;&#1575;&#1606;</font></td>
						<td width="663" dir="rtl" style="text-align: right"><asp:TextBox ID="SubJect" runat="server" CssClass="txtclass" Width="529px" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
					</tr>
					<tr>
						<td>
<font size="2" color="#808080">&#1705;&#1604;&#1740;&#1583; &#1608;&#1575;&#1688;&#1607;</font></td>
						<td width="663" dir="rtl" style="text-align: right">
                            <asp:TextBox ID="keyWork" runat="server" CssClass="txtclass" Width="400px" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
					</tr>
					<tr>
						<td>
<font size="1" color="#808080">&#1705;&#1604;&#1740;&#1583; &#1608;&#1575;&#1688;&#1607; </font>
								<font size="1">&#1586;&#1576;&#1575;&#1606;&#1607;&#1575;&#1740; &#1583;&#1740;&#1711;&#1585;</font></td>
						<td width="663" dir="rtl" style="text-align: right"><asp:TextBox ID="keyWorkOtherLan" runat="server" CssClass="txtclass" Width="400px" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
					</tr>
					<tr>
						<td style="height: 26px">
<font size="2" color="#808080">&#1606;&#1608;&#1740;&#1587;&#1606;&#1583;&#1607;</font></td>
						<td width="663" dir="rtl" style="height: 26px; text-align: right"><asp:TextBox ID="Writer" runat="server" CssClass="txtclass" Width="400px" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
					</tr>
					<tr>
						<td>
<font size="2" color="#808080">&#1605;&#1578;&#1585;&#1580;&#1605;</font></td>
						<td width="663" dir="rtl" style="text-align: right"><asp:TextBox ID="Translator" runat="server" CssClass="txtclass" Width="400px" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
					</tr>
					<tr>
						<td>
<font size="2" color="#808080">&#1605;&#1606;&#1576;&#1593;</font></td>
						<td width="663" dir="rtl">
						<table border="0" width="663" id="table124">
							<tr>
								<td width="510" style="text-align: right"><asp:TextBox ID="Ref" runat="server" CssClass="txtclass" Width="400px" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
								<td width="30">&#1606;&#1583;&#1575;&#1585;&#1583;</td>
								<td width="37"><asp:RadioButton ID="yes" runat="server" CssClass="txtclass" GroupName="ManEL" Checked="True" /></td>
								<td width="24">&#1583;&#1575;&#1585;&#1583;</td>
								<td width="28">
                                    <asp:RadioButton ID="no" runat="server" GroupName="ManEL" /></td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
						<td>
<font size="2" color="#808080">&#1670;&#1705;&#1740;&#1583;&#1607;</font></td>
						<td width="663" dir="rtl" style="text-align: right">
                            <asp:TextBox ID="ShortText" runat="server" CssClass="txtclass" TextMode="MultiLine"
                                Width="450px" Height="150px" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
					</tr>
					<tr>
						<td>
<font size="1" color="#808080">&#1670;&#1705;&#1740;&#1583;&#1607;: <br/>
</font><font size="1">&#1586;&#1576;&#1575;&#1606;&#1607;&#1575;&#1740; &#1583;&#1740;&#1711;&#1585;</font></td>
						<td width="663" dir="rtl" style="text-align: right"><asp:TextBox ID="ShortTextOtherLan" runat="server" CssClass="txtclass" TextMode="MultiLine"
                                Width="450px" Height="150px" Font-Names="Tahoma" Font-Size="X-Small"></asp:TextBox></td>
					</tr>
					<tr>
						<td><font size="2">&#1605;&#1602;&#1575;&#1604;&#1607;</font></td>
						<td width="663" dir="rtl">
                            <radE:RadEditor ID="RadEditor1" runat="server" ImagesPaths="~/phascoupfile/art_Upfiles/" UploadDocumentsPaths="~/phascoupfile/art_Upfiles/" UploadFlashPaths="~/phascoupfile/art_Upfiles/" UploadImagesPaths="~/phascoupfile/art_Upfiles/" UploadMediaPaths="~/phascoupfile/art_Upfiles/" UploadTemplatePaths="~/phascoupfile/art_Upfiles/">
                            </radE:RadEditor>
                        </td>
					</tr>
                    <tr>
                        <td>
                        </td>
                        <td dir="rtl" width="663">
                            </td>
                    </tr>
					<tr>
						<td></td>
						<td width="663" dir="rtl" align="right">
                            <asp:Button ID="Button_Insert_Article" runat="server" Text="ثبت شود" Font-Names="Tahoma" OnClick="Button_Insert_Article_Click" />
                            <asp:Button ID="Button_Edit_Article" runat="server" Text="ويرايش شود" Font-Names="Tahoma" OnClick="Button_Edit_Article_Click" /></td>
					</tr>
				</table>
        
        </asp:View>
        <asp:View ID="View4" runat="server">
            <div style="text-align: center">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                    <tr>
                        <td align="right" dir="rtl" style="width: 100%; height: 13px" valign="top">
                            <asp:LinkButton ID="LinkButton_Back_to_Level2" runat="server" OnCommand="LinkButton_Back_to_Level2_Command">برگشت به لیست</asp:LinkButton><br />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" dir="rtl" style="width: 100%; height: 13px">
                            <asp:GridView ID="GridView_Article" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" Width="746px" 
					 DataKeyNames="id" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellSpacing="2">
                                <FooterStyle BackColor="#CCCCCC" />
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="کد">
                                        <ItemStyle Width="5%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="SubJect" HeaderText="عنوان" >
                                        <ItemStyle Width="65%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="ويرايش">
                                        <ItemStyle Width="10%" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton_Edit_Article" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                OnCommand="LinkButton_Edit_Article_Command">ويرايش</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="حذف">
                                        <ItemStyle Width="10%" />
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton_Delete_Article" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                                OnCommand="LinkButton_Delete_Article_Command">حذف</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="White" />
                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:View>
    </asp:MultiView>
    <asp:HiddenField ID="HiddenField_Subject_Id" runat="server" /><asp:HiddenField ID="HiddenField_Level2_ID" runat="server" EnableViewState="False" /><asp:HiddenField ID="HiddenField_Article_Edit" runat="server" EnableViewState="False" />
    <asp:HiddenField ID="HiddenField_Article_List" runat="server" EnableViewState="False" />
</asp:Content>
 