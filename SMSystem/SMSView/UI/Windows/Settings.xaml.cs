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
using System.Windows.Shapes;
using SMSViewModel.UI.Windows;

namespace SMSView.UI.Windows
{
    /// <summary>
    /// Settings.xaml の相互作用ロジック
    /// </summary>
    public partial class Settings : BaseWindow
    {
        #region コンストラクタ

        public Settings()
        {
            InitializeComponent();

            LoadCommand.Execute(this);

        }

        #endregion

        #region コマンド一覧
        public static readonly ICommand SelectDirectoryCommand = new SettingsCommands.SelectDirectoryCommand();
        public static readonly ICommand SaveCommand = new SettingsCommands.SaveCommand();
        public static readonly ICommand LoadCommand = new SettingsCommands.LoadCommand();
        public static readonly ICommand CloseCommand = new SettingsCommands.CloseCommand();
        #endregion

        #region イベント
        #endregion

    }
}
