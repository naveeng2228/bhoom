

create table TBL_USERROLEASSIGNMENTS
(
RecordId int not null identity(1,1),
UserID int,
RoleId varchar(20),
CreatedDate datetime not null,
CreatedBy int not null,
ModifiedDate datetime not null,
ModifiedBy int not null,
[Status] int not null
Constraint Fk_UserID Foreign key (UserID) references tbl_Users(ID),
Constraint Fk_RoleId Foreign key (RoleId) references tbl_Roles(RoleId)
)


select  *from TBL_USERROLEASSIGNMENTS

