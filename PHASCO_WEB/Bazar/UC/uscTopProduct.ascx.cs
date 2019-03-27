using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Membership_Manage;
using DataAccessLayer.BIZ;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.UC
{
    public partial class uscTopProduct : BaseUserControl
    {
        #region Properties
        int _PageView;
        public int PageView
        {
            get
            {
                return _PageView;
            }
            set
            {
                _PageView = value;
            }
        }

        int _CategoryID;
        public int CategoryID
        {
            get
            {
                return _CategoryID;
            }
            set
            {
                _CategoryID = value;
            }
        }

        string _GroupID;
        public string GroupID
        {
            get
            {
                return _GroupID;
            }
            set
            {
                _GroupID = value;
            }
        }

        string _SearchWord;
        public string SearchWord
        {
            get
            {
                return _SearchWord;
            }
            set
            {
                _SearchWord = value;
            }
        }

        int _SearchType;//and or like ...
        public int SearchType
        {
            get
            {
                return _SearchType;
            }
            set
            {
                _SearchType = value;
            }
        }

        string _State;
        public string State
        {
            get
            {
                return _State;
            }
            set
            {
                _State = value;
            }
        }

        string _FromDate;
        public string FromDate
        {
            get
            {
                return _FromDate;
            }
            set
            {
                _FromDate = value;
            }
        }

        string _ToDate;
        public string ToDate
        {
            get
            {
                return _ToDate;
            }
            set
            {
                _ToDate = value;
            }
        }

        int _SearchSection;
        public int SearchSection
        {
            get
            {
                return _SearchSection;
            }
            set
            {
                _SearchSection = value;
            }
        }

        int _StatusID;
        public int StatusID
        {
            get
            {
                return _StatusID;
            }
            set
            {
                _StatusID = value;
            }
        }

        TBL_SearchHistory Search = new TBL_SearchHistory();
        TBL_Categories Categories = new TBL_Categories();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["PageView"]))
                PageView = PHASCOUtility.ConverToNullableInt(Request.QueryString["PageView"]);

            if (!string.IsNullOrEmpty(Request.QueryString["Status"]))
                StatusID = PHASCOUtility.ConverToNullableInt(Request.QueryString["Status"]);

            if (!string.IsNullOrEmpty(Request.QueryString["CategoryID"]))
                CategoryID = PHASCOUtility.ConverToNullableInt(Request.QueryString["CategoryID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchType"])) // 1 -> OR . 2 -> AND . 3 -> All
                SearchType = PHASCOUtility.ConverToNullableInt(Request.QueryString["SearchType"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchSection"])) // 0 -> All . 1 -> Product . 2 -> Request . 3 -> Company
                SearchSection = PHASCOUtility.ConverToNullableInt(Request.QueryString["SearchSection"]);

            if (!string.IsNullOrEmpty(Request.QueryString["GroupID"]))
                GroupID = PHASCOUtility.ConverToNullableString(Request.QueryString["GroupID"]);

            if (!string.IsNullOrEmpty(Request.QueryString["SearchWord"]))
                SearchWord = PHASCOUtility.ConverToNullableString(Request.QueryString["SearchWord"]);

            if (!string.IsNullOrEmpty(Request.QueryString["State"]))
                State = PHASCOUtility.ConverToNullableString(Request.QueryString["State"]);

            if (!string.IsNullOrEmpty(Request.QueryString["FromDate"]))
                FromDate = PHASCOUtility.ConverToNullableString(Request.QueryString["FromDate"]);

            if (!string.IsNullOrEmpty(Request.QueryString["ToDate"]))
                ToDate = PHASCOUtility.ConverToNullableString(Request.QueryString["ToDate"]);



        }

    }
}