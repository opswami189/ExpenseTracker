using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExpenseTracker.NewFolder1
{
    public class Beneficiary
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string MobileNo { get; set; }
        public ICollection<Payment> Payments { get; set; }

    }
}