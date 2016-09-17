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
using System.ComponentModel;
using SMSView.UI.UserControls.Calendaer;
using SMSViewModel.DataInstance;
using SMSViewModel.Common.VisualTreeHelperEx;
using SMSView.UI.CustomControls;

namespace SMSView.UI.UserControls.Shift
{
    /// <summary>
    /// ShiftMainFrame.xaml の相互作用ロジック
    /// </summary>
    public partial class ShiftMainFrame : UserControl, INotifyPropertyChanged
    {
        public ShiftMainFrame()
        {
            InitializeComponent();
        }

        #region INotifyPropertyChangedの実装

        public event PropertyChangedEventHandler PropertyChanged;

        // Create the OnPropertyChanged method to raise the event
        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }



        #endregion

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if(MessageBox.Show("シフトの変更箇所を保存します。\r\n\r\n宜しいですか？","保存",MessageBoxButton.YesNo,MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                MessageBox.Show(Data.DB.Instance.SMSystemInstance.SaveShiftToDB(),"更新結果",MessageBoxButton.OK,MessageBoxImage.Information);
                Data.DB.Instance.SMSystemInstance.Load();
                Data.UI.Instance.ShiftInstance.EmployeeShiftDetailList = Data.DB.Instance.SMSystemInstance.GetEmployeeShiftDetailByDateTime((DateTime)Data.UI.Instance.ShiftInstance.SelectedDate, 7);
                Refresh();
            }

        }

        //全てのInputComboBoxをRefresh
        public void Refresh()
        {
            var list = VisualTreeHelperEx.FindUIElements<InputComboBoxBase>(this);

            foreach(var icb in list)
            {
                icb.UpdateLayout();
                //icb.OnApplyTemplate();
                //icb.IsCellModified = false;
            }


        }
    }
}
