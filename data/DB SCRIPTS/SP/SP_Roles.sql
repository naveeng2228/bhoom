

create procedure SP_Roles
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


end