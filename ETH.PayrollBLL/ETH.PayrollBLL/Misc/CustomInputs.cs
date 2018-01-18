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
}
