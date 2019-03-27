using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccessLayer;
using BusinessAccessLayer;

namespace Rahbina.Job
{
    public partial class add_JobGroups : System.Web.UI.Page
    {
        protected void Page_PreRender(object sender, EventArgs e)
        {
            //


        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Get_groups();
                proccess_Request();
            }
        }
        public void Get_groups()
        {
            DropDownList_groups.DataSource = getCategories.get_category();
            DropDownList_groups.DataBind();
            //
            DropDownList_groups2.DataSource = getCategories.get_category();
            DropDownList_groups2.DataBind();
            //
            DropDownList_group_deleting.DataSource = getCategories.get_category();
            DropDownList_group_deleting.DataBind();
            //
            DropDownList_group3.DataSource = getCategories.get_category();
            DropDownList_group3.DataBind();
            //
            DropDownList_editing_group.DataSource = getCategories.get_category();
            DropDownList_editing_group.DataBind();
            //
            DropDownList_editing_group2.DataSource = getCategories.get_category();
            DropDownList_editing_group2.DataBind();
            //
            DropDownList_editing_Subgroup.DataSource = getCategories.get_subCategory(int.Parse(DropDownList_editing_group2.SelectedValue));
            DropDownList_editing_Subgroup.DataBind();
            //initializing DropDownList_subCategory with a first group in the list
            //if (DropDownList_groups2.SelectedValue != null)
            {
                DropDownList_subCategory.DataSource = getCategories.get_subCategory(int.Parse(DropDownList_groups2.SelectedValue));
                DropDownList_subCategory.DataBind();
            }
            //
            DropDownList_deleting_subGr.DataSource = getCategories.get_subCategory(int.Parse(DropDownList_group3.SelectedValue));
            DropDownList_deleting_subGr.DataBind();
        }
        public void proccess_Request()
        {
            if (Request["status"] != null)
            {
                if (Request["status"].ToString() == "insert")
                {
                    if (Request["group"] != null)
                    {
                        string CategoryName = Request["group"].ToString();
                        TBL_Job_Category insert_group = new TBL_Job_Category();
                        insert_group.Select_categories("Inser_group", 0, CategoryName);
                        Response.Redirect("add_JobGroups.aspx");
                    }
                    if (Request["Subgroup"] != null)
                    {
                        string CategoryName = Request["Subgroup"].ToString();
                        int SubCategoryID = int.Parse(Request["SubCategoryID"].ToString());
                        TBL_Job_Category insert_group = new TBL_Job_Category();
                        insert_group.Select_categories("Inser_group", SubCategoryID, CategoryName);

                        DropDownList_subCategory.DataBind();
                        Response.Redirect("add_JobGroups.aspx");
                    }

                }
            }
            if (Request["status"] == "deleteGroup")
            {
                int CategoryID = int.Parse(Request["id"].ToString());
                TBL_Job_Category deleteCategory = new TBL_Job_Category();
                deleteCategory.Select_categories("delete_group", CategoryID);
                Response.Redirect("add_JobGroups.aspx");
            }
            if (Request["status"] == "deleteSubGroup")
            {

                int CategoryID = int.Parse(Request["id"].ToString());
                TBL_Job_Category deleteCategory = new TBL_Job_Category();
                deleteCategory.Select_categories("delete_Subgroup", CategoryID);
                Response.Redirect("add_JobGroups.aspx");

            }
        }
        protected void LinkButton_add_gr_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_JobGroups.aspx?group=" + TextBox_job_group.Text.Trim() + "&status=insert");
        }

        protected void DropDownList_groups2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList_subCategory.DataSource = getCategories.get_subCategory(int.Parse(DropDownList_groups2.SelectedValue));
            DropDownList_subCategory.DataBind();

        }

        protected void LinkButton_addSubGroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_JobGroups.aspx?Subgroup=" + TextBox_subGroup.Text.Trim() + "&SubCategoryID=" + DropDownList_groups2.SelectedValue + "&status=insert");

        }

        protected void DropDownList_group_deleting_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton_deleteGroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_JobGroups.aspx?id=" + DropDownList_group_deleting.SelectedValue + "&status=deleteGroup");
        }

        protected void LinkButton_delete_subgroup_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_JobGroups.aspx?id=" + DropDownList_deleting_subGr.SelectedValue + "&status=deleteSubGroup");
        }

        protected void DropDownList_group3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dt = getCategories.get_subCategory(int.Parse(DropDownList_group3.SelectedValue));
            DropDownList_deleting_subGr.DataSource = dt;
            DropDownList_deleting_subGr.DataBind();

            if (dt.Rows.Count == 0)
            {
                LinkButton_delete_subgroup.Enabled = false;
            }
            else
                LinkButton_delete_subgroup.Enabled = true;

        }

        protected void DropDownList_editing_group_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox_group.Text = DropDownList_editing_group.SelectedItem.Text;

        }

        protected void LinkButton_edit_group_Click(object sender, EventArgs e)
        {
            int categoryID = int.Parse(DropDownList_editing_group.SelectedValue);
            string category = TextBox_group.Text;
            //
            TBL_Job_Category update_category = new TBL_Job_Category();
            update_category.Select_categories_2("edit_category", categoryID, category);
            Response.Redirect("add_JobGroups.aspx");
        }

        protected void DropDownList_editing_Subgroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox_SubGroup_edit.Text = DropDownList_editing_Subgroup.SelectedItem.Text;
        }

        protected void DropDownList_editing_group2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int categoryID = int.Parse(DropDownList_editing_group2.SelectedValue);
            DropDownList_editing_Subgroup.DataSource = getCategories.get_subCategory(categoryID);

            DropDownList_editing_Subgroup.DataBind();
        }

        protected void LinkButton_edit_SubGroup_Click(object sender, EventArgs e)
        {
            string Subcategory = TextBox_SubGroup_edit.Text;
            int categoryID = int.Parse(DropDownList_editing_Subgroup.SelectedValue);
            //
            TBL_Job_Category update_category = new TBL_Job_Category();
            update_category.Select_categories_2("edit_category", categoryID, Subcategory);
            Response.Redirect("add_JobGroups.aspx");
        }



        protected void DropDownList_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            string state = DropDownList_state.SelectedItem.Text;
            TBL_Job_CityState select_cities = new TBL_Job_CityState();
            DataTable dt;
            dt = select_cities.TBL_Job_CityState_SP("select_cities", state);
            DropDownList_city.DataSource = dt;
            DropDownList_city.DataBind();
        }

        protected void LinkButton_addCity_Click(object sender, EventArgs e)
        {
            string state = DropDownList_state.SelectedItem.Text;
            string city = TextBox_city.Text.Trim();
            TBL_Job_CityState addCity = new TBL_Job_CityState();
            addCity.TBL_Job_CityState_SP("addCity", state, city);
            //

            TBL_Job_CityState select_cities = new TBL_Job_CityState();
            DataTable dt;
            dt = select_cities.TBL_Job_CityState_SP("select_cities", state);
            DropDownList_city.DataSource = dt;
            DropDownList_city.DataBind();
            TextBox_city.Text = string.Empty;


        }

        protected void DropDownList_state_edit_SelectedIndexChanged(object sender, EventArgs e)
        {
            string state = DropDownList_state_edit.SelectedItem.Text;
            TBL_Job_CityState select_cities = new TBL_Job_CityState();
            DataTable dt;
            dt = select_cities.TBL_Job_CityState_SP("select_cities", state);
            DropDownList_city_edit.DataSource = dt;
            DropDownList_city_edit.DataBind();
        }

        protected void DropDownList_city_edit_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox_city_edit.Text = DropDownList_city_edit.SelectedItem.Text;
        }

        protected void LinkButton_edit_city_Click(object sender, EventArgs e)
        {
            string city = TextBox_city_edit.Text.Trim();
            string state = DropDownList_state_edit.SelectedItem.Text;
            int id = int.Parse(DropDownList_city_edit.SelectedValue);

            TBL_Job_CityState addCity = new TBL_Job_CityState();
            addCity.TBL_Job_CityState_SP("editCity", city, id);

           
            TBL_Job_CityState select_cities = new TBL_Job_CityState();
            DataTable dt;
            dt = select_cities.TBL_Job_CityState_SP("select_cities", state);
            DropDownList_city_edit.DataSource = dt;
            DropDownList_city_edit.DataBind();

            TextBox_city_edit.Text = string.Empty;

        }
    }
}
