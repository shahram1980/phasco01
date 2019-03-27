<%@ Page Language="C#" MasterPageFile="~/Template/Master_Phasco.Master" AutoEventWireup="true"
    CodeBehind="UserRating.aspx.cs" Inherits="PHASCO_WEB.UserRating" %>

<asp:Content ContentPlaceHolderID="head_Meta" runat="server">
    <style type="text/css">
        .Userrate_td {
            text-align: center;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Plc_Mid">
    <script language="C#" runat="server">
        public string Images(int Image, int id, int sex)
        {

            if (Image == 1) return "http://phasco.com/phascoupfile/Userphoto/" + id.ToString() + ".jpg";
            if (sex == 0) return "http://phasco.com/phascoupfile/Userphoto/Nopic_male.jpg";
            else if (sex == 1) return "phascoupfile/Userphoto/Nopic_female.jpg";
            return "~/phascoupfile/Userphoto/Nopic_female.jpg";

        }
    </script>

    <table border="0" width="100%" dir="rtl">
        <tr>
            <td>
                <strong>جدول برترین کاربران فاسکو</strong><br />
                این جدول رده بندی بر اساس نتایج تمامی دوره های رقابت برترین کاربران علمی سایت فاسکو
                    تهیه شده است:
                    
            </td>
        </tr>
    </table>
    <br />
    <div class="table-responsive rtl-text">
         <table class="table table-striped table-hover table-bordered" border="1" style="border-collapse: collapse; direction: rtl;">
        <tr>
            <td style="width: 5%;" class="Userrate_td">رتبه
            </td>
            <td style="width: 25%; text-align: center; font-weight: bold;">کاربر
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/1.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/2.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/3.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/4.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/5.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/6.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/7.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/8.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/9.jpg" />
            </td>
            <td style="width: 7%;" class="Userrate_td">
                <img src="images/Rated/10.jpg" />
            </td>
        </tr>
        <asp:Repeater ID="repUserRate" runat="server">

            <ItemTemplate>

                <tr>
                    <td style="width: 5%;" class="Userrate_td">
                        <%#Eval("row")%>
                    </td>
                    <td style="width: 25%; text-align: center;">
                        <a href="UserProfile.aspx?id=<%#DataBinder.Eval(Container.DataItem, "uid")%>">
                            <img src='<%# Images(int.Parse(Eval("Image").ToString()), int.Parse(Eval("uid").ToString()), int.Parse(Eval("sex").ToString()))%>'
                                width="50" style="border: 1px solid #000" />
                            <br />
                        </a>
                        <%-- [img : <%# Eval("Image")%>]<br />  [sex : <%# Eval("sex")%>] <br /> [uid : <%# Eval("uid")%>]--%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),1)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),2)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),3)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),4)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),5)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),6)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),7)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),8)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),9)%>
                    </td>
                    <td style="width: 7%;" class="Userrate_td">
                        <%#GetUserRateCount(Eval("uid").ToString(),10)%>
                    </td>
                </tr>

            </ItemTemplate>
        </asp:Repeater>
    </table>

    </div>
   

</asp:Content>
