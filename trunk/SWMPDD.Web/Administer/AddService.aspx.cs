using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SWMPDD.Web.Business.Pages;

namespace SWMPDD.Web.Administer
{
    public partial class AddService : AuthenticatedPage
    {
        bool editMode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            editMode = (Request["serviceId"] != null);
            if (IsPostBack == false)
            {
                if (editMode)
                {
                    Data.Service service= GetService();
                    tbServiceNAme.Text = service.Name;
                    ddlWaiveORNW.Text = service.WaiverOrNW.ToString();
                    tbCode.Text = service.Code;
                    tbType.Text = service.Type;
                    tbDescription.Text = service.Description;
                    tbCount.Text = service.ServiceUCount;
                    ddlActive.Text = service.Active.ToString();
                }
            }
        }
        public override string GetTabName()
        {
            return "ADMINISTER";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
                Data.Service service = null;
                if (editMode == false)
                {
                    service = new Data.Service();
                    service.ServiceId = System.Guid.NewGuid().ToString();
                }
                else
                {
                    service = GetService();
                }
                service.Name = tbServiceNAme.Text;
                service.WaiverOrNW= ddlWaiveORNW.Text.ToString()=="True"?true:false;
                service.Code = tbCode.Text;
                service.Type = tbType.Text;
                service.Description = tbDescription.Text;
                service.ServiceUCount = tbCount.Text;
                service.Active = ddlActive.Text.ToString() == "True" ? true : false;
                if (editMode == false)
                {
                    service.CreationTime = DateTime.Now;
                    service.CreationUser = LoggedInUser.UserName;
                    DatabaseContext.AddToServices(service);
                }
                else
                {
                    service.LastUpdateUser = LoggedInUser.UserName;
                    service.LastUpdateTime = DateTime.Now;
                }
                DatabaseContext.SaveChanges();
                Response.Redirect("~/Administer/ManageServices.aspx");
            
        }
        private Data.Service GetService()
        {
            string serviceId = Request["serviceId"];
            return (from u in DatabaseContext.Services where u.ServiceId == serviceId select u).FirstOrDefault();
        }
    }
}