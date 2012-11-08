using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using SWMPDD.Web.Business.Pages;
using SWMPDD.Web.Business.Common;
namespace SWMPDD.Web.Administer
{
    public partial class ChangePassword : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public override string GetTabName()
        {
            return "ADMINISTER";
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Data.User user = GetUser();
            if (Valid(user))
            {
                user.Password = tbPassword.Text;
                DatabaseContext.SaveChanges();
                SetSuccessMessage("Password changed successfully");
            }
        }
        private bool Valid(Data.User user)
        {
            if (tbExistingPassword.Text != user.Password)
            {
                SetErrorMessage("Existing Password does not match");
                return false;
            }
            if (tbPassword.Text != tbConfirmPassword.Text)
            {
                SetErrorMessage("Password does not match with Confirm Password");
                return false;
            }
            return true;
        }
        private Data.User GetUser()
        {
            return (from u in DatabaseContext.Users where u.UserId == LoggedInUser.UserId select u).FirstOrDefault();
        }
    }
}