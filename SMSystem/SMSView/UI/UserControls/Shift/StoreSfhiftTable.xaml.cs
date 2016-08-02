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
