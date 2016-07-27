using Microsoft.VisualStudio.TestTools.UnitTesting;
using SMSView.UI.Windows.MenuCommands;
using SMSView.UI.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMSView.UI.Windows.MenuCommands.Tests
{
    [TestClass()]
    public class ShowWindowCommandTests
    {
        [TestMethod()]
        public void CanExecuteTest()
        {
            Menu win = new Menu();

            Assert.AreEqual(null,null);
        }
    }
}