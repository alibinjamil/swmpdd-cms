using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Web.Business.Pages;
using SWMPDD.Web.Business.Common;

using SWMPDD.Data;


namespace SWMPDD.Web
{
    public partial class Login : GenericPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public override string GetTabName()
        {
            return "";
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User user = (from u in DatabaseContext.Users where u.UserName == tbUserName.Text && u.Password == tbPassword.Text select u).FirstOrDefault();
            if (user != null)
            {
                Session[Constants.Session.LOGGED_IN_USER] = user;
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}