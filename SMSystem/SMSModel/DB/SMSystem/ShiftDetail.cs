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
    
    public partial class ShiftDetail
    {
        public int ID { get; set; }
        public int EmployeeID { get; set; }
        public int ShopID { get; set; }
        public int DutyCategoryID { get; set; }
        public bool IsHoliday { get; set; }
        public System.DateTime WorkingDate { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public string Intermission1 { get; set; }
        public string Intermission2 { get; set; }
        public string TravelTime1 { get; set; }
        public string TravelTime2 { get; set; }
        public bool IsHelpStaff { get; set; }
        public System.DateTime 登録日時 { get; set; }
        public string 備考 { get; set; }
        public bool 削除フラグ { get; set; }
    
        public virtual DutyCategory DutyCategory { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Shop Shop { get; set; }

        public bool IsModified { get; set; } //オリジナルのプロパティ
    }
}
