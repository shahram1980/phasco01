<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Template/Master_Phasco.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="phasco_webproject._Default" %>

<%@ Register Src="UI/User_Middle_Option.ascx" TagName="User_Middle_Option" TagPrefix="uc5" %>
<%@ Register Src="UI/Default_Tabs.ascx" TagName="Default_Tabs" TagPrefix="uc3" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head_Meta" runat="server">

    <!-- loading page-->
    <script type="text/javascript">

        $(document).ready(function () {

            $('#page_effect').fadeIn(9000);
        });

    </script>
    <!-- loading page-->
    <style type="text/css">
        .style18 {
            width: 799px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Plc_Mid" runat="server">

    <script language="C#" runat="server">
        public string image_Check(string Valid_Image, int id_, string Image_Mode, int AutoId)
        {
            string ret_ = "";
            string name_Fiel = Convert.ToString(id_) + Convert.ToString((id_ * 4));
            string Get_Id = Convert.ToString(Request.QueryString["id"]);
            if (Valid_Image == "yes")
            {
                ret_ = "<a href='Default.aspx?Page=ProductDetail&id=" + Convert.ToString(AutoId) + "'><img border='0' src='phascoupfile/Product_Images/" + name_Fiel + Image_Mode + "' alt='" + name_Fiel + Image_Mode + "' width='120'></a>";
            }
            else if (Valid_Image == "no")
            {
                ret_ = "<a href='Default.aspx?Page=ProductDetail&id=" + Convert.ToString(AutoId) + "'><img border='0' src='phascoupfile/Product_Images/NOpic/NoPic.jpg' ></a>";
            }
            return ret_;
        }

        public string SingIn_Check(int id_)
        {
            String ret_ = "";
            //if (Session["Uid_Name"] != null)
            ret_ = "<a href='addtocard.aspx?Pid=" + Convert.ToString(id_) + "'>" + Resources.Resource.addtocart + "</a>";
            return ret_;
        }
        public string Counter()
        {
            int count = int.Parse(HiddenField_Counter.Value.ToString());
            count = count + 1;
            HiddenField_Counter.Value = count.ToString();
            if (count <= 3)
            { return "<img src='/images/Phascp_Icon_Users.jpg' title='برترین کابران' /> : "; }
            return count.ToString() + " : ";
        }
    </script>
    <%--  <div class="welcome-box">
        <div class="container">
            <h1>سایت جامع علوم آزمایشگاهی و پزشکی  <span>فاسکو</span></h1>
            <p>
                فراهم آوردن فضایی مجازی و در عین حال علمی، تخصصی و کاربردی در زمینه علوم آزمایشگاهی به نحوی که کلیه دست اندرکاران و متخصصین این رشته بتوانند به راحتی و با اطمینان و به صورت متمرکز، از امکانات و اطلاعات آن بهره برداری نمایند، در این زمان نیازی اساسی و انکار ناپذیر است.
 در این راستا سایت جامع علوم آزمایشگاهی و پزشکی فاسکو این افتخار را دارد که برای اولین بار به عنوان بزرگترین سایت تخصصی علوم آزمایشگاهی در کشور، ضمن ارائه خدمات عمومی و تخصصی به جامعه آزمایشگاهی کشور، محیطی فراهم آورده تا پزشکان و متخصصان امر درمان نیز بتوانند با آگاهی و اطمینان بیشتری با مراکز آزمایشگاهی ارتباط بر قرار کرده و در بحث تشخیص گام های موثر تری بردارند
            </p>
        </div>
    </div>--%>
    <%--  <div class="recent-works no-background-box">
        <div class="container">
            <h3>آخرین ویدئو ها</h3>

            <div id="carousel-example-generic" class="carousel slide" data-type="multi" data-ride="carousel">

                <!-- Wrapper for slides -->
                <div class="carousel-inner">

                    <div class="item active">
                        <div class="row">


                            <asp:Repeater ID="DataList_Video" runat="server">
                                <ItemTemplate>


                                    <div class="col-md-4">
                                        <div class="work-post">
                                            <div class="work-post-gal">
                                                <img src='http://www.phasco.com/phascoupfile/Video/thumbnail/Small/<%# Eval("VideoPhotoname")%>' title="<%# Eval("VideoPhotoname")%>" />

                                                <div class="hover-box">
                                                    <a class="zoom video" href="http://www.phasco.com/Video/watch.aspx?Vid=<%# Eval("Videoid")%>&t=<%# Eval("VideoName")%>"></a>

                                                </div>
                                            </div>
                                            <div class="work-post-content">
                                                <h5><%# Eval("VideoName")%></h5>

                                            </div>
                                        </div>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                          


                        </div>
                    </div>



                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"></a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"></a>
            </div>
        </div>
    </div>--%>
    <asp:HiddenField ID="HiddenField_Counter" runat="server" Value="0" />

   
    


    <uc3:Default_Tabs ID="Default_Tabs1" runat="server" />

    <%--<div class="recent-works no-background-box">
        <div class="container">
            <h3>کلمات کلیدی سایت  فاسکو</h3>

            <div class="innner-box">

                <div class="widget footer-widgets tag-widget">

                    <ul class="tag-widget-list">

                        <asp:Repeater runat="server" ID="rpt_Keyword">
                            <ItemTemplate>
                                <li><a href='<%# Eval("url")%>' title='<%# Eval("tag")%>'><%# Eval("tag")%></a></li>

                            </ItemTemplate>
                        </asp:Repeater>

                    </ul>
                </div>
            </div>
        </div>
    </div>--%>
</asp:Content>

