using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Threading;
using System.Globalization;

namespace BiztBiz
{
    public class MultiLanguage
    {
        private static string[] themes = { "BiztBiz", "BiztBiz" };
        private MultiLanguage() { }

        
        public static void SetdefaultThemeANDCulture(Page page)
        {
            string dir = GetCurrentDirection().ToString();
            string culture = GetCurrentCulture();
            SetCurrentCulture(page, culture);
        }

        public static Direction GetCurrentDirection()
        {
            string culture = GetCurrentCulture();
            Direction dir = Direction.rtl;
            switch (culture)
            {
                case"fa-IR":
                    dir = Direction.rtl;
                    break;
                case "en-US":
                    dir = Direction.ltr;
                    break;
                default:
                    dir = Direction.rtl;
                    break;
            }
            return dir;            
        }

        /// <summary>
        /// returns current Culture like "fa-IR"
        /// </summary>
        /// <returns>string</returns>
        public static string GetCurrentCulture()
        {
            return "fa-IR";
        }

        public static void SetCurrentCulture(Page page,string culture)
        {
            CultureInfo ci;
            switch (culture)
            {
                case "fa-IR":
                    {
                        ci = new CultureInfo("fa-IR");
                        Thread.CurrentThread.CurrentCulture = ci;
                        Thread.CurrentThread.CurrentUICulture = ci;
                        page.Theme = themes[0];
                        break;
                    }
                case "en-US":
                    {
                        ci = new CultureInfo("en-US");
                        Thread.CurrentThread.CurrentCulture = ci;
                        Thread.CurrentThread.CurrentUICulture = ci;
                        page.Theme = themes[1];
                        break;
                    }
                default:
                    {
                        throw new InvalidExpressionException("Current Culture is invalid");
                        break;
                    }
            }
        }

        public enum Direction
        {
            rtl, ltr
        }
    }    
}
