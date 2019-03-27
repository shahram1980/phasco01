using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace BusinessAccessLayer
{
    public class PHASCOUtility
    {
        public static ArrayList arQueryString = new ArrayList();

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
            if (obj != null && obj != DBNull.Value)
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
        /// Conver Float From DB To Control
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static float ConverToNullableFloat(object obj)
        {
            float f = 0;
            if (obj != null && obj != DBNull.Value && !string.IsNullOrEmpty(obj.ToString()))
            {
                float.TryParse(obj.ToString(), out f);
            }
            return f;
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
        /// Convert float From Control To DB
        /// </summary>
        /// <param name="i"></param>
        /// <returns></returns>
        public static object ConvertFloatForDB(object i)
        {
            object obj = null;
            float integer = 0;
            if (i != null && !string.IsNullOrEmpty(i.ToString()))
            {
                if (float.TryParse(i.ToString(), out integer))
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

        public static object ConvertStringForDBForDDLNotDBNull(string st)
        {
            object obj = null;
            if (st != null && !string.IsNullOrEmpty(st.ToString()) && st.ToString() != "0")
                obj = st;
            else
                obj = "0";

            return obj;
        }

        public static int ConvertintForDBForDDLNotDBNull(string st)
        {
            int obj = 0;
            if (st != null && !string.IsNullOrEmpty(st.ToString()) && st.ToString() != "0")
                obj = ConverToNullableInt(st);
            else
                obj = 0;

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
        public static string ConverToCurrencyFormat(object Mony)
        {

            decimal dollarAmount = Convert.ToDecimal(Mony.ToString());
            return dollarAmount.ToString("#,#");//   String.Format("c", total_); 
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

            return (dtmTemp);
        }

        public static bool CompareGreaterTwoDates(DateTime dateTimeGreater, DateTime dateTimeSmaller)
        {
            return (dateTimeGreater > dateTimeSmaller);
        }

        //public static bool CompareGreaterTwoDates(string dateTimeGreater, string dateTimeSmaller)
        //{
        //    bool blnResult = false;
        //    DateTime dtmTempGreater = new DateTime(1870, 1, 1, 1, 1, 0);
        //    DateTime dtmTempSmaller = new DateTime(1870, 1, 1, 1, 1, 0);
        //    if (!string.IsNullOrEmpty(dateTimeGreater))
        //        dtmTempGreater = QLink.Helpers.DateHelper.JalaaliToGregorian(dateTimeGreater, 3);
        //    if (!string.IsNullOrEmpty(dateTimeSmaller))
        //        dtmTempSmaller = QLink.Helpers.DateHelper.JalaaliToGregorian(dateTimeSmaller, 3);

        //    if (dtmTempGreater.Year != 1870 && dtmTempSmaller.Year != 1870)
        //        blnResult = dtmTempGreater > dtmTempSmaller;

        //    return blnResult;
        //}

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

        //public static string GetStringGregorianDate(string jalaliDate, int mode)
        //{
        //    string strDate;
        //    DateTime dtm = new DateTime();
        //    dtm = QLink.Helpers.DateHelper.JalaaliToGregorian(jalaliDate, mode);
        //    strDate = dtm.Year.ToString() + "/" + dtm.Month + "/" + dtm.Day;
        //    return (strDate);
        //}

        //public static string GetStringDate4Grid(string dtSessionDate)
        //{
        //    return (QLink.Helpers.DateHelper.GregorianToJalaali(dtSessionDate, 3));
        //}

        public static void AddToQueryString(string keys, string values)
        {
            object[] qrs = new object[2] { keys, values };
            arQueryString.Add(qrs);
        }

        public static void ClearQueryString()
        {
            arQueryString.Clear();
        }

        public static string Right(string value, int length)
        {
            return value.Substring(value.Length - length);
        }

        /// <summary>
        /// Make Keyword from String
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string KeyWordMaker(object obj, int count, string Url)
        {
            string ret_ = "<ul  class='tag-widget-list'>";
            string str = obj.ToString().Replace(":", " ");
            str = str.ToString().Replace(":", " ");
            str = str.ToString().Replace("\n", " ");
            str = str.ToString().Replace("\r", " ");
            str = str.ToString().Replace("\n", " ");
            str = str.ToString().Replace("\r", " ");
            str = str.ToString().Replace("(", " ");
            str = str.ToString().Replace(")", " ");

            ListItem li = new ListItem();
            string[] split = str.Split(new Char[] { ' ', ',', '.', ':', '\t' });

            if (count > split.Length)
                count = split.Length;

            Random r = new Random();
            int rndRange = split.Length;

            for (int i = 0; i < count; i++)
            {
                int rInt = r.Next(1, rndRange); //for ints  
                if (split[rInt].Trim() != "" && split[rInt].Length > 2 && ret_.IndexOf(split[rInt]) == -1)
                {
                    ret_ = ret_ + "<li><a href='" + Url + "&t=" + split[rInt] + "' >" + split[rInt] + "</a></li>";
                }
            }
            return ret_ + "</ul>";
        }

        /// <summary>
        /// Convert String From Control To DB For DropDown
        /// </summary>
        /// <param name="st"></param>
        /// <returns></returns>
        public static string GetShamsiDate(object date)
        {
            string sdate = string.Empty;
            if (!string.IsNullOrEmpty(date.ToString()))
                sdate = QLink.Helpers.DateHelper.GregorianToJalaali(date.ToString(), 3);
            return sdate;
        }

        public static string Mss_Date(string date)
        {
            DateTime dtm = new DateTime();
            dtm = Convert.ToDateTime(date);
            Persia.SunDate sunDate = Persia.Calendar.ConvertToPersian(dtm);

            return sunDate.Weekday.ToString();
        }

        public static string cleanHtmlText(string input)
        {
            input  = Regex.Replace(input, "&.*?;", "");
            return Regex.Replace(input, "<.*?>", "");

        }


    }
}
