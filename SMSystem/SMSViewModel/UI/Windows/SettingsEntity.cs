using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMSViewModel.UI.Windows
{
    /// <summary>
    /// 設定画面のエンティティクラス
    /// </summary>
    public class SettingsEntity 
    {

        private string _PrintOutputPath;
        private string _PrinterName;
        private string _OutputTrayName;
        private string _StoreOwnerName;

        public string PrintOutputPath
        {
            get
            {
                return _PrintOutputPath;
            }

            set
            {
                _PrintOutputPath = value;
            }
        }

        public string PrinterName
        {
            get
            {
                return _PrinterName;
            }

            set
            {
                _PrinterName = value;
            }
        }

        public string OutputTrayName
        {
            get
            {
                return _OutputTrayName;
            }

            set
            {
                _OutputTrayName = value;
            }
        }

        public string StoreOwnerName
        {
            get
            {
                return _StoreOwnerName;
            }

            set
            {
                _StoreOwnerName = value;
            }
        }
    }
}
