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

namespace SMSView.UI.UserControls.Shift
{
    /// <summary>
    /// IndividualColumnCells.xaml の相互作用ロジック
    /// </summary>
    public partial class IndividualColumnCells : UserControl
    {
        public IndividualColumnCells()
        {
            InitializeComponent();
        }

        private void Border_GotFocus(object sender, RoutedEventArgs e)
        {
            var border = sender as Border;
            if(border == null)
            {
                return;
            }

            border.BorderBrush = new SolidColorBrush(Colors.Green);
        }

        private void Border_LostFocus(object sender, RoutedEventArgs e)
        {
            var border = sender as Border;
            if (border == null)
            {
                return;
            }

            border.BorderBrush = new SolidColorBrush(Colors.Gray);

        }
    }
}
