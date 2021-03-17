using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExpenseTracker.NewFolder1
{
    public class UserProfile
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailId { get; set; }
        public string Password { get; set; }
        public string MobileNo { get; set; }
        public ICollection<Payment> Payments { get; set; }
    }
}