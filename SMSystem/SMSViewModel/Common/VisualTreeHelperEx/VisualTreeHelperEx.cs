using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SMSViewModel.Common.VisualTreeHelperEx
{
    public static class VisualTreeHelperEx
    {
        public static T FindFirstUIElement<T>(DependencyObject obj) where T : FrameworkElement
        {
            var fe = obj as FrameworkElement;
            if (fe != null)
            {
                int childCount = VisualTreeHelper.GetChildrenCount(fe);

                for (int i = 0; i < childCount; i++)
                {
                    var fe2 = VisualTreeHelper.GetChild(fe, i) as FrameworkElement;
                    if (fe2 == null)
                    {
                        continue;
                    }

                    if (fe2 is T)
                    {
                        return (T)fe2;
                    }

                    fe2 = FindFirstUIElement<T>(fe2) as FrameworkElement;

                    if (fe2 == null)
                    {
                        continue;
                    }

                    if (fe2 is T)
                    {
                        return (T)fe2;
                    }


                }
            }

            return null;
        }


        public static List<T> FindUIElements<T>(DependencyObject obj) where T : FrameworkElement
        {
            List<T> list = new List<T>();

            var fe = obj as FrameworkElement;
            if (fe != null)
            {
                if(fe is T)
                {
                    list.Add((T)fe);
                }

                int childCount = VisualTreeHelper.GetChildrenCount(fe);

                for (int i = 0; i < childCount; i++)
                {
                    var sublist=  FindUIElements<T>(VisualTreeHelper.GetChild(fe, i));
                    list = list.Concat(sublist).ToList();
                }
            }

            return list;

        }

    }
}
