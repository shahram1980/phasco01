<%@ Page Language="C#" MasterPageFile="~/Template/Article_M.Master" AutoEventWireup="true"
    CodeBehind="altlas.aspx.cs" Inherits="PHASCO_WEB.altlas" %>

<asp:Content ContentPlaceHolderID="Plc" runat="server">
    <script language="C#" runat="server">
 
        public string Mss_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            return sunDate.Weekday.ToString();
        }
        public string Set_Image(int image)
        {
            if (image == 1) return "phascoupfile/Userphoto/" + image + ".jpg";
            else if (image == 0) return "phascoupfile/Userphoto/Nopic.jpg";

            return "phascoupfile/Userphoto/Nopic.jpg";
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

        public string Set_UserToolTip(string uid, string ArticleNo, string name, string famil, string RegisterDate, string LastLoginDate, string Point, string Image)
        {
            string res_ = "";


            string Body_Html = "<table border=1 width=&quot;250&quot; cellpadding=&quot;0&quot; style=&quot;border-collapse: collapse&quot; bordercolor=#C0C0C0>";
            Body_Html = Body_Html + "<tr><td valign=&quot;top&quot; dir=&quot;rtl&quot; align=center colspan=&quot;2&quot;>";
            Body_Html = Body_Html + "<img border=&quot;0&quot; src=" + Set_Image(int.Parse(Image)) + "></td></tr>";
            Body_Html = Body_Html + "<tr><td width=&quot;65%&quot; valign=&quot;top&quot; dir=rtl align=right>" + name + " " + famil + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1606;&#1575;&#1605; : </td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=rtl align=right>" + uid + " </td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1606;&#1575;&#1605; &#1705;&#1575;&#1585;&#1576;&#1585;&#1740; :</td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=rtl align=right>" + Mss_Date(RegisterDate) + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1593;&#1590;&#1608;&#1740;&#1578; : </td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=rtl align=right>" + Mss_Date(LastLoginDate) + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1570;&#1582;&#1585;&#1740;&#1606; &#1605;&#1585;&#1575;&#1580;&#1593;&#1607;: </td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=rtl align=right>" + Point + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1575;&#1605;&#1578;&#1740;&#1575;&#1586; :</td></tr><tr>";
            Body_Html = Body_Html + "<td width=&quot;65%&quot; valign=&quot;top&quot; dir=rtl align=right>" + ArticleNo + "</td>";
            Body_Html = Body_Html + "<td width=&quot;35%&quot; dir=rtl align=left valign=&quot;top&quot;>&#1605;&#1602;&#1575;&#1604;&#1575;&#1578; :</td></tr></table>";



            res_ = "<script type='text/javascript'>";
            res_ = res_ + "var hb3 = new HelpBalloon({";
            res_ = res_ + "title: '" + uid + "',";
            res_ = res_ + "content: '" + Body_Html + "'";
            res_ = res_ + "});<" + "/" + "script>";
            return res_;
        }
 
    </script>
    <table cellpadding="0" style="width: 100%; border-collapse: collapse">
        <tr>
            <td>
                <table style="width: 100%; border-collapse: collapse">
                    <tr>
                        <td width="50%" align="center">
                            <img alt="" src="images/Slideslogo.jpg" />
                        </td>
                        <td width="50%" valign="top">
                            <table cellpadding="0" cellspacing="0" style="width: 390px">
                                <tr>
                                    <td bgcolor="#A20001" style="width: 391px; height: 50px; vertical-align: middle;"
                                        dir="rtl">
                                        &nbsp;&nbsp;<span style="color: #FFFFFF"> گروه بندی اطلس </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="daily-art" dir="rtl" align="center" height="180" valign="top">
                                        <asp:DataList ID="DataList_Slides" runat="server" RepeatColumns="2" Width="95%">
                                            <ItemTemplate>
                                                <div align="Right">
                                                    <table id="table1" border="0" dir="rtl" style="border-collapse: collapse" width="100%">
                                                        <tr>
                                                            <td>
                                                                <img src="../images/arrow3.gif" />
                                                            </td>
                                                            <td>
                                                                <a href='atlas.aspx?slideid=<%#DataBinder.Eval(Container.DataItem, "Id")%>'>
                                                                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                                                </a>
                                                            </td>
                                                            <td>
                                                                (
                                                                <%#DataBinder.Eval(Container.DataItem, "Visitcount")%>
                                                                )
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 1000px background-color: #fff4e2;">
                            <tr>
                                <td align="right" style="width: 100%">
                                    <table cellpadding="0" style="width: 100%; border-collapse: collapse">
                                        <tr>
                                            <td style="background-image: url('../images/atlas_bg.gif');" width="10%">
                                                <img alt="" src="images/atlas_img.jpg" />
                                            </td>
                                            <td style="background-image: url('../images/atlas_bg.gif');" width="90%" dir="rtl">
                                                &nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label_Current_Title0" runat="server" Font-Bold="True" Font-Size="XX-Small"
                                                    ForeColor="Red">اطلس ها</asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100%">
                                    <asp:DataList ID="DataList_Rand" runat="server" CellPadding="5" RepeatColumns="1"
                                        Width="700px">
                                        <ItemTemplate>
                                            <table border="2" id="table1" border="2" bordercolor="#CCC1A7" onmouseout="this.style.backgroundColor='#f3e5ca';"
                                                onmouseover="this.style.backgroundColor='#CCC1A7';" style="border-collapse: collapse;
                                                height: 250; width: 100%; vertical-align: top;">
                                                <tr>
                                                    <td align="center" width="20%" valign="top">
                                                        <div onmousemove="zoom_move(event);" onmouseout="zoom_off();" onmouseover='zoom_on(event,87,60,&#039;phascoupfile/Slides/b_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg&#039;);'
                                                            style="float: left">
                                                            <img alt="tjpzoom picture title" src='phascoupfile/Slides/s_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg'
                                                                style="padding: 0; margin: 0; border: 0; width: 87; height: 60;" />
                                                        </div>
                                                        <div style="clear: both;">
                                                        </div>
                                                        </div>
                                                        <br />
                                                        <a href="#" onclick='javascript:window.open (&#039;SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "id")%>&#039;,&#039;mywindow&#039;,&#039;location=0,status=0,scrollbars=0,width=600,height=600&#039;);'>
                                                            بزرگنمایی </a>
                                                    </td>
                                                    <td width="80%" style="vertical-align: top;">
                                                        <h4>
                                                            <%#DataBinder.Eval(Container.DataItem, "Title")%></h4>
                                                        <br />
                                                        <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 100%">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 600px; height: 20px">
                                        <tr>
                                            <td align="center" style="background-image: url(images/paging-bg.gif); width: 100%">
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; background-color: #fff4e2;">
                            <tr>
                                <td align="right" style="width: 100%">
                                    <table cellpadding="0" style="width: 100%; border-collapse: collapse">
                                        <tr>
                                            <td style="background-image: url('../images/atlas_bg.gif');" width="10%">
                                                <img alt="" src="images/atlas_img.jpg" />
                                            </td>
                                            <td style="background-image: url('../images/atlas_bg.gif');" width="90%" dir="rtl">
                                                &nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label_Current_Title" runat="server" Font-Bold="True" Font-Size="XX-Small"
                                                    ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 100%">
                                    <asp:DataList ID="DataList_Slid" runat="server" CellPadding="5" RepeatColumns="5">
                                        <ItemTemplate>
                                            <table id="table2" border="2" bordercolor="#CCC1A7" onmouseout="this.style.backgroundColor='#f3e5ca';"
                                                onmouseover="this.style.backgroundColor='#CCC1A7';" style="border-collapse: collapse;
                                                height: 250; width: 100px;">
                                                <tr>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" style="width: 60px;">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <div onmousemove="zoom_move(event);" onmouseout="zoom_off();" onmouseover='zoom_on(event,87,60,&#039;phascoupfile/Slides/b_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg&#039;);'
                                                                        style="float: left">
                                                                        <img alt="tjpzoom picture title" src='phascoupfile/Slides/s_<%#DataBinder.Eval(Container.DataItem, "id")%>.jpg'
                                                                            style="padding: 0; margin: 0; border: 0; width: 87; height: 60;" />
                                                                    </div>
                                                                    <div style="clear: both;">
                                                                    </div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%" valign="bottom">
                                                                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%" valign="bottom">
                                                                    <a href="#" onclick='javascript:window.open (&#039;SlideShow.aspx?img=<%#DataBinder.Eval(Container.DataItem, "id")%>&#039;,&#039;mywindow&#039;,&#039;location=0,status=0,scrollbars=0,width=600,height=600&#039;);'>
                                                                        بزرگنمایی </a>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                            Font-Underline="False" HorizontalAlign="Center" VerticalAlign="Top" />
                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 100%">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 600px; height: 20px">
                                        <tr>
                                            <td align="center" style="background-image: url(images/paging-bg.gif); width: 100%">
                                                <asp:Repeater ID="Repeater_Slide_Paging" runat="server">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="Linkbutton_Panging_Slide" runat="server" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.value","{0}") %>'
                                                            Font-Bold='<%# ISCurrent(Eval("value").ToString()) %>' OnCommand="Linkbutton_Panging_Slide_Command"
                                                            Text='<%# Eval("item")%>'></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
