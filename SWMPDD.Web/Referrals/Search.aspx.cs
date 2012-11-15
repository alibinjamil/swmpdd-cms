using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SWMPDD.Web.Business.Pages;
using System.Data;

namespace SWMPDD.Web.Referrals
{
    public partial class Search : AuthenticatedPage
    {
        protected int TotalRows;
        public override string GetTabName()
        {
            return "REFERRALS";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["county"] != null)
            {
                ddlCounty.SelectedValue = Request["county"];
            }
            if (Request["statusid"] != null)
            {
                ddlStatus.SelectedValue = Request["statusid"];
            }
            SetWhereClause();
        }
        private void SetWhereClause()
        {
            edsClients.Where = "";
            if (tbSearchBy.Text.Length > 0)
            {
                edsClients.Where += "(it.LastName LIKE @SearchString OR it.City LIKE @SearchString OR it.Zip LIKE @SearchString OR it.Phone LIKE @SearchString)";
                if (edsClients.WhereParameters["SearchString"] != null)
                {
                    edsClients.WhereParameters["SearchString"].DefaultValue = "%" + tbSearchBy.Text + "%";
                }
                else
                {
                    Parameter searchStringParameter = new Parameter();
                    searchStringParameter.Name = "SearchString";

                    searchStringParameter.DbType = System.Data.DbType.String;
                    searchStringParameter.DefaultValue = "%" + tbSearchBy.Text + "%";
                    edsClients.WhereParameters.Add(searchStringParameter);
                }
            }
            if (ddlStatus.SelectedValue.ToUpper() != "ALL")
            {
                if (edsClients.Where.Length > 0)
                {
                    edsClients.Where += " AND ";
                }
                if (ddlStatus.SelectedValue.ToUpper() == "ACTIVE")
                {
                    edsClients.Where += " it.StatusId IS NULL ";
                }
                else if (ddlStatus.SelectedValue.ToUpper() == "INACTIVE")
                {
                    edsClients.Where += " it.StatusId IS NOT NULL ";
                }
                else
                {
                    edsClients.Where += " it.StatusId = " + ddlStatus.SelectedValue;
                }
            }
            if (ddlCounty.SelectedValue.ToUpper() != "ALL")
            {
                if (edsClients.Where.Length > 0)
                {
                    edsClients.Where += " AND ";
                }
                edsClients.Where += " it.County = @County ";

                if (edsClients.WhereParameters["County"] != null)
                {
                    edsClients.WhereParameters["County"].DefaultValue = ddlCounty.SelectedValue;
                }
                else
                {
                    Parameter parameter = new Parameter();
                    parameter.Name = "County";
                    parameter.DbType = System.Data.DbType.String;
                    parameter.DefaultValue = ddlCounty.SelectedValue;
                    edsClients.WhereParameters.Add(parameter);
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {            
            gvClients.DataBind();
        }
        protected void DataSource_Selected(object sender, EntityDataSourceSelectedEventArgs e) {
            TotalRows = e.TotalRowCount;
        }
    }
}