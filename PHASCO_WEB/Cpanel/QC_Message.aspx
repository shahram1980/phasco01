<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true" CodeBehind="QC_Message.aspx.cs" Inherits="PHASCO_WEB.Cpanel.QC_Message" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="style3" dir="rtl">
        <tr>
            <td style="width: 100%; direction: rtl; vertical-align: top;">
                &nbsp;
                <table class="style3">
                    <tr>
                        <td style="width: 103px">
                            تعداد کل پیغام ها </td>
                        <td>
                            <asp:Label ID="Label_CountMessage" runat="server" Font-Bold="True" 
                                ForeColor="#CC0000"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">
                            کد :</td>
                        <td>
                            <asp:TextBox ID="TextBox_Code" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                              <tr>
                        <td style="width: 103px">
                            کد عوامل ایجاد خطا   :</td>
                        <td>
                            <asp:TextBox ID="TextBox_Code_Reason" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">
                            متن پیغام :</td>
                        <td>
                                     <FCKeditorV2:FCKeditor ID="FCKeditor_Message" runat="server" Height="150px">
                        </FCKeditorV2:FCKeditor>
                                            </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="Button_Insert_Edit" runat="server" Text="ثبت شود" 
                                onclick="Button_Insert_Edit_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button_Edit" runat="server" Text="--  ویرایش شود   --" 
                                onclick="Button_Edit_Click" Visible="False" />
                            <asp:HiddenField ID="HIddenField_ID" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="Label_Alarm" runat="server"></asp:Label>
                            <br />
                            <asp:Button ID="Button_Set_To_Edit" runat="server" Font-Bold="True" 
                                ForeColor="#339933" onclick="Button_Set_To_Edit_Click" 
                                Text="می خواهم ویرایش کنم" Visible="False" />
&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button_delete" runat="server" Font-Bold="True" 
                                ForeColor="#FF3300" onclick="Button_delete_Click" Text="می خواهم حذف کنم" 
                                Visible="False" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 100%; direction: rtl; vertical-align: top;">
                            <asp:GridView ID="GridView_Brand" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource_Brand"
                    EnableModelValidation="True" CellPadding="4" ForeColor="#333333" GridLines="None" 
                                Width="100%">
                    <alternatingrowstyle backcolor="White" forecolor="#284775" />
                    <columns>
                        <asp:BoundField DataField="Code" HeaderText="Code" >
                            <ItemStyle Width="20%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ReasonCodeId" HeaderText="Reason Code " />
                        <asp:BoundField DataField="message" HeaderText="message">
                            <ItemStyle Width="70%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="messageGroup" HeaderText="Message Group">
                            <ItemStyle Width="10%" />
                        </asp:BoundField>
                    </columns>
                    <editrowstyle backcolor="#999999" />
                    <footerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
                    <headerstyle backcolor="#5D7B9D" font-bold="True" forecolor="White" />
                    <pagerstyle backcolor="#284775" forecolor="White" horizontalalign="Center" />
                    <rowstyle backcolor="#F7F6F3" forecolor="#333333" />
                    <selectedrowstyle backcolor="#E2DED6" font-bold="True" forecolor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource_Brand" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:phasco.Properties.Settings.Phasco_NetConnectionString %>" 
                    
                                SelectCommand="SELECT top 10 [messageGroup], [message], [Code], [id],[ReasonCodeId] FROM [TBL_QC_Message]   where ReasonCodeId is null  ORDER BY [id] DESC">
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
