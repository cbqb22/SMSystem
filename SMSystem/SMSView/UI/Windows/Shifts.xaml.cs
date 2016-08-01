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
using SMSViewModel.DataInstance;

namespace SMSView.UI.Windows
{
    /// <summary>
    /// Shifts.xaml の相互作用ロジック
    /// </summary>
    public partial class Shifts : BaseWindow
    {

        #region コンストラクタ
        public Shifts()
        {
            InitializeComponent();

            this.DataContext = Data.UI.Instance.ShiftInstance;
        }

        #endregion

        #region コマンド一覧
        public static readonly ICommand ShowWindowCommand = new ShiftsCommands.ShowWindowCommand();
        public static readonly ICommand CloseCommand = new ShiftsCommands.CloseCommand();
        public static readonly ICommand MinimizeWindowCommand = new ShiftsCommands.MinimizeWindowCommand();
        public static readonly ICommand MaximizeWindowCommand = new ShiftsCommands.MaximizeWindowCommand();
        public static readonly ICommand ActivateWindowCommand = new ShiftsCommands.ActivateWindowCommand();
        #endregion

        #region イベント

        private void GridOperationButtons_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

            //マウスボタン押下状態でなければ何もしない
            if (e.ButtonState != MouseButtonState.Pressed) return;

            this.DragMove();


        }

        #endregion 
    }
}
