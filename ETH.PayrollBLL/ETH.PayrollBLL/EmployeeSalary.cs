using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ETH.BLL
{
    public class EmployeeSalary
    {
        public int SalaryId { get; set; }
        public int EmployeeId { get; set; }
        public string Designation { get; set; }
        public float TotalSalary { get; set; }
        public string EffectiveFrom { get; set; }
        public float CTC { get; set; }
        public int Status { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public string CreatedDate { get; set; }
        public string CreatedTime { get; set; }
        public string ModifiedDate { get; set; }
        public string ModifiedTime { get; set; }
    }
}
