USE [E_ERP]
GO
/****** Object:  User [devadmin]    Script Date: 2/8/2018 6:59:44 PM ******/
CREATE USER [devadmin] FOR LOGIN [devadmin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [devadmin]
GO
/****** Object:  Table [dbo].[tbl_AllowanceGroup]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_AllowanceGroup](
	[AllowanceGroupID] [varchar](20) NOT NULL,
	[AllowanceGroupName] [varchar](35) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_AllowanceGroupID] PRIMARY KEY CLUSTERED 
(
	[AllowanceGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Allowances]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Allowances](
	[AllowanceID] [varchar](20) NOT NULL,
	[AllowanceName] [varchar](35) NOT NULL,
	[Type] [int] NOT NULL,
	[Value] [varchar](100) NOT NULL,
	[BasedON] [varchar](20) NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[WorkareaID] [varchar](20) NOT NULL,
	[AllowanceGroupID] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_AllowanceID] PRIMARY KEY CLUSTERED 
(
	[AllowanceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Company](
	[CompanyID] [varchar](20) NOT NULL,
	[CustomerId] [nvarchar](50) NOT NULL,
	[CompanyName] [varchar](100) NOT NULL,
	[CompanyCode] [varchar](6) NOT NULL,
	[Description] [varchar](300) NULL,
	[YearOfEstablishment] [varchar](6) NOT NULL,
	[CompanyLogo] [varchar](300) NOT NULL,
	[CompanyEmail] [varchar](50) NOT NULL,
	[PrimaryAddress] [varchar](300) NOT NULL,
	[CountryID] [varchar](20) NOT NULL,
	[StateID] [varchar](20) NOT NULL,
	[Pincode] [int] NULL,
	[Website] [varchar](50) NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Priority] [int] NOT NULL,
	[CST] [varchar](20) NULL,
	[TIN] [varchar](20) NULL,
	[PAN] [varchar](20) NULL,
	[TAN] [varchar](20) NULL,
	[GST] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_CompanyID] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Country](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryID] [varchar](20) NOT NULL,
	[CountryName] [varchar](35) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_CountryID] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Customers]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Customers](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Gender] [varchar](20) NULL,
	[CompanyName] [nvarchar](150) NULL,
	[CompanyDesc] [nvarchar](500) NULL,
	[WorkAreas] [int] NULL CONSTRAINT [DF_tbl_customers_WorkAreas]  DEFAULT ((0)),
	[Address] [nvarchar](150) NULL,
	[Village] [nvarchar](150) NULL,
	[City] [nvarchar](150) NULL,
	[State] [nvarchar](150) NULL,
	[PostalCode] [nvarchar](150) NULL,
	[Country] [nvarchar](150) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[DefaultPhoneNumber] [nvarchar](50) NULL,
	[AdministratorEmailId] [nvarchar](100) NULL,
	[AlternativeEmailId] [nvarchar](100) NULL,
	[ProductPlan] [nvarchar](50) NULL,
	[DateofReg] [datetime] NULL,
	[RegPeriodinDays] [int] NULL,
	[DateofExpiry] [datetime] NULL,
	[NoofUsers] [int] NULL,
	[NoOfCompany] [int] NULL,
	[NoOfWorkArea] [int] NULL,
	[Status] [int] NULL,
	[ModuleLicensing] [nvarchar](500) NULL,
	[OrderNo] [int] NULL,
	[TotalOrderAmount] [decimal](18, 0) NULL,
	[TermsandConditions] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[IsDeleted] [int] NULL CONSTRAINT [DF_tbl_Customers_IsDeleted]  DEFAULT ((0)),
	[DeletedBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Departments]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Departments](
	[DepartmentID] [varchar](20) NOT NULL,
	[DepartmentName] [varchar](35) NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[WorkareaID] [varchar](20) NOT NULL,
	[DivisionID] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_DepartmentID] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Designations]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Designations](
	[DesignitionID] [varchar](20) NOT NULL,
	[DesignitionName] [varchar](35) NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[WorkareaID] [varchar](20) NOT NULL,
	[DivisionID] [varchar](20) NOT NULL,
	[DepartmentID] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_DesignitionID] PRIMARY KEY CLUSTERED 
(
	[DesignitionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Divisions]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Divisions](
	[DivisionID] [varchar](20) NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[WorkareaID] [varchar](20) NOT NULL,
	[DivisionName] [varchar](35) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_DivisionID] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_EventManager]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_EventManager](
	[EventID] [varchar](50) NOT NULL,
	[EventName] [varchar](35) NOT NULL,
	[EventState] [int] NULL,
	[FormID] [varchar](20) NULL,
	[ModuleID] [nvarchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_EventID] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Forms]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Forms](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[FormId] [varchar](20) NOT NULL,
	[FormName] [varchar](35) NULL,
	[FormUrl] [varchar](300) NULL,
	[ModuleId] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_FormId] PRIMARY KEY CLUSTERED 
(
	[FormId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_FORMWISESECURITY]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_FORMWISESECURITY](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleID] [nvarchar](20) NOT NULL,
	[FormID] [varchar](20) NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CanView] [int] NULL,
	[CanSave] [int] NULL,
	[CanDelete] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Holiday]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Holiday](
	[ID] [int] NOT NULL,
	[Name] [varchar](35) NOT NULL,
	[YEAR] [varchar](6) NOT NULL,
	[Reason] [varchar](300) NULL,
	[FromDate] [varchar](15) NOT NULL,
	[ToDate] [varchar](15) NOT NULL,
	[FromTime] [varchar](15) NULL,
	[ToTime] [varchar](15) NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[HolidayGroupID] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_Holiday_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_HolidayGroup]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_HolidayGroup](
	[HolidayGroupID] [varchar](20) NOT NULL,
	[HolidayGroupName] [varchar](35) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
 CONSTRAINT [Pk_HolidayGroupID] PRIMARY KEY CLUSTERED 
(
	[HolidayGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_LeaveGroup]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LeaveGroup](
	[LeaveGroupID] [varchar](20) NOT NULL,
	[LeaveGroupName] [varchar](35) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
 CONSTRAINT [Pk_LeaveGroupID] PRIMARY KEY CLUSTERED 
(
	[LeaveGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_LeaveType]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LeaveType](
	[ID] [int] NOT NULL,
	[LeaveName] [varchar](35) NOT NULL,
	[Abbreviation] [varchar](6) NOT NULL,
	[IsPaidType] [int] NULL,
	[IsEncashable] [int] NULL,
	[IsCummulative] [int] NULL,
	[NoOfDays] [int] NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[LeaveGroupID] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_LeaveType_ID] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_LoginHistory]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_LoginHistory](
	[LoginId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](15) NOT NULL,
	[UserName] [varchar](15) NOT NULL,
	[LastLoginDate] [datetime] NULL,
	[IPAddress] [varchar](15) NULL,
	[SessionId] [varchar](300) NULL,
	[hasActiveSession] [bit] NULL,
	[AuthenticatedOTP] [varchar](6) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [pk_LoginId] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Modules]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Modules](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[ModuleId] [nvarchar](20) NOT NULL,
	[ModuleName] [nvarchar](35) NOT NULL,
	[ModuleUrl] [nvarchar](300) NOT NULL,
	[ModuleDescription] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Roles](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleID] [varchar](20) NOT NULL,
	[RoleName] [varchar](35) NOT NULL,
	[Description] [varchar](300) NULL,
	[CompanyID] [varchar](20) NULL,
	[WorkareaID] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CustomerId] [varchar](20) NOT NULL,
 CONSTRAINT [Pk_RoleID] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_ShiftGroup]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_ShiftGroup](
	[ShiftGroupID] [varchar](20) NOT NULL,
	[ShiftGroupName] [varchar](35) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
 CONSTRAINT [Pk_ShiftGroupID] PRIMARY KEY CLUSTERED 
(
	[ShiftGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_States]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_States](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [varchar](20) NOT NULL,
	[StateName] [varchar](35) NOT NULL,
	[CountryId] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_StateId] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TBL_USERROLEASSIGNMENTS]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TBL_USERROLEASSIGNMENTS](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoleId] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [int] NOT NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](150) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [varchar](100) NULL,
	[CompanyID] [int] NULL,
	[WorkAreaID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](20) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](20) NULL,
	[PasswordQuestion1] [nvarchar](150) NULL,
	[PasswordQuestion2] [nvarchar](150) NULL,
	[PasswordAnswer1] [nvarchar](150) NULL,
	[PasswordAnswer2] [nvarchar](150) NULL,
	[UserType] [int] NULL,
	[UserId] [nvarchar](20) NULL,
	[status] [int] NULL,
	[CustomerId] [varchar](20) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Gender] [int] NULL,
	[MaritalStatus] [int] NULL,
	[DateOfBirth] [date] NULL,
	[Age] [int] NULL,
	[ProfilePicUrl] [nvarchar](max) NULL,
	[UniqueAccessPath] [nvarchar](max) NULL,
	[Mobile] [bigint] NULL,
	[CountryId] [varchar](20) NULL,
	[StateId] [varchar](20) NULL,
	[PrimaryAddress] [varchar](300) NULL,
 CONSTRAINT [pk_id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_WorkArea]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_WorkArea](
	[WorkareaID] [varchar](20) NOT NULL,
	[WorkareaName] [varchar](35) NOT NULL,
	[WorkareaCode] [varchar](6) NOT NULL,
	[CustomerID] [varchar](20) NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[YearOfEstablishment] [varchar](6) NOT NULL,
	[Priority] [int] NOT NULL,
	[PrimaryAddress] [varchar](300) NOT NULL,
	[CountryID] [varchar](20) NOT NULL,
	[StateID] [varchar](20) NOT NULL,
	[Pincode] [int] NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[FaxNumber] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[Website] [varchar](60) NULL,
	[LeaveGroupID] [varchar](20) NULL,
	[ShiftGroupID] [varchar](20) NULL,
	[AllowanceGroupID] [varchar](20) NULL,
	[HolidayGroupID] [varchar](20) NULL,
	[CST] [varchar](20) NULL,
	[TIN] [varchar](20) NULL,
	[TAN] [varchar](20) NULL,
	[PAN] [varchar](20) NULL,
	[GST] [varchar](20) NULL,
	[PFCode] [varchar](20) NULL,
	[ESICode] [varchar](20) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_WorkareaID] PRIMARY KEY CLUSTERED 
(
	[WorkareaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_WorkAreaRules_Fields]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_WorkAreaRules_Fields](
	[RuleID] [varchar](20) NOT NULL,
	[RuleIndex] [varchar](5) NOT NULL,
	[Rule_Name] [varchar](300) NOT NULL,
	[Description] [varchar](max) NULL,
	[ModuleID] [varchar](20) NOT NULL,
	[DefaultValue] [varchar](20) NULL,
	[IsEditable] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [Pk_WorkAreaRules_RuleID] PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_WorkAreaRulesValues]    Script Date: 2/8/2018 6:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_WorkAreaRulesValues](
	[Value] [varchar](20) NOT NULL,
	[CompanyID] [varchar](20) NOT NULL,
	[WorkareaID] [varchar](20) NOT NULL,
	[RuleID] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Status] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_Company] ([CompanyID], [CustomerId], [CompanyName], [CompanyCode], [Description], [YearOfEstablishment], [CompanyLogo], [CompanyEmail], [PrimaryAddress], [CountryID], [StateID], [Pincode], [Website], [PhoneNumber], [Priority], [CST], [TIN], [PAN], [TAN], [GST], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'100001', N'10000682', N'Ethon Health Care', N'ETH', N'', N'2007', N'', N'ethonnoreply@gmail.com', N'Madhapur', N'10001', N'1001', 500081, N'www.ethonhealthcare.com', N'8499978610', 1, N'', N'', N'', N'', N'', CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-24 18:02:59.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Company] ([CompanyID], [CustomerId], [CompanyName], [CompanyCode], [Description], [YearOfEstablishment], [CompanyLogo], [CompanyEmail], [PrimaryAddress], [CountryID], [StateID], [Pincode], [Website], [PhoneNumber], [Priority], [CST], [TIN], [PAN], [TAN], [GST], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'100002', N'10000683', N'Data base tech 1', N'DBT', NULL, N'2012', N'', N'data_basedevp@gmail.com', N'Madhapur', N'10001', N'1001', 500047, N'www.databasetech.com', N'9706114254', 1, N'', N'', N'', N'', N'', CAST(N'2018-01-31 10:39:28.963' AS DateTime), 1, CAST(N'2018-01-31 10:39:28.963' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Company] ([CompanyID], [CustomerId], [CompanyName], [CompanyCode], [Description], [YearOfEstablishment], [CompanyLogo], [CompanyEmail], [PrimaryAddress], [CountryID], [StateID], [Pincode], [Website], [PhoneNumber], [Priority], [CST], [TIN], [PAN], [TAN], [GST], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'100003', N'10000684', N'Data base tech 2', N'DBT', NULL, N'2012', N'', N'data_basedevp@gmail.com', N'Madhapur', N'10001', N'1001', 500047, N'www.databasetech.com', N'9706114226', 1, N'', N'', N'', N'', N'', CAST(N'2018-01-31 10:40:12.987' AS DateTime), 1, CAST(N'2018-01-31 10:40:12.987' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Company] ([CompanyID], [CustomerId], [CompanyName], [CompanyCode], [Description], [YearOfEstablishment], [CompanyLogo], [CompanyEmail], [PrimaryAddress], [CountryID], [StateID], [Pincode], [Website], [PhoneNumber], [Priority], [CST], [TIN], [PAN], [TAN], [GST], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'100004', N'10000685', N'Data base tech 3', N'DBT', NULL, N'2012', N'', N'data_basedev3p@gmail.com', N'Madhapur', N'10001', N'1001', 500047, N'www.databasetech.com', N'9706159226', 1, N'', N'', N'', N'', N'', CAST(N'2018-01-31 10:40:39.200' AS DateTime), 1, CAST(N'2018-01-31 10:40:39.200' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_Country] ON 

INSERT [dbo].[tbl_Country] ([RecordId], [CountryID], [CountryName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'10001', N'India', CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_Country] OFF
SET IDENTITY_INSERT [dbo].[tbl_Customers] ON 

INSERT [dbo].[tbl_Customers] ([RecordId], [CustomerId], [UserName], [Password], [FirstName], [MiddleName], [LastName], [Gender], [CompanyName], [CompanyDesc], [WorkAreas], [Address], [Village], [City], [State], [PostalCode], [Country], [PhoneNumber], [DefaultPhoneNumber], [AdministratorEmailId], [AlternativeEmailId], [ProductPlan], [DateofReg], [RegPeriodinDays], [DateofExpiry], [NoofUsers], [NoOfCompany], [NoOfWorkArea], [Status], [ModuleLicensing], [OrderNo], [TotalOrderAmount], [TermsandConditions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy]) VALUES (1, N'10000682', N'admin', N'admin', N'Admin', NULL, N'Admin', N'1', N'Ethon Health Care', NULL, 1, N'Madhapur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[tbl_Customers] ([RecordId], [CustomerId], [UserName], [Password], [FirstName], [MiddleName], [LastName], [Gender], [CompanyName], [CompanyDesc], [WorkAreas], [Address], [Village], [City], [State], [PostalCode], [Country], [PhoneNumber], [DefaultPhoneNumber], [AdministratorEmailId], [AlternativeEmailId], [ProductPlan], [DateofReg], [RegPeriodinDays], [DateofExpiry], [NoofUsers], [NoOfCompany], [NoOfWorkArea], [Status], [ModuleLicensing], [OrderNo], [TotalOrderAmount], [TermsandConditions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy]) VALUES (2, N'10000683', N'ethon', N'ethon', N'Ajay', NULL, N'kumar', N'1', N'Data base tech', NULL, 1, N'Madhapur', NULL, NULL, N'Telangana', N'500047', N'India', N'9706114254', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[tbl_Customers] ([RecordId], [CustomerId], [UserName], [Password], [FirstName], [MiddleName], [LastName], [Gender], [CompanyName], [CompanyDesc], [WorkAreas], [Address], [Village], [City], [State], [PostalCode], [Country], [PhoneNumber], [DefaultPhoneNumber], [AdministratorEmailId], [AlternativeEmailId], [ProductPlan], [DateofReg], [RegPeriodinDays], [DateofExpiry], [NoofUsers], [NoOfCompany], [NoOfWorkArea], [Status], [ModuleLicensing], [OrderNo], [TotalOrderAmount], [TermsandConditions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy]) VALUES (3, N'10000684', N'naveen', N'naveen', N'Naveen', NULL, N'kumar', N'1', N'Data base tech', NULL, 1, N'Madhapur', NULL, NULL, N'Telangana', N'500047', N'India', N'9706114226', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[tbl_Customers] ([RecordId], [CustomerId], [UserName], [Password], [FirstName], [MiddleName], [LastName], [Gender], [CompanyName], [CompanyDesc], [WorkAreas], [Address], [Village], [City], [State], [PostalCode], [Country], [PhoneNumber], [DefaultPhoneNumber], [AdministratorEmailId], [AlternativeEmailId], [ProductPlan], [DateofReg], [RegPeriodinDays], [DateofExpiry], [NoofUsers], [NoOfCompany], [NoOfWorkArea], [Status], [ModuleLicensing], [OrderNo], [TotalOrderAmount], [TermsandConditions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [IsDeleted], [DeletedBy]) VALUES (4, N'10000685', N'Shakeer', N'Shakeer', N'Shakeer', NULL, N'kumar', N'1', N'Data base tech', NULL, 1, N'Madhapur', NULL, NULL, N'Telangana', N'500047', N'India', N'9706159226', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Customers] OFF
SET IDENTITY_INSERT [dbo].[tbl_Forms] ON 

INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'10001', N'Administration Home', N'administration', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'10002', N'Manage Company', N'administration/managecompany', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'10003', N'Manage Workarea', N'administration/manageworkarea', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'10004', N'Manage Divisions', N'administration/managedivisions', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'10005', N'Manage Departments', N'administration/managedepartments', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'10006', N'Manage Designations', N'administration/managedesignations', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'10007', N'Manage Holiday Groups', N'administration/manageholidaygroups', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'10008', N'Manage Leave Groups', N'leavemanagement/manageleavegroups', N'10005', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'10009', N'Manage Shift Groups', N'attendance/manageshiftgroups', N'10002', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'10010', N'Manage Allowance Groups', N'payroll/manageallowancegroups', N'10003', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'10011', N'Manage Holidays', N'administration/manageholidays', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'10012', N'Manage Leave Types', N'leavemanagement/manageleavetypes', N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'10013', N'Manage Leaves', N'leavemanagement/manageleaves', N'10005', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'10014', N'Manage Shifts', N'attendance/manageshifts', N'10002', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Forms] ([RecordId], [FormId], [FormName], [FormUrl], [ModuleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'10015', N'Manage Allowances', N'payroll/manageallowances', N'10003', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_Forms] OFF
SET IDENTITY_INSERT [dbo].[TBL_FORMWISESECURITY] ON 

INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (1, N'10001', N'10001', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (2, N'10001', N'10002', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (3, N'10001', N'10003', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (4, N'10001', N'10004', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (5, N'10001', N'10005', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (6, N'10001', N'10006', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (7, N'10001', N'10007', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (8, N'10005', N'10008', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (9, N'10002', N'10009', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (10, N'10003', N'10010', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (11, N'10001', N'10011', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (12, N'10001', N'10012', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (13, N'10005', N'10013', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (14, N'10002', N'10014', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (15, N'10003', N'10015', 1, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (16, N'10001', N'10001', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (17, N'10001', N'10002', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (18, N'10001', N'10003', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (19, N'10001', N'10004', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (20, N'10001', N'10005', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (21, N'10001', N'10006', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (22, N'10001', N'10007', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (23, N'10005', N'10008', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (24, N'10002', N'10009', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (25, N'10003', N'10010', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (26, N'10001', N'10011', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (27, N'10001', N'10012', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (28, N'10005', N'10013', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (29, N'10002', N'10014', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
INSERT [dbo].[TBL_FORMWISESECURITY] ([RecordId], [ModuleID], [FormID], [UserID], [RoleID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CanView], [CanSave], [CanDelete]) VALUES (30, N'10003', N'10015', 2, N'10001', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[TBL_FORMWISESECURITY] OFF
SET IDENTITY_INSERT [dbo].[tbl_LoginHistory] ON 

INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (1, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'EY5B5HIYckexok9SccogLSncqc4uXES6vxmOHdMJ+plkdnsqBvmBiMpTHZe4JB7w47a61SiArfxQ+OH7ddSwhaUA00l0bi2kv5KGkwqPG7LstX9ViGcVgM7ednR2kHF93GLr8KGeRdPpRNAuEi2EfQcoiFAvk2ITTjuAIO0WZl0=', 0, NULL, CAST(N'2018-01-18 18:02:12.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (2, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'Ez5qI/eN1PqFpiyPcLQs19IbOY+M2xDIA56I/olrKUD0A0Uf8aaHSU2zABzdttlgdwUkFbyH7zmrA2q3CIHYKCyUXe+3pbdoTM+DkUAUj5chE/cxASR2hcsAHuQeRIfnRjXQmjskK0+i6b849oGnD6hV+oww8f0l43TZnTdqg6s=', 0, NULL, CAST(N'2018-01-18 18:14:29.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (3, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-19 10:47:07.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (4, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-19 10:50:49.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (5, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-19 11:23:40.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (6, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-19 11:49:55.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (7, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-19 12:26:19.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (8, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-19 12:57:02.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (9, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-22 10:17:10.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (10, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-22 10:20:40.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (11, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-22 10:28:44.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (12, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-22 12:30:18.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (13, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-22 12:32:52.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (14, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-22 13:35:16.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (15, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-22 13:39:12.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (16, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-22 13:55:07.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (17, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 10:56:05.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (18, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 11:40:07.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (19, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 12:19:37.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (20, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 12:55:56.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (21, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 12:58:31.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (22, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 13:50:11.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (23, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 13:54:39.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (24, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 15:34:41.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (25, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 19:36:07.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (26, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 19:40:01.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (27, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-23 19:49:52.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (28, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 12:11:14.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (29, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 12:13:06.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (30, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 13:35:17.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (31, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), NULL, N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 15:32:51.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (32, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 15:41:23.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (33, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 16:35:28.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (34, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 16:42:11.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (35, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 17:14:12.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (36, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 17:22:34.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (37, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 17:32:21.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (38, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-01-24 17:59:50.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (39, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-02-08 10:27:37.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (40, N'1', N'admin', CAST(N'2018-01-18 18:02:12.000' AS DateTime), N'', N'2xPCBKqT3+uVJTbINcgNkmmL53Kci3ctIcv2IqZ13IzYfhdLTMH0g4d3js37/aw2uXMQDhm5SGxWaeyyuDiGtNsMGROCQrN2RAJHmeIfA1Yv8V/Z0gIGriPYf/LRyL+9mmdZ7jrQMm0se7xZ8CK0tgunB8WSbrQhxnK28WPiv1s=', 1, NULL, CAST(N'2018-02-08 11:13:14.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (41, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 11:20:38.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (42, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 11:28:13.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (43, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 11:59:23.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (44, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 12:59:43.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (45, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 13:29:30.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (46, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 13:48:22.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (47, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 16:21:47.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (48, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 16:24:18.000' AS DateTime))
INSERT [dbo].[tbl_LoginHistory] ([LoginId], [UserId], [UserName], [LastLoginDate], [IPAddress], [SessionId], [hasActiveSession], [AuthenticatedOTP], [CreatedDate]) VALUES (49, N'2', N'ajay', CAST(N'2018-02-08 11:20:38.000' AS DateTime), N'', N'uqfeCuOc3fvHnCDLbEAEp8rGW9j0SHGt1BoPyO3Tn1/V1mWJpLrvRs7mUdR7yHRlzNXLUpmdDanwQsPEF8f5MN+W1rrPTvFit8QaMqnfiO3UFvUqGceb7zXlBy7Itp3i61If4Fjt4ffqmYVPS4TWKIVhAAtRmZ3yIiY9tE40KfY=', 1, NULL, CAST(N'2018-02-08 16:25:58.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_LoginHistory] OFF
SET IDENTITY_INSERT [dbo].[tbl_Modules] ON 

INSERT [dbo].[tbl_Modules] ([RecordId], [ModuleId], [ModuleName], [ModuleUrl], [ModuleDescription], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'10001', N'Administration', N'administration', N'Administration Dashboard', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Modules] ([RecordId], [ModuleId], [ModuleName], [ModuleUrl], [ModuleDescription], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'10002', N'Attendance', N'attendance', N'Attendance Dashboard', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Modules] ([RecordId], [ModuleId], [ModuleName], [ModuleUrl], [ModuleDescription], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'10003', N'Payroll', N'payroll', N'Payroll Dashboard', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Modules] ([RecordId], [ModuleId], [ModuleName], [ModuleUrl], [ModuleDescription], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'10004', N'Security', N'security', N'Security Dashboard', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Modules] ([RecordId], [ModuleId], [ModuleName], [ModuleUrl], [ModuleDescription], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'10005', N'Leave Management', N'leavemanagement', N'Leave Management Dashboard', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_Modules] ([RecordId], [ModuleId], [ModuleName], [ModuleUrl], [ModuleDescription], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'10006', N'Other', N'other', N'Other Forms', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_Modules] OFF
SET IDENTITY_INSERT [dbo].[tbl_Roles] ON 

INSERT [dbo].[tbl_Roles] ([RecordId], [RoleID], [RoleName], [Description], [CompanyID], [WorkareaID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [CustomerId]) VALUES (4, N'10001', N'SuperAdmin', NULL, N'', NULL, CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, 0, N'10000682')
SET IDENTITY_INSERT [dbo].[tbl_Roles] OFF
SET IDENTITY_INSERT [dbo].[tbl_States] ON 

INSERT [dbo].[tbl_States] ([RecordId], [StateId], [StateName], [CountryId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'1001', N'Telangana', N'10001', CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[tbl_States] OFF
SET IDENTITY_INSERT [dbo].[TBL_USERROLEASSIGNMENTS] ON 

INSERT [dbo].[TBL_USERROLEASSIGNMENTS] ([RecordId], [UserID], [RoleId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, 1, N'10001', CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-19 00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[TBL_USERROLEASSIGNMENTS] OFF
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([Id], [Username], [Password], [Email], [CompanyID], [WorkAreaID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [PasswordQuestion1], [PasswordQuestion2], [PasswordAnswer1], [PasswordAnswer2], [UserType], [UserId], [status], [CustomerId], [FirstName], [MiddleName], [LastName], [Gender], [MaritalStatus], [DateOfBirth], [Age], [ProfilePicUrl], [UniqueAccessPath], [Mobile], [CountryId], [StateId], [PrimaryAddress]) VALUES (1, N'admin', N'ZiW+dSI8nwzA0+vxDo0Stw==', N'ethadmin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, N'10000682', N'Admin', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9000078948, NULL, NULL, NULL)
INSERT [dbo].[tbl_Users] ([Id], [Username], [Password], [Email], [CompanyID], [WorkAreaID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [PasswordQuestion1], [PasswordQuestion2], [PasswordAnswer1], [PasswordAnswer2], [UserType], [UserId], [status], [CustomerId], [FirstName], [MiddleName], [LastName], [Gender], [MaritalStatus], [DateOfBirth], [Age], [ProfilePicUrl], [UniqueAccessPath], [Mobile], [CountryId], [StateId], [PrimaryAddress]) VALUES (2, N'ajay', N'ZiW+dSI8nwzA0+vxDo0Stw==', N'data_basedev3p@gmail.com', 100004, NULL, CAST(N'2018-01-31 11:07:32.150' AS DateTime), N'1', CAST(N'2018-01-31 11:07:32.150' AS DateTime), N'1', NULL, NULL, NULL, NULL, 0, NULL, 0, N'10000683', N'Ajay', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9706114254, NULL, NULL, NULL)
INSERT [dbo].[tbl_Users] ([Id], [Username], [Password], [Email], [CompanyID], [WorkAreaID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [PasswordQuestion1], [PasswordQuestion2], [PasswordAnswer1], [PasswordAnswer2], [UserType], [UserId], [status], [CustomerId], [FirstName], [MiddleName], [LastName], [Gender], [MaritalStatus], [DateOfBirth], [Age], [ProfilePicUrl], [UniqueAccessPath], [Mobile], [CountryId], [StateId], [PrimaryAddress]) VALUES (3, N'naveen', N'ZiW+dSI8nwzA0+vxDo0Stw==', N'data_basedev3p@gmail.com', NULL, 10003, CAST(N'2018-01-31 11:08:23.950' AS DateTime), N'1', CAST(N'2018-01-31 11:08:23.950' AS DateTime), N'1', NULL, NULL, NULL, NULL, 0, NULL, 0, N'10000684', N'Naveen', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9706114254, NULL, NULL, NULL)
INSERT [dbo].[tbl_Users] ([Id], [Username], [Password], [Email], [CompanyID], [WorkAreaID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [PasswordQuestion1], [PasswordQuestion2], [PasswordAnswer1], [PasswordAnswer2], [UserType], [UserId], [status], [CustomerId], [FirstName], [MiddleName], [LastName], [Gender], [MaritalStatus], [DateOfBirth], [Age], [ProfilePicUrl], [UniqueAccessPath], [Mobile], [CountryId], [StateId], [PrimaryAddress]) VALUES (4, N'shakeer', N'ZiW+dSI8nwzA0+vxDo0Stw==', N'data_basedev3p@gmail.com', 100004, 10004, CAST(N'2018-01-31 11:08:58.797' AS DateTime), N'1', CAST(N'2018-01-31 11:08:58.797' AS DateTime), N'1', NULL, NULL, NULL, NULL, 0, NULL, 0, N'10000685', N'Shakeer', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9706114254, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
INSERT [dbo].[tbl_WorkArea] ([WorkareaID], [WorkareaName], [WorkareaCode], [CustomerID], [CompanyID], [YearOfEstablishment], [Priority], [PrimaryAddress], [CountryID], [StateID], [Pincode], [PhoneNumber], [FaxNumber], [Email], [Website], [LeaveGroupID], [ShiftGroupID], [AllowanceGroupID], [HolidayGroupID], [CST], [TIN], [TAN], [PAN], [GST], [PFCode], [ESICode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10001', N'Madhapur', N'MDH1', N'10000682', N'100001', N'2007', 1, N'Madhapur', N'10001', N'1001', 500081, N'8499978610', N'22461774', N'ethonnoreply@gmail.com', N'www.ethonhealthcare.com', NULL, NULL, NULL, NULL, N'656666262', N'656666245', N'65666675', N'GHT656666262', N'15', N'PK102451', N'ESI100012', CAST(N'2018-01-31 10:47:33.030' AS DateTime), 1, CAST(N'2018-01-31 10:47:33.030' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkArea] ([WorkareaID], [WorkareaName], [WorkareaCode], [CustomerID], [CompanyID], [YearOfEstablishment], [Priority], [PrimaryAddress], [CountryID], [StateID], [Pincode], [PhoneNumber], [FaxNumber], [Email], [Website], [LeaveGroupID], [ShiftGroupID], [AllowanceGroupID], [HolidayGroupID], [CST], [TIN], [TAN], [PAN], [GST], [PFCode], [ESICode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10002', N'Ayyappa society 1', N'APSC1', N'10000683', N'100002', N'2012', 1, N'Madhapur', N'10001', N'1001', 500081, N'8499978610', N'22461774', N'data_basedev3p@gmail.com', N'www.databasetech.com', NULL, NULL, NULL, NULL, N'656666262', N'656666245', N'65666675', N'GHT656666244', N'15', N'PK104451', N'ESI100014', CAST(N'2018-01-31 11:02:10.730' AS DateTime), 1, CAST(N'2018-01-31 11:02:10.730' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkArea] ([WorkareaID], [WorkareaName], [WorkareaCode], [CustomerID], [CompanyID], [YearOfEstablishment], [Priority], [PrimaryAddress], [CountryID], [StateID], [Pincode], [PhoneNumber], [FaxNumber], [Email], [Website], [LeaveGroupID], [ShiftGroupID], [AllowanceGroupID], [HolidayGroupID], [CST], [TIN], [TAN], [PAN], [GST], [PFCode], [ESICode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10003', N'Ayyappa society 2', N'APSC1', N'10000683', N'100002', N'2012', 1, N'Madhapur', N'10001', N'1001', 500081, N'8499978610', N'22461774', N'data_basedev3p@gmail.com', N'www.databasetech.com', NULL, NULL, NULL, NULL, N'656666262', N'656666245', N'65666675', N'GHT656666244', N'15', N'PK104451', N'ESI100014', CAST(N'2018-01-31 11:02:25.803' AS DateTime), 1, CAST(N'2018-01-31 11:02:25.803' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkArea] ([WorkareaID], [WorkareaName], [WorkareaCode], [CustomerID], [CompanyID], [YearOfEstablishment], [Priority], [PrimaryAddress], [CountryID], [StateID], [Pincode], [PhoneNumber], [FaxNumber], [Email], [Website], [LeaveGroupID], [ShiftGroupID], [AllowanceGroupID], [HolidayGroupID], [CST], [TIN], [TAN], [PAN], [GST], [PFCode], [ESICode], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10004', N'Ayyappa society 3', N'APSC1', N'10000683', N'100002', N'2012', 1, N'Madhapur', N'10001', N'1001', 500081, N'8499978610', N'22461774', N'data_basedev3p@gmail.com', N'www.databasetech.com', NULL, NULL, NULL, NULL, N'656666262', N'656666245', N'65666675', N'GHT656666244', N'15', N'PK104451', N'ESI100014', CAST(N'2018-01-31 11:02:35.320' AS DateTime), 1, CAST(N'2018-01-31 11:02:35.320' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10001', N'A', N'Late Comings Allowed (Yes/ No)', N'', N'10002', N'1', 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10002', N'A1', N'If ''A'' is Yes, Then Late Deductable Ratio', N'', N'10002', N'1', 3, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10003', N'B', N'Absent Deductable Ratio', N'', N'10002', N'1', 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10004', N'C', N'Max. Permissions allowed in a month', N'', N'10002', N'1', 3, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10005', N'C1', N'Max. Hours allowed per permission', N'', N'10002', N'1', 2, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10006', N'D', N'OT Applicable (Yes/ No)', N'', N'10002', N'1', 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10007', N'D1', N'If ''D'' is Yes, OT Applicable For (Before/ After/ Both)', N'', N'10002', N'1', 2, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10008', N'D2', N'If ''D'' is Yes, OT Applicable For (Before/ After/ Both)', N'', N'10002', N'1', 2, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10009', N'D3', N'If ''D'' is Yes, OT Applicable For (Before/ After/ Both)', N'', N'10002', N'1', 2, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10010', N'D4', N'If ''D'' is Yes, OT Applicable For (Before/ After/ Both)', N'', N'10002', N'1', 2, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10011', N'D5', N'If ''D'' is Yes, OT Applicable For (Before/ After/ Both)', N'', N'10002', N'1', 2, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10012', N'D6', N'If ''D'' is Yes, OT Applicable For (Before/ After/ Both)', N'', N'10002', N'1', 2, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10013', N'D7', N'If ''D'' is Yes, OT Applicable For (Before/ After/ Both)', N'', N'10002', N'1', 2, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10014', N'E', N'Attendance Reader Integrated', N'', N'10002', N'1', 0, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10015', N'F', N'Attendance Calculation: Use Default Format (Yes/ No)', N'', N'10002', N'1', 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10016', N'F1', N'If ''F'' is No, Start Day In a Month', N'If ''No'', User needs to provide Start Day & End Day for calculating attendance. If ''Yes'', System will take Start Day as 1st of every month and end day as  current months last day.', N'10002', N'1', 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10017', N'F2', N'If ''F'' is No, End Day In a Month', N'', N'10002', N'1', 31, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10018', N'G', N'Compensation OFF Applicable (Yes/ NO)', N'', N'10002', N'1', 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10019', N'G1', N'If G is Yes, Number of Compensation OFF''s allowed', N'', N'10002', N'1', 15, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10020', N'H', N'Consider as Leave if Holiday is in between Leave (Yes/ No)', N'', N'10002', N'1', 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[tbl_WorkAreaRules_Fields] ([RuleID], [RuleIndex], [Rule_Name], [Description], [ModuleID], [DefaultValue], [IsEditable], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (N'10021', N'I', N'Allow Workarea Selection in Payroll & Attendance Modules (Yes/ No)', N'', N'10006', N'1', 0, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, CAST(N'2018-01-22 00:00:00.000' AS DateTime), 1, 0)
ALTER TABLE [dbo].[tbl_LeaveType] ADD  CONSTRAINT [D_NoOfDays]  DEFAULT ((0)) FOR [NoOfDays]
GO
ALTER TABLE [dbo].[tbl_Allowances]  WITH CHECK ADD  CONSTRAINT [Fk_Allowances_AllowanceGroupID] FOREIGN KEY([AllowanceGroupID])
REFERENCES [dbo].[tbl_AllowanceGroup] ([AllowanceGroupID])
GO
ALTER TABLE [dbo].[tbl_Allowances] CHECK CONSTRAINT [Fk_Allowances_AllowanceGroupID]
GO
ALTER TABLE [dbo].[tbl_Allowances]  WITH CHECK ADD  CONSTRAINT [Fk_Allowances_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tbl_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tbl_Allowances] CHECK CONSTRAINT [Fk_Allowances_CompanyID]
GO
ALTER TABLE [dbo].[tbl_Allowances]  WITH CHECK ADD  CONSTRAINT [Fk_Allowances_WorkareaID] FOREIGN KEY([WorkareaID])
REFERENCES [dbo].[tbl_WorkArea] ([WorkareaID])
GO
ALTER TABLE [dbo].[tbl_Allowances] CHECK CONSTRAINT [Fk_Allowances_WorkareaID]
GO
ALTER TABLE [dbo].[tbl_Company]  WITH CHECK ADD  CONSTRAINT [Fk_CountryID] FOREIGN KEY([CountryID])
REFERENCES [dbo].[tbl_Country] ([CountryID])
GO
ALTER TABLE [dbo].[tbl_Company] CHECK CONSTRAINT [Fk_CountryID]
GO
ALTER TABLE [dbo].[tbl_Company]  WITH CHECK ADD  CONSTRAINT [Fk_CustomerID] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tbl_Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[tbl_Company] CHECK CONSTRAINT [Fk_CustomerID]
GO
ALTER TABLE [dbo].[tbl_Company]  WITH CHECK ADD  CONSTRAINT [Fk_StateID] FOREIGN KEY([StateID])
REFERENCES [dbo].[tbl_States] ([StateId])
GO
ALTER TABLE [dbo].[tbl_Company] CHECK CONSTRAINT [Fk_StateID]
GO
ALTER TABLE [dbo].[tbl_Departments]  WITH CHECK ADD  CONSTRAINT [Fk_Department_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tbl_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tbl_Departments] CHECK CONSTRAINT [Fk_Department_CompanyID]
GO
ALTER TABLE [dbo].[tbl_Departments]  WITH CHECK ADD  CONSTRAINT [Fk_Department_WorkareaID] FOREIGN KEY([WorkareaID])
REFERENCES [dbo].[tbl_WorkArea] ([WorkareaID])
GO
ALTER TABLE [dbo].[tbl_Departments] CHECK CONSTRAINT [Fk_Department_WorkareaID]
GO
ALTER TABLE [dbo].[tbl_Departments]  WITH CHECK ADD  CONSTRAINT [Fk_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[tbl_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[tbl_Departments] CHECK CONSTRAINT [Fk_DivisionID]
GO
ALTER TABLE [dbo].[tbl_Designations]  WITH CHECK ADD  CONSTRAINT [Fk_Designition_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tbl_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tbl_Designations] CHECK CONSTRAINT [Fk_Designition_CompanyID]
GO
ALTER TABLE [dbo].[tbl_Designations]  WITH CHECK ADD  CONSTRAINT [Fk_Designition_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tbl_Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[tbl_Designations] CHECK CONSTRAINT [Fk_Designition_DepartmentID]
GO
ALTER TABLE [dbo].[tbl_Designations]  WITH CHECK ADD  CONSTRAINT [Fk_Designition_DivisionID] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[tbl_Divisions] ([DivisionID])
GO
ALTER TABLE [dbo].[tbl_Designations] CHECK CONSTRAINT [Fk_Designition_DivisionID]
GO
ALTER TABLE [dbo].[tbl_Designations]  WITH CHECK ADD  CONSTRAINT [Fk_Designition_WorkareaID] FOREIGN KEY([WorkareaID])
REFERENCES [dbo].[tbl_WorkArea] ([WorkareaID])
GO
ALTER TABLE [dbo].[tbl_Designations] CHECK CONSTRAINT [Fk_Designition_WorkareaID]
GO
ALTER TABLE [dbo].[tbl_Divisions]  WITH CHECK ADD  CONSTRAINT [FK_CompanyID1] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tbl_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tbl_Divisions] CHECK CONSTRAINT [FK_CompanyID1]
GO
ALTER TABLE [dbo].[tbl_Divisions]  WITH CHECK ADD  CONSTRAINT [FK_WorkareaID] FOREIGN KEY([WorkareaID])
REFERENCES [dbo].[tbl_WorkArea] ([WorkareaID])
GO
ALTER TABLE [dbo].[tbl_Divisions] CHECK CONSTRAINT [FK_WorkareaID]
GO
ALTER TABLE [dbo].[tbl_EventManager]  WITH CHECK ADD  CONSTRAINT [FK_EventManager_FormID] FOREIGN KEY([FormID])
REFERENCES [dbo].[tbl_Forms] ([FormId])
GO
ALTER TABLE [dbo].[tbl_EventManager] CHECK CONSTRAINT [FK_EventManager_FormID]
GO
ALTER TABLE [dbo].[tbl_EventManager]  WITH CHECK ADD  CONSTRAINT [FK_EventManager_ModuleID] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[tbl_Modules] ([ModuleId])
GO
ALTER TABLE [dbo].[tbl_EventManager] CHECK CONSTRAINT [FK_EventManager_ModuleID]
GO
ALTER TABLE [dbo].[TBL_FORMWISESECURITY]  WITH NOCHECK ADD  CONSTRAINT [Fk_FormID] FOREIGN KEY([FormID])
REFERENCES [dbo].[tbl_Forms] ([FormId])
GO
ALTER TABLE [dbo].[TBL_FORMWISESECURITY] CHECK CONSTRAINT [Fk_FormID]
GO
ALTER TABLE [dbo].[TBL_FORMWISESECURITY]  WITH NOCHECK ADD  CONSTRAINT [Fk_ModuleID] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[tbl_Modules] ([ModuleId])
GO
ALTER TABLE [dbo].[TBL_FORMWISESECURITY] CHECK CONSTRAINT [Fk_ModuleID]
GO
ALTER TABLE [dbo].[TBL_FORMWISESECURITY]  WITH CHECK ADD  CONSTRAINT [Fk_RoleID1] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tbl_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[TBL_FORMWISESECURITY] CHECK CONSTRAINT [Fk_RoleID1]
GO
ALTER TABLE [dbo].[TBL_FORMWISESECURITY]  WITH CHECK ADD  CONSTRAINT [Fk_UserID1] FOREIGN KEY([UserID])
REFERENCES [dbo].[tbl_Users] ([Id])
GO
ALTER TABLE [dbo].[TBL_FORMWISESECURITY] CHECK CONSTRAINT [Fk_UserID1]
GO
ALTER TABLE [dbo].[tbl_Holiday]  WITH CHECK ADD  CONSTRAINT [Fk_Holiday_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tbl_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tbl_Holiday] CHECK CONSTRAINT [Fk_Holiday_CompanyID]
GO
ALTER TABLE [dbo].[tbl_Holiday]  WITH CHECK ADD  CONSTRAINT [Fk_Holiday_HolidayGroupID] FOREIGN KEY([HolidayGroupID])
REFERENCES [dbo].[tbl_HolidayGroup] ([HolidayGroupID])
GO
ALTER TABLE [dbo].[tbl_Holiday] CHECK CONSTRAINT [Fk_Holiday_HolidayGroupID]
GO
ALTER TABLE [dbo].[tbl_LeaveType]  WITH CHECK ADD  CONSTRAINT [Fk_LeaveType_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tbl_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tbl_LeaveType] CHECK CONSTRAINT [Fk_LeaveType_CompanyID]
GO
ALTER TABLE [dbo].[tbl_LeaveType]  WITH CHECK ADD  CONSTRAINT [Fk_LeaveType_LeaveGroupID] FOREIGN KEY([LeaveGroupID])
REFERENCES [dbo].[tbl_LeaveGroup] ([LeaveGroupID])
GO
ALTER TABLE [dbo].[tbl_LeaveType] CHECK CONSTRAINT [Fk_LeaveType_LeaveGroupID]
GO
ALTER TABLE [dbo].[TBL_USERROLEASSIGNMENTS]  WITH CHECK ADD  CONSTRAINT [Fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[tbl_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[TBL_USERROLEASSIGNMENTS] CHECK CONSTRAINT [Fk_RoleId]
GO
ALTER TABLE [dbo].[TBL_USERROLEASSIGNMENTS]  WITH CHECK ADD  CONSTRAINT [Fk_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[tbl_Users] ([Id])
GO
ALTER TABLE [dbo].[TBL_USERROLEASSIGNMENTS] CHECK CONSTRAINT [Fk_UserID]
GO
ALTER TABLE [dbo].[tbl_WorkArea]  WITH CHECK ADD  CONSTRAINT [Fk_AllowanceGroupID] FOREIGN KEY([AllowanceGroupID])
REFERENCES [dbo].[tbl_AllowanceGroup] ([AllowanceGroupID])
GO
ALTER TABLE [dbo].[tbl_WorkArea] CHECK CONSTRAINT [Fk_AllowanceGroupID]
GO
ALTER TABLE [dbo].[tbl_WorkArea]  WITH CHECK ADD  CONSTRAINT [Fk_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tbl_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tbl_WorkArea] CHECK CONSTRAINT [Fk_CompanyID]
GO
ALTER TABLE [dbo].[tbl_WorkArea]  WITH CHECK ADD  CONSTRAINT [Fk_CountryID1] FOREIGN KEY([CountryID])
REFERENCES [dbo].[tbl_Country] ([CountryID])
GO
ALTER TABLE [dbo].[tbl_WorkArea] CHECK CONSTRAINT [Fk_CountryID1]
GO
ALTER TABLE [dbo].[tbl_WorkArea]  WITH CHECK ADD  CONSTRAINT [Fk_HolidayGroupID] FOREIGN KEY([HolidayGroupID])
REFERENCES [dbo].[tbl_HolidayGroup] ([HolidayGroupID])
GO
ALTER TABLE [dbo].[tbl_WorkArea] CHECK CONSTRAINT [Fk_HolidayGroupID]
GO
ALTER TABLE [dbo].[tbl_WorkArea]  WITH CHECK ADD  CONSTRAINT [Fk_LeaveGroupID] FOREIGN KEY([LeaveGroupID])
REFERENCES [dbo].[tbl_LeaveGroup] ([LeaveGroupID])
GO
ALTER TABLE [dbo].[tbl_WorkArea] CHECK CONSTRAINT [Fk_LeaveGroupID]
GO
ALTER TABLE [dbo].[tbl_WorkArea]  WITH CHECK ADD  CONSTRAINT [Fk_ShiftGroupID] FOREIGN KEY([ShiftGroupID])
REFERENCES [dbo].[tbl_ShiftGroup] ([ShiftGroupID])
GO
ALTER TABLE [dbo].[tbl_WorkArea] CHECK CONSTRAINT [Fk_ShiftGroupID]
GO
ALTER TABLE [dbo].[tbl_WorkArea]  WITH CHECK ADD  CONSTRAINT [Fk_StateID1] FOREIGN KEY([StateID])
REFERENCES [dbo].[tbl_States] ([StateId])
GO
ALTER TABLE [dbo].[tbl_WorkArea] CHECK CONSTRAINT [Fk_StateID1]
GO
ALTER TABLE [dbo].[tbl_WorkAreaRulesValues]  WITH CHECK ADD  CONSTRAINT [FK_WorkAreaRulesValues_CompanyID] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[tbl_Company] ([CompanyID])
GO
ALTER TABLE [dbo].[tbl_WorkAreaRulesValues] CHECK CONSTRAINT [FK_WorkAreaRulesValues_CompanyID]
GO
ALTER TABLE [dbo].[tbl_WorkAreaRulesValues]  WITH CHECK ADD  CONSTRAINT [FK_WorkAreaRulesValues_RuleID] FOREIGN KEY([RuleID])
REFERENCES [dbo].[tbl_WorkAreaRules_Fields] ([RuleID])
GO
ALTER TABLE [dbo].[tbl_WorkAreaRulesValues] CHECK CONSTRAINT [FK_WorkAreaRulesValues_RuleID]
GO
ALTER TABLE [dbo].[tbl_WorkAreaRulesValues]  WITH CHECK ADD  CONSTRAINT [FK_WorkAreaRulesValues_WorkareaID] FOREIGN KEY([WorkareaID])
REFERENCES [dbo].[tbl_WorkArea] ([WorkareaID])
GO
ALTER TABLE [dbo].[tbl_WorkAreaRulesValues] CHECK CONSTRAINT [FK_WorkAreaRulesValues_WorkareaID]
GO
/****** Object:  StoredProcedure [dbo].[SP_AllowanceGroup]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[SP_AllowanceGroup]
(
@AllowanceGroupID VARCHAR(20) = NULL,
@CompanyID VARCHAR(20) = NULL,
@AllowanceGroupName VARCHAR(35) = NULL,
@CreatedDate datetime = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate datetime = NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_AllowanceGroup
 ( AllowanceGroupID, CompanyID, AllowanceGroupName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @AllowanceGroupID, @CompanyID,@AllowanceGroupName,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
,@CreatedBy,CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime),@ModifiedBy,@Status


end

else if (@Flag = 1)
begin
update tbl_AllowanceGroup set AllowanceGroupName = @AllowanceGroupName,
ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
 ,ModifiedBy = @ModifiedBy, Status = @Status
 where AllowanceGroupID = @AllowanceGroupID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_AllowanceGroup set [status] = 2 where AllowanceGroupID = @AllowanceGroupID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_AllowanceGroup set [status] = 3 where AllowanceGroupID = @AllowanceGroupID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select AllowanceGroupID, CompanyID, AllowanceGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
 ,ModifiedBy, [Status]
from tbl_AllowanceGroup(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select AllowanceGroupID, CompanyID, AllowanceGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
 ,ModifiedBy, [Status]
from tbl_AllowanceGroup(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select AllowanceGroupID, CompanyID, AllowanceGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
 ,ModifiedBy, [Status]
from tbl_AllowanceGroup(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select AllowanceGroupID, CompanyID, AllowanceGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
 ,ModifiedBy, [Status]
from tbl_AllowanceGroup(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select AllowanceGroupID, CompanyID, AllowanceGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
 ,ModifiedBy, [Status]
from tbl_AllowanceGroup(nolock)
end

else if (@Flag = 9)   --Extraction of all records

begin
select AllowanceGroupID, CompanyID, AllowanceGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
 ,ModifiedBy, [Status]
from tbl_AllowanceGroup(nolock)
WHERE CompanyID = @CompanyID AND [Status] = 0
end

else if (@Flag = 10)   --Extraction of all records

begin
select isnull(MAX(AllowanceGroupID), 10001) as ID
from tbl_AllowanceGroup(nolock)
end


end
GO
/****** Object:  StoredProcedure [dbo].[SP_Allowances]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[SP_Allowances]
(
@AllowanceID VARCHAR(20) = null,
@AllowanceName VARCHAR(35) = NULL,
@Type INT = NULL,
@Value VARCHAR(100) = NULL,
@BasedON VARCHAR(20) = NULL,
@CompanyID VARCHAR(20) = NULL,
@WorkareaID VARCHAR(20) = NULL,
@AllowanceGroupID VARCHAR(20) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_Allowances
 ( AllowanceID, AllowanceName, Type, Value, BasedON, CompanyID, WorkareaID, AllowanceGroupID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @AllowanceID,@AllowanceName,@Type,@Value,@BasedON,@CompanyID,@WorkareaID,@AllowanceGroupID
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_Allowances SET AllowanceName = @AllowanceName, Type = @Type, Value = @Value, BasedON = @BasedON, CompanyID = @CompanyID, WorkareaID = @WorkareaID, AllowanceGroupID = @AllowanceGroupID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where AllowanceID = @AllowanceID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Allowances set [status] = 2 where AllowanceID = @AllowanceID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Allowances set [status] = 3 where AllowanceID = @AllowanceID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select AllowanceID, AllowanceName, Type, Value, BasedON, CompanyID, WorkareaID, AllowanceGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Allowances(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select AllowanceID, AllowanceName, Type, Value, BasedON, CompanyID, WorkareaID, AllowanceGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Allowances(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select AllowanceID, AllowanceName, Type, Value, BasedON, CompanyID, WorkareaID, AllowanceGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Allowances(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select AllowanceID, AllowanceName, Type, Value, BasedON, CompanyID, WorkareaID, AllowanceGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Allowances(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select AllowanceID, AllowanceName, Type, Value, BasedON, CompanyID, WorkareaID, AllowanceGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Allowances(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_Company]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_Company]
(
@CompanyID VARCHAR(20) = null,
@CustomerId nvarchar(50) = NULL,
@CompanyName VARCHAR(100) = NULL,
@CompanyCode VARCHAR(6) = NULL,
@Description VARCHAR(300) = NULL,
@YearOfEstablishment VARCHAR(6)  = NULL,
@CompanyLogo VARCHAR(300) = NULL,
@CompanyEmail VARCHAR(50)  = NULL,
@PrimaryAddress VARCHAR(300) = NULL,
@CountryID VARCHAR(20) = null,
@StateID VARCHAR(20) = null,
@Pincode int = NULL,
@Website VARCHAR(50) = NULL,
@PhoneNumber VARCHAR(20) = NULL,
@Priority int = NULL,
@CST VARCHAR(20) = NULL,
@TIN VARCHAR(20) = NULL,
@PAN VARCHAR(20) = NULL,
@TAN VARCHAR(20) = NULL,
@GST VARCHAR(20) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date = NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)

begin
INSERT INTO tbl_Company
 ( CompanyID, CustomerId, CompanyName, CompanyCode, Description, YearOfEstablishment, CompanyLogo, CompanyEmail, PrimaryAddress, CountryID, StateID, Pincode, Website, PhoneNumber, Priority, CST, TIN, PAN, [TAN], GST, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @CompanyID,@CustomerId,@CompanyName,@CompanyCode,@Description,@YearOfEstablishment,@CompanyLogo,@CompanyEmail,@PrimaryAddress,@CountryID,@StateID,@Pincode,@Website,@PhoneNumber,@Priority,@CST,@TIN,@PAN,@TAN,@GST
, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime),@CreatedBy
,CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime),@ModifiedBy,@Status

end

else if (@Flag = 1)
begin
update tbl_Company set CustomerId = @CustomerId ,CompanyName = @CompanyName ,CompanyCode = @CompanyCode ,Description = @Description ,YearOfEstablishment = @YearOfEstablishment
 ,CompanyLogo = @CompanyLogo ,CompanyEmail = @CompanyEmail ,PrimaryAddress = @PrimaryAddress ,CountryID = @CountryID ,StateID = @StateID ,Pincode = @Pincode
 ,Website = @Website ,PhoneNumber = @PhoneNumber ,Priority = @Priority ,CST = @CST ,TIN = @TIN ,PAN = @PAN ,TAN = @TAN ,GST = @GST
,ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
 ,ModifiedBy = @ModifiedBy, Status = @Status
 where CompanyID = @CompanyID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Company set [status] = 2 where CompanyID = @CompanyID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Company set [status] = 3 where CompanyID = @CompanyID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select CompanyID, CustomerId, CompanyName, CompanyCode, [Description], YearOfEstablishment, CompanyLogo, CompanyEmail, PrimaryAddress, CountryID, StateID, Pincode, Website, PhoneNumber, [Priority], CST, TIN, PAN, [TAN], GST
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Company(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select CompanyID, CustomerId, CompanyName, CompanyCode, [Description], YearOfEstablishment, CompanyLogo, CompanyEmail, PrimaryAddress, CountryID, StateID, Pincode, Website, PhoneNumber, [Priority], CST, TIN, PAN, [TAN], GST
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Company(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select CompanyID, CustomerId, CompanyName, CompanyCode, [Description], YearOfEstablishment, CompanyLogo, CompanyEmail, PrimaryAddress, CountryID, StateID, Pincode, Website, PhoneNumber, [Priority], CST, TIN, PAN, [TAN], GST
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Company(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select CompanyID, CustomerId, CompanyName, CompanyCode, [Description], YearOfEstablishment, CompanyLogo, CompanyEmail, PrimaryAddress, CountryID, StateID, Pincode, Website, PhoneNumber, [Priority], CST, TIN, PAN, [TAN], GST
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Company(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select CompanyID, CustomerId, CompanyName, CompanyCode, [Description], YearOfEstablishment, CompanyLogo, CompanyEmail, PrimaryAddress, CountryID, StateID, Pincode, Website, PhoneNumber, [Priority], CST, TIN, PAN, [TAN], GST
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Company(nolock)
end

else if (@Flag = 9)

begin

select CompanyID, CustomerId, CompanyName, CompanyCode, [Description], YearOfEstablishment, CompanyLogo, CompanyEmail, PrimaryAddress, CountryID, StateID, Pincode, Website, PhoneNumber, [Priority], CST, TIN, PAN, [TAN], GST
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Company(nolock)
where CompanyID = @CompanyID and CustomerId = @CustomerId and [Status] = @Status

end

else if (@Flag = 10)

begin

select CompanyID, CustomerId, CompanyName, CompanyCode, [Description], YearOfEstablishment, CompanyLogo, CompanyEmail, PrimaryAddress, CountryID, StateID, Pincode, Website, PhoneNumber, [Priority], CST, TIN, PAN, [TAN], GST
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Company(nolock)
where CustomerId = @CustomerId and [Status] = @Status

end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_Countries]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_Countries]
(
  @CountryID varchar(20) = null
, @CountryName varchar(35) = null
, @CreatedDate date = null
, @CreatedTime time = null
, @CreatedBy int = null
, @ModifiedDate date = null
, @ModifiedTime time = null
, @ModifiedBy int = null
, @Status int = null
, @Flag int = null
)

as

begin

if(@Flag = 0)   --Insertion of New Country 
begin
INSERT INTO tbl_Country
 (CountryID, CountryName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @CountryID, @CountryName, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)  --Updating the Current Record

begin

update tbl_Country set CountryName = @CountryName
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, [Status] = @Status
where CountryID = @CountryID

end

else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Country set [status] = 2 where CountryID = @CountryID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Country set [status] = 3 where CountryID = @CountryID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select RecordId, CountryID, CountryName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Country(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select RecordId, CountryID, CountryName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Country(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select RecordId, CountryID, CountryName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Country(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select RecordId, CountryID, CountryName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Country(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select RecordId, CountryID, CountryName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Country(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_Customers]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_Customers]
(
	@CustomerId nvarchar(50) = NULL,
	@UserName nvarchar(50) = NULL,
	@Password nvarchar(50) = NULL,
	@FirstName nvarchar(50) = NULL,
	@MiddleName nvarchar(50) = NULL,
	@LastName nvarchar(50) = NULL,
	@Gender varchar(20) = NULL,
	@CompanyName nvarchar(150) = NULL,
	@CompanyDesc nvarchar(500) = NULL,
	@WorkAreas int = NULL,
	@Address nvarchar(150) = NULL,
	@Village nvarchar(150) = NULL,
	@City nvarchar(150) = NULL,
	@State nvarchar(150) = NULL,
	@PostalCode nvarchar(150) = NULL,
	@Country nvarchar(150) = NULL,
	@PhoneNumber nvarchar(50) = NULL,
	@DefaultPhoneNumber nvarchar(50) = NULL,
	@AdministratorEmailId nvarchar(100) = NULL,
	@AlternativeEmailId nvarchar(100) = NULL,
	@ProductPlan nvarchar(50) = NULL,
	@DateofReg datetime = NULL,
	@RegPeriodinDays int = NULL,
	@DateofExpiry datetime = NULL,
	@NoofUsers int = NULL,
	@NoOfCompany int = NULL,
	@NoOfWorkArea int = NULL,
	@Status int = NULL,
	@ModuleLicensing nvarchar(500) = NULL,
	@OrderNo int = NULL,
	@TotalOrderAmount decimal(18, 0) = NULL,
	@TermsandConditions nvarchar(max) = NULL,
	@CreatedDate date = NULL,
	@CreatedTime time = NULL,
	@CreatedBy nvarchar(50) = NULL,
	@ModifiedDate date = NULL,
	@ModifiedTime time = NULL,
	@ModifiedBy nvarchar(50) = NULL,
	@IsDeleted int = NULL,
	@DeletedBy nvarchar(50) NULL,
	@Flag int = null
)

as

begin
if (@Flag = 0)
begin
INSERT INTO tbl_Customers
 (CustomerId, UserName, Password, FirstName, MiddleName, LastName, Gender, CompanyName, CompanyDesc, WorkAreas, Address, Village, City, State, PostalCode, Country, PhoneNumber, DefaultPhoneNumber, AdministratorEmailId, AlternativeEmailId, ProductPlan, DateofReg, RegPeriodinDays, DateofExpiry, NoofUsers, NoOfCompany, NoOfWorkArea, Status, ModuleLicensing, OrderNo, TotalOrderAmount, TermsandConditions, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, IsDeleted, DeletedBy)
 
SELECT @CustomerId, @UserName,@Password,@FirstName,@MiddleName,@LastName,@Gender,@CompanyName,@CompanyDesc,@WorkAreas,@Address,@Village,@City,@State,@PostalCode,@Country,@PhoneNumber,@DefaultPhoneNumber,@AdministratorEmailId,@AlternativeEmailId,@ProductPlan,@DateofReg,@RegPeriodinDays,@DateofExpiry,@NoofUsers,@NoOfCompany,@NoOfWorkArea,@Status,@ModuleLicensing,@OrderNo,@TotalOrderAmount,@TermsandConditions
, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime),@CreatedBy
,CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime),@ModifiedBy,@IsDeleted,@DeletedBy

end

else if (@Flag = 1)
begin
update tbl_Customers set UserName = @UserName, Password = @Password, FirstName = @FirstName ,MiddleName = @MiddleName ,LastName = @LastName ,Gender = @Gender
 ,CompanyName = @CompanyName ,CompanyDesc = @CompanyDesc ,WorkAreas = @WorkAreas ,Address = @Address ,Village = @Village ,City = @City ,State = @State
 ,PostalCode = @PostalCode ,Country = @Country ,PhoneNumber = @PhoneNumber ,DefaultPhoneNumber = @DefaultPhoneNumber ,AdministratorEmailId = @AdministratorEmailId
 ,AlternativeEmailId = @AlternativeEmailId ,ProductPlan = @ProductPlan ,DateofReg = @DateofReg ,RegPeriodinDays = @RegPeriodinDays ,DateofExpiry = @DateofExpiry
 ,NoofUsers = @NoofUsers ,NoOfCompany = @NoOfCompany ,NoOfWorkArea = @NoOfWorkArea ,Status = @Status ,ModuleLicensing = @ModuleLicensing ,OrderNo = @OrderNo
 ,TotalOrderAmount = @TotalOrderAmount ,TermsandConditions = @TermsandConditions,ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
 ,ModifiedBy = @ModifiedBy ,IsDeleted = @IsDeleted ,DeletedBy = @DeletedBy
 where CustomerId = @CustomerId
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Customers set [status] = 2 where CustomerId = @CustomerId
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Customers set [status] = 3 where CustomerId = @CustomerId
end

else if (@Flag = 4)   --Extraction of Active records

begin
select RecordId, CustomerId, UserName, [Password], FirstName, MiddleName, LastName, Gender, CompanyName, CompanyDesc, WorkAreas, [Address], Village, City, [State], PostalCode, Country, PhoneNumber, DefaultPhoneNumber, AdministratorEmailId, AlternativeEmailId, ProductPlan, DateofReg, RegPeriodinDays, DateofExpiry, NoofUsers, NoOfCompany, NoOfWorkArea, [Status], ModuleLicensing, OrderNo, TotalOrderAmount, TermsandConditions
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, IsDeleted, DeletedBy
from tbl_Customers(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select RecordId, CustomerId, UserName, [Password], FirstName, MiddleName, LastName, Gender, CompanyName, CompanyDesc, WorkAreas, [Address], Village, City, [State], PostalCode, Country, PhoneNumber, DefaultPhoneNumber, AdministratorEmailId, AlternativeEmailId, ProductPlan, DateofReg, RegPeriodinDays, DateofExpiry, NoofUsers, NoOfCompany, NoOfWorkArea, [Status], ModuleLicensing, OrderNo, TotalOrderAmount, TermsandConditions
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, IsDeleted, DeletedBy
from tbl_Customers(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select RecordId, CustomerId, UserName, [Password], FirstName, MiddleName, LastName, Gender, CompanyName, CompanyDesc, WorkAreas, [Address], Village, City, [State], PostalCode, Country, PhoneNumber, DefaultPhoneNumber, AdministratorEmailId, AlternativeEmailId, ProductPlan, DateofReg, RegPeriodinDays, DateofExpiry, NoofUsers, NoOfCompany, NoOfWorkArea, [Status], ModuleLicensing, OrderNo, TotalOrderAmount, TermsandConditions
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, IsDeleted, DeletedBy
from tbl_Customers(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select RecordId, CustomerId, UserName, [Password], FirstName, MiddleName, LastName, Gender, CompanyName, CompanyDesc, WorkAreas, [Address], Village, City, [State], PostalCode, Country, PhoneNumber, DefaultPhoneNumber, AdministratorEmailId, AlternativeEmailId, ProductPlan, DateofReg, RegPeriodinDays, DateofExpiry, NoofUsers, NoOfCompany, NoOfWorkArea, [Status], ModuleLicensing, OrderNo, TotalOrderAmount, TermsandConditions
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, IsDeleted, DeletedBy
from tbl_Customers(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select RecordId, CustomerId, UserName, [Password], FirstName, MiddleName, LastName, Gender, CompanyName, CompanyDesc, WorkAreas, [Address], Village, City, [State], PostalCode, Country, PhoneNumber, DefaultPhoneNumber, AdministratorEmailId, AlternativeEmailId, ProductPlan, DateofReg, RegPeriodinDays, DateofExpiry, NoofUsers, NoOfCompany, NoOfWorkArea, [Status], ModuleLicensing, OrderNo, TotalOrderAmount, TermsandConditions
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, IsDeleted, DeletedBy
from tbl_Customers(nolock)
end

else if (@Flag = 9)

begin
select RecordId, CustomerId, UserName, [Password], FirstName, MiddleName, LastName, Gender, CompanyName, CompanyDesc, WorkAreas, [Address], Village, City, [State], PostalCode, Country, PhoneNumber, DefaultPhoneNumber, AdministratorEmailId, AlternativeEmailId, ProductPlan, DateofReg, RegPeriodinDays, DateofExpiry, NoofUsers, NoOfCompany, NoOfWorkArea, [Status], ModuleLicensing, OrderNo, TotalOrderAmount, TermsandConditions
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, IsDeleted, DeletedBy
from tbl_Customers(nolock)
where CustomerId = @CustomerId and [Status] = @Status

end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_Department]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[SP_Department]
(
@DepartmentID VARCHAR(20) = null,
@DepartmentName VARCHAR(35) = null,
@CompanyID VARCHAR(20) = NULL,
@WorkareaID VARCHAR(20) = NULL,
@DivisionID VARCHAR(20) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_Departments
 ( DepartmentID, DepartmentName, CompanyID, WorkareaID, DivisionID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @DepartmentID, @DepartmentName, @CompanyID, @WorkareaID, @DivisionID
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_Departments SET  DepartmentName = @DepartmentName, CompanyID = @CompanyID, WorkareaID = @WorkareaID, DivisionID = @DivisionID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where DepartmentID = @DepartmentID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Departments set [status] = 2 where DepartmentID = @DepartmentID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Departments set [status] = 3 where DepartmentID = @DepartmentID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select DepartmentID, DepartmentName, CompanyID, WorkareaID, DivisionID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Departments(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select DepartmentID, DepartmentName, CompanyID, WorkareaID, DivisionID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Departments(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select DepartmentID, DepartmentName, CompanyID, WorkareaID, DivisionID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Departments(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select DepartmentID, DepartmentName, CompanyID, WorkareaID, DivisionID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Departments(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select DepartmentID, DepartmentName, CompanyID, WorkareaID, DivisionID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Departments(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_Designition]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[SP_Designition]
(
@DesignitionID VARCHAR(20) = null,
@DesignitionName VARCHAR(35) = null,
@CompanyID VARCHAR(20) = NULL,
@WorkareaID VARCHAR(20) = NULL,
@DivisionID VARCHAR(20) = NULL,
@DepartmentID VARCHAR(20) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_Designations
 ( DesignitionID, DesignitionName, CompanyID, WorkareaID, DivisionID, DepartmentID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @DesignitionID, @DesignitionName, @CompanyID, @WorkareaID, @DivisionID, @DepartmentID
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_Designations SET  DesignitionName = @DesignitionName, CompanyID = @CompanyID, WorkareaID = @WorkareaID, DivisionID = @DivisionID, DepartmentID = @DepartmentID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where DesignitionID = @DesignitionID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Designations set [status] = 2 where DesignitionID = @DesignitionID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Designations set [status] = 3 where DesignitionID = @DesignitionID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select DesignitionID, DesignitionName, CompanyID, WorkareaID, DivisionID, DepartmentID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Designations(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select DesignitionID, DesignitionName, CompanyID, WorkareaID, DivisionID, DepartmentID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Designations(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select DesignitionID, DesignitionName, CompanyID, WorkareaID, DivisionID, DepartmentID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Designations(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select DesignitionID, DesignitionName, CompanyID, WorkareaID, DivisionID, DepartmentID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Designations(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select DesignitionID, DesignitionName, CompanyID, WorkareaID, DivisionID, DepartmentID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Designations(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_Division]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[SP_Division]
(
@DivisionID VARCHAR(20) = null,
@CompanyID VARCHAR(20) = NULL,
@WorkareaID VARCHAR(20) = NULL,
@DivisionName VARCHAR(35) = null,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_Divisions
 ( DivisionID, CompanyID, WorkareaID, DivisionName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @DivisionID, @CompanyID, @WorkareaID, @DivisionName
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_Divisions SET  CompanyID = @CompanyID, WorkareaID = @WorkareaID, DivisionName = @DivisionName
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where DivisionID = @DivisionID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Divisions set [status] = 2 where DivisionID = @DivisionID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Divisions set [status] = 3 where DivisionID = @DivisionID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select DivisionID, CompanyID, WorkareaID, DivisionName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Divisions(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select DivisionID, CompanyID, WorkareaID, DivisionName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Divisions(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select DivisionID, CompanyID, WorkareaID, DivisionName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Divisions(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select DivisionID, CompanyID, WorkareaID, DivisionName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Divisions(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select DivisionID, CompanyID, WorkareaID, DivisionName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Divisions(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_EventManager]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_EventManager]
(
@EventID varchar(50) = null,
@EventName varchar(35) = null,
@EventState int = null,
@FormID varchar(20) = null,
@ModuleID nvarchar(20) = null,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_EventManager
 ( EventID, EventName, EventState, FormID, ModuleID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @EventID, @EventName, @EventState, @FormID, @ModuleID
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_EventManager SET EventName = @EventName, EventState = @EventState, FormID = @FormID, ModuleID = @ModuleID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where EventID = @EventID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_EventManager set [status] = 2 where EventID = @EventID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_EventManager set [status] = 3 where EventID = @EventID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select EventID, EventName, EventState, FormID, ModuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_EventManager(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select EventID, EventName, EventState, FormID, ModuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_EventManager(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select EventID, EventName, EventState, FormID, ModuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_EventManager(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select EventID, EventName, EventState, FormID, ModuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_EventManager(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select EventID, EventName, EventState, FormID, ModuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_EventManager(nolock)
end

else if (@Flag = 9)   --Extraction of all active records based on Event id

begin
select EventID, EventName, EventState, FormID, ModuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_EventManager(nolock)
where EventID = @EventID 
and FormID = @FormID
and ModuleID = @ModuleID
and [Status] = 0
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_Forms]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[SP_Forms]
(
  @FormId varchar(20) = null
, @FormName varchar(35) = null
, @FormUrl varchar(300) = null
, @ModuleId varchar(20) = null
, @CreatedDate date = null
, @CreatedTime time = null
, @CreatedBy int = null
, @ModifiedDate date = null
, @ModifiedTime time = null
, @ModifiedBy int = null
, @Status int = null
, @Flag int = null
)

as

begin

if (@Flag = 0)

begin
INSERT INTO tbl_Forms
 ( FormId, FormName, FormUrl, ModuleId, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @FormId, @FormName, @FormUrl, @ModuleId, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)

begin

update tbl_Forms set  FormName = @FormName, FormUrl = @FormUrl, ModuleId = @ModuleId
,ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime)), ModifiedBy = @ModifiedBy, [Status] = @Status
where FormId = @FormId

end

else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Forms set [status] = 2 where FormId = @FormId
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Forms set [status] = 3 where FormId = @FormId
end

else if (@Flag = 4)   --Extraction of Active records

begin
select RecordId, FormId, FormName, FormUrl, ModuleId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Forms(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select RecordId, FormId, FormName, FormUrl, ModuleId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Forms(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select RecordId, FormId, FormName, FormUrl, ModuleId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Forms(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select RecordId, FormId, FormName, FormUrl, ModuleId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Forms(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select RecordId, FormId, FormName, FormUrl, ModuleId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy,[Status]
from tbl_Forms(nolock)
end

else if (@Flag = 9)
begin
select RecordId, FormId, FormName, FormUrl, ModuleId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Forms(nolock)
where FormId = @FormId and [Status] = 0
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_Holiday]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[SP_Holiday]
(
@ID INT = null,
@Name VARCHAR(35) = NULL,
@YEAR VARCHAR(6) = NULL,
@Reason VARCHAR(300) = NULL,
@FromDate VARCHAR(15) = NULL,
@ToDate VARCHAR(15) = NULL,
@FromTime VARCHAR(15) = NULL,
@ToTime VARCHAR(15) = null,
@CompanyID VARCHAR(20) = NULL,
@HolidayGroupID VARCHAR(20) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_Holiday
 ( ID, Name, [YEAR], Reason, FromDate, ToDate, FromTime, ToTime, CompanyID, HolidayGroupID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @ID,@Name,@YEAR,@Reason,@FromDate,@ToDate,@FromTime,@ToTime,@CompanyID,@HolidayGroupID
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_Holiday SET  Name = @Name, [YEAR] = @YEAR, Reason = @Reason, FromDate = @FromDate, ToDate = @ToDate, FromTime = @FromTime, ToTime = @ToTime, CompanyID = @CompanyID, HolidayGroupID = @HolidayGroupID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where ID = @ID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Holiday set [status] = 2 where ID = @ID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Holiday set [status] = 3 where ID = @ID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select ID, Name, [YEAR], Reason, FromDate, ToDate, FromTime, ToTime, CompanyID, HolidayGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Holiday(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select ID, Name, [YEAR], Reason, FromDate, ToDate, FromTime, ToTime, CompanyID, HolidayGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Holiday(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select ID, Name, [YEAR], Reason, FromDate, ToDate, FromTime, ToTime, CompanyID, HolidayGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Holiday(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select ID, Name, [YEAR], Reason, FromDate, ToDate, FromTime, ToTime, CompanyID, HolidayGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Holiday(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select ID, Name, [YEAR], Reason, FromDate, ToDate, FromTime, ToTime, CompanyID, HolidayGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Holiday(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_HolidayGroup]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[SP_HolidayGroup]
(
@HolidayGroupID VARCHAR(20) = NULL,
@CompanyID VARCHAR(20) = NULL,
@HolidayGroupName VARCHAR(35) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_HolidayGroup
 ( HolidayGroupID, CompanyID, HolidayGroupName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @HolidayGroupID, @CompanyID, @HolidayGroupName, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin
update tbl_HolidayGroup set HolidayGroupName = @HolidayGroupName,
ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
 ,ModifiedBy = @ModifiedBy, Status = @Status
 where HolidayGroupID = @HolidayGroupID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_HolidayGroup set [status] = 2 where HolidayGroupID = @HolidayGroupID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_HolidayGroup set [status] = 3 where HolidayGroupID = @HolidayGroupID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select HolidayGroupID, CompanyID, HolidayGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_HolidayGroup(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select HolidayGroupID, CompanyID, HolidayGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_HolidayGroup(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select HolidayGroupID, CompanyID, HolidayGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_HolidayGroup(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select HolidayGroupID, CompanyID, HolidayGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_HolidayGroup(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select HolidayGroupID, CompanyID, HolidayGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_HolidayGroup(nolock)
end

else if (@Flag = 9)   --Extraction of all records

begin
select HolidayGroupID, CompanyID, HolidayGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_HolidayGroup(nolock)
WHERE CompanyID = @CompanyID AND [Status] = 0
end

else if (@Flag = 10)   --Extraction of all records

begin
select isnull(MAX(HolidayGroupID), 10001) as ID
from tbl_HolidayGroup(nolock)
end


end
GO
/****** Object:  StoredProcedure [dbo].[SP_LeaveGroup]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_LeaveGroup]
(
@LeaveGroupID VARCHAR(20) = NULL,
@CompanyID VARCHAR(20) = NULL,
@LeaveGroupName VARCHAR(35) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_LeaveGroup
 ( LeaveGroupID, CompanyID, LeaveGroupName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @LeaveGroupID, @CompanyID, @LeaveGroupName, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin
update tbl_LeaveGroup set LeaveGroupName = @LeaveGroupName,
ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
,ModifiedBy = @ModifiedBy, Status = @Status
where LeaveGroupID = @LeaveGroupID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_LeaveGroup set [status] = 2 where LeaveGroupID = @LeaveGroupID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_LeaveGroup set [status] = 3 where LeaveGroupID = @LeaveGroupID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select LeaveGroupID, CompanyID, LeaveGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveGroup(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select LeaveGroupID, CompanyID, LeaveGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveGroup(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select LeaveGroupID, CompanyID, LeaveGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveGroup(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select LeaveGroupID, CompanyID, LeaveGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveGroup(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select LeaveGroupID, CompanyID, LeaveGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveGroup(nolock)
end

else if (@Flag = 9)   --Extraction of all records

begin
select LeaveGroupID, CompanyID, LeaveGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveGroup(nolock)
WHERE CompanyID = @CompanyID AND [Status] = 0
end

else if (@Flag = 10)   --Extraction of all records

begin
select isnull(MAX(LeaveGroupID), 10001) as ID
from tbl_LeaveGroup(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_LeaveTypes]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[SP_LeaveTypes]
(
@ID INT = null,
@LeaveName VARCHAR(35) = NULL,
@Abbreviation VARCHAR(6) = NULL,
@IsPaidType INT = NULL,
@IsEncashable INT = NULL,
@IsCummulative INT = NULL,
@NoOfDays INT = NULL,
@CompanyID VARCHAR(20) = NULL,
@LeaveGroupID VARCHAR(20) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_LeaveType
 ( ID, LeaveName, Abbreviation, IsPaidType, IsEncashable, IsCummulative, NoOfDays, CompanyID, LeaveGroupID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @ID,@LeaveName,@Abbreviation,@IsPaidType,@IsEncashable,@IsCummulative,@NoOfDays,@CompanyID,@LeaveGroupID
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_LeaveType SET LeaveName = @LeaveName, Abbreviation = @Abbreviation, IsPaidType = @IsPaidType, IsEncashable = @IsEncashable, IsCummulative = @IsCummulative, NoOfDays = @NoOfDays, CompanyID = @CompanyID, LeaveGroupID = @LeaveGroupID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where ID = @ID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_LeaveType set [status] = 2 where ID = @ID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_LeaveType set [status] = 3 where ID = @ID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select ID, LeaveName, Abbreviation, IsPaidType, IsEncashable, IsCummulative, NoOfDays, CompanyID, LeaveGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveType(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select ID, LeaveName, Abbreviation, IsPaidType, IsEncashable, IsCummulative, NoOfDays, CompanyID, LeaveGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveType(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select ID, LeaveName, Abbreviation, IsPaidType, IsEncashable, IsCummulative, NoOfDays, CompanyID, LeaveGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveType(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select ID, LeaveName, Abbreviation, IsPaidType, IsEncashable, IsCummulative, NoOfDays, CompanyID, LeaveGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveType(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select ID, LeaveName, Abbreviation, IsPaidType, IsEncashable, IsCummulative, NoOfDays, CompanyID, LeaveGroupID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_LeaveType(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_LoginHistory]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




create procedure [dbo].[SP_LoginHistory]
(
	 @LoginId BIGINT = null
	,@UserId nvarchar(20) = null
	,@Username nvarchar(15) = null
	,@LastLoginDate DATE = null
	,@LastLoginTime time = null
	,@IPAddress VARCHAR(15) = null
	,@SessionId VARCHAR(300) = null
	,@hasActiveSession BIT = null
	,@AuthenticatedOTP VARCHAR(6) = null
	,@CreatedDate DATE = null
	,@CreatedTime time = null
	,@Flag int = null
)

as

begin

if (@Flag = 0)   --Insertion of New Login Entry
begin
INSERT INTO tbl_LoginHistory
 ( UserId, UserName, LastLoginDate, IPAddress, SessionId, hasActiveSession, AuthenticatedOTP, CreatedDate)
 
SELECT  @UserId,@Username,CAST(CONVERT(Varchar(10), @LastLoginDate, 112) + ' ' + CONVERT(Varchar(8), @LastLoginTime) AS DateTime)
,@IPAddress,@SessionId,@hasActiveSession,@AuthenticatedOTP,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)

end

else if (@Flag = 9)   --Extractng session details base on User id

begin

select top 1
LoginId
,UserId
,UserName
,convert(varchar(10),LastLoginDate,101) as LastLoginDate
,LTRIM(RIGHT(CONVERT(CHAR(20), LastLoginDate, 22), 11)) as LastLoginTime
,IPAddress
,SessionId
,hasActiveSession
,AuthenticatedOTP
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
from tbl_LoginHistory (nolock)
where Userid = @UserId
order by LoginId desc

end

else if (@Flag = 10)  --Extracting user id details based on Session id

begin

select top 1
UserId
from tbl_LoginHistory (nolock)
where SessionId = @SessionId

end

else if (@Flag = 11)   --Select All

begin

select 
LoginId
,UserId
,UserName
,convert(varchar(10),LastLoginDate,101) as LastLoginDate
,LTRIM(RIGHT(CONVERT(CHAR(20), LastLoginDate, 22), 11)) as LastLoginTime
,IPAddress
,SessionId
,hasActiveSession
,AuthenticatedOTP
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
from tbl_LoginHistory (nolock)
where Userid = @UserId
order by LoginId desc

end

end


GO
/****** Object:  StoredProcedure [dbo].[SP_Modules]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_Modules]
(   @ModuleId nvarchar(20)=NULL,
	@ModuleName nvarchar(150)=NULL,
	@ModuleUrl nvarchar(10) = NULL,
	@ModuleDescription nvarchar(500) = NULL,
	@CreatedDate date = null,
	@CreatedTime time = null,
	@CreatedBy int = null,
	@ModifiedDate date = null,
	@ModifiedTime time = null,
	@ModifiedBy int = null,
	@Status int = null,
	@Flag INT = null
)
AS
BEGIN


if(@Flag=0)    --Inserting a New Modules into the database
Begin 
 
INSERT INTO tbl_Modules  
 (  ModuleId, ModuleName, ModuleUrl, ModuleDescription, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT   @ModuleId, @ModuleName, @ModuleUrl, @ModuleDescription, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status


End


if(@Flag=1)   --Modification of the existing Modules
Begin 

UPDATE tbl_Modules   
   SET ModuleName = @ModuleName, ModuleUrl = @ModuleUrl, ModuleDescription = @ModuleDescription,  ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime)), ModifiedBy = @ModifiedBy, [Status] = @Status
WHERE ModuleId = @ModuleId

End

else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Modules set [status] = 2 where ModuleId = @ModuleId
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Modules set [status] = 3 where ModuleId = @ModuleId
end


else if (@Flag = 4)   --Extraction of Active records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Modules(nolock) where [status] = 0
end

else if (@Flag = 5)   --Extraction of DeActive records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Modules(nolock) where [status] = 1
end

else if (@Flag = 6)   --Extraction of Partially deleted records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Modules(nolock) where [status] = 2
end

else if (@Flag = 7)  --Extraction of Permanantly deleted records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Modules(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Modules(nolock)
end

END



GO
/****** Object:  StoredProcedure [dbo].[SP_Roles]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_Roles]
(
  @RoleID VARCHAR(20) = null
, @RoleName VARCHAR(35) = null
, @Description VARCHAR(300) = null
, @CompanyID VARCHAR(20) = null
, @WorkareaID VARCHAR(20) = null
, @CreatedDate date = null
, @CreatedTime time = null
, @CreatedBy int = null
, @ModifiedDate date = null
, @ModifiedTime time = null
, @ModifiedBy int = null
, @Status int = null
, @UserId varchar(20) = null
, @ModuleID varchar(20) = null
, @FormID varchar(20) = null
, @Flag int = null
)

as

Begin
if(@Flag = 0)
begin
INSERT INTO tbl_Roles
 ( RoleID, RoleName, [Description], CompanyID, WorkareaID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @RoleID, @RoleName, @Description, @CompanyID, @WorkareaID, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime), @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

update tbl_Roles set RoleName = @RoleName, [Description] = @Description, CompanyID = @CompanyID, WorkareaID = @WorkareaID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, [Status] = @Status
where RoleID = @RoleID

end

else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Roles set [status] = 2 where RoleID = @RoleID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Roles set [status] = 3 where RoleID = @RoleID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select RecordId, RoleID, RoleName, [Description], CompanyID, WorkareaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Roles(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select RecordId, RoleID, RoleName, [Description], CompanyID, WorkareaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Roles(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select RecordId, RoleID, RoleName, [Description], CompanyID, WorkareaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Roles(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select RecordId, RoleID, RoleName, [Description], CompanyID, WorkareaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Roles(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select RecordId, RoleID, RoleName, [Description], CompanyID, WorkareaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_Roles(nolock)
end

else if (@Flag = 9)

begin

INSERT INTO TBL_USERROLEASSIGNMENTS
 ( UserID, RoleId, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @UserID, @RoleId, GETDATE(), @CreatedBy, GETDATE(), @ModifiedBy, @Status

end

else if (@Flag = 10)

begin 

INSERT INTO TBL_FORMWISESECURITY
 (  ModuleID, FormID, UserID, RoleID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT   @ModuleID, @FormID, @UserID, @RoleID, GETDATE(), @CreatedBy, GETDATE(), @ModifiedBy, @Status

end

else if (@Flag = 11)

begin

select M.ModuleId,M.ModuleName,M.ModuleUrl,M.ModuleDescription,f.FormId,f.FormName,f.FormUrl,fs.CanView,fs.CanSave,fs.CanDelete
from TBL_FORMWISESECURITY fs
inner join tbl_Users u on u.Id = fs.UserID
and u.Id = @UserId
and (fs.CanSave = 1 or fs.CanDelete = 1 or fs.CanView = 1)
inner join tbl_Modules M on M.ModuleId = fs.ModuleID
and M.[Status] = 0
inner join tbl_Forms f on f.FormId = fs.FormID
inner join tbl_Roles r on r.RoleID = fs.RoleID
inner join TBL_USERROLEASSIGNMENTS ra on ra.RoleId = r.RoleID



end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_ShiftGroup]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_ShiftGroup]
(
@ShiftGroupID VARCHAR(20) = NULL,
@CompanyID VARCHAR(20) = NULL,
@ShiftGroupName VARCHAR(35) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_ShiftGroup
 ( ShiftGroupID, CompanyID, ShiftGroupName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @ShiftGroupID, @CompanyID, @ShiftGroupName, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin
update tbl_ShiftGroup set ShiftGroupName = @ShiftGroupName,
ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
,ModifiedBy = @ModifiedBy, Status = @Status
where ShiftGroupID = @ShiftGroupID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_ShiftGroup set [status] = 2 where ShiftGroupID = @ShiftGroupID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_ShiftGroup set [status] = 3 where ShiftGroupID = @ShiftGroupID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select ShiftGroupID, CompanyID, ShiftGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_ShiftGroup(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select ShiftGroupID, CompanyID, ShiftGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_ShiftGroup(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select ShiftGroupID, CompanyID, ShiftGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_ShiftGroup(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select ShiftGroupID, CompanyID, ShiftGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_ShiftGroup(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select ShiftGroupID, CompanyID, ShiftGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_ShiftGroup(nolock)
end

else if (@Flag = 9)   --Extraction of all records

begin
select ShiftGroupID, CompanyID, ShiftGroupName
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_ShiftGroup(nolock)
WHERE CompanyID = @CompanyID AND [Status] = 0
end

else if (@Flag = 10)   --Extraction of all records

begin
select isnull(MAX(ShiftGroupID), 10001) as ID
from tbl_ShiftGroup(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_States]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[SP_States]
(
  @StateId varchar(20) = null
, @StateName varchar(35) = null
, @CountryId varchar(20) = null
, @CreatedDate date = null
,  @Createdtime time = null
, @CreatedBy int = null
, @ModifiedDate date = null
,  @ModifiedTime time = null
, @ModifiedBy int = null
, @Status int = null
, @Flag int = null
)
as

begin
if(@Flag = 0)
begin
INSERT INTO tbl_States
 (  StateId, StateName, CountryId, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, [Status])
 
SELECT  @StateId, @StateName, @CountryId, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime), @CreatedBy
, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if(@Flag = 1)
begin

update tbl_States set StateName = @StateName,CountryId = @CountryId,ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime)),ModifiedBy = @ModifiedBy, [Status] = @Status
where StateId = @StateId

end

else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_States set [status] = 2 where StateId = @StateId
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_States set [status] = 3 where StateId = @StateId
end

else if (@Flag = 4)   --Extraction of Active records

begin
select RecordId, StateId, StateName, CountryId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_States(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select RecordId, StateId, StateName, CountryId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_States(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select RecordId, StateId, StateName, CountryId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_States(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select RecordId, StateId, StateName, CountryId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_States(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select RecordId, StateId, StateName, CountryId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_States(nolock)
end

else if (@Flag = 9)   --Extraction of all records

begin
select RecordId, StateId, StateName, CountryId
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_States(nolock)
where CountryId = @CountryId and status = 0
end


end
GO
/****** Object:  StoredProcedure [dbo].[SP_UserController]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_UserController] 
	(@Username nvarchar(300) = null,
	@Password nvarchar(max) = null,
	@Email varchar(100) = null,
	@CompanyID int = null,
	@WorkAreaID int = null,
	@CreatedDate date = null,
	@CreatedTime time = null,
	@CreatedBy nvarchar(40) = null,
	@ModifiedDate date = null,
	@ModifiedTime time = null,
	@ModifiedBy nvarchar(40) = null,
	@PasswordQuestion1 nvarchar(300) = null,
	@PasswordQuestion2 nvarchar(300) = null,
	@PasswordAnswer1 nvarchar(300) = null,
	@PasswordAnswer2 nvarchar(300) = null,
	@UserType int = null,
	@UserId nvarchar(20) = null,
	@status int = null
	,@customer_id varchar(20) = null
	,@FirstName varchar(50) = null
    ,@MiddleName varchar(50) = null
    ,@LastName varchar(50) = null
    ,@Gender int = null
    ,@MaritalStatus int = null
    ,@DateOfBirth date = null
    ,@Age int = null
    ,@ProfilePicUrl nvarchar(max) = null
    ,@UniqueAccessPath nvarchar(max) = null
    ,@Mobile bigint = null
    ,@CountryId varchar(20) = null
    ,@StateId varchar(20) = null
    ,@PrimaryAddress varchar(300) = null
	,@Flag int = null
	)
as
begin

if(@Flag = 0)  --Insertion of the New Entry resord
begin

INSERT INTO tbl_Users
 ( Username, [Password], Email, CompanyID, WorkAreaID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, PasswordQuestion1, PasswordQuestion2, PasswordAnswer1, PasswordAnswer2, UserType, [status], CustomerId, FirstName, MiddleName, LastName, Gender, MaritalStatus, DateOfBirth, Age, ProfilePicUrl, UniqueAccessPath, Mobile, CountryId, StateId, PrimaryAddress)
 
SELECT  @Username, @Password, @Email, @CompanyID, @WorkAreaID, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime), @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @PasswordQuestion1, @PasswordQuestion2, @PasswordAnswer1, @PasswordAnswer2, @UserType, @status, @customer_id, @FirstName, @MiddleName, @LastName, @Gender, @MaritalStatus, @DateOfBirth, @Age, @ProfilePicUrl, @UniqueAccessPath, @Mobile, @CountryId, @StateId, @PrimaryAddress

end

else if (@Flag = 1)   --Update based on Userid Modification
begin

update tbl_Users set [Password] = @Password, WorkAreaID = @WorkAreaID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime)), ModifiedBy = @ModifiedBy
, PasswordQuestion1 = @PasswordQuestion1, PasswordQuestion2 = @PasswordQuestion2, PasswordAnswer1 = @PasswordAnswer1, PasswordAnswer2 = @PasswordAnswer2, UserType = @UserType, [status] = @status, FirstName = @FirstName, MiddleName = @MiddleName, LastName = @LastName, Gender = @Gender, MaritalStatus = @MaritalStatus, DateOfBirth = @DateOfBirth, Age = @Age, ProfilePicUrl = @ProfilePicUrl, UniqueAccessPath = @UniqueAccessPath, Mobile = @Mobile, CountryId = @CountryId, StateId = @StateId, PrimaryAddress = @PrimaryAddress 
where Id = @UserId

end

else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_Users set [status] = 2 where Id = @UserId
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_Users set [status] = 3 where Id = @UserId
end

else if (@Flag = 4)   --Extraction of Active records

begin
select Id, Username, [Password], Email, CompanyID, WorkAreaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, PasswordQuestion1, PasswordQuestion2, PasswordAnswer1, PasswordAnswer2, UserType, [status], CustomerId, FirstName, MiddleName, LastName, Gender, MaritalStatus, DateOfBirth, Age, ProfilePicUrl, UniqueAccessPath, Mobile, CountryId, StateId, PrimaryAddress
from tbl_Users(nolock) where [status] = 0
end
else if (@Flag = 5)  --Extraction of DeActive records

begin
select Id, Username, [Password], Email, CompanyID, WorkAreaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, PasswordQuestion1, PasswordQuestion2, PasswordAnswer1, PasswordAnswer2, UserType, [status], CustomerId, FirstName, MiddleName, LastName, Gender, MaritalStatus, DateOfBirth, Age, ProfilePicUrl, UniqueAccessPath, Mobile, CountryId, StateId, PrimaryAddress
from tbl_Users(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select Id, Username, [Password], Email, CompanyID, WorkAreaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, PasswordQuestion1, PasswordQuestion2, PasswordAnswer1, PasswordAnswer2, UserType, [status], CustomerId, FirstName, MiddleName, LastName, Gender, MaritalStatus, DateOfBirth, Age, ProfilePicUrl, UniqueAccessPath, Mobile, CountryId, StateId, PrimaryAddress
 from tbl_Users(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select Id, Username, [Password], Email, CompanyID, WorkAreaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, PasswordQuestion1, PasswordQuestion2, PasswordAnswer1, PasswordAnswer2, UserType, [status], CustomerId, FirstName, MiddleName, LastName, Gender, MaritalStatus, DateOfBirth, Age, ProfilePicUrl, UniqueAccessPath, Mobile, CountryId, StateId, PrimaryAddress
from tbl_Users(nolock) where [status] = 3 ;
end

else if (@Flag = 8)   --Extraction of all records

begin
select Id, Username, [Password], Email, CompanyID, WorkAreaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, PasswordQuestion1, PasswordQuestion2, PasswordAnswer1, PasswordAnswer2, UserType, [status], CustomerId, FirstName, MiddleName, LastName, Gender, MaritalStatus, DateOfBirth, Age, ProfilePicUrl, UniqueAccessPath, Mobile, CountryId, StateId, PrimaryAddress
from tbl_Users(nolock) ;
end

else if (@Flag = 9)   -- Verifing the user Based on User name and Password or Email id and password

begin


select 
Id
from tbl_Users u (nolock)
where (u.Username = @Username or u.Email = @Email)
and u.[Password] = @Password
and u.[status] = 0 ;

end

else if (@Flag = 10)   --Extraction of Active records

begin
select Id, Username, [Password], Email, CompanyID, WorkAreaID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, PasswordQuestion1, PasswordQuestion2, PasswordAnswer1, PasswordAnswer2, UserType, [status], CustomerId, FirstName, MiddleName, LastName, Gender, MaritalStatus, DateOfBirth, Age, ProfilePicUrl, UniqueAccessPath, Mobile, CountryId, StateId, PrimaryAddress
from tbl_Users(nolock) where [status] = 0 AND Id = @UserId;
end


end
GO
/****** Object:  StoredProcedure [dbo].[SP_WorkArea]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[SP_WorkArea]
(
@WorkareaID VARCHAR(20) = NULL,
@WorkareaName VARCHAR(35) = NULL,
@WorkareaCode VARCHAR(6) = NULL,
@CustomerID  VARCHAR(20) = NULL,
@CompanyID VARCHAR(20) = NULL,
@YearOfEstablishment VARCHAR(6) = NULL,
@Priority int = NULL,
@PrimaryAddress VARCHAR(300) = NULL,
@CountryID VARCHAR(20) = NULL,
@StateID VARCHAR(20) = NULL,
@Pincode INT = NULL,
@PhoneNumber VARCHAR(20) = NULL,
@FaxNumber VARCHAR(20) = NULL,
@Email VARCHAR(50) = NULL,
@Website VARCHAR(60)  =NULL,
@LeaveGroupID VARCHAR(20) = NULL,
@ShiftGroupID VARCHAR(20) = NULL,
@AllowanceGroupID VARCHAR(20)  =NULL,
@HolidayGroupID VARCHAR(20) = NULL,
@CST VARCHAR(20) = NULL,
@TIN VARCHAR(20) = NULL,
@TAN VARCHAR(20) = NULL,
@PAN VARCHAR(20) = NULL,
@GST VARCHAR(20) = NULL,
@PFCode VARCHAR(20) = NULL,
@ESICode VARCHAR(20) = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0)
begin
INSERT INTO tbl_WorkArea
 ( WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @WorkareaID,@WorkareaName,@WorkareaCode,@CustomerID,@CompanyID,@YearOfEstablishment,@Priority,@PrimaryAddress,@CountryID,@StateID,@Pincode,@PhoneNumber,@FaxNumber,@Email,@Website,@LeaveGroupID,@ShiftGroupID,@AllowanceGroupID,@HolidayGroupID,@CST,@TIN,@TAN,@PAN,@GST,@PFCode,@ESICode
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin
UPDATE tbl_WorkArea SET  WorkareaName = @WorkareaName, WorkareaCode = @WorkareaCode, CustomerID = @CustomerID
, CompanyID = @CompanyID, YearOfEstablishment = @YearOfEstablishment, [Priority] = @Priority, PrimaryAddress = @PrimaryAddress, CountryID = @CountryID
, StateID = @StateID, Pincode = @Pincode, PhoneNumber = @PhoneNumber, FaxNumber = @FaxNumber, Email = @Email, Website = @Website
, LeaveGroupID = @LeaveGroupID, ShiftGroupID = @ShiftGroupID, AllowanceGroupID = @AllowanceGroupID, HolidayGroupID = @HolidayGroupID
, CST = @CST, TIN = @TIN, TAN = @TAN, PAN = @PAN, GST = @GST, PFCode = @PFCode, ESICode = @ESICode
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where WorkareaID = @WorkareaID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_WorkArea set [status] = 2 where WorkareaID = @WorkareaID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_WorkArea set [status] = 3 where WorkareaID = @WorkareaID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode
, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkArea(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode
, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkArea(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode
, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkArea(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode
, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkArea(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode
, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkArea(nolock)
end

else if (@Flag = 9)
begin

select WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode
, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkArea(nolock)
where WorkareaID = @WorkareaID
and CustomerID = @CustomerID
and CompanyID = @CompanyID
and CountryID = @CountryID
and [Status] = @Status

end

-- GET WORKAREAS LIST BY COMPANYID
else if (@Flag = 10)
begin

select WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode
, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkArea(nolock) where [status] = 0
and CompanyID = @CompanyID

end

-- GET WORKAREAS LIST BY WORKAREAID
else if (@Flag = 11)
begin

select WorkareaID, WorkareaName, WorkareaCode, CustomerID, CompanyID, YearOfEstablishment, Priority, PrimaryAddress, CountryID, StateID, Pincode
, PhoneNumber, FaxNumber, Email, Website, LeaveGroupID, ShiftGroupID, AllowanceGroupID, HolidayGroupID, CST, TIN, TAN, PAN, GST, PFCode, ESICode
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkArea(nolock) where [status] = 0
and WorkareaID = @WorkareaID

end


end
GO
/****** Object:  StoredProcedure [dbo].[SP_WorkAreaRulesFields]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[SP_WorkAreaRulesFields]
(
@RuleID VARCHAR(20) = null,
@RuleIndex VARCHAR(5) = NULL,
@Rule_Name VARCHAR(300) = NULL,
@Description VARCHAR(MAX) = NULL,
@ModuleID VARCHAR(20) = NULL,
@DefaultValue VARCHAR(20) = NULL,
@IsEditable INT = NULL,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0 and (select count(*) from tbl_WorkAreaRules_Fields) = 0)
begin
INSERT INTO tbl_WorkAreaRules_Fields
 ( RuleID, RuleIndex, Rule_Name, [Description], ModuleID, DefaultValue, IsEditable, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @RuleID, @RuleIndex, @Rule_Name, @Description, @ModuleID, @DefaultValue, @IsEditable
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_WorkAreaRules_Fields SET RuleIndex = @RuleIndex, Rule_Name = @Rule_Name, [Description] = @Description, ModuleID = @ModuleID, DefaultValue = @DefaultValue, IsEditable = @IsEditable
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where RuleID = @RuleID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_WorkAreaRules_Fields set [status] = 2 where RuleID = @RuleID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_WorkAreaRules_Fields set [status] = 3 where RuleID = @RuleID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select RuleID, RuleIndex, Rule_Name, [Description], ModuleID, DefaultValue, IsEditable
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRules_Fields(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select RuleID, RuleIndex, Rule_Name, [Description], ModuleID, DefaultValue, IsEditable
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRules_Fields(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select RuleID, RuleIndex, Rule_Name, [Description], ModuleID, DefaultValue, IsEditable
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRules_Fields(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select RuleID, RuleIndex, Rule_Name, [Description], ModuleID, DefaultValue, IsEditable
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRules_Fields(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select RuleID, RuleIndex, Rule_Name, [Description], ModuleID, DefaultValue, IsEditable
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRules_Fields(nolock)
end

end
GO
/****** Object:  StoredProcedure [dbo].[SP_WorkAreaRulesValues]    Script Date: 2/8/2018 6:59:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[SP_WorkAreaRulesValues]
(
@Value VARCHAR(20) = NULL,
@CompanyID VARCHAR(20) = NULL,
@WorkareaID VARCHAR(20) = NULL,
@RuleID VARCHAR(20) = null,
@CreatedDate date = NULL,
@CreatedTime time = null,
@CreatedBy INT = NULL,
@ModifiedDate date =  NULL,
@ModifiedTime time = null,
@ModifiedBy INT = NULL,
@Status INT = NULL,
@Flag int = null
)
as
begin
if (@Flag = 0 and (select count(*) from tbl_WorkAreaRulesValues where RuleID = @RuleID) = 0)

begin

INSERT INTO tbl_WorkAreaRulesValues
 ( Value, CompanyID, WorkareaID, RuleID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, Status)
 
SELECT  @Value, @CompanyID, @WorkareaID, @RuleID
,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)
, @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @Status

end

else if (@Flag = 1)
begin

UPDATE tbl_WorkAreaRulesValues SET  Value = @Value, CompanyID = @CompanyID, WorkareaID = @WorkareaID, RuleID = @RuleID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime))
, ModifiedBy = @ModifiedBy, Status = @Status
where RuleID = @RuleID
end



else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_WorkAreaRulesValues set [status] = 2 where RuleID = @RuleID
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_WorkAreaRulesValues set [status] = 3 where RuleID = @RuleID
end

else if (@Flag = 4)   --Extraction of Active records

begin
select Value, CompanyID, WorkareaID, RuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRulesValues(nolock) where [status] = 0
end

else if (@Flag = 5)  --Extraction of DeActive records

begin
select Value, CompanyID, WorkareaID, RuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRulesValues(nolock) where [status] = 1
end

else if (@Flag = 6)  --Extraction of Partially deleted records

begin
select Value, CompanyID, WorkareaID, RuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRulesValues(nolock) where [status] = 2
end

else if (@Flag = 7)   --Extraction of Permanantly deleted records

begin
select Value, CompanyID, WorkareaID, RuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRulesValues(nolock) where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select Value, CompanyID, WorkareaID, RuleID
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModifiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModifiedTime
, ModifiedBy, [Status]
from tbl_WorkAreaRulesValues(nolock)
end

end
GO
