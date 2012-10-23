using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Data.Objects;

using SWMPDD.Web.Business.Pages;

namespace SWMPDD.Web
{
    public partial class Default : AuthenticatedPage
    {
        public override string GetTabName()
        {
            return "HOME";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}