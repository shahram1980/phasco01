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
using System.Text;
using System.Globalization;
using System.Threading;
using Membership_Manage;
using DataAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class inquiry_List : BasePage
    {
        int _TypeID;
        public int TypeID
        {
            get
            {
                return _TypeID;
            }
            set
            {
                _TypeID = value;
            }
        }

        TBL_inquire da = new TBL_inquire();
        TBL_User_Biz da_User = new TBL_User_Biz();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["TypeID"]))
                TypeID = Utility.ConverToNullableInt(Request.QueryString["TypeID"]);

            if (!IsPostBack)
            {
                if (Request.QueryString["detid"] != null)
                    set_Detail();
                else if (Request.QueryString["reid"] != null)
                    set_replay();
                else
                    Initialize();
            }
            SetLinkAndInq();

        }

        protected void Initialize()
        {
            switch (TypeID)
            {
                case 0:
                    SetInquiryDesc();
                    break;
                case 1:
                    BindInquiryList(1, 0);
                    break;
                case 2:
                    BindInquiryList(2, 0);

                    break;
                case 3:
                case 5:
                    BindInquiryList(3, 5);

                    break;
            }
        }

        protected void SetLinkAndInq()
        {
            DataTable dtInquiry = da.TBL_inquire_Tra(UserOnline.id(), "SelectCountinquire");
            if (dtInquiry.Rows.Count > 0)
            {
                lnkProductInquiry.Text = dtInquiry.Rows[0]["Productinquire"].ToString();
                lnkProducts.Text = "درخواست محصولات " + "(" + dtInquiry.Rows[0]["Productinquire"].ToString() + ")";

                lnkRequestInquiry.Text = dtInquiry.Rows[0]["Requestinquire"].ToString();
                lnkRequest.Text = "پاسخ درخواست ها " + "(" + dtInquiry.Rows[0]["Requestinquire"].ToString() + ")";

                lnkMessageInquiry.Text = dtInquiry.Rows[0]["Messageinquire"].ToString();
                lnkMessage.Text = "پیام ها " + "(" + dtInquiry.Rows[0]["Messageinquire"].ToString() + ")";
            }
        }

        protected void SetInquiryDesc()
        {
            MultiView1.ActiveViewIndex = 3;
        }

        protected void BindInquiryList(int typeID1, int typeID2)
        {
            MultiView1.ActiveViewIndex = 0;
            DataTable dtInquiry = da.TBL_inquire_Tra("SelectinquireByType", UserOnline.id(), typeID1, typeID2);
            repinquire.DataSource = dtInquiry;
            repinquire.DataBind();
        }

        void Bind_Inquiry()
        {
            try
            {
                DataTable dt = da.TBL_inquire_Tra_select_Uid_rec(UserOnline.id(), "select_Uid_rec");

                if (dt.Rows.Count <= 0)
                {
                    MultiView1.ActiveViewIndex = 2;
                    return;
                }

                repinquire.DataSource = dt;
                repinquire.DataBind();
                MultiView1.ActiveViewIndex = 0;
            }
            catch (Exception)
            {
                MultiView1.ActiveViewIndex = 2;
            }

        }
        protected void listItems_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            //this.dataPager.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            Bind_Inquiry();
        }
        void set_Detail()
        {
            int id = 0;
            if (!string.IsNullOrEmpty(Request.QueryString["detid"]))
                id = Utility.ConverToNullableInt(Request.QueryString["detid"]);

            lnkreplyInquiry.HRef = "~/MyBiztBiz/inquiry_List.aspx?reid=" + id;

            DataTable dt = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Uid_rec_item");
            if (dt.Rows.Count > 0)
            {
                if (Utility.ConverToNullableInt(dt.Rows[0]["Uid_receiver"]) == UserOnline.id())
                {
                    Label_Topic.Text = dt.Rows[0]["topic"].ToString();
                    Label_Send_Date.Text = QLink.Helpers.DateHelper.GregorianToJalaali(dt.Rows[0]["Send_date"].ToString(), 1);

                    Label_Message.Text = dt.Rows[0]["Message"].ToString();
                    //Label_Company_Name.Text = dt.Rows[0]["Company"].ToString();
                    Label_Name.Text = dt.Rows[0]["Given_Name"].ToString() + " " + dt.Rows[0]["Family_Name"].ToString();

                    //Label_Country.Text = dt.Rows[0]["Business_Location"].ToString();
                    //Label_Company_address.Text = dt.Rows[0]["Company_Address"].ToString();
                    Label_Email.Text = dt.Rows[0]["Uid"].ToString();
                    Label_Tel.Text = dt.Rows[0]["Tel_A_Number"].ToString();

                    MultiView1.ActiveViewIndex = 1;
                }
            }
            else
            {
                dt = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Id");
                if (dt.Rows.Count > 0)
                {
                    if (Utility.ConverToNullableInt(dt.Rows[0]["Uid_receiver"]) == UserOnline.id())
                    {
                        Label_Topic.Text = dt.Rows[0]["topic"].ToString();
                        Label_Send_Date.Text = QLink.Helpers.DateHelper.GregorianToJalaali(dt.Rows[0]["Send_date"].ToString(), 1);

                        Label_Message.Text = dt.Rows[0]["Message"].ToString();

                        Label_Name.Text = dt.Rows[0]["SenderName"].ToString();


                        Label_Email.Text = dt.Rows[0]["SenderEmail"].ToString();
                        Label_Tel.Text = dt.Rows[0]["SenderTel"].ToString();
                        MultiView1.ActiveViewIndex = 1;
                    }
                }
            }
        }

        public string Set_Date(string date)
        {
            string sdate = string.Empty;
            if (!string.IsNullOrEmpty(date))
            {
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date, 3);
            }
            return sdate;
        }

        protected void Button_Delete_Click(object sender, EventArgs e)
        {
            //StringBuilder str = new StringBuilder();
            //for (int i = 0; i < listItems.Items.Count; i++)
            //{
            //    ListViewItem row = listItems.Items[i];
            //    bool isChecked = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Checked;
            //    string id_ = ((HtmlInputCheckBox)row.FindControl("chkBxMail")).Value.ToString();
            //    if (isChecked)
            //    {
            //        da.TBL_inquire_Tra_select_Uid_rec(int.Parse(id_), "delete_Id");
            //    }
            //}
            //Response.Redirect("inquiry_List.aspx");
        }
        void set_replay()
        {
            int id = 0;
            if (!string.IsNullOrEmpty(Request.QueryString["reid"]))
                id = Utility.ConverToNullableInt(Request.QueryString["reid"]);

            DataTable dt = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Uid_rec_item");
            if (dt.Rows.Count > 0)
            {
                if (Utility.ConverToNullableInt(dt.Rows[0]["Uid_receiver"]) == UserOnline.id())
                {
                    Label_Email_send.Text = dt.Rows[0]["Uid"].ToString();
                    MultiView1.ActiveViewIndex = 2;
                }
                else
                    MultiView1.ActiveViewIndex = 3;
            }
            else
            {
                dt = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Id");
                if (dt.Rows.Count > 0)
                {
                    if (Utility.ConverToNullableInt(dt.Rows[0]["Uid_receiver"]) == UserOnline.id())
                    {
                        Label_Email_send.Text = dt.Rows[0]["SenderEmail"].ToString();
                        MultiView1.ActiveViewIndex = 2;
                    }
                    else
                        MultiView1.ActiveViewIndex = 3;
                }
            }
        }

        protected void ImageButton_Insert_Click(object sender, EventArgs e)
        {
            try
            {
                int id = 0;
                if (!string.IsNullOrEmpty(Request.QueryString["reid"]))
                    id = Utility.ConverToNullableInt(Request.QueryString["reid"]);

                DataTable dt = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Uid_rec_item");
                if (dt.Rows.Count > 0)
                {
                    da.TBL_inquire_Tra(0, "insert", UserOnline.id(),
                        Utility.ConverToNullableInt(dt.Rows[0]["Uid_id"]), 0, TextBox_Subject.Text,
                        TextBox_BodyMail.Text, "", 0, 5, UserOnline.Given_Name() + " " + UserOnline.Family_Name(), UserOnline.Uid(), "");
                }
                else
                {
                    dt = da.TBL_inquire_Tra_select_Uid_rec(id, "select_Id");
                    if (dt.Rows.Count > 0)
                    {
                        Mailer.Send_Mail(TextBox_Subject.Text.ToString(), dt.Rows[0]["SenderEmail"].ToString(), TextBox_BodyMail.Text.ToString());
                    }
                }
                divMessageResult.Visible = true;
                divMessageResult.Style.Add("background-color", "Green");
                lblMessageResult.Text = "پیام با موفقیت ارسال شد. ";
            }
            catch
            {
                divMessageResult.Visible = true;
                divMessageResult.Style.Add("background-color", "Red");
                lblMessageResult.Text = "اشکال در ارسال پیام. ";
            }
            //Mailer.Send_Mail(TextBox_Subject.Text.ToString(), Label_Email_send.Text.ToString(), TextBox_BodyMail.Text.ToString());
        }

        protected void lnkDelete_Command(object sender, CommandEventArgs e)
        {
            int id = Utility.ConverToNullableInt(e.CommandArgument);
            da.TBL_inquire_Tra(id, "delete_Id");
            if (!string.IsNullOrEmpty(Request.QueryString["TypeID"]))
                TypeID = Utility.ConverToNullableInt(Request.QueryString["TypeID"]);
            Initialize();
        }

        protected void btnDeleteInq_Click(object sender, EventArgs e)
        {
            int id = 0;
            if (!string.IsNullOrEmpty(Request.QueryString["detid"]))
                id = Utility.ConverToNullableInt(Request.QueryString["detid"]);

            da.TBL_inquire_Tra(id, "delete_Id");

            Response.Redirect("~/MyBiztBiz/inquiry_List.aspx", true);
        }

        public string getStatus(string status)
        {
            if (status == "0")
                return "خوانده نشده";
            else
                return "خوانده شده";
        }

        public string GetUserFullName(string userID)
        {
            string UserFullName = string.Empty;
            DataTable dtUsers = da_User.TBL_User_Tra("selectFullNameById", Utility.ConverToNullableInt(userID));
            if (dtUsers.Rows.Count > 0)
                UserFullName = dtUsers.Rows[0]["FullName"].ToString();

            return UserFullName;
        }

        public string GetVisite(string visit)
        {
            if (visit == "0")
                return "bold";
            else
                return "normal";
        }

    }
}
