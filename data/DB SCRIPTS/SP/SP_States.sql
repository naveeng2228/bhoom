


create procedure SP_States
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


end