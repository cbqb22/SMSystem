﻿using Microsoft.VisualStudio.TestTools.UnitTesting;
using SMSViewModel.UI.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMSViewModel.UI.Windows.Tests
{
    [TestClass()]
    public class SingletonWindowsManagerTests
    {
        [TestMethod()]
        public void HasWindowTest()
        {
            var win = SingletonWindowsManager.HasWindow<BaseWindow>(typeof(BaseWindow));

            Assert.AreEqual(null,win);
        }
    }
}