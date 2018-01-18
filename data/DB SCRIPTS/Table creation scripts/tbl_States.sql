

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
)

select * from tbl_States