using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExpenseTracker.NewFolder1
{
    public class Category
    {
        public int Id { get; set; }

        public string CategoryType { get; set; }
        public ICollection<Payment> Payments { get; set; }
    }
}