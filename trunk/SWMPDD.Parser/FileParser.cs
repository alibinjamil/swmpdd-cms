using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using iTextSharp.text.pdf;
using SWMPDD.Data;
using System.IO;

namespace SWMPDD.Parser
{
    class FileParser
    {
        private FileParser(){

        }
        private static FileParser instance = new FileParser();
        public static FileParser Instance { get{return instance;}  }
        private bool ParseNull(string field) {
            if (field != null && field != "") {
                return true;
            }
            return false;
        }
        public void Parse()
        {
            string fileName = @"C:\Users\Ahmad Abdullah Saeed\Desktop\005964EC-043B-46C8-9B00-CE486130F082_POC_File01.pdf";
            int first = Path.GetFileName(fileName).IndexOf("_") + 1;
            int last = Path.GetFileName(fileName).IndexOf("_", first);
            string fileType = Path.GetFileName(fileName).Substring(first, last - first);
            string clientId = Path.GetFileName(fileName).Substring(0, first-1);
            SWMPDDEntities dbContext = new SWMPDDEntities();
            if (fileType == "HV")
            {
                PdfReader reader = new PdfReader(fileName);
                HomeVisit homeVisit = new HomeVisit
                {
                    VisitId = Guid.NewGuid().ToString(),
                    ClientId = clientId,
                    DateOfVisit = reader.AcroFields.GetField("Date_of_Visit") != "" ? DateTime.Parse(reader.AcroFields.GetField("Date_of_Visit")) : (DateTime?)null,
                    RN = reader.AcroFields.GetField("RN"),
                    LSW = reader.AcroFields.GetField("LSW"),
                    TypeOfVisit_Monthly = reader.AcroFields.GetField("Type_of_Visit") == "3" ? true : false,
                    TypeOfVisit_Quarterly = reader.AcroFields.GetField("Type_of_Visit") == "2" ? true : false,
                    TypeOfVisit_RecertificationCompleted = reader.AcroFields.GetField("Type_of_Visit") == "1" ? true : false,
                    ClientsAppearance_Clean = reader.AcroFields.GetField("Client_Appearance") == "1" ? true : false,
                    ClientsAppearance_Dirty = reader.AcroFields.GetField("Client_Appearance") == "2" ? true : false,
                    ClientsDress_Appropriate = reader.AcroFields.GetField("Client_Dress") == "2" ? true : false,
                    ClientsDress_Inappropriate = reader.AcroFields.GetField("Client_Dress") == "1" ? true : false,
                    ClientsGait_Steady = reader.AcroFields.GetField("Client_Gait_Steady") == "1" ? true : false,
                    ClientsGait_Unsteady = reader.AcroFields.GetField("Client_Gait_Unsteady") == "1" ? true : false,
                    ClientsGait_Assistance = reader.AcroFields.GetField("Client_Gait_Steady_Text"),
                    ClientsGait_Falls = reader.AcroFields.GetField("Client_Gait_Denies_Falls") == "1" ? true : false,
                    CleintsGait_Report = reader.AcroFields.GetField("Client_Gait_Reports_Text"),
                    MentalStatus_Alert = reader.AcroFields.GetField("Client_Mental_Alert") == "1" ? true : false,
                    MentalStatus_Oriented = reader.AcroFields.GetField("Client_Mental_Oriented") == "1" ? true : false,
                    MentalStatus_Confused = reader.AcroFields.GetField("Client_Mental_Confused") == "1" ? true : false,
                    MentalStatus_MemoryImpairment = reader.AcroFields.GetField("Client_Mental_Memory_Imp") == "1" ? true : false,
                    MentalStatus_Hallucinates = reader.AcroFields.GetField("Client_Mental_Hallucinates") == "1" ? true : false,
                    HomeEnvironment_Clean = reader.AcroFields.GetField("Home_Env_Clean") == "1" ? true : false,
                    HomeEnvironment_Dirty = reader.AcroFields.GetField("Home_Env_Dirty") == "1" ? true : false,
                    HomeEnvironment_Neat = reader.AcroFields.GetField("Home_Env_Neat") == "1" ? true : false,
                    HomeEnvironment_Odor = reader.AcroFields.GetField("Home_Env_Odor") == "1" ? true : false,
                    HomeEnvironment_Safe = reader.AcroFields.GetField("Home_Env_Safe") == "1" ? true : false,
                    HomeEnvironment_Unsafe = reader.AcroFields.GetField("Home_Env_Unsafe") == "1" ? true : false,
                    HomeEnvironment_Cluttered = reader.AcroFields.GetField("Home_Env_Cluttered") == "1" ? true : false,
                    HomeEnvironment_Uncluttered = reader.AcroFields.GetField("Home_Env_Uncluttered") == "1" ? true : false,
                    Present_Caregiver = reader.AcroFields.GetField("Present_Visit_Caregiver") == "1" ? true : false,
                    Present_Provider = reader.AcroFields.GetField("Present_Visit_Provider") == "1" ? true : false,
                    Present_FamilyFriend = reader.AcroFields.GetField("Present_Visit_Fmly_Frnd") == "1" ? true : false,
                    Present_None = reader.AcroFields.GetField("Present_Visit_None") == "1" ? true : false,
                    CaregiverSystem_ProvideName = reader.AcroFields.GetField("CG_System_Name"),
                    CaregiverSystem_Supportive = reader.AcroFields.GetField("CG_System_Supportive") == "1" ? true : false,
                    CaregiverSystem_Adequate = reader.AcroFields.GetField("CG_System_Adequate") == "1" ? true : false,
                    CaregiverSystem_Strained = reader.AcroFields.GetField("CG_System_Strained") == "1" ? true : false,
                    CaregiverSystem_Inadequate = reader.AcroFields.GetField("CG_System_Inadequate") == "1" ? true : false,
                    CaregiverSystem_Other = reader.AcroFields.GetField("CG_System_Other_Text"),
                    Medical_Denies = reader.AcroFields.GetField("Medical_Denies_MD_Visit") == "1" ? true : false,
                    Medical_SeenMD = reader.AcroFields.GetField("Medical_Visited_MD_Txt"),
                    Medical_Hospitalization = reader.AcroFields.GetField("Medical_Visited_Hospitalized_Txt"),
                    Medicaid_DeniesMedicaid = reader.AcroFields.GetField("Mcaid_Elgblty_No_Mcaid_Ltr") == "1" ? true : false,
                    Medicaid_DeniesSS = reader.AcroFields.GetField("Mcaid_Elgblty_No_SS_Ltr") == "1" ? true : false,
                    Medicaid_Received = reader.AcroFields.GetField("Mcaid_Elgblty_Rcvd_Ltr_Txt"),
                    CaseManagerInfo_HasInfo = reader.AcroFields.GetField("CM_Info_Has_Name_Tel") == "1" ? true : false,
                    CaseManagerInfo_WasProvided = reader.AcroFields.GetField("CM_Info_Provdd_Name_Tel") == "1" ? true : false,
                    ReviewOfResults = reader.AcroFields.GetField("Review_Rslts_Cncrns"),
                    ContinuePlanOfCare = reader.AcroFields.GetField("Clnt_Continue_POC") == "1" ? true : false,
                    ChangeServices = reader.AcroFields.GetField("Clnt_Change_Svcs") == "1" ? true : false,
                    ChangeServiceProviders = reader.AcroFields.GetField("Clnt_Change_Provider") == "1" ? true : false,
                    PleasedWithServices = reader.AcroFields.GetField("Clnt_Vrbalizes_Pleasure") == "1" ? true : false,
                    ProblemWith = reader.AcroFields.GetField("Clnt_Vrbalizes_Problem"),
                    GeneralComments = reader.AcroFields.GetField("General_Comments"),
                    DateSigned = reader.AcroFields.GetField("Date_Signed_CR")!=""? DateTime.Parse(reader.AcroFields.GetField("Date_Signed_CR")):(DateTime?) null,
                    CreationDate = DateTime.Now
                };
                HomeVisitService homeVisitServiceHDM = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "HDM",
                    Frequency = reader.AcroFields.GetField("Svcs_HDM_Freq"),
                    Days = reader.AcroFields.GetField("Svcs_HDM_Days"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_HDM_Person"),
                    ClientRating = reader.AcroFields.GetField("Svcs_HDM_Clnt_Rtg"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_HDM_Meets_Needs"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_HDM_Chng_Ndd"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceHDM.Frequency) || ParseNull(homeVisitServiceHDM.Days) || ParseNull(homeVisitServiceHDM.NameOfPerson)
                    || ParseNull(homeVisitServiceHDM.ClientRating) || ParseNull(homeVisitServiceHDM.MeetsNeed) || ParseNull(homeVisitServiceHDM.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceHDM);
                }
                HomeVisitService homeVisitServiceHM1 = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "HM",
                    Frequency = reader.AcroFields.GetField("Svcs_HM_Freq_01"),
                    Days = reader.AcroFields.GetField("Svcs_HM_Days_01"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_HM_Person_01"),
                    ClientRating = reader.AcroFields.GetField("Svcs_HM_Clnt_Rtg_01"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_HM_Meets_Needs_01"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_HM_Chng_Ndd_01"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceHM1.Frequency) || ParseNull(homeVisitServiceHM1.Days) || ParseNull(homeVisitServiceHM1.NameOfPerson)
                    || ParseNull(homeVisitServiceHM1.ClientRating) || ParseNull(homeVisitServiceHM1.MeetsNeed) || ParseNull(homeVisitServiceHM1.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceHM1);
                }
                HomeVisitService homeVisitServiceHM2 = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "HM",
                    Frequency = reader.AcroFields.GetField("Svcs_HM_Freq_02"),
                    Days = reader.AcroFields.GetField("Svcs_HM_Freq_02"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_HM_Freq_02"),
                    ClientRating = reader.AcroFields.GetField("Svcs_HM_Freq_02"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_HM_Freq_02"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_HM_Freq_02"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceHM2.Frequency) || ParseNull(homeVisitServiceHM2.Days) || ParseNull(homeVisitServiceHM2.NameOfPerson)
                    || ParseNull(homeVisitServiceHM2.ClientRating) || ParseNull(homeVisitServiceHM2.MeetsNeed) || ParseNull(homeVisitServiceHM2.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceHM2);
                }
                HomeVisitService homeVisitServiceHHA = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "HHA",
                    Frequency = reader.AcroFields.GetField("Svcs_HHA_Freq"),
                    Days = reader.AcroFields.GetField("Svcs_HHA_Days"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_HHA_Person"),
                    ClientRating = reader.AcroFields.GetField("Svcs_HHA_Clnt_Rtg"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_HHA_Meets_Needs"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_HHA_Chng_Ndd"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceHHA.Frequency) || ParseNull(homeVisitServiceHHA.Days) || ParseNull(homeVisitServiceHHA.NameOfPerson)
                    || ParseNull(homeVisitServiceHHA.ClientRating) || ParseNull(homeVisitServiceHHA.MeetsNeed) || ParseNull(homeVisitServiceHHA.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceHHA);
                }
                HomeVisitService homeVisitServiceSN = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "SN",
                    Frequency = reader.AcroFields.GetField("Svcs_SN_Freq"),
                    Days = reader.AcroFields.GetField("Svcs_SN_Days"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_SN_Person"),
                    ClientRating = reader.AcroFields.GetField("Svcs_SN_Clnt_Rtg"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_SN_Meets_Needs"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_SN_Chng_Ndd"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceSN.Frequency) || ParseNull(homeVisitServiceSN.Days) || ParseNull(homeVisitServiceSN.NameOfPerson)
                    || ParseNull(homeVisitServiceSN.ClientRating) || ParseNull(homeVisitServiceSN.MeetsNeed) || ParseNull(homeVisitServiceSN.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceSN);
                }
                HomeVisitService homeVisitServiceIHR = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "IHR",
                    Frequency = reader.AcroFields.GetField("Svcs_IHR_Freq"),
                    Days = reader.AcroFields.GetField("Svcs_IHR_Days"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_IHR_Person"),
                    ClientRating = reader.AcroFields.GetField("Svcs_IHR_Clnt_Rtg"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_IHR_Meets_Needs"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_IHR_Chng_Ndd"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceIHR.Frequency) || ParseNull(homeVisitServiceIHR.Days) || ParseNull(homeVisitServiceIHR.NameOfPerson)
                    || ParseNull(homeVisitServiceIHR.ClientRating) || ParseNull(homeVisitServiceIHR.MeetsNeed) || ParseNull(homeVisitServiceIHR.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceIHR);
                }
                HomeVisitService homeVisitServiceADC = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "ADC",
                    Frequency = reader.AcroFields.GetField("Svcs_ADC_Freq"),
                    Days = reader.AcroFields.GetField("Svcs_ADC_Days"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_ADC_Person"),
                    ClientRating = reader.AcroFields.GetField("Svcs_ADC_Clnt_Rtg"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_ADC_Meets_Needs"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_ADC_Chng_Ndd"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceADC.Frequency) || ParseNull(homeVisitServiceADC.Days) || ParseNull(homeVisitServiceADC.NameOfPerson)
                    || ParseNull(homeVisitServiceADC.ClientRating) || ParseNull(homeVisitServiceADC.MeetsNeed) || ParseNull(homeVisitServiceADC.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceADC);
                }
                HomeVisitService homeVisitServiceIR = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "Inst. Respite",
                    Frequency = reader.AcroFields.GetField("Svcs_IR_Freq"),
                    Days = reader.AcroFields.GetField("Svcs_IR_Days"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_IR_Person"),
                    ClientRating = reader.AcroFields.GetField("Svcs_IR_Clnt_Rtg"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_IR_Meets_Needs"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_IR_Chng_Ndd"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceIR.Frequency) || ParseNull(homeVisitServiceIR.Days) || ParseNull(homeVisitServiceIR.NameOfPerson)
                    || ParseNull(homeVisitServiceIR.ClientRating) || ParseNull(homeVisitServiceIR.MeetsNeed) || ParseNull(homeVisitServiceIR.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceIR);
                }
                HomeVisitService homeVisitServiceTpt = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "Transportation",
                    Frequency = reader.AcroFields.GetField("Svcs_Tpt_Freq"),
                    Days = reader.AcroFields.GetField("Svcs_Tpt_Days"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_Tpt_Person"),
                    ClientRating = reader.AcroFields.GetField("Svcs_Tpt_Clnt_Rtg"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_Tpt_Meets_Needs"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_Tpt_Chng_Ndd"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceTpt.Frequency) || ParseNull(homeVisitServiceTpt.Days) || ParseNull(homeVisitServiceTpt.NameOfPerson)
                    || ParseNull(homeVisitServiceTpt.ClientRating) || ParseNull(homeVisitServiceTpt.MeetsNeed) || ParseNull(homeVisitServiceTpt.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceTpt);
                }
                HomeVisitService homeVisitServiceNW1 = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "Non-Waivered",
                    Frequency = reader.AcroFields.GetField("Svcs_NW_Freq_01"),
                    Days = reader.AcroFields.GetField("Svcs_NW_Days_01"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_NW_Person_01"),
                    ClientRating = reader.AcroFields.GetField("Svcs_NW_Clnt_Rtg_01"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_NW_Meets_Needs_01"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_NW_Chng_Ndd_01"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceNW1.Frequency) || ParseNull(homeVisitServiceNW1.Days) || ParseNull(homeVisitServiceNW1.NameOfPerson)
                    || ParseNull(homeVisitServiceNW1.ClientRating) || ParseNull(homeVisitServiceNW1.MeetsNeed) || ParseNull(homeVisitServiceNW1.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceNW1);
                }
                HomeVisitService homeVisitServiceNW2 = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "Non-Waivered",
                    Frequency = reader.AcroFields.GetField("Svcs_NW_Freq_02"),
                    Days = reader.AcroFields.GetField("Svcs_NW_Days_02"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_NW_Person_02"),
                    ClientRating = reader.AcroFields.GetField("Svcs_NW_Clnt_Rtg_02"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_NW_Meets_Needs_02"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_NW_Chng_Ndd_02"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceNW2.Frequency) || ParseNull(homeVisitServiceNW2.Days) || ParseNull(homeVisitServiceNW2.NameOfPerson)
                    || ParseNull(homeVisitServiceNW2.ClientRating) || ParseNull(homeVisitServiceNW2.MeetsNeed) || ParseNull(homeVisitServiceNW2.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceNW2);
                }
                HomeVisitService homeVisitServiceNW3 = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "Non-Waivered",
                    Frequency = reader.AcroFields.GetField("Svcs_NW_Freq_03"),
                    Days = reader.AcroFields.GetField("Svcs_NW_Days_03"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_NW_Person_03"),
                    ClientRating = reader.AcroFields.GetField("Svcs_NW_Clnt_Rtg_03"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_NW_Meets_Needs_03"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_NW_Chng_Ndd_03"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceNW3.Frequency) || ParseNull(homeVisitServiceNW3.Days) || ParseNull(homeVisitServiceNW3.NameOfPerson)
                    || ParseNull(homeVisitServiceNW3.ClientRating) || ParseNull(homeVisitServiceNW3.MeetsNeed) || ParseNull(homeVisitServiceNW3.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceNW3);
                }
                HomeVisitService homeVisitServiceOther = new HomeVisitService
                {
                    ServiceId = Guid.NewGuid().ToString(),
                    Service = "Other",
                    Frequency = reader.AcroFields.GetField("Svcs_Other_Freq"),
                    Days = reader.AcroFields.GetField("Svcs_Other_Days"),
                    NameOfPerson = reader.AcroFields.GetField("Svcs_Other_Person"),
                    ClientRating = reader.AcroFields.GetField("Svcs_Other_Clnt_Rtg"),
                    MeetsNeed = reader.AcroFields.GetField("Svcs_Other_Meets_Needs"),
                    ChangesNeeded = reader.AcroFields.GetField("Svcs_Other_Chng_Ndd"),
                    CreationDate = DateTime.Now
                };
                if (ParseNull(homeVisitServiceOther.Frequency) || ParseNull(homeVisitServiceOther.Days) || ParseNull(homeVisitServiceOther.NameOfPerson)
                    || ParseNull(homeVisitServiceOther.ClientRating) || ParseNull(homeVisitServiceOther.MeetsNeed) || ParseNull(homeVisitServiceOther.ChangesNeeded))
                {
                    homeVisit.HomeVisitServices.Add(homeVisitServiceOther);
                }
                dbContext.AddToHomeVisits(homeVisit);
                dbContext.SaveChanges();
            }
            else if (fileType=="POC")
            {
                PdfReader reader = new PdfReader(fileName);
                PlanOfCare POC = new PlanOfCare {
                    POCId = Guid.NewGuid().ToString(),
                    ClientId = clientId,
                    CreationDate = DateTime.Now,
                    CaseNumber = reader.AcroFields.GetField("Case_Number"),
                    PANumber = reader.AcroFields.GetField("PA_Number"),
                    CertificationDate = reader.AcroFields.GetField("Certification_Date")!=""?DateTime.Parse(reader.AcroFields.GetField("Certification_Date")) : (DateTime?)null,
                    MedicalDXProblems = reader.AcroFields.GetField("Medical_Problems"),
                    County = reader.AcroFields.GetField("County"),
                    ProviderNumber = reader.AcroFields.GetField("Provider_Number"),
                    PrimaryDiagnosisCode = reader.AcroFields.GetField("Primary_Diagnosis_Code"),
                    PrimaryDiagnosisDescription = reader.AcroFields.GetField("Primary_Diagnosis_Description"),
                    PersonalGoal = reader.AcroFields.GetField("Personal_Goals"),
                    SignatureDate1 = reader.AcroFields.GetField("Date_Signed_CC_01")!=""?DateTime.Parse(reader.AcroFields.GetField("Date_Signed_CC_01")): (DateTime?)null,
                    SignatureDate2 = reader.AcroFields.GetField("Date_Signed_CC_02")!=""?DateTime.Parse(reader.AcroFields.GetField("Date_Signed_CC_02")): (DateTime?)null,
                    CaregiverNameIfNotIndicate = reader.AcroFields.GetField("CG_Name_01"),
                    ManagerNameCase1 = reader.AcroFields.GetField("CM1_Name"),
                    LastQuaterDate1Case1 = reader.AcroFields.GetField("CM1_Last_Qtr_Rv_Date_01")!=""?DateTime.Parse(reader.AcroFields.GetField("CM1_Last_Qtr_Rv_Date_01")): (DateTime?)null,
                    LastQuaterDate2Case1 = reader.AcroFields.GetField("CM1_Last_Qtr_Rv_Date_02")!=""?DateTime.Parse(reader.AcroFields.GetField("CM1_Last_Qtr_Rv_Date_02")): (DateTime?)null,
                    ManagerNameCase2 = reader.AcroFields.GetField("CM2_Name"),
                    LastQuaterDate1Case2 = reader.AcroFields.GetField("CM2_Last_Qtr_Rv_Date_01")!=""?DateTime.Parse(reader.AcroFields.GetField("CM2_Last_Qtr_Rv_Date_01")): (DateTime?)null,
                    LastQuaterDate2Case2 = reader.AcroFields.GetField("CM2_Last_Qtr_Rv_Date_02")!=""?DateTime.Parse(reader.AcroFields.GetField("CM2_Last_Qtr_Rv_Date_02")): (DateTime?)null
                };
                for (int count = 0; count < 10; count++) {
                    string counter = "";
                    if (count + 1 < 10){
                        counter = "0"+(count + 1);
                    }
                    else{
                        counter = ""+(count + 1);
                    }
                    POCNeed need = new POCNeed {
                        NeedId = Guid.NewGuid().ToString(),
                        CreationDate = DateTime.Now,
                        Problem = reader.AcroFields.GetField("Problems_Needs_" + counter),
                        ServiceNeed = reader.AcroFields.GetField("Service_Needed_" + counter),
                        ObjectiveNeed = reader.AcroFields.GetField("Service_Objective_" + counter)
                    };
                    if (ParseNull(reader.AcroFields.GetField("Problems_Needs_" + counter)) || ParseNull(reader.AcroFields.GetField("Service_Needed_" + counter)) || ParseNull(reader.AcroFields.GetField("Service_Objective_" + counter))){
                        POC.POCNeeds.Add(need);
                    }
                }
                for (int count = 0; count < 10; count++)
                {
                    string counter = "";
                    if (count + 1 < 10)
                    {
                        counter = "0" + (count + 1);
                    }
                    else
                    {
                        counter = "" + (count + 1);
                    }
                    POCService service = new POCService
                    {
                        ServiceId = Guid.NewGuid().ToString(),
                        CreationDate = DateTime.Now,
                        ServiceType = "Waivered",
                        RevCode = reader.AcroFields.GetField("WV_HCPCS_Rev_Code_" + counter),
                        Type = reader.AcroFields.GetField("Type_" + counter),
                        Description = reader.AcroFields.GetField("Description_" + counter),
                        HrsDays = reader.AcroFields.GetField("Hr_Day_" + counter),
                        DaysWk = reader.AcroFields.GetField("Days_Wk_" + counter),
                        HrsMonth = reader.AcroFields.GetField("Hrs_Month_" + counter),
                        VisitsWk = reader.AcroFields.GetField("Visit_Wk_" + counter),
                        VisitsMonth = reader.AcroFields.GetField("Visits_Month_" + counter),
                        Units = reader.AcroFields.GetField("Units_" + counter),
                        ProviderNameNumber = reader.AcroFields.GetField("Provider_Name_Ph_" + counter),
                        ServiceDate = reader.AcroFields.GetField("Service_Date_" + counter)!=""?DateTime.Parse(reader.AcroFields.GetField("Service_Date_" + counter)):(DateTime?)null,
                        BeginDate = reader.AcroFields.GetField("Begin_Date_" + counter)!=""?DateTime.Parse(reader.AcroFields.GetField("Begin_Date_" + counter)):(DateTime?)null,
                        EndChangeDate = reader.AcroFields.GetField("End_Change_Date_" + counter)!=""?DateTime.Parse(reader.AcroFields.GetField("End_Change_Date_" + counter)):(DateTime?)null
                    };
                    if (ParseNull(reader.AcroFields.GetField("WV_HCPCS_Rev_Code_" + counter)) || ParseNull(reader.AcroFields.GetField("Type_" + counter))
                        || ParseNull(reader.AcroFields.GetField("Description_" + counter)) || ParseNull(reader.AcroFields.GetField("Hr_Day_" + counter))
                        || ParseNull(reader.AcroFields.GetField("Days_Wk_" + counter)) || ParseNull(reader.AcroFields.GetField("Hrs_Month_" + counter))
                        || ParseNull(reader.AcroFields.GetField("Visit_Wk_" + counter)) || ParseNull(reader.AcroFields.GetField("Visits_Month_" + counter))
                        || ParseNull(reader.AcroFields.GetField("Units_" + counter)) || ParseNull(reader.AcroFields.GetField("Provider_Name_Ph_" + counter))
                        || ParseNull(reader.AcroFields.GetField("Service_Date_" + counter)) || ParseNull(reader.AcroFields.GetField("Begin_Date_" + counter))
                        || ParseNull(reader.AcroFields.GetField("End_Change_Date_" + counter)))
                    {
                        POC.POCServices.Add(service);
                    }
                }
                for (int count = 0; count < 5; count++)
                {
                    string counter = "";
                    counter = "0" + (count + 1);
                    POCService service = new POCService
                    {
                        ServiceId = Guid.NewGuid().ToString(),
                        CreationDate = DateTime.Now,
                        ServiceType = "Non-Waivered",
                        RevCode = reader.AcroFields.GetField("NW_HCPCS_Rev_Code_" + counter),
                        Type = reader.AcroFields.GetField("NW_Type_" + counter),
                        Description = reader.AcroFields.GetField("NW_Description_" + counter),
                        HrsDays = reader.AcroFields.GetField("NW_Hr_Day_" + counter),
                        DaysWk = reader.AcroFields.GetField("NW_Days_Wk_" + counter),
                        HrsMonth = reader.AcroFields.GetField("NW_Hrs_Month_" + counter),
                        VisitsWk = reader.AcroFields.GetField("NW_Visit_Wk_" + counter),
                        VisitsMonth = reader.AcroFields.GetField("NW_Visits_Month_" + counter),
                        Units = reader.AcroFields.GetField("NW_Units_" + counter),
                        ProviderNameNumber = reader.AcroFields.GetField("NW_Provider_Name_Ph_" + counter),
                        ServiceDate = reader.AcroFields.GetField("NW_Service_Date_" + counter)!=""?DateTime.Parse(reader.AcroFields.GetField("NW_Service_Date_" + counter)):(DateTime?)null,
                        BeginDate = reader.AcroFields.GetField("NW_Begin_Date_" + counter)!=""?DateTime.Parse(reader.AcroFields.GetField("NW_Begin_Date_" + counter)):(DateTime?)null,
                        EndChangeDate = reader.AcroFields.GetField("NW_End_Change_Date_" + counter)!=""?DateTime.Parse(reader.AcroFields.GetField("NW_End_Change_Date_" + counter)):(DateTime?)null
                    };
                    if (ParseNull(reader.AcroFields.GetField("NW_HCPCS_Rev_Code_" + counter)) || ParseNull(reader.AcroFields.GetField("NW_Type_" + counter))
                        || ParseNull(reader.AcroFields.GetField("NW_Description_" + counter)) || ParseNull(reader.AcroFields.GetField("NW_Hr_Day_" + counter))
                        || ParseNull(reader.AcroFields.GetField("NW_Days_Wk_" + counter)) || ParseNull(reader.AcroFields.GetField("NW_Hrs_Month_" + counter))
                        || ParseNull(reader.AcroFields.GetField("NW_Visit_Wk_" + counter)) || ParseNull(reader.AcroFields.GetField("NW_Visits_Month_" + counter))
                        || ParseNull(reader.AcroFields.GetField("NW_Units_" + counter)) || ParseNull(reader.AcroFields.GetField("NW_Provider_Name_Ph_" + counter))
                        || ParseNull(reader.AcroFields.GetField("NW_Service_Date_" + counter)) || ParseNull(reader.AcroFields.GetField("NW_Begin_Date_" + counter))
                        || ParseNull(reader.AcroFields.GetField("NW_End_Change_Date_" + counter)))
                    {
                        POC.POCServices.Add(service);
                    }
                }
                dbContext.AddToPlanOfCares(POC);
                dbContext.SaveChanges();
            }
        }
    }
}
