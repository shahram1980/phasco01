<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Default_Tabs.ascx.cs"
    Inherits="PHASCO_WEB.UI.Default_Tabs" %>
<script language="C#" runat="server">

    public string set_Image(string Image, int id)
    {
        if (Image == "none.jpg") return "";
        if (Image != "none.jpg") return "../phascoupfile/NewsImages/" + Image;
        return "تصویر ناشناخته";
    }

    public string Images(int Image, int id, int sex)
    {

        if (Image == 1) return "http://phasco.com/phascoupfile/Userphoto/" + id.ToString() + ".jpg";

        if (sex == 0) return "phascoupfile/Userphoto/nopic.png";
        else if (sex == 1) return "phascoupfile/Userphoto/nopic.png";
        return "~/phascoupfile/Userphoto/nopic.png";

    }
    public string Shamsi_Date(string date)
    {
        DateTime dtm = new DateTime();
        dtm = Convert.ToDateTime(date);
        Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

        return sunDate.Weekday.ToString();
    }

    public string clean_text(string text)
    {
        return text.ToString().Replace(".", "").Replace("-", "");
    }
</script>


<div class="tabs-widget widget">
    <ul class="tab-links">

        <li><a class="tab-link6" href="#">
            <asp:Literal runat="server"  EnableViewState="false" Text="<%$ Resources:Resource,  PHasco_Top_Articel %>"
                ID="Literal4" /></a></li>
        <li><a class="tab-link5" href="#">
            <asp:Literal runat="server" EnableViewState="false" Text="<%$ Resources:Resource,  Phasco_New_Article %>"
                ID="Literal3" /></a></li>
        <li><a class="tab-link4  active" href="#">
            <asp:Literal runat="server" EnableViewState="false" Text="<%$ Resources:Resource,  Phasco_WEblog %>"
                ID="Literal2" /></a></li>
        <li><a class="tab-link3" href="#">
            <asp:Literal runat="server" EnableViewState="false" Text="<%$ Resources:Resource,  Phasco_Users_Newst %>"
                ID="Literal1" /></a></li>
        <li><a class="tab-link2" href="#">
            <asp:Literal runat="server" EnableViewState="false" Text="<%$ Resources:Resource,  Phasco_News %>"
                ID="a1" /></a></li>
        <li><a class="tab-link1" href="#">مطلب روز</a></li>
    </ul>
    <div class="tab-box">

        <div class="tab-content" style="display: none;">
            <ul class="widget-item article">
                <asp:Repeater ID="RPT_Best" runat="server" EnableViewState="false">
                    <ItemTemplate>

                        <li>

                            <h6 class="right">
                                <a target="_parent" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" rel="Site/Article/ShortView.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                    <i class="fa fa-pencil-square pull-right head-icon"></i><%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                </a></h6>
                            <p class="rtl-text">
                                <i class="fa fa-calendar"></i>
                                <i class="date-wrapper"><%# Shamsi_Date(DataBinder.Eval(Container.DataItem, "DateIns").ToString())%></i>
                                <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                <i class="fa fa-eye"></i><i class="pull-right"><%# Eval("ClickNumber")%></i>
                                <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                <i class="fa fa-user"></i>
                                <%# Set_User(int.Parse(Eval("UID_ID").ToString()))%>
                                <%--<a class="pull-right" href="UserProfile.aspx?id=<%# Eval("UID_ID")%>"><%# Eval("UserName")%></a>--%>
                            </p>
                            <span class="button-wrapper">
                                <a class="read-more" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>"><i class="fa fa-arrow-left"></i>جزئیات</a>
                            </span>
                            <p>
                            </p>
                        </li>

                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>

        <div class="tab-content" style="display: none;">
            <ul class="widget-item article">
                <asp:Repeater ID="RPT_Last" runat="server" EnableViewState="false">
                    <ItemTemplate>
                        <li>

                            <h6 class="right">
                                <a target="_parent" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" rel="Site/Article/ShortView.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>">
                                    <i class="fa fa-pencil-square pull-right head-icon"></i><%# DataBinder.Eval(Container.DataItem, "SubJect") %>
                                </a></h6>
                            <p class="rtl-text">
                                <i class="fa fa-calendar"></i>
                                <i class="date-wrapper"><%# Shamsi_Date(DataBinder.Eval(Container.DataItem, "DateIns").ToString())%></i>
                                <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                <i class="fa fa-eye"></i><i class="pull-right"><%# Eval("ClickNumber")%></i>
                                <i class="seprator margin-right-5 margin-left-5 pull-right">|</i>
                                <i class="fa fa-user"></i>
                                <%# Set_User(int.Parse(Eval("UID_ID").ToString()))%>
                                <%--<a class="pull-right" href="UserProfile.aspx?id=<%# Eval("UID_ID")%>"><%# Eval("UserName")%></a>--%>
                            </p>
                            <span class="button-wrapper">
                                <a class="read-more" title="<%#DataBinder.Eval(Container.DataItem, "SubJect")%>" href="/Article.aspx?Detailsid=<%#DataBinder.Eval(Container.DataItem, "id")%>&t=<%# clean_text(Eval("SubJect").ToString()) %>"><i class="fa fa-arrow-left"></i>جزئیات</a>
                            </span>
                            <p>
                            </p>
                        </li>

                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div class="tab-content" style="display: block;">
            <ul class="widget-item article">
                <asp:Repeater ID="Repeater_Blog" runat="server" EnableViewState="false">

                    <ItemTemplate>
                        <li>

                            <h6 class="right">
                                <i class="fa fa-pencil-square pull-right head-icon"></i> <a target="_parent" href="/Wblog.aspx?OBid=<%# Eval("OBid")%>&t=<%# clean_text(Eval("Title").ToString())%>"
                                    title="<%# Eval("Title")%>">
                                    <%# Eval("Title")%>
                                </a></h6>
                            <p>

                                <i class="fa fa-calendar"></i>
                                <i class="date-wrapper"><%# Shamsi_Date(DataBinder.Eval(Container.DataItem, "DateIns").ToString())%></i>
                                <i class="seprator margin-left-5 margin-left-5 pull-right">|  </i>
                                <i class="pull-right"><i class="fa fa-user"></i>
                                    <a href="userProfile.aspx?id=<%# Eval("Id")%>"> <%# Eval("Uid")%> </a> </i>
                            </p>

                        </li>

                    </ItemTemplate>

                </asp:Repeater>
            </ul>
        </div>
        <div class="tab-content" style="display: none;">

            <div class="">
                <div class="container">


                    <div class="row rtl-text">


                        <asp:Repeater ID="DataList_User" runat="server">
                            <ItemTemplate>

                                <div class="col-md-3">
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
                                            <%--<ul class="staf-social">
										<li></li>
										<li></li>
										<li>    <%# Shamsi_Date(Eval("RegisterDate").ToString()) %></li>
										<li> <%#DataBinder.Eval(Container.DataItem, "Point")%></li>
										<li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
										<li><a class="pinterest" href="#"><i class="fa fa-pinterest"></i></a></li>
									</ul>--%>
                                            <img src='<%# Images(int.Parse(Eval("Image").ToString()), int.Parse(Eval("id").ToString()), int.Parse(Eval("sex").ToString()))%>' />

                                        </div>
                                    </div>
                                </div>

                            </ItemTemplate>

                        </asp:Repeater>


                    </div>
                </div>
            </div>

        </div>
        <div class="tab-content" style="display: none;">
            <ul class="widget-item">
                <asp:Repeater ID="Repeater_News" runat="server" EnableViewState="false">
                    <ItemTemplate>
                        <li>

                            <h6 class="right"><a href="/News.aspx?News_Id=<%#Eval("id") %>&t=<%# clean_text(Eval("Title").ToString()) %>">
                                <%# Eval("Title") %>
                            </a></h6>
                            <p><%# Eval("news") %></p>

                        </li>

                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div class="tab-content" style="display: none;">
            <div style="text-align: justify; padding: 5px; direction: rtl;">
                <blockquote>
                    <p>
                        <asp:Literal ID="Label_TODay" runat="server"></asp:Literal>
                    </p>
                </blockquote>
                <p>
                    <asp:HyperLink ID="HyperLink_URL" runat="server">منبع این مطلب</asp:HyperLink>
                </p>
            </div>
        </div>

    </div>
</div>

