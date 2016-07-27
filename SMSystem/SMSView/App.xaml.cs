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
        private void Application_Startup(object sender, StartupEventArgs e)
        {
            var win = SingletonWindowsManager.GetorMakeWindow<Menu>(typeof(Menu));
            win.ShowDialog();

            this.Shutdown();
        }
    }
}
