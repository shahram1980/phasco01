using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace Membership_Manage
{
    public class UserProfile
    {
        #region [ private ]
        private DS_MainPhasco.ScientificPropertiesRow _row;
        #endregion

        #region [ properties ]
        public DS_MainPhasco.ScientificPropertiesRow UserDataRow
        {
            set { _row = value; }
            get { return _row; }
        }
        public string Name
        { get { return this._row.Name; } }
        public DateTime LoginDateEn
        { get { return this._row.LoginDateEn; } }
        public string Email
        { get { return this._row.Email; } }
        public string Famil
        { get { return this._row.Famil; } }
        public string Introdce
        { get { return this._row.Uidm; } }
        #endregion

        #region [ Constractor ]
        public UserProfile(DS_MainPhasco.ScientificPropertiesRow row)
        { this._row = row; }
        #endregion
    }
}
