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
using phasco.BaseClass;
using PHASCO_WEB.DAL;

namespace phasco_webproject.UI
{
    public partial class formfed : UnSecureForm
    {
        #region Dataset
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.OD_Err_TblTableAdapter da = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.OD_Err_TblTableAdapter();
        DS_MainPhasco.OD_Err_TblDataTable dt_od = new DS_MainPhasco.OD_Err_TblDataTable();
        #endregion
        #region SetPage
        public override string FormTitle
        { get { return "ارسال پيام"; } }

        public override MasterPageColection MasterPageName
        { get { return MasterPageColection.Phasco01; } }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) MultiView1.ActiveViewIndex = 0;
        }

        protected void Button_Insert_Click(object sender, EventArgs e)
        {

        }
    }
}