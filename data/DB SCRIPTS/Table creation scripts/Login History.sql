


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
)

select * from tbl_LoginHistory