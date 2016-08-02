using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
using System.Windows.Controls.Primitives;
using SMSView.UI.UserControls.Calendaer;


namespace SMSView.UI.CustomControls
{
    /// <summary>
    /// 入力用のカスタムコンボボックスのベースクラス
    /// </summary>
    public abstract class InputComboBoxBase : Control, INotifyPropertyChanged
    {


        static InputComboBoxBase()
        {
            DefaultStyleKeyProperty.OverrideMetadata(typeof(InputComboBoxBase), new FrameworkPropertyMetadata(typeof(InputComboBoxBase)));


        }



        #region Value 依存関係プロパティ


        public static readonly DependencyProperty CanvasWidthProperty = DependencyProperty.Register("CanvasWidth", typeof(double), typeof(InputComboBoxBase));

        public double CanvasWidth
        {
            get { return (double)this.GetValue(CanvasWidthProperty); }
            set { this.SetValue(CanvasWidthProperty, value); }
        }


        public static readonly DependencyProperty CanvasHeightProperty = DependencyProperty.Register("CanvasHeight", typeof(double), typeof(InputComboBoxBase));

        public double CanvasHeight
        {
            get { return (double)this.GetValue(CanvasHeightProperty); }
            set { this.SetValue(CanvasHeightProperty, value); }
        }

        public static readonly DependencyProperty TextBoxWidthProperty = DependencyProperty.Register("TextBoxWidth", typeof(double), typeof(InputComboBoxBase));

        public double TextBoxWidth
        {
            get { return (double)this.GetValue(TextBoxWidthProperty); }
            set { this.SetValue(TextBoxWidthProperty, value); }
        }


        public static readonly DependencyProperty TextBoxHeightProperty = DependencyProperty.Register("TextBoxHeight", typeof(double), typeof(InputComboBoxBase));

        public double TextBoxHeight
        {
            get { return (double)this.GetValue(TextBoxHeightProperty); }
            set { this.SetValue(TextBoxHeightProperty, value); }
        }

        //public static readonly DependencyProperty ListBoxWidthProperty = DependencyProperty.Register("ListBoxWidth", typeof(double), typeof(InputComboBoxBase), new PropertyMetadata(80));

        //public double ListBoxWidth
        //{
        //    get { return (double)this.GetValue(ListBoxWidthProperty); }
        //    set { this.SetValue(ListBoxWidthProperty, value); }
        //}


        public static readonly DependencyProperty ListBoxHeightProperty = DependencyProperty.Register("ListBoxHeight", typeof(double), typeof(InputComboBoxBase), new PropertyMetadata(160d));

        public double ListBoxHeight
        {
            get { return (double)this.GetValue(ListBoxHeightProperty); }
            set { this.SetValue(ListBoxHeightProperty, value); }
        }


        /// <summary>
        /// 編集可能か
        /// </summary>
        public static readonly DependencyProperty CanEditableProperty = DependencyProperty.Register("CanEditable", typeof(bool), typeof(InputComboBoxBase), new PropertyMetadata(true));

        public bool CanEditable
        {
            get { return (bool)this.GetValue(CanEditableProperty); }
            set { this.SetValue(CanEditableProperty, value); }
        }


        /// <summary>
        /// 修正したか
        /// </summary>
        public static readonly DependencyProperty IsModifiedProperty = DependencyProperty.Register("IsModified", typeof(bool), typeof(InputComboBoxBase), new PropertyMetadata(true));

        public bool IsModified
        {
            get { return (bool)this.GetValue(IsModifiedProperty); }
            set { this.SetValue(IsModifiedProperty, value); }
        }


        /// <summary>
        /// SlashLineVisibility
        /// </summary>
        public static readonly DependencyProperty SlashLineVisibilityProperty = DependencyProperty.Register("SlashLineVisibility", typeof(Visibility), typeof(InputComboBoxBase), new PropertyMetadata(Visibility.Collapsed));

        public Visibility SlashLineVisibility
        {
            get { return (Visibility)this.GetValue(SlashLineVisibilityProperty); }
            set { this.SetValue(SlashLineVisibilityProperty, value); }
        }


        /// <summary>
        /// BackSlashLineVisibility
        /// </summary>
        public static readonly DependencyProperty BackSlashLineVisibilityProperty = DependencyProperty.Register("BackSlashLineVisibility", typeof(Visibility), typeof(InputComboBoxBase), new PropertyMetadata(Visibility.Collapsed));

