﻿//------------------------------------------------------------------------------
// <auto-generated>
//     このコードはテンプレートから生成されました。
//
//     このファイルを手動で変更すると、アプリケーションで予期しない動作が発生する可能性があります。
//     このファイルに対する手動の変更は、コードが再生成されると上書きされます。
// </auto-generated>
//------------------------------------------------------------------------------

namespace SMSModel.DB.SMSystem
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SMSystemEntities : DbContext
    {
        public SMSystemEntities()
            : base("name=SMSystemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<DutyCategory> DutyCategories { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<ShiftDetail> ShiftDetails { get; set; }
        public virtual DbSet<ShopCategory> ShopCategories { get; set; }
        public virtual DbSet<Shop> Shops { get; set; }
        public virtual DbSet<Status> Statuses { get; set; }
        public virtual DbSet<Territory> Territories { get; set; }
    }
}
