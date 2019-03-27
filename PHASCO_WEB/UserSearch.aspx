<%@ Page Title="" Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="UserSearch.aspx.cs" Inherits="Rahbina.Users.UserSearch" %>

<script language="C#" runat="server">
    public string addfriend(string id)
    {
        if (Membership_Manage.UserOnline.User_Online_Valid())
            return "<a href='UserSearch.aspx?userid=" + id + "'>اضافه به لیست دوستان</a>";
        else return "اضافه به لیست دوستان";
      
    }
    public string Images(int Image, int id, int sex)
    {
        if (Image == 1) return "phascoupfile/Userphoto/" + id.ToString() + ".jpg";
        if (sex == 0) return "phascoupfile/Userphoto/Nopic_male.jpg";
        else if (sex == 1) return "phascoupfile/Userphoto/Nopic_female.jpg";
        return "~/phascoupfile/Userphoto/Nopic_female.jpg";
    }
    public bool ISCurrent(string value)
    {
        try
        {
            if (value == ViewState["drpPagingIndex"].ToString()) return true;
            else return false;
        }
        catch (Exception)
        {
            if (value == "0") return true;
            else return false;
        }
        return false;
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Plc_Mid" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table align="right" dir="rtl">
        <tr>
            <td align="center">
                <p class="alert alert-danger" id="lbl_msg_wrapper" runat="server">

                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>

                </p>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server" DefaultButton="btn_search">
                    <table class="table no-border table-sm form-group" style="width: 100%">
                        <tr>
                            <td style="width: 10%">نام
                            </td>
                            <td>
                                <asp:TextBox ID="txt_name" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name"
                                    ErrorMessage="نام را وارد نمایید" ValidationGroup="name"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 10%">&nbsp;
                            </td>
                            <td>
                                <asp:Button ID="btn_search" runat="server" CssClass="btn btn-primary" OnClick="btn_search_Click" Text="جستجو"
                                    ValidationGroup="name" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p>
                                    <asp:Label runat="server" ID="Lbl_Count" />
                                </p>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>

    </table>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="table-responsive rtl-text">
                <asp:DataList ID="DataList_User" runat="server" CssClass="table no-border" CellPadding="8" RepeatColumns="5"
                RepeatDirection="Horizontal">
                <ItemTemplate>
                    <table id="table4" class="table table-bordered table-striped" border="0" style="border-collapse: collapse; height: 150px;" width="100%">
                        <tr>
                            <td align="center" valign="middle">
                                <a href='UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>'>
                                    <img src='<%# Images(int.Parse(Eval("Image").ToString()), int.Parse(Eval("id").ToString()), int.Parse(Eval("sex").ToString()))%>' />
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; padding-right: 10px;" valign="top">
                                <a class="menu" href='UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>'>
                                    <%#DataBinder.Eval(Container.DataItem, "Uid")%>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; padding-right: 10px;" valign="top">
                                <a class="menu" href='UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>'>
                                    <%#DataBinder.Eval(Container.DataItem, "name")%>&nbsp;
                                                                        <%#DataBinder.Eval(Container.DataItem, "famil")%>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center; padding-right: 10px;" valign="top">امتیاز :
                                                                    <%#DataBinder.Eval(Container.DataItem, "Point")%>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>

            </asp:DataList>

            </div>
            
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 20px">
                <tr>
                    <td align="center">
                        <ul class="pagination-list rtl-text">
                            <asp:Repeater ID="Repeater_Article_List" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <asp:LinkButton ID="Linkbutton_Panging" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.value","{0}") %>'
                                            Font-Bold='<%# ISCurrent(Eval("value").ToString()) %>' OnCommand="Linkbutton_Panging_Command"
                                            Text='<%# Eval("item")%>'></asp:LinkButton>
                                    </li>

                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>

                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="middle">
            </div>
            <div style="padding: 15px; position: absolute; top: 200px; right: 180px; width: 100%; height: 100%; text-align: center; padding-top: 60px;">
                <table border="0" width="70%" id="table1" style="border-collapse: collapse">
                    <tr>
                        <td align="center" valign="top">
                            <img src="images/wall_Loader.gif" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <b>در حال بارگزاری .. </b>
                        </td>
                    </tr>
                </table>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
