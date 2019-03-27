using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Collections.Generic;
using System.Text;
namespace BusinessAccessLayer.BIZ
{
    public static class Utilities
    {
        public static ArrayList arQueryString = new ArrayList();

        public enum UserRule
        {
            Administrator = 1,
            Oil = 2,
            MaliSetad = 3,
            Operator = 4,
            Contractor = 5
        }

        public enum SessionStatus
        {
            InVeiw = 0,
            InEdit = 1,
            FinalRegister = 2
        }
        public enum MembersMode
        {
            Null = 0,
            Personel = 1,
            Groups = 2
        }
        public enum StateLevel
        {
            Country = 1,
            Province = 2,
            City = 3,
            Village = 4
        }
        public enum Month
        {
            Farvardin = 1,
            Ordibehesht = 2,
            Khordad = 3,
            Tir = 4,
            Mordad = 5,
            Shahrivar = 6,
            Mehr = 7,
            Aban = 8,
            Azar = 9,
            Dey = 10,
            Bahman = 11,
            Esfand = 12
        }


        public static DataTable GetKeyWord(string keywords, string clumnName, string splitchar)
        {
            string[] splitKeyword;
            DataTable dtKeyWords = new DataTable();
            dtKeyWords.Columns.Add(clumnName);

            if (!string.IsNullOrEmpty(keywords))
            {
                splitKeyword = keywords.Split(new string[] { splitchar }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < splitKeyword.Length; i++)
                {
                    DataRow rowKeyWord = dtKeyWords.NewRow();
                    rowKeyWord[clumnName] = splitKeyword[i];
                    dtKeyWords.Rows.Add(rowKeyWord);
                }
            }
            else
            {
                DataRow rowKeyWord = dtKeyWords.NewRow();
                rowKeyWord[clumnName] = string.Empty;
                dtKeyWords.Rows.Add(rowKeyWord);
            }

            return dtKeyWords;
        }

        public static DataTable GetKeyWord(string keywords, string clumnName)
        {
            string[] splitKeyword;
            DataTable dtKeyWords = new DataTable();
            dtKeyWords.Columns.Add(clumnName);

            if (!string.IsNullOrEmpty(keywords))
            {
                splitKeyword = keywords.Split(new string[] { "%&%" }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < splitKeyword.Length; i++)
                {
                    DataRow rowKeyWord = dtKeyWords.NewRow();
                    rowKeyWord[clumnName] = splitKeyword[i];
                    dtKeyWords.Rows.Add(rowKeyWord);
                }
            }
            else
            {
                DataRow rowKeyWord = dtKeyWords.NewRow();
                rowKeyWord[clumnName] = string.Empty;
                dtKeyWords.Rows.Add(rowKeyWord);
            }

            return dtKeyWords;
        }

        public static DataTable GetKeyWord(string keywords)
        {
            string[] splitKeyword;
            DataTable dtKeyWords = new DataTable();
            dtKeyWords.Columns.Add();

            if (!string.IsNullOrEmpty(keywords))
            {
                splitKeyword = keywords.Split(new string[] { "%&%" }, StringSplitOptions.RemoveEmptyEntries);
                for (int i = 0; i < splitKeyword.Length; i++)
                {
                    DataRow rowKeyWord = dtKeyWords.NewRow();
                    rowKeyWord[0] = splitKeyword[i];
                    dtKeyWords.Rows.Add(rowKeyWord);
                }
            }
            else
            {
                DataRow rowKeyWord = dtKeyWords.NewRow();
                rowKeyWord[0] = string.Empty;
                dtKeyWords.Rows.Add(rowKeyWord);
            }

            return dtKeyWords;
        }

        public static void ClearControls(Control c)
        {
            foreach (Control ctl in c.Controls)
            {
                if (ctl is TextBox)
                {
                    TextBox txt = ctl as TextBox;
                    txt.Text = string.Empty;
                }
                else if (ctl is DropDownList)
                {
                    DropDownList drp = ctl as DropDownList;
                    if (drp.Items.Count > 0)
                        drp.SelectedIndex = 0;
                }
                else if (ctl.Controls.Count > 0)
                {
                    ClearControls(ctl);
                }

            }
        }


        /// <summary>
        /// Conver DateTime From DB To Control
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static DateTime? ConverToNullableDateTime(object obj)
        {
            DateTime? date = null;
            if (obj != null && obj != DBNull.Value)
            {
                date = Convert.ToDateTime(obj);
            }
            return date;
        }

        public static DateTime ConverToDateTime(object obj)
        {
            DateTime date = DateTime.Now;
            if (obj != null && obj != DBNull.Value && obj.ToString() != string.Empty)
            {
                date = Convert.ToDateTime(obj);
            }
            return date;
        }

