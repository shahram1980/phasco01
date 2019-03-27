<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Blogeditor.ascx.cs" Inherits="phasco_webproject.UI.Blogeditor" %>
<%@ Register Assembly="RadEditor" Namespace="Telerik.WebControls" TagPrefix="radE" %>
 <script language="C#" runat="server">
 
    public string Blog_Date( string date)
    {
        DateTime dtm = new DateTime();
        dtm = Convert.ToDateTime(date);
        Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
        
       return   sunDate.Weekday.ToString() + "<br/>["+dtm.Hour+":"+dtm.Minute+":"+dtm.Second+"]";
  
    }
    </script>
 
 
 <table style="width: 100%">
    <tr>
        <td align="right" style="width: 100%">
            &nbsp; &nbsp;
            <asp:LinkButton ID="LinkButton_Edit" runat="server" Text="<%$ Resources:Resource, Edit %>" OnClick="LinkButton_Edit_Click"></asp:LinkButton>
            <asp:LinkButton ID="LinkButton_New" runat="server"  Text="<%$ Resources:Resource, New %>" OnClick="LinkButton_New_Click"></asp:LinkButton></td>
    </tr>
    <tr>
        <td align="right" style="width: 100%">
        </td>
    </tr>
</table>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="View1" runat="server">
 
 
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
            <tr>
                <td align="right" dir="rtl" style="width: 80%">
                    <asp:TextBox ID="TextBox_Title" runat="server"></asp:TextBox></td>
                <td style="width: 20%" valign="top">
                    <asp:Label ID="Label1"  Text="<%$ Resources:Resource, Title %>" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 80%">
                    <radE:RadEditor ID="RadEditor_Body" runat="server" DeleteDocumentsPaths="~/news_M/newsdoc/"
                        DeleteFlashPaths="~/news_M/newsdoc/" DeleteImagesPaths="~/news_M/newsdoc/" DeleteMediaPaths="~/news_M/newsdoc/"
                        DeleteTemplatePaths="~/news_M/newsdoc/" Editable="true" EnableEnhancedEdit="True"
                        FlashPaths="~/news_M/newsdoc/" Font-Names="tahoma" Height="300px" ImagesPaths="~/news_M/newsdoc/"
                        MediaPaths="~/news_M/newsdoc/" ShowHtmlMode="False" ShowPreviewMode="False" ShowSubmitCancelButtons="False"
                        ToolsFile="~/RadControls/Editor/Admin_ToolsFile.xml" UploadFlashPaths="~/news_M/newsdoc/"
                        UploadImagesPaths="~/news_M/newsdoc/" UploadMediaPaths="~/news_M/newsdoc/" UploadTemplatePaths="~/news_M/newsdoc/"
                        Width="400px">
                    </radE:RadEditor>
                </td>
                <td style="width: 20%" valign="top">
                 <asp:Label ID="Label2"  Text="<%$ Resources:Resource, Body %>" runat="server"> </asp:Label>
                </td>
            </tr>
    <tr>
        <td align="right" dir="rtl" style="width: 80%">
            <asp:CheckBox ID="CheckBox_Comment" runat="server" /></td>
        <td style="width: 20%" valign="top">
            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, Comment_Tick %>"> </asp:Label></td>
    </tr>
            <tr>
                <td align="right" dir="rtl" style="width: 80%">
                    <asp:Button ID="Button_INs" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                        OnClick="Button_INs_Click" Text="<%$ Resources:Resource, Reg_Form_Submit %>" />
                    <asp:Button ID="Button_Edit" runat="server" Font-Names="Tahoma" Font-Size="XX-Small"
                        OnClick="Button_Edit_Click1" Text="<%$ Resources:Resource, Edit_Bottom %>" /></td>
                <td style="width: 20%" valign="top">
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
    <table style="width: 100%">
            <tr>
                <td align="right" dir="rtl" style="width: 100%">
                </td>
            </tr>
            <tr>
                <td align="center" dir="rtl" style="width: 100%">
        <asp:GridView ID="GridView_Blog" runat="server" AutoGenerateColumns="False" Width="90%" CellPadding="4" ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:BoundField HeaderText="عنوان" DataField="Title" />
                <asp:BoundField HeaderText="مشاهده" DataField="Visit" />
                <asp:TemplateField HeaderText="آخرین ویرایش">
                <ItemTemplate>
                <%# Blog_Date(Eval("DateEdit").ToString()) %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="تاریخ ثبت">
                            <ItemTemplate>
                <%# Blog_Date(Eval("DateIns").ToString()) %>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ويرايش / حذف">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton_Edit" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' Text="<%$ Resources:Resource, Edit %>" runat="server" OnCommand="LinkButton_Edit_Command"></asp:LinkButton>&nbsp;
                        <asp:LinkButton ID="LinkButton_Delete" OnClientClick="return confirm('حذف شود ؟')" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>' Text="<%$ Resources:Resource, Delete %>" runat="server" ForeColor="Red" OnCommand="LinkButton_Delete_Command"></asp:LinkButton>
                        
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View3" runat="server">
    </asp:View>
</asp:MultiView>
<asp:HiddenField ID="HiddenField_Id" runat="server" EnableViewState="False" />
    
    