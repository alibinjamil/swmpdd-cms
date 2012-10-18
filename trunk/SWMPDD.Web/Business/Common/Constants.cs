using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SWMPDD.Web.Business.Common
{
    public static class Constants
    {
        public static class Session
        {
            public static string LOGGED_IN_USER = "LOGGED_IN_USER";
            public static string RETURN_URL = "RETURN_URL";
        }
        public static class DetailTypes
        {
            public static string SERVICES_NEEDED = "S";
            public static string ADDITIONAL_PERTINENT_INFO = "A";
            public static string COMMENTS = "C";
        }
    }
}