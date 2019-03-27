using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using BiztBiz.Component;
using System.Threading;
using System.Globalization;
using Membership_Manage;
using DataAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class News : BasePage
    {
        TBL_User_News da = new TBL_User_News();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                if (Request.QueryString["statue"] != null)
                {
                    string statu = Request.QueryString["statue"].ToString();
                    switch (statu)
                    {
                        case "editapp":
                            Set_Edit_View();
                            break;
                        case "new":
                            set_New();
                            break;
                        case "edit":
                            Set_Edit();
                            break;
                        case "delete":
                            Delete_News();
                            break;
                        case "sucss":
                            MultiView1.ActiveViewIndex = 2;
                            Lbl_ALARM.Text = Resources.Resource.News_Ins_Success;
                            break;
                    }
                }
        }

        void set_New()
        {
            MultiView1.ActiveViewIndex = 0;
        }

        void Set_Edit()
        {
            Bind_News();
        }

        protected void Button_News_insert_Click(object sender, EventArgs e)
        {
            try
            {
                int id = 0;

                if (!string.IsNullOrEmpty(Utility.ConverToNullableString(Request.QueryString["id"])))
                    id = Utility.ConverToNullableInt(Request.QueryString["id"]);

                if (id > 0)
                {
                    DataTable dt = da.TBL_User_News_Tra(id);
                    if (dt.Rows.Count > 0)
                    {
                        if (Utility.ConverToNullableInt(dt.Rows[0]["Uid"]) != UserOnline.id())
                        {
                            return;
                        }
                    }
                    else
                        return;
                }

                bool isActive = false;
                if (rdbListIsActive.SelectedValue == "1")
                    isActive = true;

                da.TBL_User_News_Tra(id, "insert", UserOnline.id(), Title.Text, FCKeditor1.Value
                    , isActive, Utility.ConverToNullableInt(rdbListStatus.SelectedValue));

                Response.Redirect("News.aspx?statue=edit");
            }
            catch
            {
            }

        }

        void Bind_News()
        {
            DataTable dt = da.TBL_User_News_Tra("select_UidnotActive", UserOnline.id());
            repNews.DataSource = dt;
            repNews.DataBind();
            MultiView1.ActiveViewIndex = 1;
        }

        void Delete_News()
        {
            int id = int.Parse(Request.QueryString["id"].ToString());
            da.TBL_User_News_Tra("delete", id);
            Response.Redirect("News.aspx?statue=edit");
        }

        void Set_Edit_View()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"].ToString()))
            {
                int id = Utility.ConverToNullableInt(Request.QueryString["id"].ToString());
                DataTable dt = da.TBL_User_News_Tra(id);
                if (dt.Rows.Count > 0)
                {
                    if (Utility.ConverToNullableInt(dt.Rows[0]["Uid"]) == UserOnline.id())
                    {
                        lnkNewNews.Text = "ویرایش خبر";
                        Title.Text = dt.Rows[0]["Title"].ToString();
                        FCKeditor1.Value = dt.Rows[0]["news"].ToString();
                        rdbListIsActive.SelectedValue = dt.Rows[0]["IsActive"].ToString() == "True" ? "1" : "0";
                        rdbListStatus.SelectedValue = Utility.ConverToNullableStringForDDL(dt.Rows[0]["Status"]);
                        MultiView1.ActiveViewIndex = 0;
                    }
                    else
                    {
                        return;
                    }
                }
            }
        }

        public string GetShamsiDate(string date)
        {
            string sdate = string.Empty;
            if (!string.IsNullOrEmpty(date))
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date, 3);
            return sdate;
        }

        public string GetIsActive(string isactive)
        {
            string active = string.Empty;
            if (!string.IsNullOrEmpty(isactive))
                if (isactive == "1" || isactive == "True")
                    active = "فعال";
                else
                    active = "غیر فعال";

            return active;
        }

        public string GetStatus(string status)
        {
            string StatusMode = string.Empty;
            if (!string.IsNullOrEmpty(status))
                if (status == "1")
                    StatusMode = "عادی";
                else if (status == "2")
                    StatusMode = "خبر داغ";

            return StatusMode;
        }

        public string GetNewsTilte(string title)
        {
            string t = title;
            if (title.Length > 25)
                t = title.Substring(0, 25) + " ... ";

            return t;
        }

    }
}
