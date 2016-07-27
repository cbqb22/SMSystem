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
            Selector = this.datespanselector;
        }

        private DateSpanSelector _Selector;
        public DateSpanSelector Selector
        {
            get
            {
                return _Selector;
            }

            set
            {
                _Selector = value;
            }
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



    }
}
