using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SWMPDD.Data.Objects
{   
    public class Dashboard
    {
        public Dashboard()
        {
            Code1 = Code2 = Code3 = Code4 = Code5 = Code6 = Code7 = Code8 = Active = Inactive = Total = 0;
        }       
        
        public string County { get; set; }
        public int Code1 { get; set; }
        public int Code2 { get; set; }
        public int Code3 { get; set; }
        public int Code4 { get; set; }
        public int Code5 { get; set; }
        public int Code6 { get; set; }
        public int Code7 { get; set; }
        public int Code8 { get; set; }
        public int Active { get; set; }
        public int Inactive { get; set; }
        public int Total { get; set; }
    }   
    
}
