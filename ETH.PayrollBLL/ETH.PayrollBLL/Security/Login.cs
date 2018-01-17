using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ETH.BLL.Security
{
    public class LoginHistory
    {
        public Int64 LoginId { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string LastLoginDate { get; set; } // "dd/MM/yyyy"
        public string LastLoginTime { get; set; } // "hh:mm:ss tt"
        public string IPAddress { get; set; }
        public string SessionId { get; set; }
        public bool hasActiveSession { get; set; }
        public string AuthenticatedOTP { get; set; }

        //Auto Input Fields
        public string CreatedDate { get; set; }
        public string CreatedTime { get; set; }
    }
}