        /// <summary>
        /// Convert DateTime From Control To DB
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static object ConvertDateTimeForDB(DateTime? date)
        {
            object obj = null;
            if (date != null)
                obj = date.Value;
            else
                obj = DBNull.Value;

            return obj;
        }


        /// <summary>
        /// Conver Int From DB To Control
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static int ConverToNullableInt(object obj)
        {
            int i = 0;
            if (obj != null && obj != DBNull.Value && !string.IsNullOrEmpty(obj.ToString()))
            {
                int.TryParse(obj.ToString(), out i);
            }
            return i;
        }

        /// <summary>
        /// Convert Int From Control To DB
        /// </summary>
        /// <param name="i"></param>
        /// <returns></returns>
        public static object ConvertIntForDB(object i)
        {
            object obj = null;
            int integer = 0;
            if (i != null && !string.IsNullOrEmpty(i.ToString()))
            {
                if (int.TryParse(i.ToString(), out integer))
                    obj = integer;
                else
                    obj = DBNull.Value;
            }
            else
                obj = DBNull.Value;

            return obj;
        }

        /// <summary>
        /// Conver String From DB To Control
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string ConverToNullableString(object obj)
        {
            string st = string.Empty;
            if (obj != null && obj != DBNull.Value && !string.IsNullOrEmpty(obj.ToString()))
            {
                st = Convert.ToString(obj);
            }
            return st;
        }

        /// <summary>
        /// Convert String From Control To DB
        /// </summary>
        /// <param name="st"></param>
        /// <returns></returns>
        public static object ConvertStringForDB(object st)
        {
            object obj = null;
            if (st != null && !string.IsNullOrEmpty(st.ToString()))
                obj = st;
            else
                obj = DBNull.Value;

            return obj;
        }

        /// <summary>
        /// Conver String From DB To Control For DropDown
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string ConverToNullableStringForDDL(object obj)
        {
            string st = "0";
            if (obj != null && obj != DBNull.Value && !string.IsNullOrEmpty(obj.ToString()))
            {
                st = Convert.ToString(obj);
            }
            return st;
        }

        /// <summary>
        /// Convert String From Control To DB For DropDown
        /// </summary>
        /// <param name="st"></param>
        /// <returns></returns>
        public static object ConvertStringForDBForDDL(object st)
        {
            object obj = null;
            if (st != null && !string.IsNullOrEmpty(st.ToString()) && st.ToString() != "0")
                obj = st;
            else
                obj = DBNull.Value;

            return obj;
        }

        public static object ConvertStringForDBForDDLNotDBNull(string st)
        {
            object obj = null;
            if (st != null && !string.IsNullOrEmpty(st.ToString()) && st.ToString() != "0")
                obj = st;
            else
                obj = "0";

            return obj;
        }

        public static string ConverToNullableBoolean(object obj)
        {
            bool b = false;
            string st = string.Empty;
            if (obj != null && obj != DBNull.Value && !string.IsNullOrEmpty(obj.ToString()))
            {
                b = Convert.ToBoolean(obj);
                if (b)
                    st = "True";
                else
                    st = "False";
            }
            return st;
        }

        public static bool ConverToBoolean(object obj)
        {
            bool b = false;
            if (obj != null && obj != DBNull.Value && !string.IsNullOrEmpty(obj.ToString()))
            {
                b = Convert.ToBoolean(obj);
            }
            return b;
        }

        public static object ConvertBooleanForDB(object b)
        {
            object obj = null;
            if (b != null && !string.IsNullOrEmpty(b.ToString()))
                obj = b;
            else
                obj = DBNull.Value;

            return obj;
        }

        public static int ConvertBooleanToInt(bool b)
        {
            int obj = 0;
            if (b != null && !string.IsNullOrEmpty(b.ToString()))
            {
                if (b == true)
                    obj = 1;

            }
            return obj;
        }

        public static bool ConvertIntToBoolean(object b)
        {
            bool obj = false;
            if (b != null && !string.IsNullOrEmpty(b.ToString()) && b != DBNull.Value)
            {
                if (b.ToString() == "1")
                    obj = true;

            }
            return obj;
        }

        public static string GetRedirectUrl(string pageUrl, params string[] param)
        {
            string redirectUrl = string.Empty;
            redirectUrl += pageUrl;
            foreach (string p in param)
            {

            }
            return redirectUrl;
        }

