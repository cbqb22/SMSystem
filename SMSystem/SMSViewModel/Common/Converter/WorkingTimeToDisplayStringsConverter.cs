using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Windows.Data;

namespace SMSViewModel.Common.Converter
{
    public class WorkingTimeToDisplayStringsConverter : IValueConverter
    {

        /// <summary>
        /// valueは時刻
        /// </summary>
        /// <param name="value"></param>
        /// <param name="targetType"></param>
        /// <param name="parameter"></param>
        /// <param name="culture"></param>
        /// <returns></returns>

        public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (value == null)
            {
                return "";
            }


            string s = value.ToString();

            if(s == "-")
            {
                return value;
            }

            if(s.Length != 4)
            {
                return "";
                //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
            }


            int hour;
            int minitune;

            try
            {
                if (int.TryParse(s.Substring(0, 2), out hour) == false)
                {
                    return "";
                    //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
                }

                if(24 < hour)
                {
                    return "";
                }

                if (int.TryParse(s.Substring(2, 2), out minitune) == false)
                {
                    return "";
                    //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
                }

                if (60 < minitune)
                {
                    return "";
                }



                double d = minitune / 60d;
                string str = (hour + d).ToString();
                //string str = string.Format("{0}{1}{2}", hour, d == 0 ? "" : ".", d == 0 ? "" : d.ToString());
                return str;

            }
            catch
            {
                return "";
                //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。\r\n" + ex.Message + ex.StackTrace);
            }


        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (value == null)
            {
                return "";
            }

            string s = value.ToString();

            if (s == "-")
            {
                return value;
            }


            double result;

            try
            {
                if (double.TryParse(s, out result) == false)
                {
                    return "";
                    //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
                }

                if (24 < result)
                {
                    return "";
                }

                var hour = Math.Floor(result);
                var hourshosuu = result - hour;
                var minute = Math.Floor(hourshosuu * 60);

                string str = string.Format("{0}{1}", hour.ToString().PadLeft(2,'0'),minute.ToString().PadLeft(2, '0'));
                return str;

            }
            catch
            {
                return "";
                //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。\r\n" + ex.Message + ex.StackTrace);
            }



        }

    }
}
