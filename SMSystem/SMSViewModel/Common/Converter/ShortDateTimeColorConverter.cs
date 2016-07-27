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
using SMSViewModel.Common;

namespace SMSViewModel.Common.Converter
{
    public class ShortDateTimeColorConverter : IValueConverter
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

            SolidColorBrush color;
            switch(dt.DayOfWeek)
            {
                case DayOfWeek.Sunday:
                    color = new SolidColorBrush(Colors.Red);
                    break;
                case DayOfWeek.Monday:
                    color = new SolidColorBrush(Colors.Black);
                    break;
                case DayOfWeek.Tuesday:
                    color = new SolidColorBrush(Colors.Black);
                    break;
                case DayOfWeek.Wednesday:
                    color = new SolidColorBrush(Colors.Black);
                    break;
                case DayOfWeek.Thursday:
                    color = new SolidColorBrush(Colors.Black);
                    break;
                case DayOfWeek.Friday:
                    color = new SolidColorBrush(Colors.Black);
                    break;
                case DayOfWeek.Saturday:
                    color = new SolidColorBrush(Colors.SkyBlue);
                    break;
                default:
                    color = new SolidColorBrush(Colors.Black);
                    break;
            }

            if(CheckNationalHoliday(dt))
            {
                color = new SolidColorBrush(Colors.Red);
            }

            return color;



        }

        public object ConvertBack(object value, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            if (value == null)
            {
                return "";
            }

            return value;

    
        }

        private bool CheckNationalHoliday(DateTime date)
        {
            if(NationalHolidaysData.I.GetData(date.Year, date.Month, date.Day) == null)
            {
                //振替休日かチェック
                if(NationalHolidaysData.I.IsCompensatoryHoliday(date.Year, date.Month, date.Day))
                {
                    return true;
                }

                return false;
            }

            return true;
        }

    }
}
