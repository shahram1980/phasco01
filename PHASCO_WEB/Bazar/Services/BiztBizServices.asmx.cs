using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data;
using System.Collections.Specialized;
using AjaxControlToolkit;

using DataAccessLayer.BIZ;
using DataAccessLayer.DIRECTORY;
using BusinessAccessLayer;

namespace BiztBiz.Services
{
    /// <summary>
    /// Summary description for BiztBiz.Services
    /// </summary>
    [System.Web.Script.Services.ScriptService]
    [WebService(Namespace = "http://phasco.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class BiztBizServices : System.Web.Services.WebService
    {

 


        [WebMethod]
        public CascadingDropDownNameValue[] GetCountry(
          string knownCategoryValues,
          string category)
        {
            Tbl_state state = new Tbl_state();
            DataTable dtCountry = state.T_state_Tra("select_country");
            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtCountry.Rows)
            {
                string country = PHASCOUtility.ConverToNullableString(dr["Satate"]);
                int countryID = PHASCOUtility.ConverToNullableInt(dr["ID"]);
                values.Add(new CascadingDropDownNameValue(
                 country, countryID.ToString()));
            }
            return values.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetState(
          string knownCategoryValues,
          string category)
        {
            Tbl_state state = new Tbl_state();
            DataTable dtCountry =   state.T_state_Tra("select_state");
            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();

                foreach (DataRow dr in dtCountry.Rows)
                {
                    string country = PHASCOUtility.ConverToNullableString(dr["Satate"]);
                    int countryID = PHASCOUtility.ConverToNullableInt(dr["ID"]);
                    values.Add(new CascadingDropDownNameValue(
                     country, countryID.ToString()));
                }
            return values.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetStateForCountry(
          string knownCategoryValues,
          string category)
        {
            Tbl_state state = new Tbl_state();

            StringDictionary kv =
          CascadingDropDown.ParseKnownCategoryValuesString(
              knownCategoryValues);
            int countryID;
            if (!kv.ContainsKey("Country") ||
                !Int32.TryParse(kv["Country"], out countryID))
            {
                return null;
            }
            DataTable dtState = state.T_state_Tra("selectName_byParentID", countryID);
            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtState.Rows)
            {
                values.Add(new CascadingDropDownNameValue(
                  PHASCOUtility.ConverToNullableString(dr["Satate"])
                  , PHASCOUtility.ConverToNullableString(dr["ID"])));
            }
            return values.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetCityForState(
          string knownCategoryValues,
          string category)
        {
            Tbl_state state = new Tbl_state();

            StringDictionary kv =
              CascadingDropDown.ParseKnownCategoryValuesString(
              knownCategoryValues);
            int ID;
            if (!kv.ContainsKey("State") ||
                !Int32.TryParse(kv["State"], out ID))
            {
                return null;
            }

            DataTable dtCity = state.T_state_Tra("selectName_byParentID",ID);
            int ss = dtCity.Rows.Count;
            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtCity.Rows)
            {
                values.Add(new CascadingDropDownNameValue(
                  PHASCOUtility.ConverToNullableString(dr["Satate"])
                  , PHASCOUtility.ConverToNullableString(dr["id"])));
            }
            return values.ToArray();
        }


        [WebMethod]
        public CascadingDropDownNameValue[] GetCategory(
          string knownCategoryValues,
          string category)
        {
            TBL_Categories Category = new TBL_Categories();
            DataTable dtCategory = Category.TBL_Categories_Tra("select_L1_fa");
            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtCategory.Rows)
            {
                string categoryName = PHASCOUtility.ConverToNullableString(dr["Subject_ir"]);
                int categoryID = PHASCOUtility.ConverToNullableInt(dr["id"]);
                values.Add(new CascadingDropDownNameValue(
                 categoryName, categoryID.ToString()));
            }
            return values.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetSubCategory(
          string knownCategoryValues,
          string category)
        {
            TBL_Categories Category = new TBL_Categories();

            StringDictionary kv =
              CascadingDropDown.ParseKnownCategoryValuesString(
              knownCategoryValues);
            int categoryID;
            if (!kv.ContainsKey("Category") ||
                !Int32.TryParse(kv["Category"], out categoryID))
            {
                return null;
            }

            DataTable dtSubCategory = Category.TBL_Categories_Tra_Cascade(categoryID);

            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtSubCategory.Rows)
            {
                values.Add(new CascadingDropDownNameValue(
                  PHASCOUtility.ConverToNullableString(dr["Subject_ir"])
                  , PHASCOUtility.ConverToNullableString(dr["id"])));
            }
            return values.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetSub2Category(
          string knownCategoryValues,
          string category)
        {
            TBL_Categories Category = new TBL_Categories();

            StringDictionary kv =
              CascadingDropDown.ParseKnownCategoryValuesString(
              knownCategoryValues);
            int categoryID;
            if (!kv.ContainsKey("SubCategory") ||
                !Int32.TryParse(kv["SubCategory"], out categoryID))
            {
                return null;
            }

            DataTable dtSubCategory = Category.TBL_Categories_Tra_Cascade(categoryID);

            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtSubCategory.Rows)
            {
                values.Add(new CascadingDropDownNameValue(
                  PHASCOUtility.ConverToNullableString(dr["Subject_ir"])
                  , PHASCOUtility.ConverToNullableString(dr["id"])));
            }
            return values.ToArray();
        }


        [WebMethod]
        public string GetCategoryList(string catid)
        {
            TBL_Categories Categories = new TBL_Categories();
            DataTable dtSubMainCategory = Categories.TBL_Categories_Tra("select_BySubID", PHASCOUtility.ConverToNullableInt(catid));

            string cats = string.Empty;
            foreach (DataRow dRow in dtSubMainCategory.Rows)
            {
                cats += PHASCOUtility.ConverToNullableInt(dRow["ID"]) + ":" + PHASCOUtility.ConverToNullableString(dRow["Name"]) + ",";
            }
            return cats;
        }



    }
}
