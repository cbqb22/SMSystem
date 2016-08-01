﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using SMSModel.DB.SMSystem;
using System.ComponentModel;
using System.Data.Entity;

namespace SMSViewModel.DataInstance
{
    /// <summary>
    /// シングルトンでデータを返すルートクラス
    /// </summary>
    public class Data
    {

        #region staticイニシャライザ
        static Data()
        {
            //お約束
            //クラスライブラリからEntityFrameworkを使う為に参照しておく
            var sps = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
        }

        #endregion

        #region データベース
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
                    this.Load();

                    //不足Rowを挿入

                }

                /// <summary>
                /// 従業員リスト
                /// </summary>
                private List<Employee> _EmployeeCashData;
                public List<Employee> EmployeeCashData
                {
                    get
                    {
                        if (_EmployeeCashData == null)
                        {
                            Load<Employee>();

                        }
                        return _EmployeeCashData;
                    }

                    set
                    {
                        _EmployeeCashData = value;
                        FirePropertyChanged("EmployeeCashData");
                    }
                }


                public List<EmployeeShiftDetail> EmployeeShiftDetailsFor7Days
                {
                    get
                    {
                        if (_EmployeeCashData == null)
                        {
                            Load<Employee>();

                            
                        }

                        return GetEmployeeShiftByDateTime((DateTime)UI.Instance.ShiftInstance.SelectedDate, 7);

                    }
                }


