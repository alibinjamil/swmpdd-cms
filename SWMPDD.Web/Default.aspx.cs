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
        protected void Page_Load(object sender, EventArgs e)
        {
            EntityDataSource1.Where = "it.County = @County1";
            if (IsPostBack == false)
            {
                EntityDataSource1.WhereParameters.Add("County1", System.Data.DbType.String, "Wilkinson");
            }
        }
    }
}