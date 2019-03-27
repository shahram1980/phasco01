using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Data;

namespace AdvertisementManagement
{

    [Serializable]
    public class SessionData
    {

        public static SessionData ActiveInstance
        {
            get
            {
                SessionWrapper<SessionData> w = new SessionWrapper<SessionData>();
                return w.Item;
            }

        }


        bool islogin = false;

        public bool IsLogIn
        {
            get { return islogin; }
            set { islogin = value; }
        }

        bool isadmin = false;

        public bool IsAdmin
        {
            get { return isadmin; }
            set { isadmin = value; }
        }

        string useranme;

        public string UserName
        {
            get { return useranme; }
            set { useranme = value; }
        }

        string fullName;

        public string FullName
        {
            get { return fullName; }
            set { fullName = value; }
        }

        string ruleID;

        public string RuleID
        {
            get { return ruleID; }
            set { ruleID = value; }
        }

        string userid;
        public string UserID
        {
            get { return userid; }
            set { userid = value; }
        }

        string lang = "Fa";

        string theme = "AdManage";

        public string Theme
        {
            get { return theme; }
            set
            {
                theme = value;
            }
        }


        public void Clear()
        {
            IsLogIn = false;
            UserID = string.Empty;
            UserName = string.Empty;
        }

       

        public void AuthenticatedUser(string _userID, string _userName, string _ruleID, string _fullName)
        {
            this.UserName = _userName;
            this.UserID = _userID;
            this.RuleID = _ruleID;
            this.FullName = _fullName;
            IsLogIn = true;
        }

       
    }

    public class SessionWrapper<T> where T : new()
    {
        public T Item
        {

            get
            {

                string key = typeof(T).Name.ToLower();
                if (HttpContext.Current.Session[key] == null)
                {
                    T Value = new T();
                    HttpContext.Current.Session.Add(key, Value);
                }
                return (T)HttpContext.Current.Session[key];
            }
        }
    }


    [Serializable]
    public class DataCache
    {

        public static DataCache ActiveInstance
        {
            get
            {
                SessionWrapper<DataCache> w = new SessionWrapper<DataCache>();
                return w.Item;
            }

        }

        DataSet currentObjectDataSet;

        public DataSet CurrentObjectDataSet
        {
            get { return currentObjectDataSet; }
            set { currentObjectDataSet = value; }
        }


    }

}