                /// <summary>
                /// 指定のタイプのリストをロード
                /// </summary>
                /// <param name="type"></param>
                public void Load<T>() where T : class
                {
                    //var aa = context.Employees.Include("Shifts.ShiftDetails").Include("Shop").Include("Status").Include("Territory").ToList();
                    try
                    {
                        using (var context = new SMSystemEntities())
                        {
                            _EmployeeCashData = context.Employees.Include(p => p.ShiftDetails).Include(p => p.Shop).Include(p => p.Territory).Include("ShiftDetails.Shop").ToList();

                            //System.Diagnostics.Debug.WriteLine("------------ログ開始--------------");
                            //context.Database.Log = (sql) => { System.Diagnostics.Debug.Write(sql); };   //SQLを出す

                            DateTime startDate = new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day).AddDays(-1);
                            DateTime endDate = startDate.AddDays(2);

                            if (typeof(T) == typeof(Employee))
                            {
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

                                    foreach(var emp in employee)
                                    {
                                        var checkData = shiftdetals.Where(x => x.EmployeeID == emp.ID && x.WorkingDate == d);
                                        if(checkData.Count() == 0)
                                        {
                                            //TODO DutyCategoryID,StartTimeなどををnull許可する
                                            ShiftDetail sd = new ShiftDetail() { EmployeeID = emp.ID, ShopID = emp.ShopID, DutyCategoryID = 1, IsHoliday = false, WorkingDate = d, StartTime = "-", EndTime = "-", Intermission1 = "-", Intermission2 = "-", TravelTime1 = "-", TravelTime2 = "-", IsHelpStaff = false, 登録日時 = DateTime.Now, 備考= "-",削除フラグ = false };

                                            shiftdetals.Add(sd);

                                        }
                                    }
                                 
                                       

                                    ////EmployeeIDごとにグループ化
                                    //foreach (var group in query.GroupBy(x => x.Employee))
                                    //{
                                    //    bool find = false;
                                    //    foreach (var row in group)
                                    //    {
                                    //        if (row.WorkingDate == d)
                                    //        {
                                    //            find = true;
                                    //            break;
                                    //        }
                                    //    }

                                    //    if (find)
                                    //    {
                                    //        continue;
                                    //    }


                                    //    //TODO DutyCategoryID,StartTimeなどををnull許可する
                                    //    ShiftDetail sd = new ShiftDetail() { EmployeeID = group.Key.ID, ShopID = group.Key.ShopID, DutyCategoryID = 1, IsHoliday = false, WorkingDate = d, StartTime = "-", EndTime = "-", Intermission1 = "-", Intermission2 = "-", TravelTime1 = "-", TravelTime2 = "-", IsHelpStaff = false, 登録日時 = DateTime.Now };

                                    //    shiftdetals.Add(sd);

                                    //}



                                }




                            }

                            context.SaveChanges();

                        }
                    }catch(Exception ex)
                    {
                        System.Diagnostics.Debug.WriteLine(ex.Message + ex.StackTrace);
                    }
                }

                /// <summary>
                /// 必要なキャッシュデータをロードする
                /// </summary>
                public void Load()
                {
                    Load<Employee>();
                    //Load<ShiftDetail>();
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
                public List<EmployeeShiftDetail> GetEmployeeShiftByDateTime(DateTime datetime,int days)
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
                          ShiftDetails = sd.ToList()
                      });


                    return query.ToList();

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

                    private List<ShiftDetail> _ShiftDetails;

                }

                //public static List<T> Instance
                //{
                //    get
                //    {

                //        try
                //        {

                //            var sps = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
                //            using (var instance = new SMSystemEntities())
                //            {

                //                var l = instance.Employees.Local;
                //                var i = instance.Set<T>().ToList();

                //                return i;


                //            }
                //        }
                //        catch (Exception ex)
                //        {
                //            throw ex;
                //        }



                //        //if (_Instance == null)
                //        //{


                //        //    //仮のデータを挿入
                //        //    //using (_Instance = new SMSystemEntities())
                //        //    //{


                //        //    //    _Instance.Configuration.AutoDetectChangesEnabled = false;
                //        //    //    int id = 1;
                //        //    //    int statudId = 1;
                //        //    //    int territoryId = 1;
                //        //    //    Employee ee = new Employee() {ID= id++, 姓= "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "",住所 = "", 備考 = "",削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "",携帯電話番号 = "",生年月日 = new DateTime(1982,9,30), 登録日時 = DateTime.Now, 自宅電話番号 = "",郵便番号 = "214-0014"};
                //        //    //    _Instance.Employees.Add(ee);
                //        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                //        //    //    _Instance.Employees.Add(ee);
                //        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                //        //    //    _Instance.Employees.Add(ee);
                //        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                //        //    //    _Instance.Employees.Add(ee);
                //        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                //        //    //    _Instance.Employees.Add(ee);
                //        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                //        //    //    _Instance.Employees.Add(ee);
                //        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                //        //    //    _Instance.Employees.Add(ee);

                //        //    //}

                //        //}

                //        //return _Instance;
                //    }

                //    //set
                //    //{
                //    //    _Instance = value;
                //    //}
                //}
            }
        }

        #endregion

        #region UI用データ
        
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


                public Shift()
                {
                    SelectedDate = DateTime.Now;
                }


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
                        _SelectedDate = value;
                        FirePropertyChanged("SelectedDate");
                    }
                }

                /// <summary>
                /// 表示・編集できるシフトデータ
                /// </summary>


                private List<DB.SMSystem.EmployeeShiftDetail> _EmployeeShiftDetailList;
                public List<DB.SMSystem.EmployeeShiftDetail> EmployeeShiftDetailList
                {
                    get
                    {
                        if(_EmployeeShiftDetailList == null)
                        {
                            _EmployeeShiftDetailList = DB.Instance.SMSystemInstance.GetEmployeeShiftByDateTime((DateTime)UI.Instance.ShiftInstance.SelectedDate, 7);
                        }


                        return _EmployeeShiftDetailList;
                        //return Data.DB.Instance.SMSystemInstance.EmployeeShiftDetailsFor7Days;
                    }

                    set
                    {
                        _EmployeeShiftDetailList = value;
                        FirePropertyChanged("EmployeeShiftDetailList");
                    }

                }

                //TODO:データベースへ移行
                public readonly List<string> IntermissionListBoxItemSource = new List<string>() {"－", "-0.5", "-1.0", "-1.5", "-2.0"};
                public readonly List<string> WorkingTimeListBoxItemSource = new List<string>() {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23" };


            }
        }

        #endregion

    }
}
