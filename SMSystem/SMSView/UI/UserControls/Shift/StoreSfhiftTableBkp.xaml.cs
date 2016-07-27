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
using SMSViewModel.DataInstance;
using SMSModel.DB.SMSystem;
using SMSViewModel.Common.VisualTreeHelperEx;

namespace SMSView.UI.UserControls.Shift
{
    /// <summary>
    /// StoreSfhiftTable.xaml の相互作用ロジック
    /// </summary>
    public partial class StoreSfhiftTableBkp : UserControl
    {
        public StoreSfhiftTableBkp()
        {
            InitializeComponent();

            this.Loaded += StoreSfhiftTable_Loaded;
        }

        private void StoreSfhiftTable_Loaded(object sender, RoutedEventArgs e)
        {

            try
            {
                using (var context = new SMSystemEntities())
                {
                    var query =
                            (from x in context.Employees
                             join y in context.Shifts
                             on
                                x.ID equals y.EmployeeID
                             join z in context.ShiftDetails
                             on
                                y.ID equals z.ShiftID into sd
                             join z2 in context.ShiftDetails
                             on
                                y.ID equals z2.ShiftID
                             where
                                z2.WorkingDate == new DateTime(2016,08,01)
                             select new
                             {
                                 Employee = x,
                                 ShiftDetail = sd
                                     //姓 = x.姓,
                                     //名 = x.名,
                                     //店舗名 = x.Shop.店舗名,
                                     //役職 = x.Status.役職名,
                                     //シフト = z,

                                 }).ToList();

                    this.DataContext = query;

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }



        }

        private void lvIndividual_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void lvIndividual_LayoutUpdated(object sender, EventArgs e)
        {
            if (!this.IsLoaded)
            {
                return;

            }

            if (lvIndividual.Items == null)
            {
                return;
            }


            int ZindexCounter = lvIndividual.Items.Count + 1;
            for (int i = 0; i < lvIndividual.Items.Count; i++)
            {

                ListViewItem listViewItem = (ListViewItem)lvIndividual.ItemContainerGenerator.ContainerFromIndex(i);
                if (listViewItem != null)
                {
                    listViewItem.SetValue(Grid.ZIndexProperty, ZindexCounter--);
                }

                var innerlistview = VisualTreeHelperEx.FindUIElement<ListView>(listViewItem) as ListView;
                if (innerlistview != null)
                {
                    int ZindexCounter2 = innerlistview.Items.Count + 1;
                    for (int i2 = 0; i2 < innerlistview.Items.Count; i2++)
                    {
                        ListViewItem listViewItem2 = (ListViewItem)innerlistview.ItemContainerGenerator.ContainerFromIndex(i2);
                        listViewItem2.SetValue(Grid.ZIndexProperty, ZindexCounter2--);
                    }
                }

            }
        }



    }
}
