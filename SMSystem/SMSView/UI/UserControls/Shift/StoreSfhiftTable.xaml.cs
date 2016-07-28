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
        public StoreSfhiftTable()
        {
            InitializeComponent();

            this.Loaded += StoreSfhiftTable_Loaded;
        }

        private void StoreSfhiftTable_Loaded(object sender, RoutedEventArgs e)
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
                             join z2 in context.ShiftDetails
                             on
                                y.ID equals z2.ShiftID
                             where
                                z2.WorkingDate == new DateTime(2016,08,01)
                             select new
                             {
                                 Employee = x,
                                 ShiftDetail = sd.ToList()
                                     //姓 = x.姓,
                                     //名 = x.名,
                                     //店舗名 = x.Shop.店舗名,
                                     //役職 = x.Status.役職名,
                                     //シフト = z,

                                 }).ToList();

                    var list = query.ToList();

                    this.DataContext = list;

                    //this.indi.DataContext = list[0];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }



        }

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
    }
}
