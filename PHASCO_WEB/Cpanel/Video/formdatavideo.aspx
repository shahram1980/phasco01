<%@ Page Title="" Language="C#" MasterPageFile="~/Template/admin.Master" AutoEventWireup="true"
    CodeBehind="formdatavideo.aspx.cs" Inherits="NewFifa.Admin.VideoManage.formdatavideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
<!--
        function popitup(url) {
            newwindow = window.open(url, 'name', 'height=700,width=500');
            if (window.focus) { newwindow.focus() }
            return false;
        }

// -->
    </script>
                	<link rel="stylesheet" href="/JS_ShowcommentVideo/demo.css?v=2">
                   <script src="/flowplayer/flowplayer-3.2.10.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellpadding="2" class="style3" dir="rtl">
        <tr>
            <td>
                &nbsp;&nbsp; ا<a href="formdatavideo.aspx">ضافه کردن ویدیو جدید</a>&nbsp;&nbsp;&nbsp;
                |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="VideoListEdit.aspx">لیست ویدیوها&nbsp;</a>
                 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="VideoListEdit.aspx?Status=New">لیست ویدیوها ارسال کاربران&nbsp;</a>
            </td>
        </tr>
    </table>
    &nbsp;<asp:Label runat="server" ID="Lbl_Alarm" />
    <asp:Panel runat="server" ID="frm_Insert">
        <table cellpadding="0" cellspacing="0" dir="rtl" style="width: 100%">
            <tr>
                <td style="width: 20%; text-align: left;">
                    نام کلیپ :
                </td>
                <td style="width: 80%; text-align: right;">
                    <asp:TextBox ID="TextBox_VideoName" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; text-align: left;">
                    توضیحات کوتاه :
                </td>
                <td style="width: 80%; text-align: right;">
                    <asp:TextBox ID="TextBox_VideoDescription" runat="server" Height="77px" TextMode="MultiLine"
                        Width="405px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; text-align: left;">
                    گروه :
                </td>
                <td style="width: 80%; text-align: right;">
                    <asp:DropDownList ID="DropDownList_CategorieID" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="Categorie_Name" DataValueField="ID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Phasco_NetConnectionString1 %>"
                        SelectCommand="SELECT [Categorie_Name], [ID] FROM [tblVideoCategorie]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; text-align: left;">
                    کلمات کلیدی :
                </td>
                <td style="width: 80%; text-align: right;">
                    <asp:TextBox ID="TextBox_VideoTag" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 20%; text-align: left;">
                    تصویر پیش نمایش :
                </td>
                <td style="width: 80%; text-align: right;">
                    <asp:FileUpload ID="FileUpload_Photo" runat="server" />
                    <asp:Image ID="Image_View" runat="server" />
                    <asp:HiddenField ID="HiddenField_UserId" runat="server" />
                    <asp:HiddenField ID="HiddenField_Photoname" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 20%; text-align: left;">
                    ویدیو :
                </td>
                <td style="width: 80%; text-align: right;">
                    <asp:FileUpload ID="FileUpload_Video" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 20%; text-align: left;">
                    &nbsp;
                </td>
                <td style="width: 80%; text-align: right;">
                  <asp:PlaceHolder ID="PlaceHolder1" runat="server" /> 
 
    <script>
        flowplayer("player", "/flowplayer/flowplayer-3.2.11.swf", {
            clip: {
                autoPlay: false,
                autoBuffering: true
            }
        });
</script></td>
            </tr>
            <tr>
                <td style="width: 20%; text-align: left;">
                </td>
                <td style="width: 80%; text-align: right;">
                    <asp:Button ID="Button_Insert" runat="server" Text="  مشخصات ثبت شود  " OnClick="Button_Insert_Click" />
                    <asp:Button ID="Button_Edit" runat="server" Visible="false" Text="  مشخصات ویرایش شود  "
                        OnClick="Button_Edit_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
