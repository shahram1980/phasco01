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
using System.Threading;
using System.Globalization;
using Membership_Manage;
using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;
using BusinessAccessLayer;
using BusinessAccessLayer.BIZ;

namespace BiztBiz.MyBiztBiz
{
    public partial class company_profile : BasePage
    {
        int _CompanyProfileNotComplate;
        public int CompanyProfileNotComplate
        {
            get
            {
                return _CompanyProfileNotComplate;
            }
            set
            {
                _CompanyProfileNotComplate = value;
            }
        }

        int _CompanyCategoryLimited;
        public int CompanyCategoryLimited
        {
            get
            {
                return _CompanyCategoryLimited;
            }
            set
            {
                _CompanyCategoryLimited = value;
            }
        }


        TBL_Company_Profile da_prof = new TBL_Company_Profile();
        TBL_Coding coding = new TBL_Coding();
        TBL_Categories Categories = new TBL_Categories();
        Tbl_state da_State = new Tbl_state();
        TBL_User_Biz da_User = new TBL_User_Biz();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["s"]))
            {
                if (Request.QueryString["s"].ToString() == "true")
                {
                    MultiView1.ActiveViewIndex = 1;
                    return;
                }
                else MultiView1.ActiveViewIndex = 0;
            }
            else MultiView1.ActiveViewIndex = 0;
            companyProfileComplate.Visible = false;
            if (!string.IsNullOrEmpty(Request.QueryString["CompanyProfileNotComplate"]))
                CompanyProfileNotComplate = PHASCOUtility.ConverToNullableInt(Request.QueryString["CompanyProfileNotComplate"]);
            if (!Page.IsPostBack)
                Initialize();
        }

        protected void Initialize()
        {
            if (CompanyProfileNotComplate > 0)
            {
                companyProfileComplate.Visible = true;
            }
            SetCompanyCategoryLimit();
            Set_Form();
        }

        protected void SetCompanyCategoryLimit()
        {
            CompanyCategoryLimited = 3;
            DataTable dtUserLimit = da_User.TBL_User_Limitation_Tra(UserOnline.UsersRoleID(), "select_byID");
            if (dtUserLimit.Rows.Count > 0)
            {
                CompanyCategoryLimited = PHASCOUtility.ConverToNullableInt(dtUserLimit.Rows[0]["CompanyLimitedCount"]);
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            //   Set_Form();
        }

        void Set_Form()
        {
            coding.BindBusinessTypeCheckBoxList(chkBusinessType);
            coding.BindUsageTypeCheckBoxList(chkUsageType);
            try
            {
                DataTable dt = da_prof.TBL_Company_Profile_Tra(0, "select_item", UserOnline.id(), "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");

                //lnkCompanyBranch.Visible = true;
                //lnkCompanyBranch.PostBackUrl = "~/MyBiztBiz/Company_Branch.aspx?CompanyID=" + dt.Rows[0]["id"].ToString();

                TextBox_Company_Name.Text = dt.Rows[0]["Company_Name"].ToString();
                TextBox_Company_Address.Text = dt.Rows[0]["Company_Address"].ToString();
                //TextBox_State_Province.Text = dt.Rows[0]["State_Province"].ToString();
                //TextBox_City.Text = dt.Rows[0]["City"].ToString();
                TextBox_Zip.Text = dt.Rows[0]["Zip"].ToString();
                //DropDownList_Reg.SelectedValue = dt.Rows[0]["registered_capital"].ToString();
                //DropDownList_Total_Staff.SelectedValue = dt.Rows[0]["Total_Staff"].ToString();
                //TextBox_year_Established.Text = dt.Rows[0]["year_Established"].ToString();
                TextBox_Company_Website.Text = dt.Rows[0]["Company_Website"].ToString();
                TextBox_Services.Text = dt.Rows[0]["Services"].ToString(); ;
                TextBox_Company_Introduction.Text = dt.Rows[0]["Company_Introduction"].ToString();
                //DropDownList_annual_sales.SelectedValue = dt.Rows[0]["annual_sales"].ToString();
                txtBrandNameOne.Text = dt.Rows[0]["BrandNameOne"].ToString();
                txtBrandTypeOne.Text = dt.Rows[0]["BrandTypeOne"].ToString();
                txtBrandNameTwo.Text = dt.Rows[0]["BrandNameTwo"].ToString();
                txtBrandTypeTwo.Text = dt.Rows[0]["BrandTypeTwo"].ToString();
                txtBrandNameThree.Text = dt.Rows[0]["BrandNameThree"].ToString();
                txtBrandTypeThree.Text = dt.Rows[0]["BrandTypeThree"].ToString();
                //TextBox_exports.Text = dt.Rows[0]["exports"].ToString();
                //TextBox_Advertisementdress.Text = dt.Rows[0]["Advertisement"].ToString();


                DataTable dtState = da_State.T_state_Tra("selectJoin_byID", PHASCOUtility.ConverToNullableInt(dt.Rows[0]["City"]));
                cddState.SelectedValue = dtState.Rows[0]["ID_CITY"].ToString();
                ccdCity.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dt.Rows[0]["City"]);



                //DataTable dtState = da_State.T_state_Tra("select_byID", PHASCOUtility.ConverToNullableInt(dt.Rows[0]["City"]));
                //if (dtState.Rows.Count > 0)
                //{
                //    if (PHASCOUtility.ConverToNullableInt(dtState.Rows[0]["StateCode"]) == 2) // ostan
                //    {
                //        cddState.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dt.Rows[0]["City"]);
                //    }
                //    else if (PHASCOUtility.ConverToNullableInt(dtState.Rows[0]["StateCode"]) == 3) // city
                //    {
                //        cddState.SelectedValue = dtState.Rows[0]["ParentID"].ToString();
                //        ccdCity.SelectedValue = PHASCOUtility.ConverToNullableStringForDDL(dt.Rows[0]["City"]);
                //    }
                //}


                if (dt.Rows[0]["image"].ToString() != "none.jpg")
                    Image_Logo.ImageUrl = "~\\bazar\\MyBiztBiz\\Coupload\\sm_" + dt.Rows[0]["image"].ToString();
                else
                    Image_Logo.ImageUrl = "~\\bazar\\MyBiztBiz\\Coupload\\None\\none.jpg";

                char[] splitter = { ',' };

                string BusinessType = dt.Rows[0]["BusinessType"].ToString();
                string[] BusinessTypeItem = BusinessType.Split(splitter);
                for (int i = 0; i < BusinessTypeItem.Length; i++)
                {
                    if (!string.IsNullOrEmpty(BusinessTypeItem[i]) && PHASCOUtility.ConverToNullableInt(BusinessTypeItem[i]) > 0)
                        chkBusinessType.Items.FindByValue(BusinessTypeItem[i]).Selected = true;
                }

                string UsageType = dt.Rows[0]["UsageType"].ToString();
                string[] UsageTypeItem = UsageType.Split(splitter);
                for (int j = 0; j < UsageTypeItem.Length; j++)
                {
                    if (!string.IsNullOrEmpty(UsageTypeItem[j]) && PHASCOUtility.ConverToNullableInt(UsageTypeItem[j]) > 0)
                        chkUsageType.Items.FindByValue(UsageTypeItem[j]).Selected = true;
                }

                string query = string.Empty;
                string Group_ID = dt.Rows[0]["Group_ID"].ToString();
                string[] Group_IDItem = Group_ID.Split(splitter);
                for (int j = 0; j < Group_IDItem.Length; j++)
                {
                    if (!string.IsNullOrEmpty(Group_IDItem[j]))
                    {
                        query += Group_IDItem[j];
                        query += " , ";
                    }
                }

                query += "0";
                DataTable dtCategory = Categories.TBL_Categories_Tra("select_bymultiid", query);
                lstGroup.DataValueField = "id";
                lstGroup.DataTextField = "Subject_ir";
                lstGroup.DataSource = dtCategory;
                lstGroup.DataBind();

            }
            catch (Exception) { }

        }

        protected void ImageButton_Create_Click(object sender, EventArgs e)
        {
            //try
            //{
            int city = PHASCOUtility.ConverToNullableInt(ccdCity.SelectedValue.Split(new char[] { ':' })[0]);
            if (city <= 0)
            {
                city = PHASCOUtility.ConverToNullableInt(cddState.SelectedValue.Split(new char[] { ':' })[0]);
            }
            if (city > 0)
            {
                string Main_Marketsnt = "";
                string image = "none.jpg";

                string BusinessType = "0,";
                for (int i = 0; i < chkBusinessType.Items.Count; i++)
                {
                    if (chkBusinessType.Items[i].Selected)
                    {
                        BusinessType += chkBusinessType.Items[i].Value;
                        BusinessType += ",";
                    }
                }
                BusinessType += "0";

                string UsageType = "0,";
                for (int j = 0; j < chkUsageType.Items.Count; j++)
                {
                    if (chkUsageType.Items[j].Selected)
                    {
                        UsageType += chkUsageType.Items[j].Value;
                        UsageType += ",";
                    }
                }
                UsageType += "0";



                //0000000000000000000000000000000000000

                string Group_ID = "";// listGroup.Value;

                //da_prof.TBL_Company_Groups_Tra(0, "delete_company", UserOnline.CompanyID(), 0);

                //string[] groups = Group_ID.Split(',');

                //for (int k = 0; k < groups.Length; k++)
                //{
                //    if (PHASCOUtility.ConverToNullableInt(groups[k]) > 0)
                //    {
                //        da_prof.TBL_Company_Groups_Tra(0, "insert", UserOnline.CompanyID(), PHASCOUtility.ConverToNullableInt(groups[k]));
                //    }
                //}

                da_prof.TBL_Company_Groups_Tra(0, "delete_company", UserOnline.CompanyID(), 0);
                for (int c = 0; c < lstGroup.Items.Count; c++)
                {
                    Group_ID = Group_ID +lstGroup.Items[c].Value.ToString()+",";
                    da_prof.TBL_Company_Groups_Tra(0, "insert", UserOnline.CompanyID(), PHASCOUtility.ConverToNullableInt(lstGroup.Items[c].Value.ToString()));
                }
 
 
                DataTable dt = da_prof.TBL_Company_Profile_Tra(0, "Insert", UserOnline.id(), image, TextBox_Company_Name.Text, "Image", TextBox_Company_Address.Text,
                       "", city.ToString()
                       , TextBox_Zip.Text, "", "-1", "",
                       TextBox_Company_Website.Text, Group_ID, TextBox_Services.Text, TextBox_Company_Introduction.Text, Main_Marketsnt, "-1",
                       0, "", BusinessType, UsageType, txtBrandTypeOne.Text, txtBrandNameOne.Text,
                       txtBrandTypeTwo.Text, txtBrandNameTwo.Text, txtBrandTypeThree.Text, txtBrandNameThree.Text);


                if (FileUpload_Logo.HasFile)
                {
                    string filename = dt.Rows[0][0].ToString() + "_co_" + DateTime.Now.Ticks.ToString() + MyFileUploader.IsExtension(FileUpload_Logo);
                    MyFileUploader.SaveFile_MyFileName(FileUpload_Logo, "~\\bazar\\MyBiztBiz\\Coupload\\", filename, "*", "*", "*", this.Server);

                    string filenam_path = Server.MapPath("~\\bazar\\MyBiztBiz\\Coupload\\" + filename);
                    string path = Server.MapPath("~//bazar//MyBiztBiz//Coupload//");
                    MyFileUploader.ResizeImage(path + filename, path + "sm_" + filename, 70, 70, true);
                    da_prof.TBL_Company_Profile_Tra(int.Parse(dt.Rows[0][0].ToString()), "Update_Image", 0, filename, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", 0, "", "", "", "", "", "", "", "", "");
                    Response.Redirect("company_profile.aspx?status=insert_983ju9zok");
                }
                ShowSuccessfulMessage();

                if (!string.IsNullOrEmpty(Request.QueryString["CompanyProfileNotComplate"]))
                    CompanyProfileNotComplate = PHASCOUtility.ConverToNullableInt(Request.QueryString["CompanyProfileNotComplate"]);
                if (CompanyProfileNotComplate > 0)
                    Response.Redirect("~/bazar/MyBiztBiz/Products.aspx?5061676556696577=31", true);
                else
                    Response.Redirect("~/bazar/MyBiztBiz/company_profile.aspx?s=true", true);
            }
            else
            {
                divMessage.Visible = true;
                divMessage.Style.Add("background-color", "Yellow");
                lblMessage.Text = "استان را انتخاب کنید";
            }
            //}
            //catch
            //{
            //    divMessage.Visible = true;
            //    divMessage.Style.Add("background-color", "Red");
            //    lblMessage.Text = "اشکال در ویرایش اطلاعات";
            //}

        }

        protected void ShowSuccessfulMessage()
        {
            divMessage.Visible = true;
            divMessage.Style.Add("background-color", "Green");
            lblMessage.Text = "عملیات ویرایش اطلاعات با موفقیت انجام شد";

        }

        protected void Button_AddGroup_Click(object sender, EventArgs e)
        {
            SetCompanyCategoryLimit();
            string Text_ = DropDownList_Cat3.SelectedItem.ToString();
            string Value_ = DropDownList_Cat3.SelectedValue.ToString();

            if (Text_ != "")
            {
                if (lstGroup.Items.Count == CompanyCategoryLimited)
                {
                    lbl_Alarm_Countgroup.Text = "* شما نمی توانید بیش از " + CompanyCategoryLimited.ToString() + " گروه کاری را انتخاب نمائید";
                    lbl_Alarm_Countgroup.Visible = true;
                }
                else
                {
                    for (int i = 0; i < lstGroup.Items.Count; i++)
                    {
                        if (lstGroup.Items[i].Value == Value_)
                        {
                            lbl_Alarm_Countgroup.Text = "قبلا این گروه را انتخاب کرده اید";
                            lbl_Alarm_Countgroup.Visible = true;
                            return;
                        }
                    }
                    lstGroup.Items.Add(new ListItem(Text_, Value_));
                    lbl_Alarm_Countgroup.Visible = false;
                }
            }
        }

        protected void button_Delete_Group_Click(object sender, EventArgs e)
        {
            for (int n = lstGroup.Items.Count - 1; n >= 0; --n)
            {
                //string ssss = lstGroup.Items[n].ToString();
                //string removelistitem = lstGroup.SelectedItem.ToString();
                if (lstGroup.Items[n].Selected)// ToString().Contains(removelistitem))
                {
                    lstGroup.Items.RemoveAt(n);
                }
            }

        }


    }
}
