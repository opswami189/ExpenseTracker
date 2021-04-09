using System.Collections.Generic;

namespace ExpenseTracker.NewFolder1
{
    public class Beneficiary
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string MobileNo { get; set; }
        public int UserProfileId { get; set; }
        public bool IsDeleted { get; set; }
        public ICollection<Payment> Payments { get; set; }

    }
}