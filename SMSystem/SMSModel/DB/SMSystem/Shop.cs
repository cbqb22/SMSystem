//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class Shop
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Shop()
        {
            this.Employees = new HashSet<Employee>();
            this.ShiftDetails = new HashSet<ShiftDetail>();
        }
    
        public int ID { get; set; }
        public int ShopCategoryID { get; set; }
        public int TerritoryID { get; set; }
        public string 店舗名 { get; set; }
        public string 営業時間_通常 { get; set; }
        public string 営業時間_祝日 { get; set; }
        public string 営業時間_その他 { get; set; }
        public string 営業日 { get; set; }
        public System.DateTime オープン日時 { get; set; }
        public System.DateTime 閉店日時 { get; set; }
        public bool 削除フラグ { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Employee> Employees { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShiftDetail> ShiftDetails { get; set; }
        public virtual ShopCategory ShopCategory { get; set; }
        public virtual Territory Territory { get; set; }
    }
}
