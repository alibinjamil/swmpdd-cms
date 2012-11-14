using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Web;
using SWMPDD.Data;

namespace SWMPDD.API
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IMyAPIWebService" in both code and config file together.
    [ServiceContract(Name = "SWMPDD.API", Namespace = "")]
    [XmlSerializerFormat]
    public interface IMyAPIWebService
    {
        /* [OperationContract]
         void DoWork();*/
        [WebGet(ResponseFormat = WebMessageFormat.Xml, UriTemplate = "getUser")]//to request
        [OperationContract]
        List<Client> getUser();

    }
}
