using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer.Video;
using BiztBiz;
using Membership_Manage;
using System.Web.UI.HtmlControls;
using System.Threading;
using BusinessAccessLayer;
using DataAccessLayer;

namespace PHASCO_WEB.Video
{
    public partial class watch : System.Web.UI.Page
    {
        tblVideo da_Video = new tblVideo();
        public DataTable dt;
        tblVideo_Comment da_Comment = new tblVideo_Comment();
        public string VideoTag_;
        public string VideoDescription_;
        protected void Page_Init(object sender, EventArgs e)
        {
            Set_Datatable();
            try
            {
                VideoTag_ = dt.Rows[0]["VideoTag"].ToString();
                VideoDescription_ = dt.Rows[0]["VideoDescription"].ToString();
            }
            catch (Exception)
            { }
            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = VideoDescription_;
            Page.Header.Controls.Add(metaDescription);
            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = VideoTag_;
            Page.Header.Controls.Add(metaKeywords);
        }
        protected void Set_Datatable()
        {
            try
            {
                int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["Vid"]);
                dt = da_Video.tblVideo_SP(17, videoId, 0, 0, "", "", "", "", "", DateTime.Now, 0, 0);
            }
            catch (Exception)
            { }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "ویدیوها و فیلم های آموزشی،تخصصی و تفریحی علوم آزمایشگاهی فاسکو";
            int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["Vid"]);

