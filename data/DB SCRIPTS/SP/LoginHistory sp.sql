


create procedure SP_LoginHistory
(
	 @RecordID BIGINT = null
	,@LoginId VARCHAR(15) = null
	,@UserId nvarchar(20) = null
	,@Username nvarchar = null
	,@LastLogin_dte DATE = null
	,@LastLogin_time time = null
	,@IPAddress VARCHAR(15) = null
	,@SessionId VARCHAR(50) = null
	,@hasActiveSession BIT = null
	,@AuthenticatedOTP VARCHAR(6) = null
	,@Created_dte DATE = null
	,@Created_Time time = null
	,@Flag int = null
)

as

begin

if (@Flag = 0)
begin
INSERT INTO tbl_LoginHistory
 ( RecordID, LoginId, UserId, UserName, LastLogin_dte, IPAddress, SessionId, hasActiveSession, AuthenticatedOTP, Created_dte)
 
SELECT  @RecordID,@LoginId,@UserId,@Username,CAST(CONVERT(Varchar(10), @LastLogin_dte, 112) + ' ' + CONVERT(Varchar(8), @LastLogin_time) AS DateTime)
,@IPAddress,@SessionId,@hasActiveSession,@AuthenticatedOTP,CAST(CONVERT(Varchar(10), @Created_dte, 112) + ' ' + CONVERT(Varchar(8), @Created_Time) AS DateTime)

end

else if (@Flag = 9)

begin

select top 1
RecordID
,LoginId
,UserId
,UserName
,convert(varchar(10),LastLogin_dte,101) as Last_Login_date
,LTRIM(RIGHT(CONVERT(CHAR(20), LastLogin_dte, 22), 11)) as Last_Login_Time
,IPAddress
,SessionId
,hasActiveSession
,AuthenticatedOTP
,convert(varchar(10),Created_dte,101) as Created_date
,LTRIM(RIGHT(CONVERT(CHAR(20), Created_dte, 22), 11)) as Created_Time
from tbl_LoginHistory 
where Userid = @UserId
order by RecordID desc

end

else if (@Flag = 10)

begin

select top 1
UserId
from tbl_LoginHistory
where SessionId = @SessionId

end

end

