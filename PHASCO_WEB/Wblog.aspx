<%@ Page Language="C#" MasterPageFile="~/Template/Weblog.Master" AutoEventWireup="true"
    CodeBehind="Wblog.aspx.cs" Inherits="PHASCO_WEB.Wblog" %>

<asp:Content ContentPlaceHolderID="head_Meta" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="Plc" runat="server">

    <script language="C#" runat="server">

        public string Blog_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return sunDate.Weekday.ToString();
        }
        public string Blog_Time(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return dtm.Hour + ":" + dtm.Minute;
        }
        public string removeHtmlTags(string text)
        {
            return Regex.Replace(text, "<.*?>", String.Empty);
        }

        public bool Set_Comment(int mode)
        {
            if (mode == 1) return true;
            return false;
        }
        public string persian_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return "<i class='date-wrapper'>" + sunDate.Weekday.ToString() + " </i> <i class='seprator margin-left-5 margin-right-5 pull-right'>| </i><i class='fa fa-clock-o'></i><i class='pull-right'>" + dtm.Hour + ":" + dtm.Minute + "</i>";
        }

        public string Set_Popup(int mode, int id)
        {
            if (mode == 1) return "javascript:popDemo('BlogComment.aspx?id=" + id.ToString() + "')";
            return "111";
        }

        public string Set_Comment_Count(int id)
        {
            PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_Blog_CommentTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.Users_Blog_CommentTableAdapter();
            int count = 0;
            int? count_ = 0;
            count_ = da.Comment_Count(id);
            return count_.ToString();
        }

    </script>

    <script language="javascript">
