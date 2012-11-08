using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Web.Business.Pages;

namespace SWMPDD.Web.Administer
{
    public partial class ChangeUserPassword : AuthenticatedPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["userId"] != null)
            {                
                if (IsPostBack == false)
                {
                    Data.User user = GetUser();
                    lblUserId.Text = user.UserName;
                    lblFullName.Text = user.Name;
                    lblEmail.Text = user.Email;
                    lblUserType.Text = user.UserType;
                    lblPosition.Text = user.UserTitle;
                    lblOfficeAddress.Text = user.Address;
                    lblCity.Text = user.City;
                    lblZipCode.Text = user.Zip;
                    lblTelephone.Text = user.Phone;
                    lblActive.Text = user.Active.ToString();
                }
            }
        }
        public override string GetTabName()
        {
            return "ADMINSTER";
        }
        
        private Data.User GetUser()
        {
            string userId = Request["userId"];
            return (from u in DatabaseContext.Users where u.UserId == userId select u).FirstOrDefault();
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (Valid())
            {
                Data.User user = GetUser();
                user.Password = tbPassword.Text;
                DatabaseContext.SaveChanges();
                SetSuccessMessage("Password changed successfully");
            }
        }
        private bool Valid()
        {
            if (tbPassword.Text != tbConfirmPassword.Text)
            {
                SetErrorMessage("Passwords do not match");
                return false;
            }
            return true;
        }
    }
}