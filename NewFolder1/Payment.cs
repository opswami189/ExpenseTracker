using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExpenseTracker.NewFolder1
{
    public class Payment
    {
        public int Id { get; set; }
        public int UserProfileId { get; set; }

        public DateTime? TransactionDate { get; set; }

        public int PaymentModeId { get; set; }

        public int CategoryId { get; set; }

        public bool IsCredit { get; set; }

        public string PaymentDetails { get; set; }

        public int? BeneficiaryId { get; set; }

        public decimal Amount { get; set; }
    }
}