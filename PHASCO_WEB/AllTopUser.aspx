<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="AllTopUser.aspx.cs" Inherits="PHASCO_WEB.AllTopUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">

    <script language="C#" runat="server">

        public string SetProfile(int id)
        {
            string ret_ = "";
            DataAccessLayer.Users.TBL_User_Profile da = new DataAccessLayer.Users.TBL_User_Profile();
            System.Data.DataTable dt;
            dt = da.Users_Profile_Tra_DT("select_Id", id);
            if (dt.Rows.Count > 0)
                ret_ = dt.Rows[0]["Maghata"].ToString() + "<br/> " + dt.Rows[0]["Reshte"].ToString();
            else ret_ = "وضعیت تحصیلی نا مشخص";
            return ret_;
        }

        public string Counter(int cureentpage)
        {

            int count = int.Parse(Session["User_PageinNumber"].ToString());

            count += cureentpage;
            //int count = int.Parse(HiddenField_Counter.Value.ToString());
            //count = count + 1;
            //HiddenField_Counter.Value = count.ToString();

            //if (count <= 10)
            //{
            //    return "<img width='32px' height='auto' src='images/Phascp_Icon_Users.jpg' title='برترین کابران' />" + count.ToString();
            //}
            return count.ToString();
        }
        public string Images(int Image, int id, int sex)
        {

            if (Image == 1) return "phascoupfile/Userphoto/" + id.ToString() + ".jpg";

            if (sex == 0) return "phascoupfile/Userphoto/Nopic_male.jpg";
            else if (sex == 1) return "phascoupfile/Userphoto/Nopic_female.jpg";
            return "~/phascoupfile/Userphoto/Nopic_female.jpg";

        }
        public string ISCurrent(string value)
        {
            try
            {
                if (value == ViewState["drpPagingIndex"].ToString()) return "active margin-top-5";
                else return "margin-top-5";
            }
            catch (Exception)
            {
                if (value == "0") return "active margin-top-5";
                else return "margin-top-5";
            }

        }
    </script>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td dir="rtl" style="width: 100%; text-align: right;">




                <div class="staff-box vers2">
                    <div class="container">
                        <h3>
                            <asp:Literal runat="server" ID="LbL_Title"></asp:Literal></h3>
                        <div class="row">
                            <asp:Repeater ID="DataList_User" runat="server">
                                <ItemTemplate>


                                    <div class="col-md-2 col-xs-6">
                                        <div class="staff-post">
                                            <div class="staff-post-content">
                                                <h5><a class="menu" href="UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                                    <%#DataBinder.Eval(Container.DataItem, "Uid")%>
                                                </a></h5>

                                                <span><a class="menu" href="UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                                    <%#DataBinder.Eval(Container.DataItem, "name")%>&nbsp;
                                                    <%#DataBinder.Eval(Container.DataItem, "famil")%>
                                                </a></span>
                                            </div>
                                            <div class="staff-post-gal">
                                                <ul class="staf-social text-center">

                                                    <li><a><i class="fa fa-trophy"></i>
                                                        <p><%# Counter(Container.ItemIndex+1)%></p>
                                                    </a></li>
                                                    <li><a><i class="fa fa-star"></i>
                                                        <p><%#DataBinder.Eval(Container.DataItem, "Point")%></p>
                                                    </a></li>

                                                </ul>
                                                <a class="menu" href="UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                                    <img src='http://phasco.com/<%# Images(int.Parse(Eval("Image").ToString()), int.Parse(Eval("id").ToString()), int.Parse(Eval("sex").ToString()))%>' />
                                                </a>
                                                <%# SetProfile(int.Parse(Eval("id").ToString()))%>
                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>

                            </asp:Repeater>




                        </div>
                    </div>
                </div>

            </td>
        </tr>

    </table>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" style="width: 100%">
                <ul class="pagination-list">
                    <asp:Repeater ID="Repeater_Article_List" runat="server">

                        <ItemTemplate>
                            <li>
                                <asp:LinkButton ID="Linkbutton_Panging" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.value","{0}") %>'
                                    CssClass='<%# ISCurrent(Eval("value").ToString()) %>' OnCommand="Linkbutton_Panging_Command"
                                    Text='<%# Eval("item")%>'></asp:LinkButton>
                            </li>

                        </ItemTemplate>
                    </asp:Repeater>
                </ul>

            </td>
        </tr>
    </table>
    <asp:HiddenField ID="HiddenField_Counter" runat="server" Value="0" />
</asp:Content>
