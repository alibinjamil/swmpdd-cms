using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using SWMPDD.Web.Business.Pages;
using SWMPDD.Data.Objects;

namespace SWMPDD.Web.Referrals
{
    public partial class Dashboard : AuthenticatedPage
    {
        public override string GetTabName()
        {
            return "REFERRALS";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            gvDashboard.DataSource = DashboardFactory.Instance.PopulateDashboardObjects();
            gvDashboard.DataBind();
        }
        protected object GetSearchURL(object county,object statusId)
        {
            if (county == "Total") county = "All";
            return "~/Referrals/Search.aspx?county=" + county + "&statusId=" + statusId;
        }
    }
}