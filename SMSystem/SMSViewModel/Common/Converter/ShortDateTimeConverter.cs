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
    public class ShortDateTimeConverter : IValueConverter
    {

        /// <summary>
        /// valueはIsBusyの値
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

            int i;

            if(int.TryParse(parameter.ToString(),out i) == false)
            {
                return "";
            }


            if(value is DateTime == false)
            {
                return "";
            }


            DateTime dt = (DateTime)value;

            dt = dt.AddDays(i);
            string str = "";
            switch(dt.DayOfWeek)
            {
                case DayOfWeek.Sunday:
                    str = "日";
                    break;
                case DayOfWeek.Monday:
                    str = "月";
                    break;
                case DayOfWeek.Tuesday:
                    str = "火";
                    break;
                case DayOfWeek.Wednesday:
                    str = "水";
                    break;
                case DayOfWeek.Thursday:
                    str = "木";
                    break;
                case DayOfWeek.Friday:
                    str = "金";
                    break;
                case DayOfWeek.Saturday:
                    str = "土";
                    break;
                default:
                    str = "";
                    break;
            }

            return dt.ToString("MM/dd") +"\r\n" + "(" + str  +  ")";





        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (value == null)
            {
                return "";
            }

            return value;

    
        }

    }
}
