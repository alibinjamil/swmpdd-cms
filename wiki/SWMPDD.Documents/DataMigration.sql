BEGIN TRY

BEGIN TRAN UpdateME

-- Update users

TRUNCATE TABLE SWMPDD.dbo.Users;

UPDATE msdepart.dbo.login SET useremail = 'support@swmpdd.com' where userid = 'view';

INSERT INTO SWMPDD.dbo.Users(UserId,UserName,Password,Name,Email,Active,UserType,LastLoginTime,UserTitle,
	Address,City,State,Zip,Phone,FirstLoginTime,LastPasswordChangeTime,LastUpdateTime,LastupdateUser,
	CreationTime,CreationUser)
SELECT NEWID(),	userid,userpassword,username,useremail,
	CASE(active)WHEN 'Y' THEN 1 ELSE 0 END,
	CASE(CHARINDEX(',',username))WHEN 0 THEN userType ELSE SUBSTRING(username,CHARINDEX(',',username)+2,LEN(username)-1-CHARINDEX(',',username)) END,
	CONVERT (datetime, lastlogin,109),userTitle,userOfficeAddress,
	UserCity,UserState,userZip,userphone,CASE(FirstTimeLogin) WHEN 'Y' THEN 1 ELSE 0 END,
	LastPasswordChangeDate,	CONVERT (datetime,LastupdatedOn,109),null,GETDATE(),null
   FROM msdepart.dbo.login;

UPDATE SWMPDD.dbo.Users
   SET Name = SUBSTRING(Name,0,CHARINDEX(',',Name))
 WHERE CHARINDEX(',',Name) > 0;

-- Adding Clients

DELETE FROM SWMPDD.dbo.Clients;

DECLARE @StatusValues TABLE (StatusId INT,StatusText VARCHAR(50))

INSERT INTO	@StatusValues VALUES(1,'Code 1 - Entered E&D Waiver');
INSERT INTO	@StatusValues VALUES(2,'Code 2 - Nursing Facility');
INSERT INTO	@StatusValues VALUES(3,'Code 3 - Entered Assisted Living Waiver');
INSERT INTO	@StatusValues VALUES(4,'Code 4 - Entered TBI/SCI Waiver');
INSERT INTO	@StatusValues VALUES(5,'Code 5 - Entered IL Waiver');
INSERT INTO	@StatusValues VALUES(6,'Code 6 - DECEASED');
INSERT INTO	@StatusValues VALUES(7,'Code 7 - Refused Waiver Services');
INSERT INTO	@StatusValues VALUES(8,'Code 8 - Other (Explain)');
INSERT INTO	@StatusValues VALUES(NULL,'Please select');

DECLARE @YesNoTable TABLE(YesNoBit bit,YesNoText VARCHAR(50));

INSERT INTO @YesNoTable VALUES (1,'Yes');
INSERT INTO @YesNoTable VALUES (0,'No');
INSERT INTO @YesNoTable VALUES (NULL,'Please select');

