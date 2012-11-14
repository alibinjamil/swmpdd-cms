using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using SWMPDD.Data;

namespace SWMPDD.API
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "MyAPIWebService" in code, svc and config file together.
    public class MyAPIWebService : IMyAPIWebService
    {
        public List<Client> getUser()
        {
            List<Client> Userlist = new List<Client>();
            SWMPDDEntities dataContext = new SWMPDDEntities();
            var clientList =from Client in dataContext.Clients
                           select Client;
            // select new { Client.FirstName, Client.City};

            foreach (Client ClientAtr in clientList)
            {
            Userlist.Add(ClientAtr);
            }
            return Userlist;
           }
    }
}
