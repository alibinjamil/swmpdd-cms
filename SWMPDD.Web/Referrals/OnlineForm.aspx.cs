using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SWMPDD.Data;
using SWMPDD.Web.Business.Pages;
using System.Web.Script.Serialization;
using SWMPDD.Web.Business.Common;
using System.Configuration;

namespace SWMPDD.Web.MedicaidForm
{
    public partial class OnlineForm : GenericPage
    {
        public override string GetTabName()
        {
            return "";
        }
        public class DataItem
        {
            public string value { get; set; }
            public string text { get; set; }
        }
        Client client = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //set the readonly attribute of html for date controls. 
            DateOfBirth.Attributes.Add("readonly", "readonly");
            client = GetClient();
            
            if (ResidenceCode.SelectedValue == "Other")
            {
                OtherInfo.Enabled = true;
                rfvOtherInfo.Enabled = true;
            }
            if (!Page.IsPostBack)
            {
                if (Request["save"] != null)
                {
                    SetSuccessMessage("Client Saved Successfully");
                }
                if (client != null)
                {
                    
                    SSN.Text = client.SSN;
                    FirstName.Text = client.FirstName;
                    MiddleInitial.Text = client.MiddleInitial;
                    LastName.Text = client.LastName;
                    if (client.DateOfBirth.HasValue) DateOfBirth.Text = client.DateOfBirth.Value.ToShortDateString();
                    AddressLine1.Text = client.Address1;
                    AddressLine2.Text = client.Address2;
                    City.Text = client.City;
                    //client.State = "MS";
                    Zip.Text = client.Zip;
                    Phone.Text = client.Phone;
                    County.SelectedValue = client.County;
                    Email.Text = client.Email;
                    Gender.SelectedValue = client.Gender;
                    ResidenceCode.SelectedValue = client.PersonResidenceCode;
                    OtherInfo.Text = client.OtherComments;
                    Medicaid.Text = client.Medicaid;
                    Medicare.Text = client.Medicare;
                    ContactPerson.Text = client.ContactPerson;
                    RelationshiptoClient.Text = client.RelationshipToClient;
                    ContactPhone.Text = client.ContactPhone;
                    Directions.Text = client.Direction;
                    ReferralSource.Text = client.ReferralSoruce;
                    ReferralPhone.Text = client.ReferralPhone;
                    Physician.Text = client.Physician;
                    PhysicianPhone.Text = client.PhysicianPhone;
                    PhysicianAddress.Text = client.PhysicianAddress;
                    PhysicianCity.Text = client.PhysicianCity;
                    PhysicianZip.Text = client.PhysicianZip;
                    Diagnosis.Text = client.Diagnostic;

                    var clientServices = (from c in DatabaseContext.ClientServices where c.ClientId == client.ClientId select c.ServiceId).ToList();
                    var clientServicesNotSelected = from s in DatabaseContext.Services where !clientServices.Contains(s.ServiceId) select s;
                    var clientServicesSelected = from s in DatabaseContext.Services where clientServices.Contains(s.ServiceId) select s;
                    ServicesNeededLeft.DataSource = clientServicesSelected;
                    ServicesNeededLeft.DataBind();
                    ServicesNeededRight.DataSource = clientServicesNotSelected;
                    ServicesNeededRight.DataBind();
                    if (clientServicesSelected.Count() == 0)
                    {
//                        ImageButtonRight.ImageUrl = "~/img/bt_dis_rem.png";
                    }
                    else if (clientServicesNotSelected.Count() == 0)
                    {
//                        ImageButtonLeft.ImageUrl = "~/img/bt_dis_add.png";
                    }

                    
                }
                else
                {
                    var clientServicesNotSelected = from s in DatabaseContext.Services select s;
                    ServicesNeededRight.DataSource = clientServicesNotSelected;
                    ServicesNeededRight.DataBind();
                    //ImageButtonRight.ImageUrl = "~/img/bt_dis_rem.png";
                }
            }
            if (SSN.Text.Trim() != "")
            {
                btnSave.Visible = true;
            }
            else
            {
                btnSave.Visible = false;
            }
        }

