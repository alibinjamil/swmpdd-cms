using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.Xml.Linq;

using SWMPDD.Web.Business.Pages;
using SWMPDD.Data;
using SWMPDD.Web.Business.Common;
using System.Web.Script.Serialization;

namespace SWMPDD.Web.Referrals
{
    public partial class AddReferral : AuthenticatedPage
    {
        public class DataItem {
            public string value { get; set; }
            public string text { get; set; }
        }
        public override string GetTabName()
        {
            return "REFERRALS";
        }
        Client client = null;
        protected int commentTotalRows = 0;
        protected int additionalPertinentInfoTotalRows = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //set the readonly attribute of html for date controls. 
            IntakeDate.Attributes.Add("readonly", "readonly");
            DateOfBirth.Attributes.Add("readonly", "readonly");
            DateClientContacted.Attributes.Add("readonly", "readonly");
            RemovalDate.Attributes.Add("readonly", "readonly");
            VerificationDate.Attributes.Add("readonly", "readonly");

            client = GetClient();
            if (ReasonforRemovalCode.SelectedValue == "8") {
                Code8Other.Enabled = true;
                rfvCode8Other.Enabled = true;
            }
            if (ResidenceCode.SelectedValue == "Other")
            {
                OtherInfo.Enabled = true;
                rfvOtherInfo.Enabled = true;
            }
            if (!Page.IsPostBack)
            {
                if (client != null)
                {
                    if (Request["save"] != null)
                    {
                        SetSuccessMessage("Client Saved Successfully");
                    }
                    SSN.Text = client.SSN;
                    if (client.InTakeDate.HasValue) IntakeDate.Text = client.InTakeDate.Value.ToShortDateString();
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
                    ByWhom.Text = LoggedInUser.Name + " [" + LoggedInUser.UserType + "]";

                    var clientServices = (from c in DatabaseContext.ClientServices where c.ClientId == client.ClientId select c.ServiceId).ToList();
                    var clientServicesNotSelected = from s in DatabaseContext.Services where !clientServices.Contains(s.ServiceId) select s;
                    var clientServicesSelected = from s in DatabaseContext.Services where clientServices.Contains(s.ServiceId) select s;
                    ServicesNeededLeft.DataSource = clientServicesSelected;
                    ServicesNeededLeft.DataBind();
                    ServicesNeededRight.DataSource = clientServicesNotSelected;
                    ServicesNeededRight.DataBind();
                    if (clientServicesSelected.Count() == 0) {
                       // ImageButtonRight.ImageUrl = "~/img/bt_dis_rem.png";
                    }
                    else if (clientServicesNotSelected.Count() == 0) {
                        //ImageButtonLeft.ImageUrl = "~/img/bt_dis_add.png";
                    }


                    for (int i = 1; i <= client.ProvidersInProgresses.Count; i++)
                    {
                        TextBox tbFrequency = (TextBox)FindControl(pnlCurrentServices, "Frequency" + i);
                        TextBox tbDiscipline = (TextBox)FindControl(pnlCurrentServices, "Descipline" + i);
                        TextBox tbProvider = (TextBox)FindControl(pnlCurrentServices, "Provider" + i);

                        if (tbFrequency != null) tbFrequency.Text = client.ProvidersInProgresses.ToList()[i - 1].Frequency;
                        if (tbDiscipline != null) tbDiscipline.Text = client.ProvidersInProgresses.ToList()[i - 1].Discipline;
                        if (tbProvider != null) tbProvider.Text = client.ProvidersInProgresses.ToList()[i - 1].Provider;
                    }

                    MedicaidStatus.SelectedValue = GetStringFromBool(client.VerificationOfMedicaidStatus);
                    if (client.VerificationDate.HasValue) VerificationDate.Text = client.VerificationDate.Value.ToShortDateString();
                    LockInStatus.SelectedValue = GetStringFromBool(client.LockinStatus);
                    MethodofContact.SelectedValue = client.MethodofContact;
                    if (client.DateClientContacted.HasValue) DateClientContacted.Text = client.DateClientContacted.Value.ToShortDateString();
                    client.ByWhom = LoggedInUser.UserName;
                    if (client.StatusId.HasValue) ReasonforRemovalCode.SelectedValue = client.StatusId.Value.ToString();
                    Code8Other.Text = client.StatusText;
                    if (client.RemovalDate.HasValue) RemovalDate.Text = client.RemovalDate.Value.ToShortDateString();

                    BindGrids();
                    pnlAddAdditionalInfo.Visible = true;
                    pnlAddComment.Visible = true;
                    btnSave.Visible = true;
                    btnSubmit.Visible = true;
                    btnPrintDay.Visible = true;
                    btnPrintReferral.Visible = true;
                }
                else
                {
                    var clientServicesNotSelected = from s in DatabaseContext.Services select s;
                    ServicesNeededRight.DataSource = clientServicesNotSelected;
                    ServicesNeededRight.DataBind();
                    BindGrids();
                   // ImageButtonRight.ImageUrl = "~/img/bt_dis_rem.png";
                }
            }
            
        }

