using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using Microsoft.WindowsAPICodePack.Dialogs;
using SMSViewModel.UI.Windows;
using System.Windows;

namespace SMSView.UI.Windows
{
    public static class MenuCommands
    {
        /// <summary>
        /// ディレクトリ選択ダイアログ表示
        /// </summary>
        public class ShowWindowCommand : ICommand
        {
            public ShowWindowCommand()
            {
            }

            public bool CanExecute(object parameter)
            {
                return true;
            }

            public  event EventHandler CanExecuteChanged
            {
                add { CommandManager.RequerySuggested += value; }
                remove { CommandManager.RequerySuggested += value; }
            }

            public void Execute(object parameter)
            {
                if (parameter is Type == false)
                {
                    return;
                }

                Type type = parameter as Type;
                var win = SingletonWindowsManager.GetorMakeWindow<BaseWindow>(type);
                win.Show();

                ////メニューは最小化
                //var menu = SingletonWindowsManager.GetorMakeWindow<Menu>(typeof(Menu));
                //menu.WindowState = WindowState.Minimized;

            }


        }

        /// <summary>
        /// 画面を閉じる
        /// </summary>
        public class CloseCommand : ICommand
        {
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

                if (parameter is Menu == false)
                {
                    return;
                }

                var win = parameter as Menu;

                if (MessageBox.Show("プログラムを終了しますか？", "保存", MessageBoxButton.OKCancel, MessageBoxImage.Question, MessageBoxResult.OK) == MessageBoxResult.OK)
                {
                    win.Close();

                }
                else
                {
                    return;
                }

            }
        }


        /// <summary>
        /// 画面を最小化
        /// </summary>
        public class MinimizeWindowCommand : ICommand
        {
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

                if (parameter is Menu == false)
                {
                    return;
                }

                var win = parameter as Menu;

                win.WindowState = WindowState.Minimized;

            }
        }

        /// <summary>
        /// 画面を最大化
        /// </summary>
        public class MaximizeWindowCommand : ICommand
        {
            public bool CanExecute(object parameter)
            {
                return false;
            }

            public event EventHandler CanExecuteChanged
            {
                add { CommandManager.RequerySuggested += value; }
                remove { CommandManager.RequerySuggested += value; }
            }

            public void Execute(object parameter)
            {

                if (parameter is Menu == false)
                {
                    return;
                }

                return;

            }
        }


        /// <summary>
        /// 画面をアクティブにする
        /// </summary>
        public class ActivateWindowCommand : ICommand
        {
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

                if (parameter is Menu == false)
                {
                    return;
                }

                var win = parameter as Menu;

                win.WindowState = WindowState.Normal;
                win.Activate();


            }
        }

    }
}
