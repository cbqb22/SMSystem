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
                if (int.TryParse(s.Substring(2, 2), out minitune) == false)
                {
                    return "";
                    //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
                }


                double d = minitune / 60;
                string str = string.Format("{0}{1}{2}", hour, d == 0 ? "" : ".", d == 0 ? "" : d.ToString());
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

            return value;

            //string s = value.ToString();

            //var sepa = s.Split('.');

            //if(sepa.Length == 0)
            //{
            //    throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
            //}

            //if(sepa.Length == 1)
            //{

            //    int hour;
            //    int minitune;

            //    try
            //    {
            //        if (int.TryParse(sepa[0], out hour) == false)
            //        {
            //            throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
            //        }

            //        return string.Format("{0}", hour, d);

            //    }
            //    catch (Exception ex)
            //    {
            //        throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。\r\n" + ex.Message + ex.StackTrace);
            //    }


            //}
            //else if(sepa.Length == 2)
            //{

            //    int hour;
            //    int minitune;

            //    try
            //    {
            //        if (int.TryParse(sepa[0], out hour) == false)
            //        {
            //            throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
            //        }
            //        if (int.TryParse(sepa[1], out minitune) == false)
            //        {
            //            throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
            //        }


            //        double d = minitune / 60;

            //        return string.Format("{0}.{1}", hour, d);

            //    }
            //    catch (Exception ex)
            //    {
            //        throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。\r\n" + ex.Message + ex.StackTrace);
            //    }


            //}
            //else
            //{
            //    throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");

            //}

        }

    }
}