        public static string GetStringTime(System.DateTime dateTime, int timeMode)
        {
            string resualt = "";
            try
            {
                int Hour = dateTime.Hour;
                int Minute = dateTime.Minute;
                int Second = dateTime.Second;
                int Millisecond = dateTime.Millisecond;
                switch (timeMode)
                {
                    case 1:
                        resualt = (Hour.ToString());
                        break;
                    case 2:
                        resualt = (Hour.ToString() + ":" + Minute.ToString());
                        break;
                    case 3:
                        resualt = (Hour.ToString() + ":" + Minute.ToString() + ":" + Second.ToString());
                        break;
                    case 4:
                        resualt = (Hour.ToString() + ":" + Minute.ToString() + ":" + Second.ToString() + ":" + Millisecond.ToString());
                        break;
                    default:
                        break;
                }
                return (resualt);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        //IFormatProvider cultureIR = new CultureInfo("fa-IR", true);
        //string myDateTimeIranValue = "    05/05/1387 12:15:12";
        //DateTime myDateTimeIR =
        //    DateTime.Parse(myDateTimeIranValue,
        //                   cultureIR,
        //                   DateTimeStyles.NoCurrentDateDefault);

        public static DateTime GetTime(string strTime)
        {
            int hour = 0;
            int minut = 0;
            if (strTime.Contains(":"))
            {
                hour = Convert.ToInt32(strTime.Split(':')[0]);
                minut = Convert.ToInt32(strTime.Split(':')[1]);
            }
            else
                hour = Convert.ToInt32(strTime);
            DateTime dtmTemp = new DateTime(1899, 12, 30, hour, minut, 0);
            //dtmTemp = dtmTemp.AddYears(1899);
            //dtmTemp = dtmTemp.AddMonths(1);
            //dtmTemp = dtmTemp.AddDays(1);
            //dtmTemp = dtmTemp.AddHours(double.Parse(strTime.Trim()));
            return (dtmTemp);
        }

        public static bool CompareGreaterTwoDates(DateTime dateTimeGreater, DateTime dateTimeSmaller)
        {
            return (dateTimeGreater > dateTimeSmaller);
        }

        public static bool CompareGreaterTwoDates(string dateTimeGreater, string dateTimeSmaller)
        {
            bool blnResult = false;
            DateTime dtmTempGreater = new DateTime(1870, 1, 1, 1, 1, 0);
            DateTime dtmTempSmaller = new DateTime(1870, 1, 1, 1, 1, 0);
            if (!string.IsNullOrEmpty(dateTimeGreater))
                dtmTempGreater = QLink.Helpers.DateHelper.JalaaliToGregorian(dateTimeGreater, 3);
            if (!string.IsNullOrEmpty(dateTimeSmaller))
                dtmTempSmaller = QLink.Helpers.DateHelper.JalaaliToGregorian(dateTimeSmaller, 3);

            if (dtmTempGreater.Year != 1870 && dtmTempSmaller.Year != 1870)
                blnResult = dtmTempGreater > dtmTempSmaller;

            return blnResult;
        }

        //public static bool CompareGreaterTwoDates(DateTime dateTimeGreater, string dateTimeSmaller)
        //{
        //    bool blnResult = false;

        //    DateTime dtmTempSmaller = new DateTime(1870, 1, 1, 1, 1, 0); ;

        //    if (!string.IsNullOrEmpty(dateTimeSmaller))
        //        dtmTempSmaller = QLink.Helpers.DateHelper.JalaaliToGregorian(dateTimeSmaller, 3);

        //    if (dateTimeGreater != null && dtmTempSmaller.Year != 1870)
        //        blnResult = dateTimeGreater > dtmTempSmaller;

        //    return blnResult;
        //}

        //public static DateTime GetNextGregorianDate(string currentDate, int nextDate, string nextHour)
        //{
        //    DateTime dtmTemp = new DateTime();

        //    dtmTemp = QLink.Helpers.DateHelper.JalaaliToGregorian(currentDate, 3);
        //    dtmTemp = dtmTemp.AddDays(nextDate);

        //    int intMonth = dtmTemp.Month;
        //    int intDay = dtmTemp.Day;
        //    int intYear = dtmTemp.Year;
        //    int hour = dtmTemp.Hour;
        //    int minut = dtmTemp.Minute;
        //    if (nextHour.Contains(":"))
        //    {
        //        hour = Convert.ToInt32(nextHour.Split(':')[0]);
        //        minut = Convert.ToInt32(nextHour.Split(':')[1]);
        //    }
        //    else
        //        hour = Convert.ToInt32(nextHour);

        //    DateTime dtmTemp2 = new DateTime(intYear, intMonth, intDay, hour, minut, 0);

        //    return (dtmTemp2);
        //}

        public static string GetStringGregorianDate(string jalaliDate, int mode)
        {
            string strDate;
            DateTime dtm = new DateTime();
            dtm = QLink.Helpers.DateHelper.JalaaliToGregorian(jalaliDate, mode);
            strDate = dtm.Year.ToString() + "/" + dtm.Month + "/" + dtm.Day;
            return (strDate);
        }

        public static string GetStringDate4Grid(string dtSessionDate)
        {
            return (QLink.Helpers.DateHelper.GregorianToJalaali(dtSessionDate, 3));
        }

        public static string GetStringTime4Grid(string dtSessionTime)
        {
            return (Utilities.GetStringTime(Convert.ToDateTime(dtSessionTime), 2));
        }

        public static void EnabledButton(Button btnTemp, DataTable tblTemp)
        {
            if (tblTemp.Rows.Count > 0)
                btnTemp.Enabled = true;
            else
                btnTemp.Enabled = false;
        }

        public static int GetSelectedItemsCount(ListBox lbxTemp)
        {
            int counter = 0;
            ListItem lim = new ListItem();
            for (int i = 0; i < lbxTemp.Items.Count; i++)
            {
                if (lbxTemp.Items[i].Selected)
                    counter = counter + 1;
            }
            return counter;
        }

        public static void MoveItems(ListBox lbxSource, ListBox lbxDestination)
        {
            if (lbxSource.SelectedIndex == -1) return;
            for (int i = lbxSource.Items.Count - 1; i >= 0; i--)
            {
                if (lbxSource.Items[i].Selected)
                {
                    ListItem item = lbxSource.Items[i];
                    item.Selected = false;
                    lbxDestination.Items.Add(item);
                    lbxSource.Items.Remove(item);
                }
            }
        }

        public static void MoveItems(CheckBoxList cbxSource, CheckBoxList cbxDestination)
        {
            if (cbxSource.SelectedIndex == -1) return;
            for (int i = cbxSource.Items.Count - 1; i >= 0; i--)
            {
                if (cbxSource.Items[i].Selected)
                {
                    ListItem item = cbxSource.Items[i];
                    item.Selected = false;
                    cbxDestination.Items.Add(item);
                    cbxSource.Items.Remove(item);
                }
            }
        }

        //public static void GenerateDataGridViewData(ref GridView grd,
        //                                            QLDataTableBase dt)
        //{
        //    BoundField bField = null;
        //    //
        //    foreach (DataColumn dc in dt.Columns)
        //    {
        //        bField = new BoundField();
        //        bField.DataField = dc.ColumnName;
        //        bField.HeaderText = dc.ColumnName;
        //        grd.Columns.Add(bField);
        //    }
        //}

        public static void InsertDataGridViewSelectColumn(ref GridView grd,
                                                          int index,
                                                          string text)
        {
            TemplateField tmpField = new TemplateField();
            tmpField.ItemTemplate = new GridViewTemplate(text);
            grd.Columns.Insert(index, tmpField);
        }

        public static void InsertDataGridViewButton(ref GridView grd,
                                                    int index,
                                                    string commandName,
                                                    string text)
        {
            ButtonField btnField = new ButtonField();
            btnField.CommandName = commandName;
            btnField.Text = text;
            grd.Columns.Add(btnField);
        }

        public static void AddToQueryString(string keys, string values)
        {
            object[] qrs = new object[2] { keys, values };
            arQueryString.Add(qrs);
        }

        public static void ClearQueryString()
        {
            arQueryString.Clear();
        }
    }

    internal class GridViewTemplate : ITemplate
    {
        private string columnName;
        //
        public GridViewTemplate(string colname)
        {
            columnName = colname;
        }

        public void InstantiateIn(System.Web.UI.Control container)
        {
            CheckBox chk = new CheckBox();
            chk.Text = columnName;
            chk.ID = columnName;
            container.Controls.Add(chk);
        }
    }

    public static class SecurityHelpers
    {
        private static int RandomNumber(int min, int max)
        {
            Random random = new Random();
            return random.Next(min, max);
        }
        private static string RandomString(int size, bool lowerCase)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }

        public static string GetPassword()
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(RandomString(2, true));
            builder.Append(RandomNumber(10, 99));
            builder.Append(RandomString(2, false));
            builder.Append(RandomNumber(100, 999));
            return builder.ToString();
        }
    }

    [Serializable]
    public class QueryStrings
    {
        public QueryStrings()
        {
        }
        public QueryStrings(string key, string values)
        {
            this.Key = key;
            this.Value = values;
        }

        public string Key
        {
            get { return key; }
            set { key = value; }
        }
        public string Value
        {
            get { return values; }
            set { values = value; }
        }

        private string key;
        private string values;
    }
}