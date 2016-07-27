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
    public static class SettingsCommands
    {
        /// <summary>
        /// ディレクトリ選択ダイアログ表示
        /// </summary>
        public class SelectDirectoryCommand : ICommand
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
                if (parameter is System.Windows.Controls.TextBox == false)
                {
                    return;
                }

                var textbox = parameter as System.Windows.Controls.TextBox;

                var dlg = new Microsoft.WindowsAPICodePack.Dialogs.CommonOpenFileDialog();
                dlg.Title = "保存先のフォルダを選択";
                dlg.IsFolderPicker = true;
                dlg.InitialDirectory = textbox.Text;

                dlg.AddToMostRecentlyUsedList = false;
                dlg.AllowNonFileSystemItems = false;
                dlg.DefaultDirectory = textbox.Text;
                dlg.EnsureFileExists = true;
                dlg.EnsurePathExists = true;
                dlg.EnsureReadOnly = false;
                dlg.EnsureValidNames = true;
                dlg.Multiselect = false;
                dlg.ShowPlacesList = true;

                if (dlg.ShowDialog() == Microsoft.WindowsAPICodePack.Dialogs.CommonFileDialogResult.Ok)
                {
                    textbox.Text = dlg.FileName;
                }
            }

        }
        /// <summary>
        /// 設定ファイルへ保存
        /// </summary>
        public class SaveCommand : ICommand
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

                if (parameter is Settings == false)
                {
                    return;
                }


                if (MessageBox.Show("設定を保存します。\r\n\r\n宜しいですか？", "保存", MessageBoxButton.OKCancel, MessageBoxImage.Question, MessageBoxResult.OK) == MessageBoxResult.OK)
                {
                    var set = parameter as Settings;

                    //保存するクラス(SampleClass)のインスタンスを作成
                    SettingsEntity se = new SettingsEntity();
                    se.StoreOwnerName = string.IsNullOrEmpty(set.tbOwnerStoreName.Text) ? "" : set.tbOwnerStoreName.Text;
                    se.PrinterName = set.cmbPrinterSettings.SelectedValue == null ? "" : set.cmbPrinterSettings.SelectedValue.ToString();
                    se.OutputTrayName = set.cmbPrinterトレイ選択.SelectedValue == null ? "" : set.cmbPrinterトレイ選択.SelectedValue.ToString();
                    se.PrintOutputPath = string.IsNullOrEmpty(set.tbShiftPrintOutputPath.Text) ? "" : set.tbShiftPrintOutputPath.Text;

                    SaveSettings(se);
                }
                else
                {
                    return;
                }



            }

        }
        /// <summary>
        /// 設定画面を閉じる
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

                if (parameter is Settings == false)
                {
                    return;
                }

                var set = parameter as Settings;

                if (MessageBox.Show("設定を保存しますか？", "保存", MessageBoxButton.OKCancel, MessageBoxImage.Question, MessageBoxResult.OK) == MessageBoxResult.OK)
                {

                    //保存するクラス(SampleClass)のインスタンスを作成
                    SettingsEntity se = new SettingsEntity();
                    se.StoreOwnerName = string.IsNullOrEmpty(set.tbOwnerStoreName.Text) ? "" : set.tbOwnerStoreName.Text;
                    se.PrinterName = set.cmbPrinterSettings.SelectedValue == null ? "" : set.cmbPrinterSettings.SelectedValue.ToString();
                    se.OutputTrayName = set.cmbPrinterトレイ選択.SelectedValue == null ? "" : set.cmbPrinterトレイ選択.SelectedValue.ToString();
                    se.PrintOutputPath = string.IsNullOrEmpty(set.tbShiftPrintOutputPath.Text) ? "" : set.tbShiftPrintOutputPath.Text;

                    SaveSettings(se);
                }


                set.Close();


                var menu = SingletonWindowsManager.GetorMakeWindow<Menu>(typeof(Menu));
                menu.WindowState = WindowState.Normal;
                menu.Activate();
            }

        }
        /// <summary>
        /// 設定ファイルを読み込みして反映
        /// </summary>
        public class LoadCommand : ICommand
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

                if (parameter is Settings == false)
                {
                    return;
                }

                var set = parameter as Settings;

                //保存するクラス(SampleClass)のインスタンスを作成
                SettingsEntity se = LoadSettings();
                set.tbOwnerStoreName.Text = se.StoreOwnerName;
                set.cmbPrinterSettings.SelectedValue = se.PrinterName;
                set.cmbPrinterトレイ選択.SelectedValue = se.OutputTrayName;
                set.tbShiftPrintOutputPath.Text = se.PrintOutputPath;
            }

        }





        /// <summary>
        /// 設定を保存する
        /// </summary>
        /// <param name="settingsEntity"></param>
        private static void SaveSettings(SettingsEntity settingsEntity)
        {
            if (!System.IO.Directory.Exists(Properties.Settings.Default.SMSystemRootFolder))
            {
                System.IO.Directory.CreateDirectory(Properties.Settings.Default.SMSystemRootFolder);
            }


            //保存先のファイル名
            string fileName = Properties.Settings.Default.SettingsConfigPath;

            //XmlSerializerオブジェクトを作成
            //オブジェクトの型を指定する
            System.Xml.Serialization.XmlSerializer serializer =
                new System.Xml.Serialization.XmlSerializer(typeof(SettingsEntity));
            //書き込むファイルを開く（UTF-8 BOM無し）
            using (System.IO.StreamWriter sw = new System.IO.StreamWriter(
                fileName, false, new System.Text.UTF8Encoding(false)))

            {
                //シリアル化し、XMLファイルに保存する
                serializer.Serialize(sw, settingsEntity);
                //ファイルを閉じる
                sw.Close();
            }

        }
        /// <summary>
        /// 設定を保存する
        /// </summary>
        /// <param name="settingsEntity"></param>
        private static SettingsEntity LoadSettings()
        {
            SettingsEntity settingsEntity = new SettingsEntity();

            if (!System.IO.Directory.Exists(Properties.Settings.Default.SMSystemRootFolder))
            {
                System.IO.Directory.CreateDirectory(Properties.Settings.Default.SMSystemRootFolder);
            }


            //保存元のファイル名
            string fileName = Properties.Settings.Default.SettingsConfigPath;

            //XmlSerializerオブジェクトを作成
            System.Xml.Serialization.XmlSerializer serializer =
                new System.Xml.Serialization.XmlSerializer(typeof(SettingsEntity));
            //読み込むファイルを開く
            using (System.IO.StreamReader sr = new System.IO.StreamReader(
                fileName, new System.Text.UTF8Encoding(false)))
            {
                //XMLファイルから読み込み、逆シリアル化する
                settingsEntity = (SettingsEntity)serializer.Deserialize(sr);
                //ファイルを閉じる
                sr.Close();
            }

            return settingsEntity;

        }

    }
}
