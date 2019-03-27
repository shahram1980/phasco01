using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using DataAccessLayer.Users;
using System.Data;
using System.Threading;
using BusinessAccessLayer;

namespace Membership_Manage
{
    public class NotificationUsers
    {

        public static void Main()
        {
            //Thread thread = new Thread(new ThreadStart(AddNewNotification());
            //thread.Name = "first";
            //thread.Start();
            //Thread thread2 = new Thread(new ThreadStart(myJob2.runme));
            //thread2.Name = "second";
            //thread2.Start();
        }

        //sabte ye vaghee dar datdabase
        public static void AddNewNotification(int UserReciverId, int UserOwnerId, int NotificationType, string URL, int InsertType,
            int NotificationIconId, int NotificationTypeID, string Title)
        {
			switch (InsertType)
			{
				case 1:
					SelectAllfreinds(UserOwnerId, NotificationType, URL, NotificationIconId, NotificationTypeID, Title);
					break;
				case 2:
					SendaUser(UserReciverId, UserOnline.id(), NotificationType, URL, NotificationIconId, NotificationTypeID, Title);
					break;
				case 4:
					SelectAllfreindsfrmADMIN(UserOwnerId, NotificationType, URL, NotificationIconId, NotificationTypeID, Title);
					break;
				default:
					break;
			}
		}

        public static void AddNewNotification(int UserReciverId, int UserOwnerId, int NotificationType, string URL, int InsertType,
    int NotificationIconId, int NotificationTypeID, string Title, DataTable dt)
        {
            switch (InsertType)
            {
                case 1:
                    SelectAllfreinds(UserOwnerId, NotificationType, URL, NotificationIconId, NotificationTypeID, Title);
                    break;
                case 2:
                    SendaUser(UserReciverId, UserOwnerId, NotificationType, URL, NotificationIconId, NotificationTypeID, Title);
                    break;
                case 3:
                    SendMemberofTitle_freinds(UserOwnerId, NotificationType, URL, NotificationIconId, NotificationTypeID, Title, dt);
                    break;
                case 4:
                    SelectAllfreindsfrmADMIN(UserOwnerId, NotificationType, URL, NotificationIconId, NotificationTypeID, Title);
                    break;
                default:
                    break;
            }
        }

