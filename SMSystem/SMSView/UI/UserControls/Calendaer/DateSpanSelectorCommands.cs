using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.WindowsAPICodePack.Dialogs;
using SMSViewModel.UI.Windows;
using System.Windows;
using SMSView.UI.UserControls.Calendaer;

namespace SMSView.UI.UserControls.Calendaer
{
    public static class DateSpanSelectorCommands
    {
        /// <summary>
        /// 開始日付を１週間プラス
        /// </summary>
        public class WeekUpCommand : ICommand
        {
            public WeekUpCommand()
            {
            }

            public bool CanExecute(object parameter)
            {
                return true;
            }

            public event EventHandler CanExecuteChanged
            {
                add { CommandManager.RequerySuggested += value; }
                remove { CommandManager.RequerySuggested += value; }
            }

            public void Execute(object parameter)
            {
                if (parameter is DateSpanSelector == false)
                {
                    return;
                }

                var dss = parameter as DateSpanSelector;
                dss.selectDateTextBox.SelectedDate = dss.selectDateTextBox.SelectedDate.AddDays(7);

                //var shift = SingletonWindowsManager.GetorMakeWindow<Windows.Shifts>(typeof(Windows.Shifts));
                //shift.DataContext = null;
                //shift.DataContext = SMSViewModel.DataInstance.Data.UI.Instance.ShiftInstance;
                //shift.UpdateLayout();
            }


        }

        /// <summary>
        /// 開始日付を１週間マイナス
        /// </summary>
        public class WeekDownCommand : ICommand
        {
            public WeekDownCommand()
            {
            }

            public bool CanExecute(object parameter)
            {
                return true;
            }

            public event EventHandler CanExecuteChanged
            {
                add { CommandManager.RequerySuggested += value; }
                remove { CommandManager.RequerySuggested += value; }
            }

            public void Execute(object parameter)
            {
                if (parameter is DateSpanSelector == false)
                {
                    return;
                }

                var dss = parameter as DateSpanSelector;
                dss.selectDateTextBox.SelectedDate = dss.selectDateTextBox.SelectedDate.AddDays(-7);

                //dss.SelectStartDate = ((DateTime)dss.SelectStartDate).AddDays(-7);
            }


        }

        /// <summary>
        /// 開始日付を1ヶ月プラス
        /// </summary>
        public class MonthUpCommand : ICommand
        {
            public MonthUpCommand()
            {
            }

            public bool CanExecute(object parameter)
            {
                return true;
            }

            public event EventHandler CanExecuteChanged
            {
                add { CommandManager.RequerySuggested += value; }
                remove { CommandManager.RequerySuggested += value; }
            }

            public void Execute(object parameter)
            {
                if (parameter is DateSpanSelector == false)
                {
                    return;
                }

                var dss = parameter as DateSpanSelector;
                dss.selectDateTextBox.SelectedDate = dss.selectDateTextBox.SelectedDate.AddMonths(1);
                //dss.SelectStartDate = ((DateTime)dss.SelectStartDate).AddMonths(1);
            }


        }

        /// <summary>
        /// 開始日付を１ヶ月マイナス
        /// </summary>
        public class MonthDownCommand : ICommand
        {
            public MonthDownCommand()
            {
            }

            public bool CanExecute(object parameter)
            {
                return true;
            }

            public event EventHandler CanExecuteChanged
            {
                add { CommandManager.RequerySuggested += value; }
                remove { CommandManager.RequerySuggested += value; }
            }

            public void Execute(object parameter)
            {
                if (parameter is DateSpanSelector == false)
                {
                    return;
                }

                var dss = parameter as DateSpanSelector;
                dss.selectDateTextBox.SelectedDate = dss.selectDateTextBox.SelectedDate.AddMonths(-1);
                //dss.SelectStartDate = ((DateTime)dss.SelectStartDate).AddMonths(-1);
            }


        }

    }
}
