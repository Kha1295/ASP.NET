//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLD.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Bank
    {
        public Bank()
        {
            this.PartnerBanks = new HashSet<PartnerBank>();
            this.PartnerStaffBanks = new HashSet<PartnerStaffBank>();
            this.ProviderBanks = new HashSet<ProviderBank>();
        }
    
        public int BankId { get; set; }
        public string Name { get; set; }
        public string Note { get; set; }
        public Nullable<int> Status { get; set; }
    
        public virtual ICollection<PartnerBank> PartnerBanks { get; set; }
        public virtual ICollection<PartnerStaffBank> PartnerStaffBanks { get; set; }
        public virtual ICollection<ProviderBank> ProviderBanks { get; set; }
    }
}
