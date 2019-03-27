using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PHASCO_Shopping.Component
{
    public class SetPageCSS
    {
        public static string Stylepage(string Culture)
        {
            if (Culture == "English (United States)")
                return "../css/main.css";
            if (Culture == "Persian (Iran)" || Culture == "Persian")
                return "../css/mainfa.css";
            if (Culture == "Chinese (People's Republic of China)")
                return "../css/mainch.css";

            return "../css/mainfa.css";
        }
    }
}