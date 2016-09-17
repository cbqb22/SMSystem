using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using SMSModel.DB.SMSystem;
using System.ComponentModel;
using System.Data.Entity;
using SMSViewModel.UI.Windows;

namespace SMSViewModel.DataInstance
{
    /// <summary>
    /// シングルトンでデータを返すルートクラス
    /// </summary>
    public class Data
    {

        public static string Value;

        #region initializer
        static Data()
        {
            //お約束
            //クラスライブラリからEntityFrameworkを使う為に参照しておく
            var sps = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
        }

        #endregion

        #region Database
        public static class DB
        {
            public static class Instance
            {
                private static SMSystem _SMSystemInstance;
                public static SMSystem SMSystemInstance
                {
                    get
                    {
                        if (_SMSystemInstance == null)
                        {
                            _SMSystemInstance = new SMSystem();
                        }
                        return _SMSystemInstance;
                    }

                    set
                    {

                        _SMSystemInstance = value;
                    }
                }
            }

            public class SMSystem : INotifyPropertyChanged
            {
                #region INotifyPropertyChanged メンバ

                public event PropertyChangedEventHandler PropertyChanged;
                protected void FirePropertyChanged(string propertyName)
                {
                    if (this.PropertyChanged != null)
                    {
                        PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
                    }
                }

                #endregion


                public SMSystem()
                {
                    //データを読込み
                    //不足Rowを挿入
                    Load();


                }

                /// <summary>
                /// 従業員リストのキャッシュ
                /// </summary>
                private List<Employee> _EmployeeCashData;
                public List<Employee> EmployeeCashData
                {
                    get
                    {
                        if (_EmployeeCashData == null)
                        {
                            Load();

                        }
                        return _EmployeeCashData;
                    }

                    set
                    {
                        _EmployeeCashData = value;
                        FirePropertyChanged("EmployeeCashData");
                    }
                }


                /// <summary>
                /// 必要なキャッシュデータをロードする
                /// </summary>
                public void Load()
                {
                    try
                    {
                        using (var context = new SMSystemEntities())
                        {
                            _EmployeeCashData = context.Employees.Include(p => p.ShiftDetails).Include(p => p.Shop).Include(p => p.Territory).Include("ShiftDetails.Shop").ToList();

                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.Message + ex.StackTrace);
                    }
                }

                /// <summary>
                /// 不足のRowを追加する
                /// </summary>
                /// <param name="type"></param>
                public void InsertEmptyCells()
                {
                    try
                    {
                        using (var context = new SMSystemEntities())
                        {

                            //System.Diagnostics.Debug.WriteLine("------------ログ開始--------------");
                            //context.Database.Log = (sql) => { System.Diagnostics.Debug.Write(sql); };   //SQLを出す

                            DateTime startDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day).AddMonths(-2);
                            DateTime endDate = startDate.AddMonths(4);

                            var employee = context.Employees;
                            var shiftdetals = context.ShiftDetails;
                            var dutyCategory = context.DutyCategories;


                            var query = from x in shiftdetals
                                        where
                                            startDate <= x.WorkingDate &&
                                            x.WorkingDate <= endDate
                                        select x;



                            for (DateTime d = startDate; d <= endDate; d = d.AddDays(1))
                            {

                                foreach (var emp in employee)
                                {
                                    var checkData = shiftdetals.Where(x => x.EmployeeID == emp.ID && x.WorkingDate == d);
                                    if (checkData.Count() == 0)
                                    {
                                        //TODO DutyCategoryID,StartTimeなどををnull許可する
                                        ShiftDetail sd = new ShiftDetail() { EmployeeID = emp.ID, ShopID = emp.ShopID, DutyCategoryID = 1, IsHoliday = false, WorkingDate = d, StartTime = "-", EndTime = "-", Intermission1 = "-", Intermission2 = "-", TravelTime1 = "-", TravelTime2 = "-", IsHelpStaff = false, 登録日時 = DateTime.Now, 備考 = "-", 削除フラグ = false };

                                        shiftdetals.Add(sd);

                                    }
                                }

                            }


                            context.SaveChanges();

                        }
                    }
                    catch (Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.Message + ex.StackTrace);
                    }
                }



                /// <summary>
                /// シフト更新処理
                /// </summary>
                public void ShiftDataUpdate()
                {
                    //TODO
                    //削除→更新→追加の順

                    //削除
                    //更新
                    //追加
                }


                /// <summary>
                /// 日付と期間を指定して従業員シフトデータをかえす
                /// </summary>
                /// <param name="datetime"></param>
                /// <param name="days"></param>
                /// <returns></returns>
                public List<EmployeeShiftDetail> GetEmployeeShiftDetailByDateTime(DateTime datetime, int days)
                {
                    DateTime dt = new DateTime(datetime.Year, datetime.Month, datetime.Day);

                    var query =
                     (from x in Data.DB.Instance.SMSystemInstance.EmployeeCashData
                      join z in Data.DB.Instance.SMSystemInstance.EmployeeCashData.SelectMany(x => x.ShiftDetails).Where(x => dt <= x.WorkingDate && x.WorkingDate < dt.AddDays(days))
                      on
                         x.ID equals z.EmployeeID into sd
                      select new EmployeeShiftDetail
                      {
                          Employee = x,
                          ShiftDetails = sd.OrderBy(d => d.WorkingDate).ToList()
                      });


                    return query.ToList();

                }


