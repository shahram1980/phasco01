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

namespace phasco.Cpanel
{
    public partial class Advertisment : System.Web.UI.Page
    {
        int? maxid;
        string date;
        PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.TAdvertiseTableAdapter Advertise = new PHASCO_WEB.DAL.DS_MainPhascoTableAdapters.TAdvertiseTableAdapter();
        DS_MainPhasco.TAdvertiseDataTable advertise_table = new DS_MainPhasco.TAdvertiseDataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

            //MultiView1.ActiveViewIndex = 0;
            if (!IsPostBack)
            {
                ViewState["edit"] = 0;
                int temp = 1;
            }
        }

        protected void btn_ok_Click(object sender, EventArgs e)
        {
            int editId = 0, count = 0;
            if (txt_count.Text != "")
                count = int.Parse(txt_count.Text);

            try
            {

                if (txt_date.Text == "")
                    date = DateTime.Now.ToString();
                else
                    date = txt_date.Text;
                try
                {
                    if (int.Parse(ViewState["edit"].ToString()) > 0)
                        editId = int.Parse(ViewState["edit"].ToString());
                }
                catch
                {
                    ViewState["edit"] = null;
                }
                Advertise.Create_Advertise(advertise_table, 6, null, null, null, 0, null, 0, 0, 0, null, null, ref maxid, 0, null);


                MyFileUploader.SaveFile(FileUpload1, "\\phascoupfile\\adver-img", Convert.ToInt32(maxid), ".jpg", ".gif", ".gif", this.Server);
                string ex = System.IO.Path.GetExtension(FileUpload1.FileName);
                string name = MyFileUploader.GetImageSingleName(Convert.ToInt32(maxid), ex);
                Advertise.Create_Advertise(advertise_table, 1, ex, DateTime.Now, txt_url.Text, count, Convert.ToDateTime(date), editId, int.Parse(rd_btn_mode.SelectedValue), 1, name, txt_desc.Text, ref maxid, int.Parse(ddl_language.SelectedValue), null);
                DataList1.DataBind();
                lbl_info.Text = "عملیات با موفقیت انجام شد";
            }
            catch (Exception Ex)
            {
                lbl_info.Text = Ex.Message;
            }

        }

        protected void edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            Advertise.Create_Advertise(advertise_table, 3, null, null, null, 0, null, id, 0, 0, null, null, ref maxid, 0, null);
            txt_date.Text = advertise_table[0].EndDate.ToString();
            txt_desc.Text = advertise_table[0].text.ToString();
            txt_url.Text = advertise_table[0].Url.ToString();
            txt_count.Text = advertise_table[0].Hit.ToString();
            ddl_language.SelectedValue = advertise_table[0].Language.ToString();
            rd_btn_mode.SelectedValue = advertise_table[0].Mode.ToString();
            //BFileUpload1. = "../advertiseimg/"+advertise_table[0].name.ToString();
            ViewState["edit"] = id;
            MultiView1.ActiveViewIndex = 0;
        }

        protected void edit_Click(object sender, EventArgs e)
        {

        }

        protected void link_btn_Insert_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
            Clear();
        }

        private void Clear()
        {
            txt_count.Text = string.Empty;
            txt_date.Text = string.Empty;
            txt_desc.Text = string.Empty;
            txt_url.Text = string.Empty;
            rd_btn_mode.SelectedIndex = -1;
            ddl_language.SelectedValue = "-1";
            lbl_info.Text = string.Empty;
        }

        protected void link_btn_show_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
            Clear();
        }

        protected void link_btn_delete_Command(object sender, CommandEventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Advertise.Create_Advertise(advertise_table, 2, null, null, null, 0, null, id, 0, 0, null, null, ref maxid, 0, null);
                DataList1.DataBind();
            }
            catch (Exception Ex)
            {
                lbl_info.Text = Ex.Message;
            }
        }

        protected void IMG1_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Advertise.Create_Advertise(advertise_table, 3, null, null, null, 0, null, id, 0, 0, null, null, ref maxid, 0, null);
            //if (advertise_table[0].Hit > 0 && advertise_table[0].Mode==1)
            //Advertise.Create_Advertise(advertise_table, 7, null, null, null, 0, null, id, 0, 0, null, null,ref maxid,0, null);
            Advertise.Create_Advertise(advertise_table, 5, null, null, null, 0, null, id, 0, 0, null, null, ref maxid, 0, "(mode=0 and EndDate<=Getdate()) or (mode=1 and [load]>0 and [load]<=hit) or (mode=2 and [load]>0 and [load]<=hit)");
            string url;
            if (advertise_table[0].Url != null)
            {
                url = advertise_table[0].Url;
                Response.Redirect(url);
            }
            SqlDataSource1.DataBind();
            DataList1.DataBind();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataList1.DataBind();
        }

        protected void IMG1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void DropDownList_Language_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataList1.DataBind();
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
