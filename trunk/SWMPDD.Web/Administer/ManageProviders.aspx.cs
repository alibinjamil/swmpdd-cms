using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SWMPDD.Web.Business.Pages;

namespace SWMPDD.Web.Administer
{
    public partial class ManageProviders : AuthenticatedPage
    {
        public override string GetTabName()
        {
            return "ADMINISTER";
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected object GetEditURL(object providerObj)
        {
            Data.Provider provider = (Data.Provider)providerObj;
            return "~/Administer/AddProvider.aspx?providerId=" + provider.ProviderId;
        }
    }
}