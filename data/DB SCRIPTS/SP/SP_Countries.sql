

Alter procedure SP_Countries
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