INSERT INTO SWMPDD.dbo.Clients(
	AdditionalPertinent,
	Address1,
	Address2,
	ApplicationApprovedBy,
	ByWhom,
	City,
	ClientAt,
	ContactPerson,
	ContactPhone,
	County,
	DateClientContacted,
	Diagnostic,
	Diet,
	Direction,
	DateOfBirth,
	Email,
	FirstName,
	Gender,
	InOtherCase,
	InTakeDate,
	IPAddress,
	LastName,
	LastUpdateUser,
	LastUpdateTime,
	LockinStatus,
	Medicaid,
	Medicare,
	MethodofContact,
	MiddleInitial,
	OfficalComments,
	OtherComments,
	ParticipantId,
	ParticipantSignature,
	PersonResidenceCode,
	Phone,
	Physician,
	PhysicianAddress,
	PhysicianCity,
	PhysicianPhone,
	PhysicianZip,
	CreationDate,
	ReferralPhone,
	ReferralSoruce,
	RelationshipToClient,
	SignatureDate,
	SSN,
	[State],
	CreationUser,
	VerificationDate,
	VerificationOfMedicaidStatus,
	Zip,
	ClientId,
	StatusId,
	StatusText,
	RemovalDate
)
SELECT 
	AdditionalPertinent,
	Address1,
	Address2,
	ApplicationApprovedBy,
	ByWhom,
	City,
	ClientAt,
	ContactPerson,
	ContactPhone,
	county,
	DateClientContacted,
	Diagnostic,
	Diet,
	Direction,
	DOB,
	EmailAddress,
	FirstName,
	Gender,
	InOtherCase,
	InTakeDate,
	ipaddress,
	LastName,
	lastUpdatedBy,
	lastupdatedDate,
	(SELECT YesNoBit FROM @YesNoTable WHERE YesNoText = LockinStatus),
	Medicaid,
	Medicare,
	MethodofContact,
	MiddleInit,
	OfficalComments,
	OtherComments,
	ParticipantId,
	ParticipantSignature,
	PersonResidenceCode,
	phone,
	Physician,
	PhysicianAddress,
	PhysicianCity,
	PhysicianPhone,
	PhysicianZip,
	recDate,
	ReferralPhone,
	ReferralSoruce,
	RelationshiptoClient,
	SignatureDate,
	SSN,
	[state],
	userid,
	VerificationDate,
	(SELECT YesNoBit FROM @YesNoTable WHERE YesNoText = VerificationofMedicaidStatus),
	zip,
	NEWID(),
	(SELECT StatusId FROM @StatusValues WHERE StatusText = ReasonforRemovalCode),
	Code8Other,
	ReasonforRemovalenteredon
FROM msdepart.dbo.tblParticipant;

--Add AdditicationalPertinentInformation

TRUNCATE TABLE Details;

INSERT INTO SWMPDD.dbo.Details(
	ClientId,
	Text,
	CreationDate,
	CreationUser,
	Type
)
SELECT 
	(SELECT ClientId FROM SWMPDD.dbo.Clients C1 WHERE C1.ParticipantId = A1.participantId),
	A1.AdditionalPertinentInformation,
	A1.recdate,
	A1.userid,
	'A'
  FROM msdepart.dbo.tblAddicationalPertinentInformation A1
 INNER JOIN msdepart.dbo.tblParticipant P1 ON P1.ParticipantId = A1.participantId;

-- Adding Comments

INSERT INTO SWMPDD.dbo.Details(
	ClientId,
	Text,
	CreationDate,
	CreationUser,
	Type
)
SELECT 
	(SELECT ClientId FROM SWMPDD.dbo.Clients C1 WHERE C1.ParticipantId = A1.participantId),
	A1.officalComments,
	A1.recdate,
	A1.userid,
	'C'
  FROM msdepart.dbo.tblofficalComments A1
 INNER JOIN msdepart.dbo.tblParticipant P1 ON P1.ParticipantId = A1.participantId;

-- Adding Providers In Progress

INSERT INTO SWMPDD.dbo.ProvidersInProgress(
	ClientId,
	Discipline,
	Frequency,
	Provider,
	CreationDate,
	CreationUser
)
SELECT (SELECT ClientId FROM SWMPDD.dbo.Clients C1 WHERE C1.ParticipantId = PP1.participantId)
      ,[Descipline]
      ,[Frequency]
      ,[Provider]
      ,PP1.recdate
      ,PP1.userid
  FROM [msdepart].[dbo].[tblProvidersinProgress] PP1
INNER JOIN msdepart.dbo.tblParticipant P1 ON P1.ParticipantId = PP1.participantId
 WHERE LEN(Descipline) > 0 
 OR LEN(Frequency) > 0
 OR LEN(Provider) > 0;

--Adding Services Needed

INSERT INTO SWMPDD.dbo.Details(
	ClientId,
	Text,
	CreationDate,
	CreationUser,
	Type
)
SELECT 
	(SELECT ClientId FROM SWMPDD.dbo.Clients C1 WHERE C1.ParticipantId = S1.participantId),
	S1.ServicesNeeded,
	S1.Recdate,
	S1.userid,
	'S'
  FROM msdepart.dbo.TblServicesNeeded S1
 INNER JOIN msdepart.dbo.tblParticipant P1 ON P1.ParticipantId = S1.participantId;

COMMIT

END TRY

BEGIN CATCH

PRINT ERROR_MESSAGE()

ROLLBACK

END CATCH