        public static void SendMemberofTitle_freinds(int UserOwnerId, int NotificationType, string URL, int NotificationIconId, int NotificationTypeID, string Title, DataTable dt)
        {
            TBL_User da = new TBL_User();
            TBL_Notification daNotification = new TBL_Notification();
            TBL_NotificationType daNoType = new TBL_NotificationType();

            int UserDoingId = UserOnline.id();
            string Title_ = Title;
            if (Title.Length > 50)
            { Title_ = PHASCOUtility.Right(Title, 50) + "..."; }

            DataTable dt_No = daNoType.TBL_NotificationType_SP(5, NotificationTypeID, "", 0);
            string NotiTypeMessage = dt_No.Rows[0]["NotificationMessage"].ToString().Replace("{0}", UserOnline.Uid());
            string NotificationTitle = dt_No.Rows[0]["NotificationTitle"].ToString();

            int UserReciverId = 0;
            string Url_ = "";
            string Email = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["uid"].ToString() != UserOnline.id().ToString())
                {
                    UserReciverId = int.Parse(dt.Rows[i]["uid"].ToString());
                    daNotification.TBL_Notification_SP(1, 0, UserDoingId, UserReciverId, int.Parse(dt.Rows[i]["uid"].ToString()), NotificationTypeID, URL, 0, NotificationIconId, Title_);
                    Url_ = "<a href='" + URL + "'>" + URL + "</a>  ";
                    //  PMail.SendMail("khosravi@phasco.com", "Phasco Notification .", Url_ );
                    Email = dt.Rows[i]["Email"].ToString();
                    PMail.SendMailNotification(Email, NotificationTitle, Url_, Title_, NotiTypeMessage);
                }
            }
            PMail.SendMailNotification("it@phasco.com", NotificationTitle, Url_, Title_, NotiTypeMessage);
        }


        public static void SelectAllfreinds(int UserOwnerId, int NotificationType, string URL, int NotificationIconId, int NotificationTypeID, string Title)
        {
            TBL_User da = new TBL_User();
            TBL_Notification daNotification = new TBL_Notification();
            TBL_NotificationType daNoType = new TBL_NotificationType();

            DataTable dt = new DataTable();
            int UserDoingId = UserOnline.id();
            string Title_ = Title;
            if (Title.Length > 50)
            { Title_ = PHASCOUtility.Right(Title, 50) + "..."; }

            DataTable dt_No = daNoType.TBL_NotificationType_SP(5, NotificationTypeID, "", 0);
            string NotiTypeMessage = dt_No.Rows[0]["NotificationMessage"].ToString().Replace("{0}", UserOnline.Uid());
            string NotificationTitle = dt_No.Rows[0]["NotificationTitle"].ToString();

            dt = da.Users_Tra("selectallFriends", UserDoingId);

            int UserReciverId = 0;
            string Url_ = "";
            string Email = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                UserReciverId = int.Parse(dt.Rows[i]["Friend_User_Id"].ToString());
                daNotification.TBL_Notification_SP(1, 0, UserDoingId, UserReciverId, UserOwnerId, NotificationTypeID, URL, 0, NotificationIconId, Title_);
                Url_ = "<a href='" + URL + "'>" + URL + "</a>  ";
                //  PMail.SendMail("khosravi@phasco.com", "Phasco Notification .", Url_ );
                Email = dt.Rows[i]["Email"].ToString();
                if (Email != "")
                    PMail.SendMailNotification(Email, NotificationTitle, Url_, Title_, NotiTypeMessage);
            }
            PMail.SendMailNotification("it@phasco.com", NotificationTitle, Url_, Title_, NotiTypeMessage);
        }

        public static void SelectAllfreindsfrmADMIN(int UserOwnerId, int NotificationType, string URL, int NotificationIconId, int NotificationTypeID, string Title)
        {
            TBL_User da = new TBL_User();
            TBL_Notification daNotification = new TBL_Notification();
            TBL_NotificationType daNoType = new TBL_NotificationType();

            DataTable dt = new DataTable();

            string Title_ = Title;
            if (Title.Length > 50)
            { Title_ = PHASCOUtility.Right(Title, 50) + "..."; }

            DataTable dt_No = daNoType.TBL_NotificationType_SP(5, NotificationTypeID, "", 0);
            string NotiTypeMessage = dt_No.Rows[0]["NotificationMessage"].ToString().Replace("{0}", UserOnline.Uid());
            string NotificationTitle = dt_No.Rows[0]["NotificationTitle"].ToString();

            dt = da.Users_Tra("selectallFriends", UserOwnerId);

            int UserReciverId = 0;
            string Url_ = "";
            string Email = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                UserReciverId = int.Parse(dt.Rows[i]["Friend_User_Id"].ToString());
                daNotification.TBL_Notification_SP(1, 0, UserOwnerId, UserReciverId, UserOwnerId, NotificationTypeID, URL, 0, NotificationIconId, Title_);
                Url_ = "<a href='" + URL + "'>" + URL + "</a>  ";
                //  PMail.SendMail("khosravi@phasco.com", "Phasco Notification .", Url_ );
                Email = dt.Rows[i]["Email"].ToString();
                if (Email != "")
                    PMail.SendMailNotification(Email, NotificationTitle, Url_, Title_, NotiTypeMessage);
            }
            PMail.SendMailNotification("it@phasco.com", NotificationTitle, Url_, Title_, NotiTypeMessage);
        }

        public static void SendaUser(int UserReciverId, int UserOwnerId, int NotificationType, string URL, int NotificationIconId, int NotificationTypeID, string Title)
        {
            TBL_Notification daNotification = new TBL_Notification();
            TBL_NotificationType daNoType = new TBL_NotificationType();

            int UserDoingId = UserOnline.id();
            string Title_ = Title;
            DataTable dt_No = daNoType.TBL_NotificationType_SP(5, NotificationTypeID, "", 0);
           
            string NotiTypeMessage = dt_No.Rows[0]["NotificationMessage"].ToString().Replace("{0}", UserOnline.Uid());
            string NotificationTitle = dt_No.Rows[0]["NotificationTitle"].ToString();
            if (Title_.IndexOf("+20") != -1)
            {
                NotiTypeMessage += "</br>   20 امتیاز از سمت هیئت علمی";
            };
            if (Title.Length > 50)
            { Title_ = PHASCOUtility.Right(Title, 50) + "..."; }

            Title_ = Title_.Replace("+20", "");
            string email_ = "";
            try
            {
                TBL_User da = new TBL_User();
                DataTable dt = da.Users_Tra("select_Item", UserReciverId);
                email_ = dt.Rows[0]["Email"].ToString();
            }
            catch (Exception) { }
            string Url_ = "<a href='" + URL + "'>" + URL + "</a>";
            daNotification.TBL_Notification_SP(1, 0, UserDoingId, UserReciverId, UserOwnerId, NotificationTypeID, URL, 0, NotificationIconId, Title_);

            if (email_ != "")
                PMail.SendMailNotification(email_, NotificationTitle, Url_, Title_, NotiTypeMessage);

            PMail.SendMailNotification("it@phasco.com", NotificationTitle, Url_, Title_, NotiTypeMessage);
        }
    }
}
