

create table tbl_Country
(
RecordId bigint not null Identity (1,1),
CountryID varchar(20) not null,
CountryName Varchar(35) not null,
CreatedDate datetime not null,
CreatedBy int not null,
ModifiedDate datetime not null,
ModifiedBy int not null,
[Status] int not null
constraint Pk_CountryID primary key (CountryID)
)

select * from tbl_Country



