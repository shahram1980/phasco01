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
using System.Globalization;
using System.Threading;
using PHASCO_WEB.BaseClass;
using Membership_Manage;
using DataAccessLayer.Users;
using DataAccessLayer.Quiz;
using BusinessAccessLayer;
using DataAccessLayer;

namespace PHASCO_WEB
{
    public partial class myhome : System.Web.UI.Page
    {
        public DataTable dt_wall;
        public DataTable dt_SendEmail;
        Users_Wall da_w = new Users_Wall();
        TBL_User_Profile User_P = new TBL_User_Profile();
        User_Gallery_Tbl da = new User_Gallery_Tbl();
        TBL_User_Friends da_fr = new TBL_User_Friends();
        #region SMS_QU
        T_Qu_Weekly da_QU = new T_Qu_Weekly();
        #endregion

        #region datatable Sol
        T_Solution_Answer Sol_Ans = new T_Solution_Answer();
        T_Solution Sol = new T_Solution();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!UserOnline.User_Online_Valid()) Response.Redirect("~\\Default.aspx");

            if (!IsPostBack)
            {
                Label_alarm_Profile_wrapper.Visible = false;

                Set_Request_Count();
                if (Request.QueryString["userid"] != null) Add_Freinds();
                if (UserOnline.User_Online_Valid())
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
                            case "req":
                                Set_request();
                                break;
                            case "aboutme":
                                set_UserProfile();
                                break;
                            case "Qu":
                                Set_New_Qu();
                                break;
                            case "Sol":
                                Set_QU();
                                break;
                            case "VID":
                                MultiView1.ActiveViewIndex = 7;
                                break;
                            case "DID":

                                break;
                        }
                    }
                    else
                        Set_Wall();

                    gallery.HRef = "/myhome.aspx?id=" + UserOnline.id().ToString() + "&mode=gallery";
                    allFreinds.HRef = "/myhome.aspx?id=" + UserOnline.id().ToString() + "&mode=all-cat";
                    requestFreinds.HRef = "/myhome.aspx?id=" + UserOnline.id().ToString() + "&mode=req";
                    myprofile.HRef = "/myhome.aspx?id=" + UserOnline.id().ToString() + "&mode=aboutme";
                    //      Qu.HRef = "/myhome.aspx?id=" + UserOnline.id().ToString() + "&mode=Qu";

                    Sol_a.HRef = "/myhome.aspx?id=" + UserOnline.id().ToString() + "&mode=Sol";
                    myvideo.HRef = "/myhome.aspx?id=" + UserOnline.id().ToString() + "&mode=VID";

                    Qu.HRef = "/MakeQuiz.aspx";
                    QU_DIV.Visible = Set_Qu();
                    SOL_DIV.Visible = true;
                }
                else { MultiView1.ActiveViewIndex = 1; return; }
            }
        }
        protected void Delete_Freinds()
        {
            if (Request.QueryString["userid"] != null)
            {
                TBL_User_Friends friends = new TBL_User_Friends();
                DataTable dt = new DataTable();
                int Current_User_Id = UserOnline.id();
                dt = friends.Insert_del_update(1, Current_User_Id, "0", 0, int.Parse(Request.QueryString["userid"].ToString()), null);
                if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() == "0") Lbl_Alarm.Text = "این کاربر قبلا به لیست شما اضافه شده است";
                else Lbl_Alarm.Text = "کاربر انتخابی به لیست شما اضافه شد";
            }
        }
        protected void Add_Freinds()
        {
            if (Request.QueryString["userid"] != null)
            {
                TBL_User_Friends friends = new TBL_User_Friends();
                DataTable dt = new DataTable();
                int Current_User_Id = UserOnline.id();
                dt = friends.Insert_del_update(1, Current_User_Id, "0", 0, int.Parse(Request.QueryString["userid"].ToString()), null);
                if (dt.Rows.Count > 0 && dt.Rows[0][0].ToString() == "0") Lbl_Alarm.Text = "این کاربر قبلا به لیست شما اضافه شده است";
                else Lbl_Alarm.Text = "کاربر انتخابی به لیست شما اضافه شد";
            }
        }

        protected void Bind_Gallery()
        {
            int id = id = int.Parse(UserOnline.id().ToString());
            DataTable dt;
            dt = da.User_Gallery_Tra("Select_Uid", 0, id, "");
            int dd = dt.Rows.Count;
            DataList_Gallary.DataSource = dt;
            DataList_Gallary.DataBind();
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Bind_Friends()
        {
            //if (Request.QueryString["denifr"] != null)
            //{
            //    da_fr.Insert_del_update(2, UserOnline.id(), "", int.Parse(Request.QueryString["denifr"].ToString()), 0, "");
            //}

            //int id = int.Parse(UserOnline.id().ToString());

            MultiView1.ActiveViewIndex = 1;
            //DataList_User.DataSource = da_fr.Insert_del_update(7, id);
            //DataList_User.DataBind();
        }

        protected void SetMyPhasco()
        {
            int id = int.Parse(UserOnline.id().ToString());
            MultiView1.ActiveViewIndex = 2;
        }


        #region request
        protected void Set_Request_Count()
        {
            DataTable dt = da_fr.Insert_del_update(9, UserOnline.id());
            if (dt.Rows[0][0].ToString() != "0")
            { lbl_request_Count.Visible = true; lbl_request_Count.Text = "(" + dt.Rows[0][0].ToString() + ")"; }
            else
                lbl_request_Count.Visible = false;

        }

        protected void Set_request()
        {
            if (Request.QueryString["accfr"] != null)
            {
                da_fr.Insert_del_update(10, int.Parse(Request.QueryString["accfr"].ToString()));
                int uid_ = PHASCOUtility.ConverToNullableInt(Request.QueryString["accfruid"]);
                #region Insert Notification
                // Insert Notification
                //  InsertType :  SendToAllFriend = 1, SendToSingleFriend=2, FinalAction=3
                NotificationUsers.AddNewNotification(uid_, 0, 0, "http://www.phasco.com/myhome.aspx", 2, 5, 17, "");
                #endregion

                Set_Request_Count();
            }
            if (Request.QueryString["denifr"] != null)
            {
                da_fr.Insert_del_update(2, int.Parse(Request.QueryString["denifr"].ToString())); Set_Request_Count();
            }

            DataTable dt = da_fr.Insert_del_update(8, UserOnline.id());
            DataList_ReqUser.DataSource = dt;
            DataList_ReqUser.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }

        #endregion

        #region profile
        void set_UserProfile()
        {
            DataTable dtt;
            MultiView1.ActiveViewIndex = 3;
            SetYear();
            dtt = User_P.Users_Profile_Tra_DT("Select_Item", UserOnline.id(), "", "", "", "", "", "", "", DateTime.Now);
            if (dtt.Rows.Count > 0)
            {
                TextBox_City.Text = dtt.Rows[0]["City"].ToString();
                TextBox_Job.Text = dtt.Rows[0]["job"].ToString();
                TextBox_Maghata.Text = dtt.Rows[0]["Maghata"].ToString();
                TextBox_OfficeName.Text = dtt.Rows[0]["OfficeName"].ToString();
                TextBox_Reshte.Text = dtt.Rows[0]["Reshte"].ToString();
                TextBox_Takhasos.Text = dtt.Rows[0]["Takhasos"].ToString();
                TextBox_Email.Text = dtt.Rows[0]["Email"].ToString();

                DateTime dt_brth = Convert.ToDateTime(dtt.Rows[0]["BirthDay"].ToString());
                PersianCalendar calendar = new PersianCalendar();
                cmbYear.SelectedValue = calendar.GetYear(dt_brth).ToString();
                cmbMonth.SelectedValue = calendar.GetMonth(dt_brth).ToString();
                cmbDay.SelectedValue = calendar.GetDayOfMonth(dt_brth).ToString();
            }
        }
        private void SetYear()
        {
            PersianCalendar calendar = new PersianCalendar();
            int num = calendar.GetYear(DateTime.Now) - 0x12;
            for (int i = num - 0x55; i <= num; i++)
            { cmbYear.Items.Add(i.ToString()); }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int year = Convert.ToInt32(cmbYear.SelectedValue);
                int month = Convert.ToInt32(cmbMonth.SelectedValue);
                int day = Convert.ToInt32(cmbDay.SelectedValue);
                PersianCalendar calendar = new PersianCalendar();

                DateTime BrtDate = calendar.ToDateTime(year, month, day, 0, 0, 0, 0);
                int id = UserOnline.id();
                User_P.Users_Profile_Tra_DT("Update_Item", UserOnline.id(), TextBox_City.Text, TextBox_Reshte.Text, TextBox_Maghata.Text, TextBox_Takhasos.Text, TextBox_OfficeName.Text, TextBox_Job.Text, TextBox_Email.Text, BrtDate);
                Label_alarm_Profile.Text = "مشخصات با موفقیت ویرایش شد";
                Label_alarm_Profile_wrapper.Visible = true;
            }
            catch (Exception) { Label_alarm_Profile.Text = "بروز خطا زمان اجرا"; return; }
        }
        #endregion

        #region wall

        protected void Set_Wall()
        {
            dt_wall = da_w.Users_Wall_tra("select_Uid", UserOnline.id());
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
            MultiView1.ActiveViewIndex = 4;

        }
        protected void Button_Comment_Click(object sender, EventArgs e)
        {
            if (UserOnline.User_Online_Valid())
            {
                da_w.Users_Wall_tra("insert", UserOnline.id(), UserOnline.id(), 0, TextBox_comment.Text);
                Response.Redirect("UserProfile.aspx?id=" + UserOnline.id());
            }
            else
                Label_Alaram_Comment.Text = "کاربر محترم لطفا ابتدا لاگین کنید";
        }

        //protected void Button_Delete_wall_command(object sender, RepeaterCommandEventArgs e)
        //{
        //    int id = Convert.ToInt32(e.CommandArgument);
        //    da_w.Users_Wall_tra("delete", 0, 0, id, "");
        //    Set_Wall();
        //}

        protected void Button_del_wall_Click(object sender, EventArgs e)
        {

        }

        delegate void mydel(string UID_Sender, string emailaddress);
        private Thread t1 = null;
        protected void MyRepeater_ItemCommand(object sender, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "Save")
            {
                int owner_id = Convert.ToInt32(e.CommandArgument);
                TextBox text = e.Item.FindControl("Text") as TextBox;
                HiddenField subid_v = e.Item.FindControl("id_wall") as HiddenField;
                if (text.Text == "")
                    return;
                if (UserOnline.User_Online_Valid())
                {
                    dt_SendEmail = da_w.Users_Wall_tra("insert", UserOnline.id(), owner_id, int.Parse(subid_v.Value.ToString()), text.Text);
                    Set_Wall();
                    //t1 = new Thread(new ThreadStart(this.st1));
                    // t1.Start();
                    for (int i = 0; i < dt_SendEmail.Rows.Count; i++)
                    {
                        PMail.Wall_Mail(dt_SendEmail.Rows[i]["Email"].ToString(), dt_SendEmail.Rows[i]["Uid_Sender"].ToString(), Request.Url.ToString(), text.Text);
                    }
                }
                else
                    Label_Alaram_Comment.Text = "کاربر محترم لطفاً ابتدا لاگین کنید";
            }
        }


        //public void myclass()
        //{
        //    t1 = new Thread(new ThreadStart(this.st1));
        //    t1.Start();
        //}
        void st1()
        {
            Thread.Sleep(50);

            this.setText("It is Safe Multithreading", "");
        }
        void setText(string UID_Sender, string emailaddress)
        {
            for (int i = 0; i < dt_SendEmail.Rows.Count; i++)
            {
                PMail.Wall_Mail(dt_SendEmail.Rows[i]["Email"].ToString(), dt_SendEmail.Rows[i]["Uid_Sender"].ToString(), Request.Url.ToString(), "");
            }

        }
        #endregion

        #region QU_Code
        protected Boolean Set_Qu()
        {
            try
            {
                System.Globalization.PersianCalendar pcal = new System.Globalization.PersianCalendar();

                string QuizCode = UserOnline.id() + "cq" + pcal.GetYear(DateTime.Now) + pcal.GetMonth(DateTime.Now) + pcal.GetDayOfMonth(DateTime.Now);
                TBL_User_Daily da_Daily = new TBL_User_Daily();
                if (da_Daily.TBL_User_Daily_SP(2, QuizCode).Rows.Count > 0)
                {
                    return false;
                }
                else
                {
                    Label_Qu_Name.Text = " آزمون رقابتی روزانه</b>";// +"<br/>" + QuizCode;
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;

            }

            return false;
            //DataTable dt = da_QU.Select_Top_Qu_Weekly();
            //if (dt.Rows.Count > 0)
            //{
            //    DataTable dt_Qu = da_QU.Select_Valid_User_Qu(UserOnline.id(), int.Parse(dt.Rows[0]["id"].ToString()));
            //    if (dt_Qu.Rows.Count <= 0) return true;
            //    else return false;
            //}
            //return false;
        }
        protected void Set_New_Qu()
        {
            try
            {
                DataTable dt = da_QU.Select_Top_Qu_Weekly();

                if (dt.Rows.Count > 0)
                {
                    DataTable dt_Qu = da_QU.Select_Valid_User_Qu(UserOnline.id(), int.Parse(dt.Rows[0]["id"].ToString()));
                    if (dt_Qu.Rows.Count <= 0)
                    {
                        Label_Qu.Text = dt.Rows[0]["Question"].ToString();
                        HiddenField_Answer_Id.Value = dt.Rows[0]["answer"].ToString();
                        point.Text = dt.Rows[0]["point"].ToString();
                        HiddenField_QU_ID.Value = dt.Rows[0]["id"].ToString();
                        RadioButtonList_QU.Items.Add(new ListItem(dt.Rows[0]["q1"].ToString(), "1"));
                        RadioButtonList_QU.Items.Add(new ListItem(dt.Rows[0]["q2"].ToString(), "2"));
                        RadioButtonList_QU.Items.Add(new ListItem(dt.Rows[0]["q3"].ToString(), "3"));
                        RadioButtonList_QU.Items.Add(new ListItem(dt.Rows[0]["q4"].ToString(), "4"));
                        MultiView1.ActiveViewIndex = 6;
                    }
                    else MultiView1.ActiveViewIndex = 6;
                }
            }
            catch (Exception)
            {


            }

            //else  
        }
        protected void Button_Answer_Click(object sender, EventArgs e)
        {
            if (RadioButtonList_QU.SelectedValue == "")
            { return; }

            int QU_Id = int.Parse(HiddenField_QU_ID.Value.ToString());
            int USER_Id = int.Parse(RadioButtonList_QU.SelectedValue.ToString());
            int True_Id = int.Parse(HiddenField_Answer_Id.Value.ToString());

            Button_Answer.Visible = false;
            if (RadioButtonList_QU.SelectedValue == HiddenField_Answer_Id.Value)
            {
                da_QU.Qu_weekly_Tra("a_True", 0, UserOnline.id(), QU_Id, USER_Id, True_Id);
                //UserOnline.Add_Point(UserOnline.id(), 4, "auto");
                Label_QU_ALARM.Text = " با عرض تبريک  ، پاسخ شما صحيح می باشد.";
            }
            else
            {
                da_QU.Qu_weekly_Tra("a_false", 0, UserOnline.id(), QU_Id, USER_Id, True_Id);
                //Label_QU_ALARM.Text = " متاسفانه پاسخ شما صحيح نمي باشد . گزينه صحيح " + HiddenField_Answer_Id.Value.ToString() + " ميباشد.";
                Label_QU_ALARM.Text = " متاسفانه پاسخ شما صحيح نمي باشد .";
            }
            MultiView1.ActiveViewIndex = 6;
            RadioButtonList_QU.Enabled = false;
            Button_Answer.Visible = false;
        }
        #endregion

        #region Sol_Code
        protected Boolean Set_Sol()
        {
            DataTable dt;
            DataTable dt_ans;
            dt = Sol.Message_Tra("Select_new", 0, "", 0);
            if (dt.Rows.Count > 0)
            {
                string ss = dt.Rows[0]["id"].ToString();
                ss = UserOnline.id().ToString();
                dt_ans = Sol_Ans.T_Solution_Answer_Tra("Select_Me", int.Parse(dt.Rows[0]["id"].ToString()), UserOnline.id(), "");
                if (dt_ans.Rows.Count <= 0)
                    return true;
            }
            else return false;
            return false;
        }
        protected void Set_QU()
        {
            DataTable dt;
            DataTable dt_ans;
            dt = Sol.Message_Tra("Select_new", 0, "", 0);
            if (dt.Rows.Count > 0)
            {
                string ss = dt.Rows[0]["id"].ToString();
                ss = UserOnline.id().ToString();
                dt_ans = Sol_Ans.T_Solution_Answer_Tra("Select_Me", int.Parse(dt.Rows[0]["id"].ToString()), UserOnline.id(), "");
                if (dt_ans.Rows.Count <= 0)
                {
                    Label_Solu_Qu.Text = dt.Rows[0]["Question"].ToString();
                    HiddenField_Id.Value = dt.Rows[0]["id"].ToString();
                    MultiView1.ActiveViewIndex = 5;
                }
                // else MultiView1.ActiveViewIndex = 7;
            }
            //dt=sol.Message_Tra("Select_Me",
        }
        protected void Button_Insert_Click(object sender, EventArgs e)
        {

            if (TextBox_Ans.Text.ToString() == "")
            { Label_Alaram.Text = "لطفا ابتدا پاسخ خود را وارد کنید"; return; }
            Sol_Ans.T_Solution_Answer_Tra("insert", int.Parse(HiddenField_Id.Value.ToString()), UserOnline.id(), TextBox_Ans.Text.ToString());
            MultiView1.ActiveViewIndex = 1;
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
        public string Mss_Open(int Mode)
        {
            if (Mode == 1) return "<font size=1 color=#0000FF>خوانده شده</font>";
            if (Mode == 0) return "<font size=1 color=#FF0000>نخوانده شده</font>";
            return "نامشخص";
        }
        public string Set_User_Name(string Uid, string name, int sender)
        {
            if (sender == 0) return "مدیریت سایت فاسکو";
            if (sender != 0) return "<a href='UserProfile.aspx?id=" + sender.ToString() + "'>" + name + "</a>"; ;
            return "نامشخص";
        }

        public string set_Sub_Wall(int id)
        {
            System.Data.DataRow[] dr = dt_wall.Select("subid2 = " + id.ToString());
            string ret = "";
            string image = "";
            if (dr.Length > 0)
            {
                ret = "<ul class='widget-item faq article with-img child text-center'>";
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
                return "<a class='read-more dislike-color margin-bottom-5'  data-toggle='modal' data-target='#confirm-delete 'data-href='UserProfile.aspx?id=" + uid_owner.ToString() + "&wid=" + Sub_wall_Id.ToString() + "' /><i class='fa fa-times'></i> حذف</a>";
            return "";
        }

        public string CheckDeleteaccessForWallOwner(int uid_owner, int wall_Id)
        {
            int uuidon = Membership_Manage.UserOnline.id();
            if (uuidon == uid_owner)
                return "<a class='read-more dislike-color margin-bottom-5' data-href='UserProfile.aspx?id=" + uid_owner.ToString() + "&owid=" + wall_Id.ToString() + "' /><i class='fa fa-times'></i> حذف</a>";
            return "";
        }

        public string persian_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);
            return "<i class='date-wrapper'>" + sunDate.Weekday.ToString() + " </i> <i class='seprator margin-left-5 margin-right-5 pull-right'>| </i><i class='fa fa-clock-o'></i><i class='pull-right'>" + dtm.Hour + ":" + dtm.Minute + "</i>";
        }
        public Boolean Set_delete(string owner)
        {
            if (int.Parse(owner) == Membership_Manage.UserOnline.id()) return true;
            else return false;
            return false;
        }


    }
}
