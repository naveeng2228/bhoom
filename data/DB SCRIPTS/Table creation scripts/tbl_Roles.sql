

create table tbl_Roles
(
RecordId bigint not null identity(1,1),
RoleID VARCHAR(20) not null,
RoleName VARCHAR(35)  NOT NULL,
[Description] VARCHAR(300)  NULL,
CompanyID VARCHAR(20) NOT NULL,
WorkareaID VARCHAR(20) NOT NULL,
CreatedDate datetime not null,
CreatedBy int not null,
ModifiedDate datetime not null,
ModifiedBy int not null,
[Status] int not null
Constraint Pk_RoleID primary key (RoleID)
)

select  *from tbl_Roles

--add fk constraints