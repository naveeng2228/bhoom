


create procedure SP_LoginHistory
(
	@LoginId BIGINT = null
	,@UserId nvarchar(20) = null
	,@Username nvarchar = null
	,@LastLoginDate DATE = null
	,@LastLoginTime time = null
	,@IPAddress VARCHAR(15) = null
	,@SessionId VARCHAR(50) = null
	,@hasActiveSession BIT = null
	,@AuthenticatedOTP VARCHAR(6) = null
	,@CreatedDate DATE = null
	,@CreatedTime time = null
	,@Flag int = null
)

as

begin

if (@Flag = 0)
begin
INSERT INTO tbl_LoginHistory
 ( LoginId, UserId, UserName, LastLoginDate, IPAddress, SessionId, hasActiveSession, AuthenticatedOTP, CreatedDate)
 
SELECT  @LoginId,@UserId,@Username,CAST(CONVERT(Varchar(10), @LastLoginDate, 112) + ' ' + CONVERT(Varchar(8), @LastLoginTime) AS DateTime)
,@IPAddress,@SessionId,@hasActiveSession,@AuthenticatedOTP,CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime)

end

else if (@Flag = 9)

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
from tbl_LoginHistory 
where Userid = @UserId
order by LoginID desc

end

else if (@Flag = 10)

begin

select top 1
UserId
from tbl_LoginHistory
where SessionId = @SessionId

end

end

