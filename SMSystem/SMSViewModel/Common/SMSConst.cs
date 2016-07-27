using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMSViewModel.Common
{
    public static class SMSConst
    {
        public static readonly DateTime SMS_DATE_MIN = new DateTime(1900, 1, 01);
        public static readonly DateTime SMS_DATE_MAX = new DateTime(2099, 12, 31);
    }
}
