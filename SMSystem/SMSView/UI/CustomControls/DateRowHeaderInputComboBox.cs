using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using SMSViewModel.Common;

namespace SMSView.UI.CustomControls
{
    /// <summary>
    /// 開始時間と終了時間を入力するコンボボックス付セル
    /// </summary>
    public class DateRowHeaderInputComboBox : InputComboBoxBase
    {

        //コントロールを上書きする場合はコメントアウト
        //static WorkingTimeInputComboBox()
        //{
        //    DefaultStyleKeyProperty.OverrideMetadata(typeof(WorkingTimeInputComboBox), new FrameworkPropertyMetadata(typeof(WorkingTimeInputComboBox)));
        //}

        public override void listbox_GotFocus(object sender, RoutedEventArgs e)
        {
        }

        public override void listbox_LostFocus(object sender, RoutedEventArgs e)
        {
        }

        public override void textBox_Loaded(object sender, RoutedEventArgs e)
        {
        }

        public override void Popup_Loaded(object sender, RoutedEventArgs e)
        {
        }


        /// <summary>
        /// リストボックスのアイテムソース
        /// </summary>
        private List<string> _ListBoxItemSource;
        public new List<string> ListBoxItemSource
        {
            get
            {
                return _ListBoxItemSource;
            }

            set
            {
                _ListBoxItemSource = value;
            }
        }


        #region OnApplyTemplate

        /// <summary>
        /// 各コントロールのテンプレートの実装
        /// </summary>
        public override void OnApplyTemplate()
        {
            base.OnApplyTemplate();

        }

        #endregion



    }
}
