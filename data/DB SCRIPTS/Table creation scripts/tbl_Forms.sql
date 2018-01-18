

create table tbl_Forms
(
RecordId bigint not null Identity(1,1),
FormId varchar(20) not null,
FormName Varchar(35),
FormUrl Varchar(300),
ModuleId varchar(20),
CreatedDate datetime not null,
CreatedBy int not null,
ModifiedDate datetime not null,
ModifiedBy int not null,
[Status] int not null
Constraint Pk_FormId Primary Key (FormId)
)

select  * from tbl_Modules