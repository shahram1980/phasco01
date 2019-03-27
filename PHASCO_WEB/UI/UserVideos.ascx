<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserVideos.ascx.cs" Inherits="PHASCO_WEB.UI.UserVideos" %>
<asp:Repeater ID="DataList_Video" runat="server">
    <ItemTemplate>


        <div class="item news-item">
            <div class="inner-item">
                <img alt="<%# Eval("VideoPhotoname")%>" title="<%# Eval("VideoPhotoname")%>" src="http://phasco.com/phascoupfile/Video/thumbnail/Small/<%# Eval("VideoPhotoname")%>">
                <div class="hover-item">
                    <ul>
                        <li><a class="autor" href="/UserProfile.aspx?id=<%# Eval("UserID") %>"><i class="fa fa-user"></i><%# Eval("Uid")%></a></li>
                        <li><a class="date" href="#"><i class="fa fa-eye"></i><%# Eval("VideoVisit")%></a></li>
                        <li><a class="comment-numb" href="#"><i class="fa fa-star"></i><%# Eval("UserPoint")%></a></li>
                    </ul>
                </div>
            </div>
            <h5><%# Eval("VideoName")%></h5>
            <p><%# Eval("VideoDescription")%></p>
            <ul class="tag-widget-list">
            </ul>

            <a class="read-more" href="watch.aspx?Vid=<%# Eval("Videoid")%>" title=" <%# Eval("VideoName")%>"><i class="fa fa-video-camera"></i>مشاهده </a>
        </div>

    </ItemTemplate>
</asp:Repeater>
