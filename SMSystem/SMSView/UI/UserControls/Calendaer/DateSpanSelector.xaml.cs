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


namespace SMSView.UI.UserControls.Calendaer
{



    public partial class DateSpanSelector : UserControl, INotifyPropertyChanged
    {
        public DateSpanSelector()
        {
            InitializeComponent();

            this.DataContext = this;
            this.SelectStartDate = DateTime.Now;

        }


        #region コマンド一覧
        public static readonly ICommand WeekUpCommand = new DateSpanSelectorCommands.WeekUpCommand();
        public static readonly ICommand WeekDownCommand = new DateSpanSelectorCommands.WeekDownCommand();
        public static readonly ICommand MonthUpCommand = new DateSpanSelectorCommands.MonthUpCommand();
        public static readonly ICommand MonthDownCommand = new DateSpanSelectorCommands.MonthDownCommand();
        #endregion


        public event PropertyChangedEventHandler PropertyChanged;


        private DateTime _SelectStartDate;

        public DateTime SelectStartDate
        {
            get { return _SelectStartDate; }
            set
            {
                _SelectStartDate = value;
                OnPropertyChanged("SelectStartDate");
            }
        }


        // Create the OnPropertyChanged method to raise the event
        protected void OnPropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }


    }
}
