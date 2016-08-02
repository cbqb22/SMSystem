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
    public class IntermissionToDisplayStringsConverter : IValueConverter
    {

        /// <summary>
        /// valueは0900-1300のデータ
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


            double result;

            if (double.TryParse(s, out result) == false)
            {
                return "";
            }

            string str = result.ToString("-0.00");

            return str;

        }

        //public object Convert(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        //{
        //    if (value == null)
        //    {
        //        return "";
        //    }


        //    string s = value.ToString();

        //    if(s.Length != 9)
        //    {
        //        return "";
        //        //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
        //    }


        //    int hour;
        //    int minitune;
        //    int hour2;
        //    int minitune2;

        //    try
        //    {
        //        if (int.TryParse(s.Substring(0, 2), out hour) == false)
        //        {
        //            return "";
        //            //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
        //        }
        //        if (int.TryParse(s.Substring(2, 2), out minitune) == false)
        //        {
        //            return "";
        //            //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
        //        }

        //        if (int.TryParse(s.Substring(5, 2), out hour2) == false)
        //        {
        //            return "";
        //            //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
        //        }
        //        if (int.TryParse(s.Substring(7, 2), out minitune2) == false)
        //        {
        //            return "";
        //            //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。");
        //        }

        //        int h = hour2 - hour;
        //        int m  = 0; 

        //        if(minitune2 < minitune)
        //        {
        //            h -= 1;
        //            m = minitune2 + 60 - minitune;
        //        }
        //        else
        //        {
        //            m = minitune2 - minitune;

        //        }

        //        double d = m / 60;

        //        return string.Format("-{0}{1}{2}", h, m == 0 ? "" : ".", m == 0 ? "" : m.ToString());

        //    }
        //    catch (Exception ex)
        //    {
        //        return "";
        //        throw ex;
        //        //throw new Exception("コンバーターに渡された値の型が不適切な為、処理を中断しました。\r\n" + ex.Message + ex.StackTrace);
        //    }


        //}

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (value == null)
            {
                return "";
            }

            string s = value.ToString();


            double result;
            if (double.TryParse(s, out result) == false)
            {
                return "";
            }

            //プラスに修正
            if (result < 0 )
            {
                result *= -1;
            }

            string str = result.ToString("0.00");



            return str;


        }

    }
}
