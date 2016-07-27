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

namespace SMSViewModel.UI.Windows
{
    /// <summary>
    /// カスタムウィンドウクラス
    /// 
    /// ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
    /// ※※※※※※                                                  　※※※※※※
    /// ※※※※※※　全てのシングルトンウィンドウはこれを派生すること　※※※※※※
    /// ※※※※※※                                                    ※※※※※※
    /// ※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※※
    /// 
    /// IsClosedの追加とOnClosedのオーバーライド 
    /// </summary>
    public abstract class BaseWindow : Window
    {

        static BaseWindow()
        {
            //Generic.xamlで指定したテンプレートを使う場合は下記のコメントをはずす
            //継承先でコントロールを実装する場合はコメントアウト。

            //DefaultStyleKeyProperty.OverrideMetadata(typeof(BaseWindow), new FrameworkPropertyMetadata(typeof(BaseWindow)));
        }

        /// <summary>
        /// ウィンドウが閉じられたか判定するフラグ
        /// </summary>
        public bool IsClosed;

        /// <summary>
        /// OnClosedをオーバーライドする
        /// </summary>
        /// <param name="e"></param>
        protected override void OnClosed(EventArgs e)
        {
            base.OnClosed(e);
            this.IsClosed = true;
        }



    }
}