                public string SaveShiftToDB()
                {
                    var query =
                     (from x in Data.DB.Instance.SMSystemInstance.EmployeeCashData
                      join z in Data.DB.Instance.SMSystemInstance.EmployeeCashData.SelectMany(x => x.ShiftDetails).Where(y => y.IsModified == true)
                      on
                         x.ID equals z.EmployeeID into sd
                      select sd);


                    string updateMessage = "";

                    var modifiedList = query.SelectMany(x => x).ToList();
                    int updateCount = modifiedList.Count();

                    if (updateCount == 0)
                    {
                        updateMessage = "変更箇所がありません。";
                        return updateMessage;
                    }

                    bool error = false;

                    try
                    {
                        using (var context = new SMSystemEntities())
                        {
                            foreach (var row in modifiedList)
                            {
                                var updateRow = context.ShiftDetails.Where(x => x.EmployeeID == row.EmployeeID && x.ID == row.ID);

                                if (updateRow.Count() == 1)
                                {
                                    var r = updateRow.First();
                                    r.StartTime = row.StartTime;
                                    r.EndTime = row.EndTime;
                                    r.Intermission1 = row.Intermission1;
                                    r.Intermission2 = row.Intermission2;
                                    r.IsHoliday = row.IsHoliday;
                                    r.IsHelpStaff = row.IsHelpStaff;
                                }
                                else
                                {
                                    //Logに出力
                                }
                            }

                            updateCount = context.SaveChanges();


                        }

                    }
                    catch (Exception e)
                    {
                        error = true;
                        updateMessage = string.Format("データベースに保存中にエラーが発生しました。\r\nMessage:{0}\r\nStackTrace:{1}", e.Message, e.StackTrace);
                    }

                    if (!error)
                    {
                        updateMessage = string.Format("{0}件の更新しました。", updateCount);
                    }

                    return updateMessage;
                }

                /// <summary>
                /// DataContext用Entity
                /// </summary>
                public class EmployeeShiftDetail
                {
                    private Employee _Employee;

                    public Employee Employee
                    {
                        get
                        {
                            return _Employee;
                        }

                        set
                        {
                            _Employee = value;
                        }
                    }
                    private List<ShiftDetail> _ShiftDetails;
                    public List<ShiftDetail> ShiftDetails
                    {
                        get
                        {
                            return _ShiftDetails;
                        }

                        set
                        {
                            _ShiftDetails = value;
                        }
                    }


                }
            }
        }

        #endregion

        #region UI Data

        public class UI
        {
            public static class Instance
            {
                private static Menu _MenuInstance;
                public static Menu MenuInstance
                {
                    get
                    {
                        if (_MenuInstance == null)
                        {
                            _MenuInstance = new Menu();
                        }
                        return _MenuInstance;
                    }

                    set
                    {

                        _MenuInstance = value;
                    }
                }


                private static Shift _ShiftInstance;
                public static Shift ShiftInstance
                {
                    get
                    {
                        if (_ShiftInstance == null)
                        {
                            _ShiftInstance = new Shift();
                        }
                        return _ShiftInstance;
                    }

                    set
                    {

                        _ShiftInstance = value;
                    }
                }

            }

            public class Menu : INotifyPropertyChanged
            {
                #region INotifyPropertyChanged メンバ

                public event PropertyChangedEventHandler PropertyChanged;
                protected void FirePropertyChanged(string propertyName)
                {
                    if (this.PropertyChanged != null)
                    {
                        PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
                    }
                }

                #endregion
            }

            public class Shift : INotifyPropertyChanged
            {
                #region INotifyPropertyChanged メンバ

                public event PropertyChangedEventHandler PropertyChanged;
                public void FirePropertyChanged(string propertyName)
                {
                    if (this.PropertyChanged != null)
                    {
                        PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
                    }
                }

                #endregion

                #region コンストラクタ
                public Shift()
                {
                    SelectedDate = DateTime.Now;
                }

                #endregion

                #region フィールド
                //TODO:データベースへ移行
                public readonly List<string> IntermissionListBoxItemSource = new List<string>() { "－", "-0.5", "-1.0", "-1.5", "-2.0" };
                public readonly List<string> WorkingTimeListBoxItemSource = new List<string>() { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23" };

                #endregion

                #region プロパティ
                /// <summary>
                /// 選択日付
                /// </summary>
                private DateTime? _SelectedDate;
                public DateTime? SelectedDate
                {
                    get
                    {
                        return _SelectedDate;
                    }

                    set
                    {
                        int DisplaySpan = 7; //シフト表示期間
                        TimeSpan sabun = new TimeSpan();
                        if (_SelectedDate != null && value != null)
                        {
                            sabun = (DateTime)value - (DateTime)_SelectedDate;
                        }

                        _SelectedDate = value;
                        FirePropertyChanged("SelectedDate");

                        if (sabun.TotalDays != 0)
                        {
                            EmployeeShiftDetailList = Data.DB.Instance.SMSystemInstance.GetEmployeeShiftDetailByDateTime((DateTime)value, DisplaySpan);
                        }

                    }
                }

                /// <summary>
                /// 表示編集用のシフトデータ
                /// </summary>
                private List<DB.SMSystem.EmployeeShiftDetail> _EmployeeShiftDetailList;
                public List<DB.SMSystem.EmployeeShiftDetail> EmployeeShiftDetailList
                {
                    get
                    {
                        if (_EmployeeShiftDetailList == null)
                        {
                            _EmployeeShiftDetailList = DB.Instance.SMSystemInstance.GetEmployeeShiftDetailByDateTime((DateTime)UI.Instance.ShiftInstance.SelectedDate, 7);
                        }


                        return _EmployeeShiftDetailList;
                    }

                    set
                    {
                        _EmployeeShiftDetailList = value;
                        FirePropertyChanged("EmployeeShiftDetailList");
                    }

                }

                #endregion

            }
        }

        #endregion

    }
}