        public Visibility BackSlashLineVisibility
        {
            get { return (Visibility)this.GetValue(BackSlashLineVisibilityProperty); }
            set { this.SetValue(BackSlashLineVisibilityProperty, value); }
        }



        /// <summary>
        /// 表示用文字列
        /// /// </summary>
        public static readonly DependencyProperty 表示用文字列Property = DependencyProperty.Register("表示用文字列", typeof(string), typeof(InputComboBoxBase), new PropertyMetadata(""));

        public string 表示用文字列
        {
            get
            {
                return (string)this.GetValue(表示用文字列Property);
            }
            set
            {
                this.SetValue(表示用文字列Property, value);
            }
        }



        /// <summary>
        /// 表示用文字列Color
        /// デフォルトは黒
        /// /// </summary>
        public static readonly DependencyProperty 表示用文字列ColorProperty = DependencyProperty.Register("表示用文字列Color", typeof(SolidColorBrush), typeof(InputComboBoxBase), new PropertyMetadata(new SolidColorBrush(Colors.Black)));

        public SolidColorBrush 表示用文字列Color
        {
            get { return (SolidColorBrush)this.GetValue(表示用文字列ColorProperty); }
            set { this.SetValue(表示用文字列ColorProperty, value); }
        }




        #endregion

        #region コントロールするアイテム

        private Border border;
        public Border Border
        {
            get
            {
                return border;
            }

            set
            {
                border = value;
            }
        }


        private TextBox textBox;

        public TextBox TextBox
        {
            get { return textBox; }
            set { textBox = value; }
        }

        private Button button;

        public Button Button
        {
            get { return button; }
            set { button = value; }
        }

        private ListBox listbox;

        public ListBox Listbox
        {
            get { return listbox; }
            set { listbox = value; }
        }


        private Popup popup;
        public Popup Popup
        {
            get
            {
                return popup;
            }

            set
            {
                popup = value;
            }
        }


        #endregion
        #region 汎用プロパティ








        /// <summary>
        /// リストボックスのアイテムソース
        /// </summary>
        private List<string> _ListBoxItemSource;
        public List<string> ListBoxItemSource
        {
            get
            {
                return _ListBoxItemSource;
            }

            set
            {
                _ListBoxItemSource = value;
                FirePropertyChanged("ListBoxItemSource");
            }
        }



        // ListBoxを表示しているかどうか
        private bool _IsListBoxDisplay;

        public bool IsListBoxDisplay
        {
            get { return _IsListBoxDisplay; }
            set
            {
                _IsListBoxDisplay = value;
                FirePropertyChanged("IsListBoxDisplay");
            }
        }


        // 一回目にフォーカスを得た時
        private bool _IsFirstFocus;

        public bool IsFirstFocus
        {
            get { return _IsFirstFocus; }
            set
            {
                _IsFirstFocus = value;
                FirePropertyChanged("IsFirstFocus");
            }
        }

        private bool _IsKeyboardFocus;

        public bool IsKeyboardFocus
        {
            get { return _IsKeyboardFocus; }
            set
            {
                _IsKeyboardFocus = value;
                FirePropertyChanged("IsKeyboardFocus");
                //System.Windows.Controls.Primitives.Popup p;
            }
        }

        private bool _IsCellModified;
        public bool IsCellModified
        {
            get
            {
                return _IsCellModified;
            }

            set
            {
                _IsCellModified = value;
                FirePropertyChanged("IsCellModified");

            }
        }



        /// <summary>
        /// ベースとなるテキストボックスの幅
        /// </summary>
        private double _TextBoxBaseWidth;


        #endregion

        #region 最低限の動作に必要な実装

        public virtual void InputComboboxBase_GotFocus(object sender, RoutedEventArgs e)
        {
            if (!this.IsFirstFocus)
            {
                this.IsFirstFocus = true;
                this.button.Visibility = System.Windows.Visibility.Visible;
                this.TextBoxWidth = _TextBoxBaseWidth - 17d; //ボタンの幅分、つめる
                this.IsKeyboardFocus = true;
                textBox.SelectAll();
            }
        }


