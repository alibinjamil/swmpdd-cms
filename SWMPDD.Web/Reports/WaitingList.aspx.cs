using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SWMPDD.Web.Business.Pages;

using SWMPDD.Data;

namespace SWMPDD.Web.Reports
{
    public partial class WaitingList : AuthenticatedPage
    {
        int waitingNumber = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            if (ddlCounties.SelectedValue == "ACTIVE")
            {
                edsClients.Where = " it.StatusId IS NULL ";
            }
            else if (ddlCounties.SelectedValue == "INACTIVE")
            {
                edsClients.Where = " it.StatusId IS NOT NULL ";
            }
            else
            {
                edsClients.Where = " it.County = @County ";
                if (edsClients.WhereParameters["County"] != null)
                {
                    edsClients.WhereParameters["County"].DefaultValue = ddlCounties.SelectedValue;
                }
                else
                {
                    Parameter searchStringParameter = new Parameter();
                    searchStringParameter.Name = "County";
                    searchStringParameter.DbType = System.Data.DbType.String;
                    searchStringParameter.DefaultValue = ddlCounties.SelectedValue;
                    edsClients.WhereParameters.Add(searchStringParameter);
                }
            }
            gvClients.DataBind();
        }
        protected void btnGo_Click(object sender, EventArgs e)
        {
            BindGrid();
        }
        public override string GetTabName()
        {
            return "REPORTS";
        }
        protected object GetWaitingListNumber(object clientObj)
        {
            Client client = (Client)clientObj;
            if (client.StatusId.HasValue == false)
            {
                return ++waitingNumber;
            }
            return null;
        }
    }
}