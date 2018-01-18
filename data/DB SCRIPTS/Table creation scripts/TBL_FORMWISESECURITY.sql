

create table TBL_FORMWISESECURITY
(
RecordId int not null identity(1,1),
ModuleID NVARCHAR(20) not null,
FormID VARCHAR(20) not null,
UserID int,
RoleID VARCHAR(20) not null,
CreatedDate datetime not null,
CreatedBy int not null,
ModifiedDate datetime not null,
ModifiedBy int not null,
[Status] int not null
constraint Fk_ModuleID Foreign key(ModuleID) references tbl_Modules(ModuleID),
constraint Fk_FormID Foreign key(FormID) references tbl_Forms(FormID),
constraint Fk_UserID1 Foreign key(UserID) references tbl_Users(id),
constraint Fk_RoleID1 Foreign key(RoleID) references tbl_Roles(RoleID)
)


