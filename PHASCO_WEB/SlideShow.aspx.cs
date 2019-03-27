using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using BusinessAccessLayer;
using DataAccessLayer;
using Membership_Manage;
using DataAccessLayer.Atlas;

namespace PHASCO_WEB
{
    public partial class SlideShow : System.Web.UI.Page
    {
        Article_Main ArticleClass = new Article_Main();
        T_Atlas_Comment da_Comment = new T_Atlas_Comment();
        public string category;
        public string categoryId;

        protected void Page_Init(object sender, EventArgs e)
        {
            string desc = "مجموعه كاملي از اطلس ها و اسلايدهاي تخصصي رشته هاي مختلف علوم آزمايشگاهي اعم از انگل شناسي، باكتري شناسي، پاتولوژي، قارچ شناسي، هماتولوژي، ويروس شناسي با توضيحات جامع به زبان انگليسي و فارسي";
            string keys = "آزمایشگاهی,سرولوژی,ایمونولوژی,هماتولوژِی,میکروب,شناسی,هورمونی,کنترل,کیفی,اطلس,آزمایشگاه,تشخیص,طبی,پاتوبیولوژی,کیت,الایزا,مقاله,تیروئیدی,هپاتیت,فریتین,تومورمارکر";

            // Add meta description tag
            HtmlMeta metaDescription = new HtmlMeta();
            metaDescription.Name = "Description";
            metaDescription.Content = desc;
            Page.Header.Controls.Add(metaDescription);

            // Add meta keywords tag
            HtmlMeta metaKeywords = new HtmlMeta();
            metaKeywords.Name = "Keywords";
            metaKeywords.Content = keys;
            Page.Header.Controls.Add(metaKeywords);


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) SetViewAtlas();
        }
        void SetViewAtlas()
        {
            try
            {
                if (!UserOnline.User_Online_Valid())
                {
                    Button_Insert.Visible = false;
                    lbl_NotUserLogin.Text = "کاربر گرامی برای ثبت نظر تفسیری خود، باید حتما در سایت لاگین کرده باشید.";
                    lbl_NotUserLogin.Text = lbl_NotUserLogin.Text + "<br/>در صورت نداشتن نام کاربری از " + " <a href='/Register.aspx'>اینجا</a>" + " می توانید ثبت نام کنید.";
                }

                SqlConnection strConnection = null;
                SqlDataReader DR;
                strConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["PHASCO_WEB.Properties.Settings.Article_phascoConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("SELECT a.id,a.Title,Comment , at.id as subId , at.Title as subTitle  FROM dbo.T_Atlas a join [dbo].[T_Atlas_Group] at on SubId = at.id where a.id = " + Request.QueryString["img"].ToString(), strConnection);

                strConnection.Open();
                DR = cmd.ExecuteReader();

                DR.Read();
                Label_Comment.Text = DR["Comment"].ToString();
                Label_Title.Text = Literal_Title.Text = DR["Title"].ToString();
                category = DR["subTitle"].ToString();
                categoryId = DR["subId"].ToString();
                Page.Title = DR["Title"].ToString();

                Image_SHow.ImageUrl = "http:////phasco.com//phascoupfile//Slides//b_" + Request.QueryString["img"].ToString() + ".jpg";
                Image_SHow.ToolTip = DR["Title"].ToString();

                Lit_Keyword.Text = PHASCOUtility.KeyWordMaker(DR["Comment"].ToString() + " " + DR["Title"].ToString(), 20, "SlideShow.aspx?img=" + DR["id"].ToString());
                Bind_Atlas_List();
                strConnection.Close();

                Bind_VideoComment(int.Parse(Request.QueryString["img"].ToString()));

            }
            catch (Exception) { }
        }
        void Bind_Atlas_List()
        {
            //DataList_CAt.DataSource = ArticleClass.AtlasTra("Select_All", 0, "", 0);
            //DataList_CAt.DataBind();
        }
        #region User Like Deslike
        protected void MyRepeater_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            string Comm_ = e.CommandName.ToString();
            int id_ = Convert.ToInt32(e.CommandArgument);
            int AtlasId = PHASCOUtility.ConverToNullableInt(Request.QueryString["img"]);
            if (UserOnline.User_Online_Valid())
            {
                Users_Wall da_w = new Users_Wall();
                switch (Comm_)
                {
                    case "minusScore":
                        {
                            da_Comment.T_Atlas_Comment_SP(5, id_, AtlasId, UserOnline.id(), "", 1);
                            Bind_VideoComment(AtlasId);
                        }
                        break;
                    case "PlusScore":
                        {
                            da_Comment.T_Atlas_Comment_SP(5, id_, AtlasId, UserOnline.id(), "", 0);
                            int CommentOwnerUid = int.Parse(da_Comment.T_Atlas_Comment_SP(6, id_, 0, UserOnline.id(), "", 0).Rows[0]["uid"].ToString());
                            if (UserOnline.id() != CommentOwnerUid)
                            {
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
                                NotificationUsers.AddNewNotification(CommentOwnerUid, CommentOwnerUid, 0, "http://phasco.com/SlideShow.aspx?img=" + AtlasId.ToString(), 2, 5, 24, "");
                                #endregion
                            }
                            Bind_VideoComment(AtlasId);
                        }
                        break;
                    default:
                        break;
                }
            }
        }
        #endregion
        void Bind_VideoComment(int videoId)
        {
            RPT_Comment.DataSource = da_Comment.T_Atlas_Comment_SP(4, 0, videoId, 0, "");
            RPT_Comment.DataBind();
        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid())
            { return; }
            int videoId = PHASCOUtility.ConverToNullableInt(Request.QueryString["img"]);
            da_Comment.T_Atlas_Comment_SP(1, 0, videoId, UserOnline.id(), FCKeditor_Comment.Value);
            Bind_VideoComment(videoId);
            FCKeditor_Comment.Value = "";

            //int uid_ = int.Parse(HiddenField_UID.Value);
            //#region Insert Notification
            //// Insert Notification
            //// InsertType :  SendToAllFriend = 1 , SendToSingleFriend=2  ,   FinalAction=3
            //NotificationUsers.AddNewNotification(0, 0, 0, "http://phasco.com/video/watch.aspx?Vid=" + videoId.ToString() + "&swb=t" + Label_Title.Text,
            //    3, 10, 21, FCKeditor_Comment.Value, da_Comment.tblVideo_Comment_SP(7, videoId));
            //#endregion
        }
    }
}
