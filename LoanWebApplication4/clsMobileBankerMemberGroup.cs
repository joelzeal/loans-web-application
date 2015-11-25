using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LoanWebApplication4
{
    public class clsMobileBankerMemberGroup : LoanGroup
    {
        private int _currentSUSUInvestmentID;
        public int CurrentSUSUInvestmentID
        {
            get { return _currentSUSUInvestmentID; }
            set { _currentSUSUInvestmentID = value; }
        }
    }
}