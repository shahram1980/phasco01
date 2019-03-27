<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Template/admin.Master" CodeBehind="QC_Lnks.aspx.cs" Inherits="PHASCO_WEB.Cpanel.QC_Lnks" %>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table style="width: 100%">
    <tr>
        <td style="width: 139px">
            نام آزمایشگاه</td>
        <td>
            <asp:TextBox ID="TextBox_Name" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 139px">
            لینک آزمایشگاه</td>
        <td>
            <asp:TextBox ID="TextBox_Url" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="width: 139px; height: 20px">
        </td>
        <td style="height: 20px">
            <asp:Button ID="Button_Send" runat="server" onclick="Button_Send_Click" 
                Text="ثبت شود" />
        </td>
    </tr>
    <tr>
        <td style="width: 139px; height: 20px">
            &nbsp;</td>
        <td style="height: 20px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="عنوان" />
                    <asp:BoundField DataField="Url" HeaderText="لینک" />
                    <asp:TemplateField>
                    <ItemTemplate>
                    <asp:LinkButton runat="server"  CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'   OnCommand="ImageButton_Edit_Command" >حذف شود</asp:LinkButton>
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </td>
    </tr>
</table>


</asp:Content>