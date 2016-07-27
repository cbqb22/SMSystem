using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using SMSModel.DB.SMSystem;
using System.ComponentModel;

namespace SMSViewModel.DataInstance
{
    public class Data
    {


        //クラスライブラリからEntityFrameworkを使う為に一度参照しておく
        static Data()
        {
            var sps = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
        }


        public static class DB
        {
            public static class SMSystem<T> where T : class
            {
                public static List<T> Instance
                {
                    get
                    {

                        try
                        {

                            var sps = System.Data.Entity.SqlServer.SqlProviderServices.Instance;
                            using (var instance = new SMSystemEntities())
                            {
                                var i = instance.Set<T>().ToList();

                                return i;


                            }
                        }
                        catch (Exception ex)
                        {
                            throw ex;
                        }



                        //if (_Instance == null)
                        //{


                        //    //仮のデータを挿入
                        //    //using (_Instance = new SMSystemEntities())
                        //    //{


                        //    //    _Instance.Configuration.AutoDetectChangesEnabled = false;
                        //    //    int id = 1;
                        //    //    int statudId = 1;
                        //    //    int territoryId = 1;
                        //    //    Employee ee = new Employee() {ID= id++, 姓= "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "",住所 = "", 備考 = "",削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "",携帯電話番号 = "",生年月日 = new DateTime(1982,9,30), 登録日時 = DateTime.Now, 自宅電話番号 = "",郵便番号 = "214-0014"};
                        //    //    _Instance.Employees.Add(ee);
                        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                        //    //    _Instance.Employees.Add(ee);
                        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                        //    //    _Instance.Employees.Add(ee);
                        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                        //    //    _Instance.Employees.Add(ee);
                        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                        //    //    _Instance.Employees.Add(ee);
                        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                        //    //    _Instance.Employees.Add(ee);
                        //    //    ee = new Employee() { ID = id++, 姓 = "三上", 名 = "雅史", 性別 = false, Shifts = null, Status = null, StatusID = statudId++, Territory = null, TerritoryID = territoryId++, Eメールアドレス = "", ホームページ = "", 住所 = "", 備考 = "", 削除フラグ = false, 外国人フラグ = false, 携帯メールアドレス = "", 携帯電話番号 = "", 生年月日 = new DateTime(1982, 9, 30), 登録日時 = DateTime.Now, 自宅電話番号 = "", 郵便番号 = "214-0014" };
                        //    //    _Instance.Employees.Add(ee);

                        //    //}
                        //}

                        //return _Instance;
                    }

                    //set
                    //{
                    //    _Instance = value;
                    //}
                }
            }
        }

        /// <summary>
        /// TODO:データベースに移行
        /// </summary>
        public static class DropDownListData
        {
            public static readonly List<string> WorkingTimeListBoxItemSource = new List<string>() { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23" };
            public static readonly List<string> IntermissionListBoxItemSource = new List<string>() { "－", "-0.5", "-1.0", "-1.5", "-2.0" };
            public static List<Employee> GetPersonNameListBoxItemSourceByStoreName(string StoreName)
            {


                List<Employee> result = null;
                try
                {
                    using (var context = new SMSystemEntities())
                    {
                        result = context.Employees.Where(x => x.ShopID == x.Shop.ID && x.Shop.店舗名 == StoreName).ToList();

                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }

                return result;


            }



            public static dynamic GetIndividualShift(string StoreName, DateTime startTime, DateTime endTime)
            {


                try
                {
                    using (var context = new SMSystemEntities())
                    {
                        var query =
                                (from x in context.Employees
                                 join y in context.Shifts
                                 on
                                    x.ID equals y.EmployeeID 
                                 join z in context.ShiftDetails 
                                 on
                                    y.ID equals z.ShiftID into sd
                                    
                                 select new  
                                 {
                                     Employee = x,
                                     ShiftDetail = sd
                                     //姓 = x.姓,
                                     //名 = x.名,
                                     //店舗名 = x.Shop.店舗名,
                                     //役職 = x.Status.役職名,
                                     //シフト = z,

                                 });

                        return query;

                        //var ent = context.Shifts.Where(x => x.EmployeeID == x.Employee.ID).ToList();
                        //x.ShiftDetails.Where(y => startTime <= y.WorkingDate && y.WorkingDate <= endTime)                        )
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }



            }

        }

    }
}
