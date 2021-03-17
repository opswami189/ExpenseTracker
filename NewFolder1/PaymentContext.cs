using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace ExpenseTracker.NewFolder1
{
    public class PaymentContext : DbContext
    {
        public PaymentContext() : base("Data Source=.;Initial Catalog=ExpenseTracker;Integrated Security=True")
        {
            Database.SetInitializer<PaymentContext>(null);
        }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Beneficiary> Beneficiaries { get; set; }
        public DbSet<PaymentMode> PaymentModes { get; set; }
        public DbSet<UserProfile> userProfiles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Payment>().ToTable("Payment");
            modelBuilder.Entity<Beneficiary>().ToTable("Beneficiary");
            modelBuilder.Entity<Category>().ToTable("Category");
            modelBuilder.Entity<PaymentMode>().ToTable("PaymentMode");
            modelBuilder.Entity<UserProfile>().ToTable("UserProfile");
        }
    }
}