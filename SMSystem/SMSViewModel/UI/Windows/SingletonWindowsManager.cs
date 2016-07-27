using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace SMSViewModel.UI.Windows
{

    /// <summary>
    /// シングルトンウィンドウを作成、管理する為のクラス
    /// </summary>
    public static class SingletonWindowsManager
    {
        private static List<BaseWindow> _SingletonWindowsList = new List<BaseWindow>();

        public static List<BaseWindow> SingletonWindowsList
        {
            get
            {
                return _SingletonWindowsList;
            }
        }

        /// <summary>
        /// 既にウィンドウがあるか
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="type"></param>
        /// <returns></returns>
        public static T HasWindow<T>(Type windowType)where T : BaseWindow
        {
            T win = default(T);
            SingletonWindowsList.ForEach((x) => 
            {
                
                if(x.GetType() == windowType)
                {
                    win = (T)x;
                }
            });

            return (T)win;
        }


        /// <summary>
        /// ウィンドウのインスタンスがない、または閉じられている場合は新しく作成
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="window"></param>
        /// <returns></returns>
        public static T GetorMakeWindow<T>(Type windowType) where T : BaseWindow
        {
            T win = default(T);

            if((win = HasWindow<T>(windowType)) == null || win.IsClosed)
            {
                BaseWindow o = (BaseWindow)Activator.CreateInstance(windowType);
                SingletonWindowsList.Add(o);
                return (T)o;
            }


            return win;
        }

    }
}
