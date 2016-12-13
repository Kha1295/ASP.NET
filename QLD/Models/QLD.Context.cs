﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class Entities : DbContext
    {
        public Entities()
            : base("name=Entities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Bank> Banks { get; set; }
        public virtual DbSet<CardDeal> CardDeals { get; set; }
        public virtual DbSet<Career> Careers { get; set; }
        public virtual DbSet<ContracImage> ContracImages { get; set; }
        public virtual DbSet<Contract> Contracts { get; set; }
        public virtual DbSet<ContractStatu> ContractStatus { get; set; }
        public virtual DbSet<ContractType> ContractTypes { get; set; }
        public virtual DbSet<Education> Educations { get; set; }
        public virtual DbSet<Folk> Folks { get; set; }
        public virtual DbSet<GridesCardType> GridesCardTypes { get; set; }
        public virtual DbSet<GroupGuest> GroupGuests { get; set; }
        public virtual DbSet<Guide> Guides { get; set; }
        public virtual DbSet<GuidesContract> GuidesContracts { get; set; }
        public virtual DbSet<GuidesGroup> GuidesGroups { get; set; }
        public virtual DbSet<GuidesPrice> GuidesPrices { get; set; }
        public virtual DbSet<GuidesProperty> GuidesProperties { get; set; }
        public virtual DbSet<GuidesPropertyDetail> GuidesPropertyDetails { get; set; }
        public virtual DbSet<History> Histories { get; set; }
        public virtual DbSet<Insurance> Insurances { get; set; }
        public virtual DbSet<InsurancePrice> InsurancePrices { get; set; }
        public virtual DbSet<Land> Lands { get; set; }
        public virtual DbSet<LandGroup> LandGroups { get; set; }
        public virtual DbSet<MoneyDeal> MoneyDeals { get; set; }
        public virtual DbSet<ParentProfit> ParentProfits { get; set; }
        public virtual DbSet<Partner> Partners { get; set; }
        public virtual DbSet<PartnerBank> PartnerBanks { get; set; }
        public virtual DbSet<PartnerBranch> PartnerBranches { get; set; }
        public virtual DbSet<PartnerContact> PartnerContacts { get; set; }
        public virtual DbSet<PartnerDeposit> PartnerDeposits { get; set; }
        public virtual DbSet<PartnerImage> PartnerImages { get; set; }
        public virtual DbSet<PartnerLeve> PartnerLeves { get; set; }
        public virtual DbSet<PartnerLeveDetail> PartnerLeveDetails { get; set; }
        public virtual DbSet<PartnerPropertise> PartnerPropertises { get; set; }
        public virtual DbSet<PartnerStaff> PartnerStaffs { get; set; }
        public virtual DbSet<PartnerStaffBank> PartnerStaffBanks { get; set; }
        public virtual DbSet<Payman> Paymen { get; set; }
        public virtual DbSet<Plan> Plans { get; set; }
        public virtual DbSet<Provider> Providers { get; set; }
        public virtual DbSet<ProviderBank> ProviderBanks { get; set; }
        public virtual DbSet<ProviderBranch> ProviderBranches { get; set; }
        public virtual DbSet<ProviderContact> ProviderContacts { get; set; }
        public virtual DbSet<ProviderImage> ProviderImages { get; set; }
        public virtual DbSet<ProviderPropertise> ProviderPropertises { get; set; }
        public virtual DbSet<Regency> Regencies { get; set; }
        public virtual DbSet<Religion> Religions { get; set; }
        public virtual DbSet<Service> Services { get; set; }
        public virtual DbSet<ServiceOther> ServiceOthers { get; set; }
        public virtual DbSet<ServiceOtherPrice> ServiceOtherPrices { get; set; }
        public virtual DbSet<Star> Stars { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Vocative> Vocatives { get; set; }
    
        public virtual int sp_alterdiagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_alterdiagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_creatediagram(string diagramname, Nullable<int> owner_id, Nullable<int> version, byte[] definition)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var versionParameter = version.HasValue ?
                new ObjectParameter("version", version) :
                new ObjectParameter("version", typeof(int));
    
            var definitionParameter = definition != null ?
                new ObjectParameter("definition", definition) :
                new ObjectParameter("definition", typeof(byte[]));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_creatediagram", diagramnameParameter, owner_idParameter, versionParameter, definitionParameter);
        }
    
        public virtual int sp_dropdiagram(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_dropdiagram", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagramdefinition_Result> sp_helpdiagramdefinition(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagramdefinition_Result>("sp_helpdiagramdefinition", diagramnameParameter, owner_idParameter);
        }
    
        public virtual ObjectResult<sp_helpdiagrams_Result> sp_helpdiagrams(string diagramname, Nullable<int> owner_id)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_helpdiagrams_Result>("sp_helpdiagrams", diagramnameParameter, owner_idParameter);
        }
    
        public virtual int sp_renamediagram(string diagramname, Nullable<int> owner_id, string new_diagramname)
        {
            var diagramnameParameter = diagramname != null ?
                new ObjectParameter("diagramname", diagramname) :
                new ObjectParameter("diagramname", typeof(string));
    
            var owner_idParameter = owner_id.HasValue ?
                new ObjectParameter("owner_id", owner_id) :
                new ObjectParameter("owner_id", typeof(int));
    
            var new_diagramnameParameter = new_diagramname != null ?
                new ObjectParameter("new_diagramname", new_diagramname) :
                new ObjectParameter("new_diagramname", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_renamediagram", diagramnameParameter, owner_idParameter, new_diagramnameParameter);
        }
    }
}
