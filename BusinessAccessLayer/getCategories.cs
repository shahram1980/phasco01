using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using DataAccessLayer;


namespace BusinessAccessLayer
{
    public class getCategories
    {
        public static DataTable get_category()
        {
            TBL_Job_Category categories = new TBL_Job_Category();
            DataTable dt = new DataTable();
            dt = categories.Select_categories("Select_categories");
            return dt;
        }
        public static DataTable get_subCategory(int CategoryID)
        {
            TBL_Job_Category SubCategories = new TBL_Job_Category();
            DataTable dt;
            dt = SubCategories.Select_categories("Select_subcategories", CategoryID);
            return dt;
        }
        //
        public static DataTable get_PhotoGalleryGroups()
        {
            TBL_PasTime_Group_Photo Groups = new TBL_PasTime_Group_Photo();
            DataTable dt = new DataTable();
            dt = Groups.TBL_PasTime_Group_Photo_SP("Select_groups");
            return dt;
        }
        public static DataTable get_PhotoGallerySubGroups(int parentID)
        {
            TBL_PasTime_Group_Photo SubGroups = new TBL_PasTime_Group_Photo();
            DataTable dt = new DataTable();
            dt = SubGroups.TBL_PasTime_Group_Photo_SP("Select_SubGroups",parentID);
            return dt;
        }
    
        //
        public static DataTable get_ThemeGroups()
        {
            TBL_PasTime_Group_intersting_theme  Groups = new TBL_PasTime_Group_intersting_theme();
            DataTable dt = new DataTable();
            dt = Groups.TBL_PasTime_Group_intersting_theme_SP("Select_groups");
            return dt;
        }
        public static DataTable get_ThemeSubGroups(int parentID)
        {
            TBL_PasTime_Group_intersting_theme SubGroups = new TBL_PasTime_Group_intersting_theme();
            DataTable dt = new DataTable();
            dt = SubGroups.TBL_PasTime_Group_intersting_theme_SP("Select_SubGroups", parentID);
            return dt;
        }
        public static string Get_ParentOfGroup(int groupID)
        {
            TBL_PasTime_Group_intersting_theme get_parent = new TBL_PasTime_Group_intersting_theme();
            DataTable dt = new DataTable();
            dt = get_parent.TBL_PasTime_Group_intersting_theme_SP("get_parent", groupID);
            return dt.Rows[0]["Groupname"].ToString();
        }
        public static string Get_NameOfGroup(int groupID)
        {
            TBL_PasTime_Group_intersting_theme get_name = new TBL_PasTime_Group_intersting_theme();
            DataTable dt = new DataTable();
            dt = get_name.TBL_PasTime_Group_intersting_theme_SP("get_name", groupID);
            return dt.Rows[0]["Groupname"].ToString();
        }
        //photo
        public static string Get_ParentOfGroup_photo(int groupID)
        {
            TBL_PasTime_Group_Photo get_parent = new TBL_PasTime_Group_Photo();
            DataTable dt = new DataTable();
            dt = get_parent.TBL_PasTime_Group_Photo_SP("get_parent", groupID);
            return dt.Rows[0]["Groupname"].ToString();
        }
        public static string Get_NameOfGroup_photo(int groupID)
        {
            TBL_PasTime_Group_Photo get_name = new TBL_PasTime_Group_Photo();
            DataTable dt = new DataTable();
            dt = get_name.TBL_PasTime_Group_Photo_SP("get_name", groupID);
            return dt.Rows[0]["Groupname"].ToString();
        }

    }
}
