using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Smart_Hotel_Restaurant
{
    public class Connection
    {
        public static string GetConnection()
        {
            return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        }
    }
}