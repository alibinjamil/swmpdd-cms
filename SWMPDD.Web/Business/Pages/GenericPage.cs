using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using SWMPDD.Data;
using SWMPDD.Web.Business.Common;

using System.Collections.Specialized;
using System.Collections.Generic;
using System.Net.Mail;

/// <summary>
/// Summary description for GenericPage
/// </summary>
namespace SWMPDD.Web.Business.Pages
{
    public abstract class GenericPage : System.Web.UI.Page
    {
        abstract public string GetTabName();
        private static string FROM_ADDRESS = ConfigurationSettings.AppSettings["FromEmailAddress"];
        private static string To_ADDRESS = ConfigurationSettings.AppSettings["ToEmailAddress"];
        private static string SMTP_SERVER = "smtp.gmail.com";
        private static string USER_NAME = "swmpd.district";
        private static string PASSWORD = "swmpddigiby";
        public static NameValueCollection AppSettings = System.Configuration.ConfigurationManager.AppSettings;
        //private SWMPDD.Data.User loggedInUser = null;
        public GenericPage()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        protected override void OnLoad(EventArgs e)
        {
            SetMessage("error", "", false);
            SetMessage("success", "", false);
            /*if (HttpContext.Current.Session[Constants.Session.LOGGED_IN_USER] != null)
            {
                loggedInUser = HttpContext.Current.Session[Constants.Session.LOGGED_IN_USER];
            }*/
            base.OnLoad(e);
        }
        protected void SendEmail(String messageBody,String subject,String sendEmail)
        {

            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
            message.To.Add(sendEmail);
            message.Subject = subject;
            message.From = new System.Net.Mail.MailAddress(FROM_ADDRESS, "SWMPD - Admin");
            message.Body = messageBody;
            message.IsBodyHtml = true;
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient(SMTP_SERVER);
            smtp.Port = 587;
            smtp.EnableSsl = true;
            System.Net.NetworkCredential SMTPUserInfo = new System.Net.NetworkCredential(USER_NAME, PASSWORD);
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = SMTPUserInfo;
            try
            {
                smtp.Send(message);
            }
            catch (Exception ex)
            {

            }
        }
        protected void SetSuccessMessage(string message)
        {
            SetMessage("error", "", false);
            SetMessage("success", message, true);
        }
        protected void SetErrorMessage(string message)
        {
            SetMessage("success", "", false);
            SetMessage("error", message, true);
        }
        private void SetMessage(string type, string message, bool visible)
        {
            Panel panel = (Panel)FindControl(this.Page.Master, type + "Panel");
            Label label = (Label)FindControl(this.Page.Master,type + "Message");
            if (panel != null && label != null)
            {
                panel.Visible = visible;
                label.Text = message;
            }
            else {
                panel = (Panel)FindControl(this.Page, type + "Panel");
                label = (Label)FindControl(this.Page, type + "Message");
                if (panel != null && label != null)
                {
                    panel.Visible = visible;
                    label.Text = message;
                }
            }
        }
       
        protected void RedirectToLogin()
        {
            /*Session[WebConstants.Session.RETURN_URL] = Request.AppRelativeCurrentExecutionFilePath;
            String query=Request.QueryString.ToString();
            if (!query.Equals(""))
            {
                Session[WebConstants.Session.RETURN_URL] += "?" + Request.QueryString;
            }
            Response.Redirect("~/CustomerLogin.aspx?" + WebConstants.Request.NEED_LOGIN + "=true");*/
        }

        private SWMPDDEntities dbContenxt = null;
        protected SWMPDDEntities DatabaseContext
        {
            get
            {
                if (dbContenxt == null)
                {
                    dbContenxt = new SWMPDDEntities();
                }
                return dbContenxt;
            }
        }

        protected Control FindControl(Control root, string controlId)
        {

            if (root != null)
            {
                if (root.ID == controlId)
                {
                    return root;
                }
                foreach (Control control in root.Controls)
                {
                    Control foundControl = FindControl(control, controlId);
                    if (foundControl != null)
                        return foundControl;
                }
            }
            return null;            
        }

        protected Nullable<bool> GetBoolFromString(string ddlSelectedValue)
        {
            
            if (ddlSelectedValue.ToUpper().Equals("YES"))
            {
                return true;
            }
            else if (ddlSelectedValue.ToUpper().Equals("NO"))
            {
                return false;
            }
            return null;
        }

        protected string GetStringFromBool(Nullable<bool> boolValue)
        {
            if (boolValue == null) return "Please select";
            else if (boolValue == true) return "Yes";
            else return "No";
        }
    } 
}
