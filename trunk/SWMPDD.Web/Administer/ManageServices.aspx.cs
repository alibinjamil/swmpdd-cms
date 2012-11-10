using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SWMPDD.Web.Business.Pages;

namespace SWMPDD.Web.Administer
{
    public partial class ManageServices : AuthenticatedPage
    {
        public override string GetTabName()
        {
            return "ADMINISTER";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected object GetEditURL(object serviceObj)
        {
            Data.Service service = (Data.Service)serviceObj;
            return "~/Administer/AddService.aspx?serviceId=" + service.ServiceId;
        }
    }
}