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
    
    public partial class ProviderBranch
    {
        public long ProviderBarchId { get; set; }
        public Nullable<long> ProviderId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Hotline { get; set; }
        public string Mail { get; set; }
        public string Fax { get; set; }
        public string Address { get; set; }
        public Nullable<int> CityId { get; set; }
        public string Note { get; set; }
    
        public virtual Provider Provider { get; set; }
    }
}
