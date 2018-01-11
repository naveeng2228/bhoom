using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ETH.PayrollBLL
{
    public class SalaryHistory
    {
        public int SalaryID { get; set; }
        public float PreviousSalary { get; set; }
        public float CurrentSalary { get; set; }
        public string IncrementDate { get; set; }
        public string EffectiveFrom { get; set; }
        public string remarks { get; set; }
        public int Status { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedTime { get; set; }
        public string ModifiedDate { get; set; }
        public string ModifiedTime { get; set; }
    }
}