        private Client GetClient()
        {
            string clientId = Request["clientId"];
            if (clientId != null)
            {
                return (from c in DatabaseContext.Clients where c.ClientId == clientId select c).FirstOrDefault();
            }
            return null;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            bool update = true;
            if (client == null)
            {
                client = new Client();
                client.ClientId = System.Guid.NewGuid().ToString();
                update = false;
            }

            client.SSN = SSN.Text;
            client.FirstName = FirstName.Text;
            client.MiddleInitial = MiddleInitial.Text;
            client.LastName = LastName.Text;
            if (DateOfBirth.Text.Length > 0) client.DateOfBirth = DateTime.Parse(DateOfBirth.Text);
            client.Address1 = AddressLine1.Text;
            client.Address2 = AddressLine2.Text;
            client.City = City.Text;
            client.State = "MS";
            client.Zip = Zip.Text;
            client.Phone = Phone.Text;
            client.County = County.SelectedValue;
            client.Email = Email.Text;
            client.Gender = Gender.SelectedValue;
            client.PersonResidenceCode = ResidenceCode.SelectedValue;
            client.OtherComments = OtherInfo.Text;
            client.Medicaid = Medicaid.Text;
            client.Medicare = Medicare.Text;
            client.ContactPerson = ContactPerson.Text;
            client.RelationshipToClient = RelationshiptoClient.Text;
            client.ContactPhone = ContactPhone.Text;
            client.Direction = Directions.Text;
            client.ReferralSoruce = ReferralSource.Text;
            client.ReferralPhone = ReferralPhone.Text;
            client.Physician = Physician.Text;
            client.PhysicianPhone = PhysicianPhone.Text;
            client.PhysicianAddress = PhysicianAddress.Text;
            client.PhysicianCity = PhysicianCity.Text;
            client.PhysicianZip = PhysicianZip.Text;
            client.Diagnostic = Diagnosis.Text;
            foreach (ClientService clientService in client.ClientServices.ToList())
            {
                DatabaseContext.ClientServices.DeleteObject(clientService);
                DatabaseContext.SaveChanges();
            }
            string leftHandItems = ServicesNeededLeftHidden.Value;
            JavaScriptSerializer json_serializer = new JavaScriptSerializer();
            List<DataItem> leftHandItemSerialize = (List<DataItem>)Newtonsoft.Json.JsonConvert.DeserializeObject(leftHandItems, typeof(List<DataItem>));
            if (leftHandItemSerialize != null)
            {
                foreach (DataItem item in leftHandItemSerialize)
                {
                    ClientService service = new ClientService
                    {
                        ClientServicesId = System.Guid.NewGuid().ToString(),
                        ServiceId = item.value
                    };
                    client.ClientServices.Add(service);
                }
            }
            if (update)
            {
                List<Detail> details = (from d in DatabaseContext.Details where d.Type == Constants.DetailTypes.SERVICES_NEEDED && d.ClientId == client.ClientId select d).ToList();
                foreach (Detail detail in details)
                {
                    DatabaseContext.Details.DeleteObject(detail);
                }
            }

            if (update)
            {
                List<ProvidersInProgress> providersInProgress = (from p in DatabaseContext.ProvidersInProgresses where p.ClientId == client.ClientId select p).ToList();
                foreach (ProvidersInProgress providerInProgress in providersInProgress)
                {
                    DatabaseContext.ProvidersInProgresses.DeleteObject(providerInProgress);
                }
            }
            foreach (ProvidersInProgress providerInProgress in client.ProvidersInProgresses)
            {
                client.ProvidersInProgresses.Remove(providerInProgress);
            }

            if (update == false)
            {
                DatabaseContext.AddToClients(client);
            }
            DatabaseContext.SaveChanges();
            if (update == false)
            {
                SendEmail("Client Created", "SWMPD - District", ConfigurationSettings.AppSettings["ToEmailAddress"]);
                Response.Redirect("~/Referrals/OnlineForm.aspx?save=true");
            }
            else
            {
                SetSuccessMessage("Client Updated Successfully.");
            }
        }

        protected void ResidenceCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            rfvOtherInfo.Enabled = (ResidenceCode.SelectedValue == "Other");
        }
        protected void SSN_TextChanged(object sender, EventArgs e)
        {
            Client client = (from c in DatabaseContext.Clients where c.SSN == SSN.Text select c).FirstOrDefault();
            if (SSN.Text.Trim() != "")
            {
                btnSave.Visible = true;
            }
            else
            {
                btnSave.Visible = false;
            }
            if (client != null)
            {
                Response.Redirect("~/Referrals/OnlineForm.aspx?clientId=" + client.ClientId);
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Referrals/OnlineForm.aspx");
        }
    }
}