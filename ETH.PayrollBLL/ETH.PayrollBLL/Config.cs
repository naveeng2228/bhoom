using ETH.BLL.Security;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ETH.BLL
{
    public class Config
    {
        public string DBType { get; set; }
        public string CustomerID { get; set; }
        public string AppDateFormat { get; set; }
        public string AppTimeFormat { get; set; }
        public LoginHistory[] LoginHistory { get; set; }
        public User UserInfo { get; set; }
        public int MinCompanyYearOfEstablishment { get; set; }
        public EventManager CurrentEvent { get; set; }
    }
}
