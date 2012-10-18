using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using SWMPDD.Web.Business.Common;
using SWMPDD.Data;

namespace SWMPDD.Web.Business.Pages
{
    public class AuthenticatedPage : GenericPage
    {        
        protected override void OnLoad(EventArgs e)
        {
            if (Session[Constants.Session.LOGGED_IN_USER] == null)
            {
                RedirectToLogin();
            }
            else
            {
                base.OnLoad(e);
            }
        }

        protected SWMPDD.Data.User LoggedIsUser
        {
            get
            {
                return (User)Session[Constants.Session.LOGGED_IN_USER];
            }
        }

        protected void RedirectToLogin()
        {
            Session[Constants.Session.RETURN_URL] = Request.AppRelativeCurrentExecutionFilePath;
            String query=Request.QueryString.ToString();
            if (!query.Equals(""))
            {
                Session[Constants.Session.RETURN_URL] += "?" + Request.QueryString;
            }
            Response.Redirect("~/Login.aspx?login=true");            
        }
    }
}