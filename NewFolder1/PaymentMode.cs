using System.Collections.Generic;

namespace ExpenseTracker.NewFolder1
{
    public class PaymentMode
    {
        public int Id { get; set; }
        public string Mode { get; set; }
        public int UserProfileId { get; set; }
        public bool IsDeleted { get; set; }
        public ICollection<Payment> Payments { get; set; }

    }
}