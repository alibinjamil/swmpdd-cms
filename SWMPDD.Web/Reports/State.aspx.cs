using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SWMPDD.Web.Business.Pages;

namespace SWMPDD.Web.Reports
{
    public partial class State : AuthenticatedPage
    {
        public override string GetTabName()
        {
            return "REPORTS";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}