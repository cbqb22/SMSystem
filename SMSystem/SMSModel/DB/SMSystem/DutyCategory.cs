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
    
    public partial class DutyCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DutyCategory()
        {
            this.ShiftDetails = new HashSet<ShiftDetail>();
        }
    
        public int ID { get; set; }
        public string 業務名 { get; set; }
        public string 備考 { get; set; }
        public bool 削除フラグ { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ShiftDetail> ShiftDetails { get; set; }
    }
}