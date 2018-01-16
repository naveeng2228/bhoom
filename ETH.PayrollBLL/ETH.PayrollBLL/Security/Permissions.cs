using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ETH.BLL.Security
{
    public class Permissions
    {
        public string ModuleID { get; set; }
        public string FormID { get; set; }
        public string UserID { get; set; }
        public string RoleID { get; set; }
        public bool CanView { get; set; }
        public bool CanSave { get; set; }
        public bool CanDelete { get; set; }
    }
}