            if (!IsPostBack)
            {
                Bind_RandomVideo(videoId);
                Bind_VideoComment(videoId);
            }
            Settoview(videoId);
        }
        //public string GetShamsiDate(string date)
        //{
        //    string sdate = string.Empty;
        //    if (!string.IsNullOrEmpty(date))
        //        sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date, 3);
        //    return sdate;
        //}
        void Settoview(int videoId)
        {
            DataTable dtview;
            dtview = da_Video.tblVideo_SP(17, videoId, 0, 0, "", "", "", "", "", DateTime.Now, 0, 1);

            if (!UserOnline.User_Online_Valid())
            {
                imgBtt_Submit.Visible = false;
                lbl_NotUserLogin.Text = "کاربر گرامی برای ثبت نظر باید حتما در سایت لاگین کرده باشید.";
                lbl_NotUserLogin.Text = lbl_NotUserLogin.Text + "<br/>در صورت نداشتن نام کاربری از " + " <a href='/Register.aspx'>اینجا</a>" + " می توانید ثبت نام کنید.";
            }
            else { imgBtt_Submit.Visible = true; }


            Page.Title = dtview.Rows[0]["VideoName"].ToString();
            lbl_like.Text = dtview.Rows[0]["ScoreUP"].ToString();
            lbl_Unlike.Text = dtview.Rows[0]["ScoreDown"].ToString();
            lbl_VideoName.Text = dtview.Rows[0]["VideoName"].ToString();
            lblVisitcount.Text = dtview.Rows[0]["VideoVisit"].ToString();
            lblUserPoint.Text = dtview.Rows[0]["UserPoint"].ToString();

            lblUser.Text = "<a class='pull-right' href='/UserProfile.aspx?id=" + dtview.Rows[0]["UserID"].ToString() + "'>" + dtview.Rows[0]["uid"].ToString() + "</a>";
            HiddenField_UID.Value = dtview.Rows[0]["UserID"].ToString();
            lblVideoDescription.Text = dtview.Rows[0]["VideoDescription"].ToString();
            lbldatesend.Text = PHASCOUtility.Mss_Date(dtview.Rows[0]["VideoUploadFullDate"].ToString());
            Lbl_VideoTag.Text = KeywordSpliter(dtview.Rows[0]["VideoTag"].ToString(), dtview.Rows[0]["Videoid"], dtview.Rows[0]["VideoName"]);


            try
            {
                HtmlGenericControl Div = new HtmlGenericControl("div");
                Div.Attributes.Add("class", "video-js-responsive-container vjs-hd");
                string filename = dtview.Rows[0]["VideoFilename"].ToString();
                string photo = "http://phasco.com/phascoupfile/Video/thumbnail/Orginal/" + dtview.Rows[0]["VideoPhotoname"].ToString();
                string InnerHtml_ = "<video  class=\"video-js vjs-default-skin\"   poster=\"" + photo + "\" width=\"640\" height=\"360\" controls ><source src='http://phasco.com/phascoupfile/Video/file/" + filename + "' type='video/x-flv' id=\"player\" ></video>";
                // string InnerHtml_ = "<a href=\"/phascoupfile/Video/file/" + filename + "\" style=\"display:block; width:500px; height:300px;\" id=\"player\"  ></a> ";
                Div.InnerHtml = InnerHtml_;
                PlaceHolder1.Controls.Add(Div);
            }
            catch (Exception) { Response.Write("مشکل در اجرا فایل پیدا نشد"); }
        }

        public string KeywordSpliter(string Keyword, object Videoid, object VideoName)
        {
            string s = Keyword.Replace("،", ",");
            string res_ = "<ul class='tag-widget-list'>";
            string[] words = s.Split(',');
            foreach (string word in words)
            {
                res_ = res_ + "<li><a href='watch.aspx?Vid=" + Videoid.ToString() + "&t=" + word + "' title='" + VideoName.ToString() + "'>" + word + "</a></li>";// Console.WriteLine(word);
            }
            return res_ + "</ul>";
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text != "")
            {
                string txtsearch = txtSearch.Text.Replace(" ", "+");
                Response.Redirect("?t=" + txtsearch);
            }
        }

        void Bind_RandomVideo(int videoId)
        {
            dt = da_Video.tblVideo_SP(18, videoId, 0, 0, "", "", "", "", "", DateTime.Now, 0, 0);
            int rr = dt.Rows.Count;
            DataList_Video.DataSource = dt;
            DataList_Video.DataBind();
        }


        #region comment

        void Bind_VideoComment(int videoId)
        {

            RPT_Comment.DataSource = da_Comment.tblVideo_Comment_SP(4, 0, videoId, 0, "");
            RPT_Comment.DataBind();
        }

        protected void MyRepeater_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            string Comm_ = e.CommandName.ToString();
            int id_ = Convert.ToInt32(e.CommandArgument);
            int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["Vid"]);
            if (UserOnline.User_Online_Valid())
            {
                Users_Wall da_w = new Users_Wall();
                switch (Comm_)
                {
                    case "minusScore":
                        {
                            da_Comment.tblVideo_Comment_SP(5, id_, videoId, UserOnline.id(), "", 1);
                            Bind_VideoComment(videoId);
                        }
                        break;
                    case "PlusScore":
                        {
                            da_Comment.tblVideo_Comment_SP(5, id_, videoId, UserOnline.id(), "", 0);
                            int CommentOwnerUid = int.Parse(da_Comment.tblVideo_Comment_SP(6, id_, 0, UserOnline.id(), "", 0).Rows[0]["uid"].ToString());
                            if (UserOnline.id() != CommentOwnerUid)
                            {
                                string wall_Text = "کاربر " + UserOnline.Uid() + " نظر شما را در مورد ویدیوی " + lbl_VideoName.Text + " پسندید   - <a href='/Video/watch.aspx?Vid=" + videoId.ToString() + "'>لینک ویدیو</a>";
                                da_w.Users_Wall_tra("insert", UserOnline.id(), CommentOwnerUid, 0, wall_Text);


                                if (UserOnline.role() == 5)
                                {
                                    // add user point
                                    UserOnline.Add_Point(CommentOwnerUid, 11, "auto");
                                    // add heyat elmi point
                                    UserOnline.Add_Point(UserOnline.id(), 501, "auto");
                                }


                                #region Insert Notification
                                // Insert Notification
                                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                                NotificationUsers.AddNewNotification(CommentOwnerUid, CommentOwnerUid, 0, "http://phasco.com/video/watch.aspx?Vid=" + videoId.ToString(), 2, 5, 16, "");
                                #endregion

                            }
                            Bind_VideoComment(videoId);
                        }
                        break;
                    default:
                        break;
                }
            }
        }

        protected void imgBtt_Submit_Click(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid())
            { return; }
            int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["Vid"]);
            da_Comment.tblVideo_Comment_SP(1, 0, videoId, UserOnline.id(), TextBox_Comment.Text);
            Bind_VideoComment(videoId);
            TextBox_Comment.Text = "";


            int uid_ = int.Parse(HiddenField_UID.Value);

            #region Insert Notification
            // Insert Notification
            // InsertType :  SendToAllFriend = 1 , SendToSingleFriend=2  ,   FinalAction=3
            NotificationUsers.AddNewNotification(0, 0, 0, "http://phasco.com/video/watch.aspx?Vid=" + videoId.ToString() + "&swb=t" + lbl_VideoName.Text,
                3, 10, 21, TextBox_Comment.Text, da_Comment.tblVideo_Comment_SP(7, videoId));
            #endregion
        }
        #endregion

        protected void ImageButton_UnlikeVideo_Click(object sender, EventArgs e)
        {
            int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["Vid"]);
            int uid_reciver = int.Parse(HiddenField_UID.Value);

            string res_ = da_Video.tblVideo_SP(19, videoId, 0, UserOnline.id(), "", "", "", "", "", DateTime.Now, 0, 0, 1).Rows[0][0].ToString();
            if (UserOnline.role() == 5)
            {
                // add heyat elmi point
                UserOnline.Add_Point(UserOnline.id(), 501, "auto");
            }
        }

        protected void ImageButton_LikeVideo_Click(object sender, EventArgs e)
        {
            int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["Vid"]);
            string res_ = da_Video.tblVideo_SP(19, videoId, 0, UserOnline.id(), "", "", "", "", "", DateTime.Now, 0, 0, 0).Rows[0][0].ToString();

            if (res_ == "1")
            {
                int uid_reciver = int.Parse(HiddenField_UID.Value);
                #region Insert Notification
                // Insert Notification
                // InsertType :  SendToAllFriend = 1 , SendToSingleFriend=2  ,   FinalAction=3
                NotificationUsers.AddNewNotification(uid_reciver, 0, 0, "http://phasco.com/video/watch.aspx?Vid=" + videoId.ToString() + "&swb=t" + lbl_VideoName.Text,
                    2, 10, 22, TextBox_Comment.Text, da_Comment.tblVideo_Comment_SP(7, videoId));
                #endregion

                if (UserOnline.role() == 5)
                {
                    // add user point
                    UserOnline.Add_Point(uid_reciver, 11, "auto");
                    // add heyat elmi point
                    UserOnline.Add_Point(UserOnline.id(), 501, "auto");
                }
            }
        }

    }
}