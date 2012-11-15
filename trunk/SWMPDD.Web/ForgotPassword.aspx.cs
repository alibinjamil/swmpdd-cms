using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Web.Business.Pages;
namespace SWMPDD.Web
{
    public partial class ForgotPassword : GenericPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public override string GetTabName()
        {
            return "SUPPORT";
        }
        protected void btnProceed_Click(object sender, EventArgs e)
        {
            SWMPDD.Data.User user = (from c in DatabaseContext.Users where c.UserName == tbUserName.Text.Trim() select c).FirstOrDefault();
            if (user != null)
            {
                SendEmail("You Password is : " + user.Password, "Your Password", user.Email);
                SetSuccessMessage("Email Sent.");
            }
            else {
                SetErrorMessage("Username does not exist.");
            }
        }
    }
}