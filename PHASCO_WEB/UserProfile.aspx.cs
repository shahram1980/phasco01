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
using phasco_webproject.BaseClass;
using PHASCO_WEB.BaseClass;
using Membership_Manage;
using DataAccessLayer.Video;
using BusinessAccessLayer;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class UserProfile : System.Web.UI.Page
    {
        public DataTable dt_wall;
        public DataTable dt_SendEmail;
        Users_Wall da_w = new Users_Wall();
        User_Gallery_Tbl da = new User_Gallery_Tbl();
        TBL_User_Friends da_fr = new TBL_User_Friends();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Check_delete_Subwall();
                Add_Freinds_Link();
                if (Request.QueryString["userid"] != null) Add_Freinds();
                if (Request.QueryString["id"] != null)
                {
                    if (Request.QueryString["mode"] != null)
                    {
                        string mode = Request.QueryString["mode"].ToString();
                        switch (mode)
                        {
                            case "all-cat":
                                Bind_Friends();
                                break;
                            case "gallery":
                                Bind_Gallery();
                                break;
                            case "myphasco":
                                SetMyPhasco();
                                break;
                            case "add-frn":
                                Add_Freinds();
                                break;
                            case "video":
                                MultiView1.ActiveViewIndex = 4;
                                break;
                        }
                    }
                    else
                        SetMyPhasco();
                    // Bind_Gallery();
                    gallery.HRef = "/UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=gallery";
                    Myphasco.HRef = "/UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=myphasco";
                    allFreinds.HRef = "/UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=all-cat";
                    Videolist.HRef = "/UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=video";
                }
                else
                { MultiView1.ActiveViewIndex = 1; return; }
            }
        }

        protected void Check_delete_Subwall()
        {
            if (Request.QueryString["wid"] != null)
            {
                int id_ = int.Parse(Request.QueryString["wid"].ToString());
                da_w.Users_Wall_tra("delete_Subwall", 0, id_);
            }

            if (Request.QueryString["owid"] != null)
            {
                int id_ = int.Parse(Request.QueryString["owid"].ToString());
                da_w.Users_Wall_tra("deleteWall", 0, id_);
            }
        }
        #region Freinds
        protected void Add_Freinds_Link()
        {
            if (Friends.Freind_Valid(int.Parse(Request.QueryString["id"].ToString())))
            {
                link_Addfrn.Visible = true;
                link_Addfrn.HRef = "/UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=add-frn";
            }
            else link_Addfrn.Visible = false;

        }
        protected void Add_Freinds()
        {
            Lbl_Alarm.Text = Friends.Add_tolist(int.Parse(Request.QueryString["id"].ToString()));
            int Uid_wall_Owner = int.Parse(Request.QueryString["id"].ToString());
            #region Insert Notification
            // Insert Notification
            //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
            NotificationUsers.AddNewNotification(Uid_wall_Owner, 0, 0, "http://www.phasco.com/myhome.aspx", 2, 5, 18, "");
            #endregion

            link_Addfrn.Visible = false;
            SetMyPhasco();
        }
        #endregion



        protected void Bind_Gallery()
        {
            int id = 0;
            try { id = int.Parse(Request.QueryString["id"].ToString()); }
            catch (Exception) { return; }
            DataTable dt;

            dt = da.User_Gallery_Tra("Select_Uid", 0, id, "");
            int dd = dt.Rows.Count;
            DataList_Gallary.DataSource = dt;
            DataList_Gallary.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        #region friend list
        protected void Bind_Friends()
        {
            int id = 0;
            try
            { id = int.Parse(Request.QueryString["id"].ToString()); }
            catch (Exception)
            { MultiView1.ActiveViewIndex = 1; return; }
            MultiView1.ActiveViewIndex = 1;
            //DataList_User.DataSource = da_fr.Insert_del_update(7, id);
            //DataList_User.DataBind();

        }






        #endregion
        protected void SetMyPhasco()
        {
            int id = 0;
            try { id = int.Parse(Request.QueryString["id"].ToString()); }
            catch (Exception) { return; }
            MultiView1.ActiveViewIndex = 2; Set_Wall(id);
        }
        #region wall
        protected void Set_Wall(int id)
        {
            dt_wall = da_w.Users_Wall_tra("select_Uid", id);
            DataRow[] datrow = dt_wall.Select("subid2 IS NULL");
            DataRow myNewRow;

            DataTable dt2 = new DataTable("Users_Wall");
            dt2.Columns.Add("id", System.Type.GetType("System.Int32"));
            dt2.Columns.Add("uid_sender", System.Type.GetType("System.Int32"));
            dt2.Columns.Add("uid_owner", System.Type.GetType("System.Int32"));

            dt2.Columns.Add("subid", System.Type.GetType("System.Int32"));
            dt2.Columns.Add("comment", System.Type.GetType("System.String"));
            dt2.Columns.Add("datesend", System.Type.GetType("System.DateTime"));
            dt2.Columns.Add("Uid", System.Type.GetType("System.String"));
            dt2.Columns.Add("Image", System.Type.GetType("System.Int32"));
            string subid = "0";
            for (int i = 0; i < dt_wall.Rows.Count; i++)
            {
                if (dt_wall.Rows[i]["subid2"].ToString() == "")
                {
                    myNewRow = dt2.NewRow();
                    myNewRow["id"] = dt_wall.Rows[i]["id"];
                    myNewRow["uid_sender"] = dt_wall.Rows[i]["uid_sender"];
                    myNewRow["subid"] = dt_wall.Rows[i]["subid"];
                    myNewRow["comment"] = dt_wall.Rows[i]["comment"];
                    myNewRow["datesend"] = dt_wall.Rows[i]["datesend"];
                    myNewRow["Uid"] = dt_wall.Rows[i]["Uid"];
                    myNewRow["Image"] = dt_wall.Rows[i]["Image"];
                    myNewRow["uid_owner"] = dt_wall.Rows[i]["uid_owner"];

                    dt2.Rows.Add(myNewRow);
                }
                else if (subid != dt_wall.Rows[i]["subid2"].ToString())
                {
                    myNewRow = dt2.NewRow();
                    myNewRow["id"] = dt_wall.Rows[i]["id"];
                    myNewRow["uid_sender"] = dt_wall.Rows[i]["uid_sender"];
                    myNewRow["subid"] = dt_wall.Rows[i]["subid"];
                    myNewRow["comment"] = dt_wall.Rows[i]["comment"];
                    myNewRow["datesend"] = dt_wall.Rows[i]["datesend"];
                    myNewRow["Uid"] = dt_wall.Rows[i]["Uid"];
                    myNewRow["Image"] = dt_wall.Rows[i]["Image"];
                    myNewRow["uid_owner"] = dt_wall.Rows[i]["uid_owner"];

                    dt2.Rows.Add(myNewRow);
                    subid = dt_wall.Rows[i]["subid2"].ToString();
                }
            }
            Repeater_Wall.DataSource = dt2;
            Repeater_Wall.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }


        protected void MyRepeater_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Save")
            {
                int Uid_wall_Owner = int.Parse(Request.QueryString["id"].ToString());
                int owner_id = Convert.ToInt32(e.CommandArgument);
                TextBox text = e.Item.FindControl("Text") as TextBox;
                HiddenField subid_v = e.Item.FindControl("id_wall") as HiddenField;
                if (text.Text == "") return;
                if (UserOnline.User_Online_Valid())
                {
                    //da_w.Users_Wall_tra("insert", UserOnline.id(), owner_id, int.Parse(subid_v.Value.ToString()), text.Text);
                    dt_SendEmail = da_w.Users_Wall_tra("insert", UserOnline.id(), owner_id, int.Parse(subid_v.Value.ToString()), text.Text);
                    User da_user = new User();
                    string uid = "";
                    for (int i = 0; i < dt_SendEmail.Rows.Count; i++)
                    {

                        if (UserOnline.id() != int.Parse(dt_SendEmail.Rows[i]["uid_sender2"].ToString()))
                        {
                            uid = da_user.GetUsers_Tra_DT("Uid", int.Parse(dt_SendEmail.Rows[i]["Uid_Sender2"].ToString())).Rows[0][0].ToString();
                            if (Uid_wall_Owner == int.Parse(dt_SendEmail.Rows[i]["uid_sender2"].ToString()))
                                PMail.Wall_Mail(dt_SendEmail.Rows[i]["Email"].ToString(), uid, "http://phasco.com/UserProfile.aspx?id=" + Uid_wall_Owner, text.Text);
                            else
                                PMail.Wall_Mail(dt_SendEmail.Rows[i]["Email"].ToString(), uid, "http://phasco.com/UserProfile.aspx?id=" + Uid_wall_Owner, text.Text);
                        }
                    }
                    text.Text = "";
                    Set_Wall(Uid_wall_Owner);
                }
                else Label_Alaram_Comment.Text = "کاربر محترم لطفا ابتدا لاگین کنید";
            }
        }
        //protected void Set_Wall(int id)
        //{
        //    dt_wall = da_w.Users_Wall_tra("select_Uid", id);

        //    DataRow[] datrow = dt_wall.Select("subid = 0");
        //    DataRow myNewRow;
        //    DataTable dt2 = new DataTable("Users_Wall");
        //    dt2.Columns.Add("id", System.Type.GetType("System.Int32"));
        //    dt2.Columns.Add("uid_sender", System.Type.GetType("System.Int32"));
        //    dt2.Columns.Add("uid_owner", System.Type.GetType("System.Int32"));

        //    dt2.Columns.Add("subid", System.Type.GetType("System.Int32"));
        //    dt2.Columns.Add("comment", System.Type.GetType("System.String"));
        //    dt2.Columns.Add("datesend", System.Type.GetType("System.DateTime"));
        //    dt2.Columns.Add("Uid", System.Type.GetType("System.String"));
        //    dt2.Columns.Add("Image", System.Type.GetType("System.Int32"));

        //    for (int i = 0; i < dt_wall.Rows.Count; i++)
        //    {
        //        if (dt_wall.Rows[i]["subid"].ToString() == "0")
        //        {
        //            myNewRow = dt2.NewRow();
        //            myNewRow["id"] = dt_wall.Rows[i]["id"];
        //            myNewRow["uid_sender"] = dt_wall.Rows[i]["uid_sender"];
        //            myNewRow["subid"] = dt_wall.Rows[i]["subid"];
        //            myNewRow["comment"] = dt_wall.Rows[i]["comment"];
        //            myNewRow["datesend"] = dt_wall.Rows[i]["datesend"];
        //            myNewRow["Uid"] = dt_wall.Rows[i]["Uid"];
        //            myNewRow["Image"] = dt_wall.Rows[i]["Image"];
        //            myNewRow["uid_owner"] = dt_wall.Rows[i]["uid_owner"];

        //            dt2.Rows.Add(myNewRow);
        //        }
        //    }

        //    Repeater_Wall.DataSource = dt2;
        //    Repeater_Wall.DataBind();
        //}
        protected void Button_Comment_Click(object sender, EventArgs e)
        {
            if (UserOnline.User_Online_Valid())
            {
                int Uid_wall_Owner = int.Parse(Request.QueryString["id"].ToString());
                int id = int.Parse(Request.QueryString["id"].ToString());
                da_w.Users_Wall_tra("insert", UserOnline.id(), id, 0, TextBox_comment.Text);

                User da = new User();
                DataTable dt_email = da.GetUsers_Tra_DT("get_email", id);

                #region Insert Notification
                // Insert Notification
                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                NotificationUsers.AddNewNotification(Uid_wall_Owner, 0, 0, "http://www.phasco.com/myhome.aspx", 2, 5, 8, "");
                #endregion



                //  PMail.Wall_Mail(dt_email.Rows[0][0].ToString(), UserOnline.Uid(), "http://www.phasco.com/myhome.aspx", TextBox_comment.Text);
                Response.Redirect("UserProfile.aspx?id=" + id.ToString());
                Set_Wall(Uid_wall_Owner);
            }
            else
                Label_Alaram_Comment.Text = "کاربر محترم لطفا ابتدا لاگین کنید";
        }
        #endregion



        public string image_Check(string id_)
        {
            string ImageName = MyFileUploader.GetImageSingleName(int.Parse(id_.ToString()), ".jpg").ToString();
            return ImageName;
        }

        public string addfriend(string id)
        {
            if (Membership_Manage.UserOnline.User_Online_Valid() == true)
            {
                if (Request.QueryString["mode"] != null)
                    return "<a href='UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&mode=" + Request.QueryString["mode"].ToString() + "&userid=" + id + "'><img src='images/addtolist.png'  /></a>";
                else
                    return "<a href='UserProfile.aspx?id=" + Request.QueryString["id"].ToString() + "&userid=" + id + "'><img src='images/addtolist.png'  /></a>";
            }
            else return "<img src='images/addtolist_offline.png'  />";
            return "<img src='images/addtolist_offline.png'  />";
        }

        public string Images(int Image, int id, int sex)
        {

            if (Image == 1) return "phascoupfile/Userphoto/" + id.ToString() + ".jpg";
            if (sex == 0) return "phascoupfile/Userphoto/Nopic_male.jpg";
            else if (sex == 1) return "phascoupfile/Userphoto/Nopic_female.jpg";
            return "~/phascoupfile/Userphoto/Nopic_female.jpg";
        }

        public string set_Sub_Wall(int id)
        {
            System.Data.DataRow[] dr = dt_wall.Select("subid2 = " + id.ToString());
            string ret = "";
            string image = "";
            if (dr.Length > 0)
            {
                ret = "<ul class='widget-item faq article with-img child'>";
                int counter = 0;
                foreach (System.Data.DataRow row in dr)
                {
                    ret += "<li class='text-left child-comment'>";
                    if (dr[counter]["Image"].ToString() == "0") image = "<img src='http://phasco.com/phascoupfile/Userphoto/Nopic.jpg'  />";
                    else image = "<img src='http://phasco.com/phascoupfile/Userphoto/" + dr[counter]["uid_sender2"].ToString() + ".jpg' />";
                    ret += "<a href='UserProfile.aspx?id=" + dr[counter]["uid_sender2"].ToString() + "'>" + image + "</a>";
                    ret += "<p>" + dr[counter]["comment2"].ToString() + "</p>";
                    ret += "<p> <i class='fa fa-calendar'></i>" + persian_Date(dr[counter]["datesend2"].ToString()) + "</p>";
                    ret += "<span class='button-wrapper small-btn'>" + CheckDeleteaccess(int.Parse(dr[counter]["uid_owner2"].ToString()), int.Parse(dr[counter]["uid_sender2"].ToString()), int.Parse(dr[counter]["Sub_wall_Id"].ToString()))
                    + " </span>";


                    counter = counter + 1;
                    ret = ret + "</li>";
                }
                ret = ret + "</ul>";
            }
            return ret;
        }
        public string CheckDeleteaccess(int uid_owner, int uid_sender, int Sub_wall_Id)
        {
            int uuidon = Membership_Manage.UserOnline.id();
            if (uuidon == uid_owner || uuidon == uid_sender)
                return "<a class='read-more dislike-color delete-btn margin-bottom-5'  data-toggle='modal' data-target='#confirm-delete' data-href='UserProfile.aspx?id=" + uid_owner.ToString() + "&wid=" + Sub_wall_Id.ToString() + "' /><i class='fa fa-times'></i> حذف</a>";
            return "";
        }

        public string CheckDeleteaccessForWallOwner(int uid_owner, int wall_Id)
        {
            int uuidon = Membership_Manage.UserOnline.id();
            if (uuidon == uid_owner)
                return "<a class='read-more dislike-color delete-btn margin-bottom-5' data-toggle='modal' data-target='#confirm-delete' data-href='UserProfile.aspx?id=" + uid_owner.ToString() + "&owid=" + wall_Id.ToString() + "' /><i class='fa fa-times'></i> حذف</a>";
            return "";
        }

        public string persian_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return "<i class='date-wrapper'>" + sunDate.Weekday.ToString() + "</i>" + " <i class='seprator margin-left-5 margin-right-5 pull-right'>| </i><i class='fa fa-clock-o'></i><i class='pull-right'>" + dtm.Hour + ":" + dtm.Minute + "</i>";
        }
    }
}

