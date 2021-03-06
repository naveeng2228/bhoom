USE [E_ERP]
GO
/****** Object:  StoredProcedure [dbo].[SP_UserController]    Script Date: 1/18/2018 1:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER procedure [dbo].[SP_UserController] 
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

INSERT INTO tbl_User
 ( Username, [Password], Email, CompanyID, WorkAreaID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy, PasswordQuestion1, PasswordQuestion2, PasswordAnswer1, PasswordAnswer2, UserType, [status], CustomerId, FirstName, MiddleName, LastName, Gender, MaritalStatus, DateOfBirth, Age, ProfilePicUrl, UniqueAccessPath, Mobile, CountryId, StateId, PrimaryAddress)
 
SELECT  @Username, @Password, @Email, @CompanyID, @WorkAreaID, CAST(CONVERT(Varchar(10), @CreatedDate, 112) + ' ' + CONVERT(Varchar(8), @CreatedTime) AS DateTime), @CreatedBy, CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime), @ModifiedBy, @PasswordQuestion1, @PasswordQuestion2, @PasswordAnswer1, @PasswordAnswer2, @UserType, @status, @customer_id, @FirstName, @MiddleName, @LastName, @Gender, @MaritalStatus, @DateOfBirth, @Age, @ProfilePicUrl, @UniqueAccessPath, @Mobile, @CountryId, @StateId, @PrimaryAddress

end

else if (@Flag = 1)   --Update based on Userid Modification
begin

update tbl_User set [Password] = @Password, WorkAreaID = @WorkAreaID
, ModifiedDate = (select CAST(CONVERT(Varchar(10), @ModifiedDate, 112) + ' ' + CONVERT(Varchar(8), @ModifiedTime) AS DateTime)), ModifiedBy = @ModifiedBy
, PasswordQuestion1 = @PasswordQuestion1, PasswordQuestion2 = @PasswordQuestion2, PasswordAnswer1 = @PasswordAnswer1, PasswordAnswer2 = @PasswordAnswer2, UserType = @UserType, [status] = @status, FirstName = @FirstName, MiddleName = @MiddleName, LastName = @LastName, Gender = @Gender, MaritalStatus = @MaritalStatus, DateOfBirth = @DateOfBirth, Age = @Age, ProfilePicUrl = @ProfilePicUrl, UniqueAccessPath = @UniqueAccessPath, Mobile = @Mobile, CountryId = @CountryId, StateId = @StateId, PrimaryAddress = @PrimaryAddress 
where Id = @UserId

end

else if (@Flag = 2)  --Updating Status to Partially deleted records

begin
update tbl_User set [status] = 2 where Id = @UserId
end

else if (@Flag = 3)   --Updating Status to fully deleted records

begin
update tbl_User set [status] = 3 where Id = @UserId
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
from tbl_User where [status] = 0
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
from tbl_User(nolock) where [status] = 1
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
 from tbl_User(nolock) where [status] = 2
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
from tbl_User(nolock) where [status] = 3 ;
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
from tbl_User(nolock) ;
end

else if (@Flag = 9)   -- Verifing the user Based on User name and Password or Email id and password

begin


select 
Id
from tbl_User u (nolock)
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
from tbl_User where [status] = 0 AND Id = @UserId;
end


end