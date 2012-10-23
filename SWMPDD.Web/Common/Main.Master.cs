using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Web.Business.Pages;

namespace SWMPDD.Web.Common
{
    public partial class Main : System.Web.UI.MasterPage
    {
        string[] tabTexts = {"HOME","REFERRALS","CASE MANAGEMENT","ADMINSTER","REPORTS","SUPPORT"};
        string[] tabUrls = { "~/Default.aspx", "~/Referrals/Dashboard.aspx", "~/Default.aspx", "~/Default.aspx", "~/Default.aspx", "~/Default.aspx" };
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected string GetTabs()
        {
            string currentTab = (MainContentPlaceHolder.Page as AuthenticatedPage).GetTabName();
            string tabs = "";
            for (int i = 0; i < tabTexts.Length; i++)
            {
                string url = MainContentPlaceHolder.Page.ResolveClientUrl(tabUrls[i]);
                tabs += "<div class='tab";
                if (currentTab == tabTexts[i])
                {
                    tabs += " selected"; 
                }
                tabs += "'><a href='" + url + "'>" + tabTexts[i] + "</a></div>";
            }
            return tabs;
        }

        protected string GetLoggedInUserName()
        {
            return (MainContentPlaceHolder.Page as AuthenticatedPage).LoggedInUser.Name;
        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {

        }
    }
}