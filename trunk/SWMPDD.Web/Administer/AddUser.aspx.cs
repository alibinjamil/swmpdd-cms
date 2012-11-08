using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Web.Business.Pages;
namespace SWMPDD.Web.Administer
{
    public partial class AddUser : AuthenticatedPage
    {
        bool editMode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            editMode = (Request["userId"] != null);
            pnlPassword.Visible = !editMode;
            if (IsPostBack == false)
            {
                tbUserId.ReadOnly = editMode;
                if (editMode)
                {
                    Data.User user = GetUser();
                    tbUserId.Text = user.UserName;
                    tbFullNAme.Text = user.Name;
                    tbEmail.Text = user.Email;
                    ddlUserType.SelectedValue = user.UserType;
                    tbPosition.Text = user.UserTitle;
                    tbOfficeAddress.Text = user.Address;
                    tbCity.Text = user.City;
                    tbZipCode.Text = user.Zip;
                    tbTelephone.Text = user.Phone;
                    ddlActive.Text = user.Active.ToString();
                }
            }
        }
        public override string GetTabName()
        {
            return "ADMINISTER";
        }
        private bool Validate()
        {
            if(editMode == false && tbPassword.Text != tbConfirmPassword.Text)
            {
                SetErrorMessage("Passwords do not match");
                return false;
            }
            return true;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Validate())
            {
                Data.User user = null;
                if (editMode == false)
                {
                    user = new Data.User();
                    user.Password = tbPassword.Text;
                }
                else
                {
                    user = GetUser();
                }
                user.UserId = tbUserId.Text;
                user.Name = tbFullNAme.Text;
                user.Email = tbEmail.Text;
                user.UserType = ddlUserType.SelectedValue;
                user.UserTitle = tbPosition.Text;
                user.Address = tbOfficeAddress.Text;
                user.City = tbCity.Text;
                user.State = "MS";
                user.Zip = tbZipCode.Text;
                user.Phone = tbTelephone.Text;
                user.Active = bool.Parse(ddlActive.SelectedValue);
                if (editMode == false)
                {
                    user.CreationTime = DateTime.Now;
                    user.CreationUser = LoggedInUser.UserName;
                    DatabaseContext.AddToUsers(user);
                }
                else
                {
                    user.LastupdateUser = LoggedInUser.UserName;
                    user.LastUpdateTime = DateTime.Now;
                }
                DatabaseContext.SaveChanges();
            }
        }
        private Data.User GetUser()
        {
            string userId = Request["userId"];
            return (from u in DatabaseContext.Users where u.UserId == userId select u).FirstOrDefault();
        }
    }
}