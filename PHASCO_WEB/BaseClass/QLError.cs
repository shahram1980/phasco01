using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PHASCO_WEB.BaseClass
{
    public class QLError
    {
        public QLError()
        {
        }
        public QLError(string errorNo, string fieldName)
        {
            this.ErrorNo = errorNo;
            this.FieldName = fieldName;
        }

        public string FieldName
        {
            get { return fieldName; }
            set { fieldName = value; }
        }
        public string ErrorNo
        {
            get { return errorNo; }
            set { errorNo = value; }
        }

        private string fieldName;
        private string errorNo;
    }
}