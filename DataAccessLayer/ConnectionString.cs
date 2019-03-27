using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace DataAccessLayer
{
    public class ConnectionString
    {
        // web connection
        public static string Directory() { return @"Data Source=185.211.56.52;Initial Catalog=phasco_Directory;User ID=phasco.com_main;Password=11004455;"; }
        public static string Advertise() { return @"Data Source=185.211.56.52;Initial Catalog=phasco.com_ADV;User ID=phasco.com_main;Password=11004455;"; }
        public static string Article() { return @"Data Source=185.211.56.52;database=phasco.com_Article;uid=phasco.com_main;password=11004455;"; }
        public static string Bazar() { return @"Data Source=185.211.56.52;Initial Catalog=Phasco.com_Bazar;Persist Security Info=true;User ID=phasco.com_main;Password=11004455;"; }
        public static string Main() { return @"Data Source=185.211.56.52;Initial Catalog=phasco.com_main;User ID=phasco.com_main;Password=11004455;"; }
        public static string Quiz() { return @"Data Source=185.211.56.52;Initial Catalog=phasco.com_quiz;Persist Security Info=True;User ID=phasco.com_main;Password=11004455;"; }

        // Local Connaction
        //public static string Directory() { return @"Data Source=REFAH-TD-13\SQL2008R2_A;Initial Catalog=Phasco_main;Integrated Security=True"; }
        //public static string Advertise() { return @"Data Source=REFAH-TD-13\SQL2008R2_A;Initial Catalog=Phasco_main;Integrated Security=True"; }
        //public static string Article() { return @"Data Source=REFAH-TD-13\SQL2008R2_A;Initial Catalog=Phasco_main;Integrated Security=True"; }
        //public static string Bazar() { return @"Data Source=REFAH-TD-13\SQL2008R2_A;Initial Catalog=Phasco_main;Integrated Security=True"; }
        //public static string Main() { return @"Data Source=REFAH-TD-13\SQL2008R2_A;Initial Catalog=Phasco_main;Integrated Security=True"; }
        //public static string Quiz() { return @"Data Source=REFAH-TD-13\SQL2008R2_A;Initial Catalog=Phasco_main;Integrated Security=True"; }
    }
}
