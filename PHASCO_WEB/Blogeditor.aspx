<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Template/Master_Phasco.Master"
    CodeBehind="Blogeditor.aspx.cs" Inherits="PHASCO_WEB.Blogeditor" EnableEventValidation="false" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
    <style>
    </style>
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">

    <script language="C#" runat="server">

        public string Blog_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            return sunDate.Weekday.ToString() + "<br />[" + dtm.Hour + ":" + dtm.Minute + ":" + dtm.Second + "]";

        }
    </script>
    <div runat="server" id="LBL_Alarm_div" class="alert alert-info rtl-text text-right">
        <p>
            <asp:Label ID="LBL_Alarm" runat="server"></asp:Label>
        </p>
    </div>
    <div class="tabs-widget widget">
        <ul class="menu-links width25">

            <li>
                <asp:Button runat="server" ID="Button_MyWEblog" CssClass="btn_img"
                    Text="وبلاگ من" OnClick="Button_MyWEblog_Click" /></li>

            <li>
                <asp:Button runat="server" ID="Button3" CssClass="btn_img"
                    Text="ایجاد و ویرایش پیوندها" OnClick="Button3_Click1" /></li>

            <li>
                <asp:Button runat="server" ID="Button2" CssClass="btn_img"
                    Text="ویرایش پست ها" OnClick="ImageButton_Edit_Click" /></li>

            <li>
                <asp:Button runat="server" ID="Button4" CssClass="btn_img"
                    Text="ایجاد پست جدید" OnClick="Button4_Click" /></li>
        </ul>

        <div class="tab-box">
            <div class="tab-content active" style="display: block;">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div class="text-right  table-responsive">
                            <table class="table table-sm form-groupno-border rtl-" border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                             <tr>
                                  <td dir="rtl">عنوان بلاگ :
                                    </td>
                             </tr>
                                
                                <tr>
                                   
                                    <td align="right" dir="rtl" style="width: 100%">
                                        <asp:TextBox ID="TextBox_Title" runat="server" CssClass="form-control"
                                            Width="512px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                     <td valign="top" dir="rtl">&nbsp;متن بلاگ&nbsp; :
                                    </td>
                                </tr>
                                <tr>

                                   
                                    <td align="right" dir="rtl"  class="fckEditor">
                                        <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Height="350px">
                                        </FCKeditorV2:FCKeditor>
                                    </td>
                                </tr>

                                <tr>
                                      <td valign="top">اجازه نظر دهی کاربران
                                    </td>
                                </tr>
                                <tr>
                                  
                                    <td align="right" dir="rtl" >
                                        <asp:CheckBox ID="CheckBox_Comment" runat="server" Checked="True" />
                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 20%" valign="top"></td>
                                    <td align="right" dir="rtl" style="width: 80%">
                                        <asp:Button ID="Button_Edit" CssClass="btn btn-success margin-right-5 pull-left" runat="server" OnClick="Button_Edit_Click1" Text="  ويرايش  " />

                                        <asp:Button ID="Button_INs" runat="server" OnClick="Button_INs_Click" CssClass="btn btn-primary pull-left" Text="  ثبت شود  " />
                                    </td>

                                </tr>
                            </table>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div class="text-right table-responsive rtl-text">
                            <asp:GridView ID="GridView_Blog" runat="server" AutoGenerateColumns="False"
                                CssClass="table table-striped rtl-text table-bordered">
                                <Columns>
                                    <asp:BoundField HeaderText="عنوان" DataField="Title" />
                                    <asp:BoundField HeaderText="مشاهده" DataField="Visit" />
                                    <asp:TemplateField HeaderText="آخرین ویرایش" HeaderStyle-Width="130px">
                                        <ItemTemplate>
                                            <i class="date-wrapper-no pull-right"><%# Blog_Date(Eval("DateEdit").ToString()) %></i>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="تاریخ ثبت" HeaderStyle-Width="130px">
                                        <ItemTemplate>
                                            <i class="date-wrapper-no pull-right"><%# Blog_Date(Eval("DateIns").ToString()) %></i>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ويرايش / حذف">
                                        <ItemTemplate>
                                            &nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton_Edit" runat="server" ImageUrl="~/images/ico.gif"
                                            OnCommand="ImageButton_Edit_Command" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                            ToolTip="ويرايش" />
                                            &nbsp;
                                        <asp:ImageButton ID="ImageButton_Delete" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                            runat="server" ImageUrl="~/images/ico-del.gif" OnCommand="ImageButton_Delete_Command"
                                            ToolTip="حذف" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </div>
                    </asp:View>
                    <asp:View ID="View3" runat="server">


                        <div class="table-responsive">
                            <asp:GridView ID="GridView_Links" CssClass="table table-hover table-striped rtl-text table-bordered" runat="server" AutoGenerateColumns="False" GridLines="None">



                                <Columns>
                                    <asp:BoundField HeaderText="عنوان" DataField="Title" />
                                    <asp:TemplateField HeaderStyle-Width="100px" HeaderText="ويرايش / حذف">
                                        <ItemTemplate>
                                            &nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButton_Link_Edit" runat="server" ImageUrl="~/images/ico.gif"
                                            OnCommand="ImageButton_Link_Edit_Command1" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                            ToolTip="ويرايش" />
                                            &nbsp;
                                        <asp:ImageButton ID="ImageButton_Link_Delete" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.id","{0}") %>'
                                            runat="server" ImageUrl="~/images/ico-del.gif" OnCommand="ImageButton_Link_Delete_Command1"
                                            ToolTip="حذف" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                        </div>

                        <div class="table-responsive">
                            <table class="table rtl-text no-border form-group" border="0" cellpadding="0" cellspacing="0" style="width: 100%">

                                <tr>
                                    <td style="width: 20%">عنوان
                                    </td>
                                    <td style="width: 40%">
                                        <asp:TextBox CssClass="form-control" ID="TextBox_Link_Title" runat="server"></asp:TextBox>
                                    </td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td style="width: 20%">آدرس
                                    </td>
                                    <td style="width: 40%;">
                                        <asp:TextBox CssClass="form-control ltr-text" ID="TextBox_Link_Url" runat="server">http://www.</asp:TextBox>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width: 100%;">
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" OnClick="Button_Link_Insert_Click" Text="ثبت شود" />
                                        <asp:HiddenField ID="HiddenField_Id_Link" runat="server" />
                                        <asp:Button CssClass="btn btn-primary margin-right-5" ID="Button_Link_Edit" runat="server" OnClick="Button_Link_Edit_Click"
                                            Text="ويرايش شود" />
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </div>

                    </asp:View>
                </asp:MultiView>
                <asp:HiddenField ID="HiddenField_Id" runat="server" EnableViewState="False" />
            </div>
        </div>
    </div>
</asp:Content>
