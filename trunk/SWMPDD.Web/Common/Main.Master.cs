using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Web.Business.Pages;
using SWMPDD.Web.Business.Common;
namespace SWMPDD.Web.Common
{
    public partial class Main : System.Web.UI.MasterPage
    {
        string[] tabTexts = {"HOME","REFERRALS","CASE MANAGEMENT","ADMINISTER","REPORTS","SUPPORT"};
        string[] tabUrls = { "~/Default.aspx", "~/Referrals/Dashboard.aspx", "~/Default.aspx", "~/Administer/ManageUsers.aspx", "~/Reports/WaitingList.aspx", "~/Default.aspx" };
        bool[] authenticPage = { true, true, true, true, true, true };
        bool[] genericPage = { true, false, false, false, false, true };
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected string GetTabs()
        {
            string currentTab = "";
            bool[] currentAvailableTab;
            if (MainContentPlaceHolder.Page as AuthenticatedPage != null)
            {
                currentTab = (MainContentPlaceHolder.Page as AuthenticatedPage).GetTabName();
                UserPanel.Visible = true;
                currentAvailableTab = authenticPage;
            }
            else {
                currentTab = (MainContentPlaceHolder.Page as GenericPage).GetTabName();
                currentAvailableTab = genericPage;
            }
            
            string tabs = "";
            for (int i = 0; i < tabTexts.Length; i++)
            {
                if (currentAvailableTab[i])
                {
                    string url = MainContentPlaceHolder.Page.ResolveClientUrl(tabUrls[i]);
                    tabs += "<div class='tab";
                    if (currentTab == tabTexts[i])
                    {
                        tabs += " selected";
                    }
                    tabs += "'><a href='" + url + "'>" + tabTexts[i] + "</a></div>";
                }
            }
            return tabs;
        }

        protected string GetLoggedInUserName()
        {
            if (MainContentPlaceHolder.Page as AuthenticatedPage != null)
            {
                return (MainContentPlaceHolder.Page as AuthenticatedPage).LoggedInUser.Name;
            }
            else {
                
                return "";
            }
        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            Session[Constants.Session.LOGGED_IN_USER] = null;
            Response.Redirect("~/Login.aspx");
        }
    }
}