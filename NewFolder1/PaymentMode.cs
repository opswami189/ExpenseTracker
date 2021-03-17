using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExpenseTracker.NewFolder1
{
    public class PaymentMode
    {
        public int Id { get; set; }

        public string Mode { get; set; }
        public ICollection<Payment> Payments { get; set; }

    }
}