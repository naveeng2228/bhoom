using ETH.BLL.Misc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETH.BLL
{
    public class User
    {
        //Basic Details
        public string EmployeeId { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public UserType UserType { get; set; }

        //CompanyDetails
        public int CompanyID { get; set; }
        public int WorkAreaID { get; set; }

        //HINT
        public string PasswordQuestion { get; set; }
        public string PasswordAnswer { get; set; }

        // User Activity
        public bool IsOnline { get; set; }
        public bool IsLocked { get; set; }
        public bool LastPasswordChangedDate { get; set; }
        public string LastLoginDate { get; set; }
        public string LastLoginTime { get; set; }
        public string RegistrationDate { get; set; }

        //Personal Details
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public Gender Gender { get; set; }
        public MaritalStatus MaritalStatus { get; set; }
        public string DateOfBirth { get; set; }
        public int Age { get; set; }
        public string ProfilePicUrl { get; set; }
        public string UniqueAccessPath { get; set; }

        //Communication Details
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string CountryId { get; set; }
        public string StateId { get; set; }
        public string PrimaryAddress { get; set; }

        //Auto Input Fields
        public string CreatedDate { get; set; }
        public string CreatedTime { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedDate { get; set; }
        public string ModifiedTime { get; set; }
        public string ModifiedBy { get; set; }

        //User Status
        public Status IsActive { get; set; }
        public DeleteStatus IsDeleted { get; set; }
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
}
