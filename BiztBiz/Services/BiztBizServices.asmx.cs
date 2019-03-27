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

namespace BiztBiz.Services
{
    /// <summary>
    /// Summary description for BiztBiz.Services
    /// </summary>
    [System.Web.Script.Services.ScriptService]
    [WebService(Namespace = "http://BiztBiz.com/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class BiztBizServices : System.Web.Services.WebService
    {

        //[WebMethod(true)]
        //[ScriptMethod]
        //public string[] GetUserContactList(string prefixText, int count)
        //{

        //    RahbinaBusinessLogics.Contact contact = new RahbinaBusinessLogics.Contact();
        //    List<string> suggestions = new List<string>();
        //    DataTable dtUserContactList = contact.GetUserContactListByUserIDAndLatter(Utilities.ConverToNullableInt(SessionData.ActiveInstance.UserID), prefixText, count);

        //    for (int i = 0; i < dtUserContactList.Rows.Count; i++)
        //    {
        //        string strItem = AjaxControlToolkit.AutoCompleteExtender.CreateAutoCompleteItem
        //            (Utilities.ConverToNullableString(dtUserContactList.Rows[i]["FullName"]),
        //            Utilities.ConverToNullableString(dtUserContactList.Rows[i]["ContactUserID"]));
        //        suggestions.Add(strItem);
        //    }


        //    return suggestions.ToArray();
        //}


        [WebMethod]
        public CascadingDropDownNameValue[] GetCountry(
          string knownCategoryValues,
          string category)
        {
            TBL_State state = new TBL_State();
            DataTable dtCountry = state.TBL_State_Tra("select_country");
            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtCountry.Rows)
            {
                string country = Utility.ConverToNullableString(dr["StateName"]);
                int countryID = Utility.ConverToNullableInt(dr["StateID"]);
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
            TBL_State state = new TBL_State();
            DataTable dtCountry = state.TBL_State_Tra("select_state");
            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtCountry.Rows)
            {
                string country = Utility.ConverToNullableString(dr["StateName"]);
                int countryID = Utility.ConverToNullableInt(dr["StateID"]);
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
            TBL_State state = new TBL_State();

            StringDictionary kv =
          CascadingDropDown.ParseKnownCategoryValuesString(
              knownCategoryValues);
            int countryID;
            if (!kv.ContainsKey("Country") ||
                !Int32.TryParse(kv["Country"], out countryID))
            {
                return null;
            }
            DataTable dtState = state.TBL_State_Tra(countryID);
            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtState.Rows)
            {
                values.Add(new CascadingDropDownNameValue(
                  Utility.ConverToNullableString(dr["StateName"])
                  , Utility.ConverToNullableString(dr["StateID"])));
            }
            return values.ToArray();
        }

        [WebMethod]
        public CascadingDropDownNameValue[] GetCityForState(
          string knownCategoryValues,
          string category)
        {
            TBL_State state = new TBL_State();

            StringDictionary kv =
              CascadingDropDown.ParseKnownCategoryValuesString(
              knownCategoryValues);
            int stateID;
            if (!kv.ContainsKey("State") ||
                !Int32.TryParse(kv["State"], out stateID))
            {
                return null;
            }

            DataTable dtCity = state.TBL_State_Tra(stateID);

            List<CascadingDropDownNameValue> values =
              new List<CascadingDropDownNameValue>();
            foreach (DataRow dr in dtCity.Rows)
            {
                values.Add(new CascadingDropDownNameValue(
                  Utility.ConverToNullableString(dr["StateName"])
                  , Utility.ConverToNullableString(dr["StateID"])));
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
                string categoryName = Utility.ConverToNullableString(dr["Subject_ir"]);
                int categoryID = Utility.ConverToNullableInt(dr["id"]);
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
                  Utility.ConverToNullableString(dr["Subject_ir"])
                  , Utility.ConverToNullableString(dr["id"])));
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
                  Utility.ConverToNullableString(dr["Subject_ir"])
                  , Utility.ConverToNullableString(dr["id"])));
            }
            return values.ToArray();
        }


        [WebMethod]
        public string GetCategoryList(string catid)
        {
            TBL_Categories Categories = new TBL_Categories();
            DataTable dtSubMainCategory = Categories.TBL_Categories_Tra("select_BySubID", Utility.ConverToNullableInt(catid));

            string cats = string.Empty;
            foreach (DataRow dRow in dtSubMainCategory.Rows)
            {
                cats += Utility.ConverToNullableInt(dRow["ID"]) + ":" + Utility.ConverToNullableString(dRow["Name"]) + ",";
            }
            return cats;
        }



    }
}