        private void BindGrids()
        {
            if (client != null)
            {
                //gvAdditionalPertinentInfo.DataSource = (from d in DatabaseContext.Details where d.ClientId == client.ClientId && d.Type == Constants.DetailTypes.ADDITIONAL_PERTINENT_INFO select d);
                //gvAdditionalPertinentInfo.DataBind();

               // gvComments.DataSource = (from d in DatabaseContext.Details where d.ClientId == client.ClientId && d.Type == Constants.DetailTypes.COMMENTS select d);
                //gvComments.DataBind();
            }
            else {
                gvAdditionalPertinentInfo.DataBind();
                gvComments.DataBind();
            }
            //commentTotalRows = gvComments.Rows.Count;
            //additionalPertinentInfoTotalRows = gvAdditionalPertinentInfo.Rows.Count;
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
        

        protected void SSN_TextChanged(object sender, EventArgs e)
        {
            Client client = (from c in DatabaseContext.Clients where c.SSN == SSN.Text select c).FirstOrDefault();
            if (client != null)
            {
                Response.Redirect("~/Referrals/AddReferral.aspx?clientId=" + client.ClientId);
            }
        }

        protected void ResidenceCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            rfvOtherInfo.Enabled = (ResidenceCode.SelectedValue == "Other");
        }

        protected void MedicaidStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            Nullable<bool> yesNo = GetBoolFromString(MedicaidStatus.SelectedValue);
            if (yesNo.HasValue) rfvVerificationDate.Enabled = yesNo.Value;
        }

        protected void ReasonforRemovalCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            rfvCode8Other.Enabled = (ReasonforRemovalCode.SelectedValue == "8");
        }

        protected void btnPertinentInfo_Click(object sender, EventArgs e)
        {           
            SaveDetail(AdditionalPertinent.Text, Constants.DetailTypes.ADDITIONAL_PERTINENT_INFO);            
        }
        private void SaveDetail(string text, string type)
        {
            if (client != null)
            {
                Detail detail = new Detail();
                detail.Text = text;
                detail.CreationDate = DateTime.Now;
                detail.CreationUser = LoggedInUser.UserName;
                detail.ClientId = client.ClientId;
                detail.Type = type;
                DatabaseContext.AddToDetails(detail);
                DatabaseContext.SaveChanges();
                BindGrids();
            }
            else {
                BindGrids();
            }
        }
        protected void SaveReferral() {
            bool update = true;
            if (client == null)
            {
                client = new Client();
                client.ClientId = System.Guid.NewGuid().ToString();
                update = false;
            }

            client.SSN = SSN.Text;
            if (IntakeDate.Text.Length > 0) client.InTakeDate = DateTime.Parse(IntakeDate.Text);
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

            for (int i = 1; i <= 5; i++)
            {
                TextBox tbFrequency = (TextBox)FindControl(pnlCurrentServices, "Frequency" + i);
                TextBox tbDiscipline = (TextBox)FindControl(pnlCurrentServices, "Descipline" + i);
                TextBox tbProvider = (TextBox)FindControl(pnlCurrentServices, "Provider" + i);

                ProvidersInProgress providerInProgress = new ProvidersInProgress();
                bool doAdd = false;
                if (tbFrequency != null && tbFrequency.Text.Trim().Length > 0)
                {
                    providerInProgress.Frequency = tbFrequency.Text;
                    doAdd = true;
                }
                if (tbDiscipline != null && tbDiscipline.Text.Trim().Length > 0)
                {
                    providerInProgress.Discipline = tbDiscipline.Text;
                    doAdd = true;
                }
                if (tbProvider != null && tbProvider.Text.Trim().Length > 0)
                {
                    providerInProgress.Provider = tbProvider.Text;
                    doAdd = true;
                }
                if (doAdd)
                {
                    providerInProgress.CreationDate = DateTime.Now;
                    providerInProgress.CreationUser = LoggedInUser.UserName;
                    client.ProvidersInProgresses.Add(providerInProgress);
                }
            }

            client.VerificationOfMedicaidStatus = GetBoolFromString(MedicaidStatus.SelectedValue);
            if (VerificationDate.Text.Length > 0) client.VerificationDate = DateTime.Parse(VerificationDate.Text);
            client.LockinStatus = GetBoolFromString(LockInStatus.SelectedValue);
            client.MethodofContact = MethodofContact.SelectedValue;
            if (DateClientContacted.Text.Length > 0) client.DateClientContacted = DateTime.Parse(DateClientContacted.Text);
            client.ByWhom = LoggedInUser.UserName;
            lbllastupdatedBy.Text = "Last updated on " + DateTime.Now + " by " + LoggedInUser.UserName;
            int statusId = int.Parse(ReasonforRemovalCode.SelectedValue);
            if (statusId > 0) client.StatusId = statusId;
            client.StatusText = Code8Other.Text;
            if (RemovalDate.Text.Length > 0) client.RemovalDate = DateTime.Parse(RemovalDate.Text);
            if (update == false)
            {
                DatabaseContext.AddToClients(client);
            }
            DatabaseContext.SaveChanges();
            if (update == false)
            {
                Response.Redirect("~/Referrals/AddReferral.aspx?clientId=" + client.ClientId + "&save=true");
            }
            else
            {
                SetSuccessMessage("Client Updated Successfully.");
            }
        }
        protected void btnAddComment_Click(object sender, EventArgs e)
        {
            SaveDetail(OfficalComments.Text, Constants.DetailTypes.COMMENTS);
        }
        
        protected void btnSubmit_Click(object sender, EventArgs e) {
            SaveReferral();
            Response.Redirect("~/Referrals/Search.aspx");
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            SaveReferral();
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Referrals/Search.aspx");
        }
        protected void Pertinent_Select(object sender, EntityDataSourceSelectedEventArgs e)
        {
            additionalPertinentInfoTotalRows = e.TotalRowCount;
        }
        protected void Comment_Select(object sender, EntityDataSourceSelectedEventArgs e)
        {
            commentTotalRows = e.TotalRowCount;
        }
    }
}
    