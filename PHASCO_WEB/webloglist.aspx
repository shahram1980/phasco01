<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="webloglist.aspx.cs" Inherits="PHASCO_WEB.webloglist" %>

<%@ Register Assembly="ComponentArt.Web.Visualization.Charting" Namespace="ComponentArt.Web.Visualization.Charting" TagPrefix="cc1" %>
<script language="C#" runat="server">

    public string Mss_Date(string date)
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

<asp:Content ID="Content1" ContentPlaceHolderID="head_Meta" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="Plc_Mid" runat="server">

    <div class="about-box">
        <div class="container">
            <div class="row">


                <div class="col-md-6 ">
                    <div class="shop-widget">
                        <h4>محبوب ترین ها</h4>
                        <ul class="widget-item article">


                            <asp:Repeater ID="DataList_BlogLates" runat="server">

                                <ItemTemplate>

                                    <li>

                                        <h6 class="text-right">
                                            <a target="_blank" href="/Wblog.aspx?OBid=<%# Eval("OBid")%>&t=<%# clean_text(Eval("Title").ToString())%>" title="<%# Eval("Title")%>">
                                                <i class="fa fa-pencil-square pull-right head-icon"></i><%# DataBinder.Eval(Container.DataItem, "Title") %>
                                            </a></h6>
                                        <p><i class="fa fa-calendar"></i><i class="date-wrapper"><%# Mss_Date(Eval("DateEdit").ToString())%></i> <i class="seprator margin-left-5 margin-left-5 pull-right"> |  </i> <i class="fa fa-user"></i><a class="pull-right"  href='UserProfile.aspx?id=<%# Eval("Id")%>'><%# Eval("Uid")%></a></p>
                                    </li>

                                </ItemTemplate>

                            </asp:Repeater>

                        </ul>
                    </div>

                </div>
                <div class="col-md-6 ">
                    <div class="shop-widget">
                        <h4>جدیدترین ها</h4>
                        <ul class="widget-item article">


                            <asp:Repeater ID="DataList_Blog" runat="server">

                                <ItemTemplate>

                                    <li>

                                        <h6 class="text-right">
                                            <a target="_blank" href="/Wblog.aspx?OBid=<%# Eval("OBid")%>&t=<%# clean_text(Eval("Title").ToString())%>" title="<%# Eval("Title")%>">
                                                <i class="fa fa-pencil-square pull-right head-icon"></i><%# DataBinder.Eval(Container.DataItem, "Title") %>
                                            </a></h6>
                                        <p><i class="fa fa-calendar"></i><i class="date-wrapper"><%# Mss_Date(Eval("DateEdit").ToString())%></i> <i class="seprator margin-left-5 margin-left-5 pull-right"> |  </i> <i class="fa fa-user"></i><a class="pull-right"  href='UserProfile.aspx?id=<%# Eval("Id")%>'><%# Eval("Uid")%></a></p>

                                    </li>

                                </ItemTemplate>

                            </asp:Repeater>

                        </ul>
                    </div>

                </div>


            </div>
        </div>
    </div>


</asp:Content>
