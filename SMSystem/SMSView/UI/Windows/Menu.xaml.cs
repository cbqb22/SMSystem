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
using System.Windows.Media.Animation;
using SMSViewModel.UI.Windows;
using SMSViewModel.DataInstance;

namespace SMSView.UI.Windows
{
    /// <summary>
    /// Menu.xaml の相互作用ロジック
    /// </summary>
    public partial class Menu : BaseWindow
    {

        #region コンストラクタ
        public Menu()
        {
            InitializeComponent();
        }

        #endregion

        #region コマンド一覧
        public static readonly ICommand ShowWindowCommand = new MenuCommands.ShowWindowCommand();
        public static readonly ICommand CloseCommand = new MenuCommands.CloseCommand();
        public static readonly ICommand MinimizeWindowCommand = new MenuCommands.MinimizeWindowCommand();
        public static readonly ICommand MaximizeWindowCommand = new MenuCommands.MaximizeWindowCommand();
        public static readonly ICommand ActivateWindowCommand = new MenuCommands.ActivateWindowCommand();
        #endregion

        #region イベント
        private void Storyboard_Completed(object sender, EventArgs e)
        {
            Storyboard sb = base.FindResource("TitleColorChange") as Storyboard;
            base.BeginStoryboard(sb);

            var st = base.FindResource("ButtonStyle1") as Style;

            
        }

        private void GridOperationButtons_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

            //マウスボタン押下状態でなければ何もしない
            if (e.ButtonState != MouseButtonState.Pressed) return;

            this.DragMove();


        }

        #endregion





    }
}
