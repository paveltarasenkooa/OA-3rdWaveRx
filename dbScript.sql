/****** Object:  Database [OA-3rdWave-FirstTry]    Script Date: 3/11/2024 3:38:57 PM ******/
CREATE DATABASE [OA-3rdWave-FirstTry]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_1', MAXSIZE = 32 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET ARITHABORT OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET  MULTI_USER 
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET ENCRYPTION ON
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET QUERY_STORE = ON
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Hospital]    Script Date: 3/11/2024 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital](
	[Hospital_ID] [int] NOT NULL,
	[Hospital_Name] [varchar](250) NOT NULL,
	[Hospital_Address] [varchar](250) NOT NULL,
	[Hospital_City] [varchar](250) NOT NULL,
	[Hospital_State] [varchar](250) NOT NULL,
	[Hospital_ZipCode] [varchar](250) NOT NULL,
	[Hospital_Contact_Info] [varchar](20) NOT NULL,
	[Hospital_Type] [varchar](250) NULL,
	[Hospital_Parking] [bit] NOT NULL,
	[HospitalType_ID] [int] NULL,
	[Hospital_TeachingCenter] [bit] NOT NULL,
 CONSTRAINT [PK_Hospital] PRIMARY KEY CLUSTERED 
(
	[Hospital_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospital_Type]    Script Date: 3/11/2024 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospital_Type](
	[HospitalType_ID] [int] NOT NULL,
	[HospitalType_Name] [varchar](250) NOT NULL,
	[HospitalType_Trauma_Center] [bit] NOT NULL,
	[HospitalType_Description] [text] NULL,
 CONSTRAINT [PK_Hospital_Type] PRIMARY KEY CLUSTERED 
(
	[HospitalType_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medical_Caregiver]    Script Date: 3/11/2024 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical_Caregiver](
	[CaregiverID] [int] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](255) NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[CaregiverTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CaregiverID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medical_Caregiver_Type]    Script Date: 3/11/2024 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical_Caregiver_Type](
	[CaregiverTypeID] [int] NOT NULL,
	[TypeName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CaregiverTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medical_Transaction]    Script Date: 3/11/2024 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical_Transaction](
	[RxNumber] [int] NOT NULL,
	[Date_Filled] [date] NULL,
	[NDC] [varchar](12) NULL,
	[Days_Supply] [int] NULL,
	[Patient_id] [int] NULL,
	[Total_Cost] [decimal](10, 2) NULL,
	[Transaction_Fee] [decimal](10, 2) NULL,
	[Copay_Amount] [decimal](10, 2) NULL,
	[Payer_Name] [varchar](255) NULL,
	[Nurse_Id] [int] NULL,
	[Doctor_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RxNumber] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 3/11/2024 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [varchar](10) NULL,
	[Address] [varchar](255) NULL,
	[RxNumber_IDl] [int] NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[EmergencyContact] [varchar](100) NULL,
	[BloodType] [varchar](5) NULL,
	[Allergies] [varchar](255) NULL,
	[MedicalHistory] [text] NULL,
	[PrimaryCarePhysician] [varchar](100) NULL,
	[InsuranceProvider] [varchar](100) NULL,
	[InsurancePolicyNumber] [varchar](50) NULL,
	[NextOfKin] [varchar](100) NULL,
	[MaritalStatus] [varchar](20) NULL,
	[Occupation] [varchar](50) NULL,
	[Language] [varchar](50) NULL,
	[Ethnicity] [varchar](50) NULL,
	[Religion] [varchar](50) NULL,
	[DateAdmitted] [date] NULL,
	[DischargeDate] [date] NULL,
	[RoomNumber] [varchar](20) NULL,
	[HospitalID] [int] NULL,
 CONSTRAINT [PK__Patient__970EC346AA7055E2] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Event]    Script Date: 3/11/2024 3:38:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Event](
	[EventID] [int] NOT NULL,
	[DateTime] [datetime] NULL,
	[PatientID] [int] NULL,
	[NurseID] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hospital]  WITH CHECK ADD  CONSTRAINT [FK_Hospital_Hospital_Type] FOREIGN KEY([HospitalType_ID])
REFERENCES [dbo].[Hospital_Type] ([HospitalType_ID])
GO
ALTER TABLE [dbo].[Hospital] CHECK CONSTRAINT [FK_Hospital_Hospital_Type]
GO
ALTER TABLE [dbo].[Medical_Caregiver]  WITH CHECK ADD  CONSTRAINT [FK_Medical_Caregiver_Medical_Caregiver_Type] FOREIGN KEY([CaregiverTypeID])
REFERENCES [dbo].[Medical_Caregiver_Type] ([CaregiverTypeID])
GO
ALTER TABLE [dbo].[Medical_Caregiver] CHECK CONSTRAINT [FK_Medical_Caregiver_Medical_Caregiver_Type]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Hospital] FOREIGN KEY([HospitalID])
REFERENCES [dbo].[Hospital] ([Hospital_ID])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Hospital]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Medical_Transaction] FOREIGN KEY([RxNumber_IDl])
REFERENCES [dbo].[Medical_Transaction] ([RxNumber])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Medical_Transaction]
GO
ALTER TABLE [dbo].[Patient_Event]  WITH CHECK ADD FOREIGN KEY([NurseID])
REFERENCES [dbo].[Medical_Caregiver] ([CaregiverID])
GO
ALTER DATABASE [OA-3rdWave-FirstTry] SET  READ_WRITE 
GO
