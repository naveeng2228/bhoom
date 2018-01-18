

create PROCEDURE [dbo].[SP_Modules]
(   @ModuleId int=NULL,
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
,convert(varchar(10),ModifiedDate,101) as ModefiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModefiedTime
, ModifiedBy, [Status]
from tbl_Modules where [status] = 0
end

else if (@Flag = 5)   --Extraction of DeActive records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModefiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModefiedTime
, ModifiedBy, [Status]
from tbl_Modules where [status] = 1
end

else if (@Flag = 6)   --Extraction of Partially deleted records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModefiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModefiedTime
, ModifiedBy, [Status]
from tbl_Modules where [status] = 2
end

else if (@Flag = 7)  --Extraction of Permanantly deleted records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModefiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModefiedTime
, ModifiedBy, [Status]
from tbl_Modules where [status] = 3
end

else if (@Flag = 8)   --Extraction of all records

begin
select RecordId, ModuleId, ModuleName, ModuleUrl, ModuleDescription
,convert(varchar(10),CreatedDate,101) as CreatedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), CreatedDate, 22), 11)) as CreatedTime
, CreatedBy
,convert(varchar(10),ModifiedDate,101) as ModefiedDate
,LTRIM(RIGHT(CONVERT(CHAR(20), ModifiedDate, 22), 11)) as ModefiedTime
, ModifiedBy, [Status]
from tbl_Modules
end

END


