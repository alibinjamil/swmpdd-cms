using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SWMPDD.Data.Objects
{
    public class DashboardFactory
    {
        private static DashboardFactory instance = new DashboardFactory();
        public static DashboardFactory Instance
        {
            get { return instance; }
        }

        public List<Dashboard> PopulateDashboardObjects()
        {
            SWMPDDEntities databaseContext = new SWMPDDEntities();
            List<Client> allClients = (from c in databaseContext.Clients orderby c.County select c).ToList();
            List<Dashboard> allDashboard = new List<Dashboard>();
            Dashboard totalDashboard = new Dashboard();
            totalDashboard.County = "Total";
            string currentCounty = "none";

            Dashboard dashboard = null;
            foreach (Client client in allClients)
            {
                if (client.County != currentCounty)
                {
                    if (dashboard != null)
                    {
                        allDashboard.Add(dashboard);
                    }
                    dashboard = new Dashboard();
                    dashboard.County = client.County;
                }
                currentCounty = client.County;
                switch (client.StatusId)
                {
                    case null:
                        dashboard.Active++;
                        totalDashboard.Active++;
                        break;
                    case 1:
                        dashboard.Inactive++;
                        dashboard.Code1++;
                        totalDashboard.Inactive++;
                        totalDashboard.Code1++;
                        break;
                    case 2:
                        dashboard.Inactive++;
                        dashboard.Code2++;
                        totalDashboard.Inactive++;
                        totalDashboard.Code2++;
                        break;
                    case 3:
                        dashboard.Inactive++;
                        dashboard.Code3++;
                        totalDashboard.Inactive++;
                        totalDashboard.Code3++;
                        break;
                    case 4:
                        dashboard.Inactive++;
                        dashboard.Code4++;
                        totalDashboard.Inactive++;
                        totalDashboard.Code4++;
                        break;
                    case 5:
                        dashboard.Inactive++;
                        dashboard.Code5++;
                        totalDashboard.Inactive++;
                        totalDashboard.Code5++;
                        break;
                    case 6:
                        dashboard.Inactive++;
                        dashboard.Code6++;
                        totalDashboard.Inactive++;
                        totalDashboard.Code6++;
                        break;
                    case 7:
                        dashboard.Inactive++;
                        dashboard.Code7++;
                        totalDashboard.Inactive++;
                        totalDashboard.Code7++;
                        break;
                    case 8:
                        dashboard.Inactive++;
                        dashboard.Code8++;
                        totalDashboard.Inactive++;
                        totalDashboard.Code8++;
                        break;
                }
                dashboard.Total++;
                totalDashboard.Total++;
            }
            if (dashboard != null)
            {
                allDashboard.Add(dashboard);
            }
            allDashboard.Add(totalDashboard);
            return allDashboard;
        }
    }
}
