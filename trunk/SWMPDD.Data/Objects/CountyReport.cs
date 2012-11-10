using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SWMPDD.Data.Objects
{
    class CountyReport
    {
        public CountyReport()
        {
            NWLCounty = PersonResidence = 0;
            NamePerson=CountyResidence=RemovalReason="";
        }       
        

        public int NWLCounty { get; set; }
        public DateTime DRReceived { get; set; }
        public string NamePerson { get; set; }
        public string CountyResidence { get; set; }
        public int PersonResidence { get; set; }
        public DateTime DRWaitingList { get; set; }
        public string RemovalReason { get; set; }

    }
}
