
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
)

select * from tbl_Modules

