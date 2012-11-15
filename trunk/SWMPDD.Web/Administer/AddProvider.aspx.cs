using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SWMPDD.Web.Business.Pages;
using SWMPDD.Data;
using System.Web.Script.Serialization;

namespace SWMPDD.Web.Administer
{
    public partial class AddProvider : AuthenticatedPage
    {
        public class DataItem
        {
            public string value { get; set; }
            public string text { get; set; }
        }
        bool editMode = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            DataItem[] list = { new DataItem{value="Adams",text="Adams"},
                                new DataItem{value="Amite",text="Amite"},
                                new DataItem{value="Claiborne",text="Claiborne"},
                                new DataItem{value="Franklin",text="Franklin"},
                                new DataItem{value="Jefferson",text="Jefferson"},
                                new DataItem{value="Lawrence",text="Lawrence"},
                                new DataItem{value="Lincoln",text="Lincoln"},
                                new DataItem{value="Pike",text="Pike"},
                                new DataItem{value="Walthall",text="Walthall"},
                                new DataItem{value="Wilkinson",text="Wilkinson"}
                                };
            editMode = (Request["providerId"] != null);
            if (IsPostBack == false)
            {
                if (editMode)
                {
                    Data.Provider provider = GetProvider();
                    tbProviderName.Text = provider.Name;
                    tbTelephone.Text = provider.Phone;
                    tbFax.Text = provider.Fax;
                    tbAddress.Text = provider.Address;
                    tbCity.Text = provider.City;
                    tbZipCode.Text = provider.Zip;
                    tbEmail.Text = provider.Email;
                    var providerServices = (from c in DatabaseContext.ProviderServices where c.ProviderId == provider.ProviderId select c.ServiceId).ToList();
                    var providerServicesNotSelected = from s in DatabaseContext.Services where !providerServices.Contains(s.ServiceId) select s;
                    var providerServicesSelected = from s in DatabaseContext.Services where providerServices.Contains(s.ServiceId) select s;
                    ServicesNeededLeft.DataSource = providerServicesSelected;
                    ServicesNeededLeft.DataBind();
                    ServicesNeededRight.DataSource = providerServicesNotSelected;
                    ServicesNeededRight.DataBind();
                    if (providerServicesSelected.Count() == 0)
                    {
                       // ImageButtonRight.ImageUrl = "~/img/bt_dis_rem.png";
                    }
                    else if (providerServicesNotSelected.Count() == 0)
                    {
                        //ImageButtonLeft.ImageUrl = "~/img/bt_dis_add.png";
                    }
                    var providerCounty = (from c in DatabaseContext.ProviderCounties where c.ProviderId == provider.ProviderId select c.County).ToList();
                    var providerCountyNotSelected = (from c in list where !providerCounty.Contains(c.value) select c).ToList();
                    var providerCountySelected = (from c in list where providerCounty.Contains(c.value) select c).ToList();
                    CountyLeft.DataSource = providerCountySelected;
                    CountyLeft.DataTextField = "text";
                    CountyLeft.DataValueField = "value";
                    CountyLeft.DataBind();
                    CountyRight.DataSource = providerCountyNotSelected;
                    CountyRight.DataTextField = "text";
                    CountyRight.DataValueField = "value";
                    CountyRight.DataBind();
                    if (providerCountySelected.Count() == 0)
                    {
                        //CountyRightButton.ImageUrl = "~/img/bt_dis_rem.png";
                    }
                    else if (providerCountyNotSelected.Count() == 0)
                    {
                        //CountyLeftButton.ImageUrl = "~/img/bt_dis_adds.png";
                    }
                }
                else
                {
                    CountyRight.DataSource = list;
                    CountyRight.DataTextField = "text";
                    CountyRight.DataValueField = "value";
                    CountyRight.DataBind();
                    //CountyRightButton.ImageUrl = "~/img/bt_dis_rem.png";
                    var providerServicesNotSelected = from s in DatabaseContext.Services select s;
                    ServicesNeededRight.DataSource = providerServicesNotSelected;
                    ServicesNeededRight.DataBind();
                   // ImageButtonRight.ImageUrl = "~/img/bt_dis_rem.png";
                }
            }
        }
        public override string GetTabName()
        {
            return "ADMINISTER";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Data.Provider provider = null;
            if (editMode == false)
            {
                provider = new Data.Provider();
                provider.ProviderId = System.Guid.NewGuid().ToString();
            }
            else
            {
                provider = GetProvider();
            }
            provider.Name = tbProviderName.Text;
            provider.Phone = tbTelephone.Text;
            provider.Fax = tbFax.Text;
            provider.Address = tbAddress.Text;
            provider.City = tbCity.Text;
            provider.State = "MS";
            provider.Zip = tbZipCode.Text;
            provider.Email = tbEmail.Text;
            foreach (ProviderService providerService in provider.ProviderServices.ToList())
            {
                DatabaseContext.ProviderServices.DeleteObject(providerService);
                DatabaseContext.SaveChanges();
            }
            string leftHandItems = ServicesNeededLeftHidden.Value;
            List<DataItem> leftHandItemSerialize = (List<DataItem>)Newtonsoft.Json.JsonConvert.DeserializeObject(leftHandItems, typeof(List<DataItem>));
            foreach (DataItem item in leftHandItemSerialize)
            {
                ProviderService service = new ProviderService
                {
                    ProviderServiceId = System.Guid.NewGuid().ToString(),
                    ServiceId = item.value
                };
                provider.ProviderServices.Add(service);
            }

            foreach (ProviderCounty providerCounty in provider.ProviderCounties.ToList())
            {
                DatabaseContext.ProviderCounties.DeleteObject(providerCounty);
                DatabaseContext.SaveChanges();
            }
            string leftHandCountyItems = CountyLeftHidden.Value;
            List<DataItem> leftHandItemSerializeCounty = (List<DataItem>)Newtonsoft.Json.JsonConvert.DeserializeObject(leftHandCountyItems, typeof(List<DataItem>));
            foreach (DataItem item in leftHandItemSerializeCounty)
            {
                ProviderCounty county = new ProviderCounty
                {
                    ProviderCountiesId = System.Guid.NewGuid().ToString(),
                    County = item.value
                };
                provider.ProviderCounties.Add(county);
            }
            if (editMode == false)
            {
                provider.CreationTime = DateTime.Now;
                provider.CreationUser = LoggedInUser.UserName;
                DatabaseContext.AddToProviders(provider);
            }
            else
            {
                provider.LastUpdateUser = LoggedInUser.UserName;
                provider.LastUpdateTime = DateTime.Now;
            }
            DatabaseContext.SaveChanges();
            Response.Redirect("~/Administer/ManageProviders.aspx");

        }
        private Data.Provider GetProvider()
        {
            string providerId = Request["providerId"];
            return (from u in DatabaseContext.Providers where u.ProviderId == providerId select u).FirstOrDefault();
        }
    }
}