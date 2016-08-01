using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using SMSView.UI.Windows;
using SMSViewModel.UI.Windows;

namespace SMSView
{
    /// <summary>
    /// App.xaml の相互作用ロジック
    /// </summary>
    public partial class App : Application
    {

        public App()
        {

            AppDomain.CurrentDomain.FirstChanceException += CurrentDomain_FirstChanceException;
      

        }

        private void CurrentDomain_FirstChanceException(object sender, System.Runtime.ExceptionServices.FirstChanceExceptionEventArgs e)
        {
//            string errorMember = e.Exception.TargetSite.Name;
//            string errorMessage = e.Exception.Message;
//            string message = string.Format(
//        @"例外が{0}で発生。プログラムは継続します。
//エラーメッセージ：{1}",
//                                      errorMember, errorMessage);
//            MessageBox.Show(message, "FirstChanceException",
//                            MessageBoxButton.OK, MessageBoxImage.Information);


            var desktopFilePath = System.Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory) + "\\SMSytemError.log";
            //MessageBox.Show("予期せぬエラーが発生しました。" + Environment.NewLine + "デスクトップにログを出力します。" + Environment.NewLine + "出力パス:" + desktopFilePath);

            string outputText = string.Format("Message:{0} \r\n StackTrace:{1}", e.Exception.Message, e.Exception.StackTrace);
            string appendText = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + Environment.NewLine + outputText;
            System.IO.File.AppendAllText(desktopFilePath, appendText);


        }

        private void Application_Startup(object sender, StartupEventArgs e)
        {
            var win = SingletonWindowsManager.GetorMakeWindow<Menu>(typeof(Menu));
            win.ShowDialog();

            this.Shutdown();
        }

        private void Application_DispatcherUnhandledException(object sender, System.Windows.Threading.DispatcherUnhandledExceptionEventArgs e)
        {

            var desktopFilePath = System.Environment.GetFolderPath(Environment.SpecialFolder.DesktopDirectory)  + "\\SMSytemError.log";
            MessageBox.Show("予期せぬエラーが発生しました。" + Environment.NewLine + "デスクトップにログを出力します。" + Environment.NewLine + "出力パス:" + desktopFilePath);

            string outputText = string.Format("Message:{0} \r\n StackTrace:{1}",e.Exception.Message  , e.Exception.StackTrace);
            string appendText = DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + Environment.NewLine + outputText;
            System.IO.File.AppendAllText(desktopFilePath, appendText);

            e.Handled = true;
        }

    }
}
