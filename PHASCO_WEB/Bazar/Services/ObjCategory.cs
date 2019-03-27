using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BiztBiz.Services
{
    [Serializable]
    public class ObjCategory
    {
        public ObjCategory()
        {
        }

        public ObjCategory(int id, string name)
        {
            this.ID = id;
            this.Name = name;

        }

        int _id;
        public int ID
        {
            get
            {
                return _id;
            }
            set
            {
                _id = value;
            }
        }

        string _name;
        public string Name
        {
            get
            {
                return _name;
            }
            set
            {
                _name = value;
            }
        }
    }
}