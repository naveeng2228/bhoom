-- DB SCRIPTS VERSION V1
-- CREATE DATABASE E_ERP;

USE E_ERP;

-- MODULES TABLE
CREATE TABLE [dbo].[tbl_Modules](
	[RecordId] bigint not null identity(1,1),
	[ModuleId] [nvarchar](20) NOT NULL,
	[ModuleName] [nvarchar](35) NOT NULL,
	[ModuleUrl] [nvarchar](300) NOT NULL,
	[ModuleDescription] [nvarchar](500) NULL,
	[CreatedDate] datetime,
	CreatedBy int,
	ModifiedDate datetime,
	ModifiedBy int,
	[Status] int not null
	PRIMARY KEY CLUSTERED 
	(
		[ModuleId] ASC
	)
);

-- FORMS TABLE
create table tbl_Forms
(
	RecordId bigint not null Identity(1,1),
	FormId varchar(20) not null,
	FormName Varchar(35),
	FormUrl Varchar(300),
	ModuleId varchar(20),
	CreatedDate datetime not null,
	CreatedBy int not null,
	ModifiedDate datetime not null,
	ModifiedBy int not null,
	[Status] int not null
	Constraint Pk_FormId Primary Key (FormId)
);

-- COUNTRY TABLE
create table tbl_Country
(
	RecordId bigint not null Identity (1,1),
	CountryID varchar(20) not null,
	CountryName Varchar(35) not null,
	CreatedDate datetime not null,
	CreatedBy int not null,
	ModifiedDate datetime not null,
	ModifiedBy int not null,
	[Status] int not null
	constraint Pk_CountryID primary key (CountryID)
);

-- STATES TABLE
create table tbl_States
(
	RecordId bigint not null identity (1,1),
	StateId varchar(20) not null,
	StateName Varchar(35) not null,
	CountryId Varchar(20) not null,
	CreatedDate datetime,
	CreatedBy int not null,
	ModifiedDate datetime,
	ModifiedBy int not null,
	[Status] int not null,
);

-- ROLES TABLE
create table tbl_Roles
(
	RecordId bigint not null identity(1,1),
	RoleID VARCHAR(20) not null,
	RoleName VARCHAR(35)  NOT NULL,
	[Description] VARCHAR(300)  NULL,
	CompanyID VARCHAR(20) NOT NULL,
	WorkareaID VARCHAR(20) NOT NULL,
	CreatedDate datetime not null,
	CreatedBy int not null,
	ModifiedDate datetime not null,
	ModifiedBy int not null,
	[Status] int not null
	Constraint Pk_RoleID primary key (RoleID)
);

-- USERS TABLE
create table tbl_Users(
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
	[status] [int] NULL
	,customer_id varchar(20)
	,FirstName varchar(50)
    ,MiddleName varchar(50)
    ,LastName varchar(50)
    ,Gender int
    ,MaritalStatus int
    ,DateOfBirth date
    ,Age int
    ,ProfilePicUrl nvarchar(max)
    ,UniqueAccessPath nvarchar(max)
    ,Mobile bigint
    ,CountryId varchar(20)
    ,StateId varchar(20)
    ,PrimaryAddress varchar(300)
	Constraint pk_id primary key (Id)
);

-- LOGIN HISTORY
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
		[LoginId] 
	)
);

-- USER ROLE ASSIGNMENTS
create table TBL_USERROLEASSIGNMENTS
(
	RecordId int not null identity(1,1),
	UserID int,
	RoleId varchar(20),
	CreatedDate datetime not null,
	CreatedBy int not null,
	ModifiedDate datetime not null,
	ModifiedBy int not null,
	[Status] int not null
	Constraint Fk_UserID Foreign key (UserID) references tbl_Users(ID),
	Constraint Fk_RoleId Foreign key (RoleId) references tbl_Roles(RoleId)
);

-- FORM WISE SECURITY


create table TBL_FORMWISESECURITY
(
	RecordId int not null identity(1,1),
	ModuleID NVARCHAR(20) not null,
	FormID VARCHAR(20) not null,
	UserID int,
	RoleID VARCHAR(20) not null,
	CreatedDate datetime not null,
	CreatedBy int not null,
	ModifiedDate datetime not null,
	ModifiedBy int not null,
	[Status] int not null
	constraint Fk_ModuleID Foreign key(ModuleID) references tbl_Modules(ModuleID),
	constraint Fk_FormID Foreign key(FormID) references tbl_Forms(FormID),
	constraint Fk_UserID1 Foreign key(UserID) references tbl_Users(id),
	constraint Fk_RoleID1 Foreign key(RoleID) references tbl_Roles(RoleID)
);