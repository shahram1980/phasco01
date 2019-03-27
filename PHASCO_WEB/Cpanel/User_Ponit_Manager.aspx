<%@ Page Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="User_Ponit_Manager.aspx.cs" Inherits="PHASCO_WEB.Cpanel.User_Ponit_Manager" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel id="Panel3" runat="server" Width="100%">
<asp:DataGrid id="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="Vertical" CellPadding="3"
								BorderStyle="None" DataKeyField="id" BorderWidth="1px" BorderColor="#999999"
								BackColor="White" Width="90%">
								<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#008A8C"></SelectedItemStyle>
								<AlternatingItemStyle BackColor="Gainsboro"></AlternatingItemStyle>
								<ItemStyle ForeColor="Black" BackColor="#EEEEEE"></ItemStyle>
								<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#000084"></HeaderStyle>
								<FooterStyle ForeColor="Black" BackColor="#CCCCCC"></FooterStyle>
								<Columns>
									<asp:BoundColumn DataField="PointMode" ReadOnly="True" HeaderText="کد امتیاز"></asp:BoundColumn>
									<asp:BoundColumn DataField="piont" HeaderText="امتیاز"></asp:BoundColumn>
									<asp:BoundColumn DataField="name" HeaderText="عنوان"></asp:BoundColumn>
									<asp:EditCommandColumn ButtonType="PushButton" UpdateText="Update" HeaderText="ویرایش" CancelText="Cancel"
										EditText="ويرايش"></asp:EditCommandColumn>
								</Columns>
								<PagerStyle HorizontalAlign="Center" ForeColor="Black" BackColor="#999999" Mode="NumericPages"></PagerStyle>
							</asp:DataGrid>
      <P>
          &nbsp;</P>
      <P>&nbsp;</P></asp:Panel>
</asp:Content>

 