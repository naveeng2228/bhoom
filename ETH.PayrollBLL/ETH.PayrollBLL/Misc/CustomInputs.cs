using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ETH.BLL.Misc
{
    public enum DB_Flags
    {
        Insert = 0,
        Update = 1,
        PartialDelete = 2,
        FullDelete = 3,
        SelectActive = 4,
        SelectInactive = 5,
        SelectPartialDeleted = 6,
        SelectFullDeleted = 7,
        SelectAll = 8
    }

    public enum Gender
    {
        Female = 0,
        Male = 1,
        UnSpecified = 2
    }

    public enum MaritalStatus
    {
        Single = 0,
        Married = 1,
        Widow = 2,
        Divorcee = 3,
        RatherNotSay = 4
    }

    public enum Status
    {
        Active = 0,
        Inactive = 1,
        PartiallyDeleted = 2,
        Deleted = 3
    }

    public enum DeleteStatus
    {
        Deleted = 0,
        NotDeleted = 1
    }

    public enum UserType
    {
        SuperAdmin = 0,
        Admin = 1,
        AuthenticatedUser = 2,
        Employee = 3,
        ApplicationUser = 4,
        Developer = 5
    }

    public enum AllowanceTypes
    {
        Amount = 0,
        Percentage = 1,
        Slab = 2,
        Custom = 3
    }

    public enum Available_Modules
    {
        Administration = 10001,
        Attendance = 10002,
        Payroll = 10003,
        Security = 10004,
        LeaveManagement = 10005,
        Other = 10006
    }

    public enum Available_Forms
    {
        AdministrationHome = 10001,
        ManageCompany = 10002,
        ManageWorkarea = 10003,
        ManageDivisions = 10004,
        ManageDepartments = 10005,
        ManageDesignations = 10006,
        ManageHolidayGroups = 10007,
        ManageLeaveGroups = 10008,
        ManageShiftGroups = 10009,
        ManageAllowanceGroups = 10010,
        ManageHolidays = 10011,
        ManageLeaveTypes = 10012,
        ManageLeaves = 10013,
        ManageShifts = 10014,
        ManageAllowances = 10015
    }

    public enum EventState
    {
        NotStarted = 0,
        Started = 1,
        Locked = 2,
        Released = 3
    }
}