<!--
    function popDemo(N) {
        newWindow = window.open(N, 'popD', 'toolbar=no,menubar=no,resizable=no,scrollbars=yes,status=no,location=no,width=600,height=500');
    }
    //-->
    </script>

    <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 95%">

        <tr>
            <td align="right" dir="rtl" style="width: 100%">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        پیدا نشد
                    </asp:View>
                    <asp:View ID="View2" runat="server">

                        <asp:Repeater ID="GridView_Blog" runat="server">
                            <ItemTemplate>


                                <h3>
                                    <%# Eval("Title") %></h3>
                                <div>

                                    <div class="reaction clearfix">


                                        <p>
                                            <span class="pull-right"><i class="fa fa-calendar margin-left-5"></i>
                                                <i class="date-wrapper pull-left margin-right-5">
                                                    <%# Blog_Date(Eval("DateIns").ToString()) %>
                                                </i>

                                            </span>
                                            <span class="pull-right margin-right-5">
                                                <i class="fa fa-clock-o margin-left-5"></i>
                                                <i class="date-wrapper pull-left"><%# Blog_Time(Eval("DateIns").ToString()) %>

                                                </i>
                                            </span>
                                           <i class="seprator margin-left-5 margin-right-5 pull-right">| </i><i class="fa fa-user pull-right margin-right-5"></i><a class="pull-right" href='UserProfile.aspx?id=<%# Eval("uid")%>'>
                                                            <%#GetUserTitle(Convert.ToInt32( Eval("uid")))%>
                                                        </a>

                                        </p>
                                        <div class="clearfix"></div>
                                        <p>
                                            <span class="pull-right"><i class="margin-left-5">نظرات :</i>
                                                <a href="#" title="نظرات" onclick="<%# Set_Popup(Convert.ToInt32(Eval("Comment")),Convert.ToInt32(Eval("id"))) %>">
                                                    <asp:Label ID="Label2" runat="server" Enabled='<%# Set_Comment(Convert.ToInt32(Eval("Comment"))) %>'>
                                                                                         <%# Set_Comment_Count(Convert.ToInt32(Eval("id"))) %> 
                                                    </asp:Label>
                                                </a>
                                            </span>
                                        </p>
                                        <% if (HasReturn)
                                            { %>
                                        <a class="btn btn-default pull-left btn-sm" href="/webloglist.aspx">بازگشت <i class="fa fa-reply"></i></a>
                                        <%} %>
                                    </div>

                                    <div class="clearfix"></div>
                                    <%-- <script>
                                        function goBack() {
                                            window.history.back();
                                        }
                                    </script>--%>
                                    <blockquote>
                                        <p>
                                            <%#removeHtmlTags( Eval("body").ToString()) %>
                                        </p>
                                    </blockquote>
                                </div>

                                <div>

                                    <!-- AddThis Button BEGIN -->
                                    <div class="addthis_toolbox addthis_default_style ">
                                        <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4d04e1941d9ddce0" class="addthis_button_compact">اشتراک گذاری این صفحه</a>
                                        <span class="addthis_separator">|</span>
                                        <a class="addthis_button_preferred_1"></a>
                                        <a class="addthis_button_preferred_2"></a>
                                        <a class="addthis_button_preferred_3"></a>
                                        <a class="addthis_button_preferred_4"></a>

                                    </div>
                                    <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username=xa-4d04e1941d9ddce0"></script>
                                    <!-- AddThis Button END -->
                                </div>

                            </ItemTemplate>
                        </asp:Repeater>



                        <asp:Panel runat="server" ID="Panel_LikeDislike">

                            <span class="button-wrapper small-btn">
                                <asp:LinkButton ID="btn_LikeVideo" OnClick="ImageButton_LikeVideo_Click" CssClass="read-more like-color" runat="server"
                                    ToolTip="امتیاز دادن به این مطلب">
                                    <i class="fa fa-thumbs-up"></i>
                                    <asp:Literal runat="server" ID="lbl_like" />
                                </asp:LinkButton>
                                <asp:LinkButton ID="LinkButton1" CssClass="read-more score-color" runat="server"
                                    ToolTip="امتیاز دادن این مطلب">
                                    <i class="fa fa-thumbs-up"></i>
                                    <asp:Literal runat="server" ID="lblUserPoint" />
                                </asp:LinkButton>

                                <asp:LinkButton ID="btn_UnlikeVideo" OnClick="ImageButton_UnlikeVideo_Click" CssClass="read-more dislike-color" runat="server"
                                    ToolTip="کسر امتیاز از این مطلب">
                                    <i class="fa fa-thumbs-down"></i>
                                    <asp:Literal runat="server" ID="lbl_Unlike" />
                                </asp:LinkButton>
                            </span>

                            <asp:HiddenField runat="server" ID="HiddenField_UID" />
                            <asp:HiddenField runat="server" ID="HiddenField_Title" />
                            <asp:Label ID="Label_Title" runat="server" Font-Bold="True"></asp:Label>

                            <div class="col-md-12  margin-top-5">
                                <div class="shop-widget text-right">
                                    <h4>نظرات</h4>
                                    <ul class="widget-item faq article with-img">

                                        <asp:Repeater ID="GridView_Comment" runat="server">
                                            <ItemTemplate>

                                                <li class="text-left">
                                                    <a href='UserProfile.aspx?id=<%# Eval("uid")%>'>
                                                        <img src='http://phasco.com/phascoupfile/Userphoto/<%# Eval("uid")%>.jpg' />

                                                    </a>
                                                    <p>
                                                        <%# Eval("Comment") %>
                                                    </p>

                                                    <p>
                                                        <i class="fa fa-calendar"></i><i class="date-wrapper"><%# persian_Date(Eval("DateSend").ToString())%></i>

                                                        <i class="seprator margin-left-5 margin-right-5 pull-right">| </i><i class="fa fa-user"></i><a class="pull-right" href='UserProfile.aspx?id=<%# Eval("uid")%>'>
                                                            <%#GetUserTitle(Convert.ToInt32( Eval("uid")))%>
                                                        </a>
                                                    </p>


                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>




                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                     <td align="left" dir="rtl" style="width: 20%" valign="top"></td>
                                    <td align="right" dir="rtl" style="width: 80%">
                                        <asp:Label ID="Label_Alarm" runat="server" Font-Names="Tahoma" ForeColor="Red"></asp:Label></td>
                                   
                                </tr>
                                <tr>
                                   <td align="left" style="width: 20%" valign="top" dir="rtl">
                                        <asp:Label ID="Label1" Text="<%$ Resources:Resource, Comment %>" runat="server"></asp:Label>
                                        :</td>
                                    <td align="right" style="width: 80%" dir="rtl">
                                        <asp:TextBox ID="TextBox_Comment" runat="server" Height="100px" TextMode="MultiLine"
                                            Width="80%" Font-Names="Tahoma" Font-Size="XX-Small"></asp:TextBox></td>
                                     
                                </tr>
                                <tr>
                                       <td align="left" dir="rtl" style="width: 20%" valign="top"></td>
                                    <td align="right" dir="rtl" style="width: 80%" class="contact-form">

                                        <asp:Button ID="Button_Insert" runat="server" Text="<%$ Resources:Resource, R_Submit %>"
                                            OnClick="Button_Insert_Click" /></td>
                                    
                                 
                                </tr>
                            </table>

                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>
