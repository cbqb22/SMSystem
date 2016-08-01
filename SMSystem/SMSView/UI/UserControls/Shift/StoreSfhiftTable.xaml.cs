using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using SMSViewModel.DataInstance;
using SMSModel.DB.SMSystem;
using SMSViewModel.Common.VisualTreeHelperEx;

namespace SMSView.UI.UserControls.Shift
{
    /// <summary>
    /// StoreSfhiftTable.xaml の相互作用ロジック
    /// </summary>
    public partial class StoreSfhiftTable : UserControl
    {
        #region コンストラクタ
        public StoreSfhiftTable()
        {
            InitializeComponent();

            Init();
        }

        #endregion
        #region クラスメソッド

        /// <summary>
        /// 初期データをセット
        /// </summary>
        private void Init()
        {
            //try
            //{
            //    int addDays = 7;
            //    var query =
            //     (from x in Data.DB.SMSystem.EmployeeCashData
            //      join y in Data.DB.SMSystem.EmployeeCashData.SelectMany(x => x.Shifts)
            //      on
            //         x.ID equals y.EmployeeID
            //      join z in Data.DB.SMSystem.EmployeeCashData.SelectMany(x => x.Shifts).SelectMany(x => x.ShiftDetails).Where(x => DateTime.Now <= x.WorkingDate && x.WorkingDate < DateTime.Now.AddDays(addDays))
            //      on
            //         y.ID equals z.ShiftID into sd

            //      select new
            //      {
            //          Employee = x,
            //          ShiftDetail = sd.ToList()
            //      });


            //    var list = query.ToList();

            //    this.DataContext = list;
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show(ex.Message + ex.StackTrace);
            //    throw ex;
            //}


        }

        #endregion 
        #region イベント
        private void IndividualColumnCells_GotFocus(object sender, RoutedEventArgs e)
        {
            var icc = sender as IndividualColumnCells;
            if (icc == null)
            {
                return;
            }

            icc.BorderBrush = new SolidColorBrush(Colors.Red);

        }

        private void IndividualColumnCells_LostFocus(object sender, RoutedEventArgs e)
        {
            var icc = sender as IndividualColumnCells;
            if (icc == null)
            {
                return;
            }

            icc.BorderBrush = new SolidColorBrush(Colors.Black);

        }

        #endregion
    }
}