        public virtual void InputComboboxBase_LostFocus(object sender, RoutedEventArgs e)
        {
            var s = SMSViewModel.DataInstance.Data.UI.Instance.ShiftInstance.EmployeeShiftDetailList;
            if (this.textBox != null && this.textBox.IsFocused)
            {
                return;
            }

            if (this.button != null && this.button.IsFocused)
            {
                return;
            }

            if (this.listbox != null && this.listbox.IsFocused)
            {
                return;
            }


            this.button.Visibility = System.Windows.Visibility.Collapsed;
            this.listbox.Visibility = System.Windows.Visibility.Collapsed;

            this.IsFirstFocus = false;
            this.IsKeyboardFocus = false;
            this.IsListBoxDisplay = false;

            this.TextBoxWidth = _TextBoxBaseWidth;　//つめる分をもどす

        }


        public virtual void listbox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var lb = sender as ListBox;
            if (lb == null)
            {
                return;
            }
            //this.表示用文字列 = lb.SelectedItems[lb.SelectedIndex].ToString();

            if(lb.SelectedItem == null)
            {
                return;
            }

            this.表示用文字列 = lb.SelectedItem.ToString();
            this.IsListBoxDisplay = false;
            this.textBox.Focus();
            this.textBox.SelectAll();
            IsModified = true;
            IsCellModified = true;
        }

        public virtual void button_Click(object sender, RoutedEventArgs e)
        {
            if (this.IsListBoxDisplay)
            {
                this.popup.IsOpen = false;
                this.IsListBoxDisplay = false;
                this.listbox.Visibility = System.Windows.Visibility.Collapsed;

            }
            else
            {
                this.popup.IsOpen = true;
                this.IsListBoxDisplay = true;
                this.listbox.Visibility = System.Windows.Visibility.Visible;
            }
        }

        //public virtual void TextBox_GotFocus(object sender, RoutedEventArgs e)
        //{
        //    if (!textBox.IsFocused)
        //    {
        //        textBox.Focus();
        //    }
        //    textBox.SelectAll();
        //}


        #endregion
        #region 子クラスで実装するもの

        public abstract void textBox_Loaded(object sender, RoutedEventArgs e);

        public abstract void listbox_LostFocus(object sender, RoutedEventArgs e);

        public abstract void listbox_GotFocus(object sender, RoutedEventArgs e);

        public abstract void Popup_Loaded(object sender, RoutedEventArgs e);

        #endregion




        #region OnApplyTemplate

        /// <summary>
        /// 各コントロールのテンプレートの実装
        /// </summary>
        public override void OnApplyTemplate()
        {
            base.OnApplyTemplate();

            this.LostFocus += new RoutedEventHandler(InputComboboxBase_LostFocus);
            this.GotFocus += new RoutedEventHandler(InputComboboxBase_GotFocus);

            button = (Button)GetTemplateChild("button");
            button.DataContext = this;
            button.Click += new RoutedEventHandler(button_Click);


            listbox = (ListBox)GetTemplateChild("listbox");
            listbox.DataContext = this;
            listbox.SelectionChanged += new SelectionChangedEventHandler(listbox_SelectionChanged);
            listbox.GotFocus += new RoutedEventHandler(listbox_GotFocus);
            listbox.LostFocus += new RoutedEventHandler(listbox_LostFocus);


            textBox = (TextBox)GetTemplateChild("textbox");
            textBox.DataContext = this;
            textBox.Loaded += new RoutedEventHandler(textBox_Loaded);
            textBox.LostFocus += TextBox_LostFocus;

            border = (Border)GetTemplateChild("border");
            border.DataContext = this;

            popup = (Popup)GetTemplateChild("popup");
            popup.DataContext = this;
            popup.Loaded += new RoutedEventHandler(Popup_Loaded);



            this.textBox.Visibility = Visibility.Visible;
            this.listbox.Visibility = System.Windows.Visibility.Collapsed;
            this.button.Visibility = System.Windows.Visibility.Collapsed;
            this.IsCellModified = false;

            _TextBoxBaseWidth = TextBoxWidth;


        }


        /// <summary>
        /// TextBoxのUpdateSourceTriggerはLostFocus時に走るため、
        /// LostFocus時に変更がソースと入力データに加えられたかチェック
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void TextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            var tb = sender as TextBox;
            if(tb == null)
            {
                return;
            }

            if(tb.Text != this.表示用文字列)
            {
                IsModified = true;
                IsCellModified = true;
            }
        }



        #endregion



        #region INotifyPropertyChangedの実装

        public event PropertyChangedEventHandler PropertyChanged;

        // Create the OnPropertyChanged method to raise the event
        protected void FirePropertyChanged(string name)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(name));
            }
        }

        #endregion 



    }
}
