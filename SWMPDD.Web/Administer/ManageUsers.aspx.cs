using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Web.Business.Pages;
using SWMPDD.Data;
namespace SWMPDD.Web.Administer
{
    public partial class ManageUsers : AuthenticatedPage
    {
        public override string GetTabName()
        {
            return "ADMINISTER";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected object GetEditURL(object userObj)
        {
            Data.User user = (Data.User)userObj;
            return "~/Administer/AddUser.aspx?userId=" + user.UserId;
        }
        protected object GetPasswordChangeURL(object userObj)
        {
            Data.User user = (Data.User)userObj;
            return "~/Administer/ChangeUserPassword.aspx?userId=" + user.UserId;
        }
    }
}