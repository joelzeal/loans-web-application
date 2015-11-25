using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin.Fix
{
    public partial class Default : System.Web.UI.Page
    {
        //fix null createdDate
        //format 20141701600180
        //2014112000
        //2013121601700202   --- double digit month
        protected void Page_Load(object sender, EventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                //2013930011200001
                //getDateFromAccountNumber("2013930011200001");
                foreach (Member member in db.Members)
                {
                    member.CreatedDate = getDateFromAccountNumber(member.AccountNumber);
                    db.SubmitChanges();
                }


                foreach (LoanGroup item in db.LoanGroups)
                {
                     item.CreatedDate = getDateFromAccountNumber(item.AccountNumber);
                    db.SubmitChanges();
                }
            }
        }

        DateTime getDateFromAccountNumber(string accNumber)
        {
            DateTime dt;
            int yr, month, day;
            char[] accNumberArray = accNumber.ToCharArray();
            yr = Convert.ToInt32(  accNumber.Substring(0, 4).ToString());

            string[] tempMonthAndDay = getMonthAndDay(accNumber).Split(',');

            month = Convert.ToInt32( tempMonthAndDay[0]);
            day = Convert.ToInt32( tempMonthAndDay[1]);

            //month = Convert.ToInt32(accNumber.Substring(4, GetnumberOfDigitsForMonth(accNumber)).ToString());
            //day = Convert.ToInt32(accNumber.Substring(4 + GetnumberOfDigitsForMonth(accNumber), GetnumberOfDigitsForDay(accNumber)).ToString());
            dt = new DateTime(yr, month, day );
            return dt;
        }


        string getMonthAndDay(string accountNumber)
        {
            string month = "";
            string day = "";
           
            if (accountNumber.Length == 14) //both  day and month are single digits
            {
                //monthAndDay = accountNumber.Substring(4, 1) + "," + accountNumber.Substring(5, 1);
                month = accountNumber.Substring(4, 1);
                day = accountNumber.Substring(5, 1);
               // return monthAndDay;
            }
            else if (accountNumber.Length == 15) //either month or day is two digits.
            {
                //if year is 2013 Jan - Dec is allowed 
                //if year is 2014 Jan and Feb is only allowed
                if (accountNumber.Substring(0, 4) == "2013")
                {
                    if (Convert.ToInt32(accountNumber.Substring(4, 2)) <= 12 && Convert.ToInt32(accountNumber.Substring(4, 2)) > 0) //is a valid month
                    {
                        month = accountNumber.Substring(4, 2);
                        day = accountNumber.Substring(6, 1);
                    }
                    else // day is rather two digits
                    {
                        month = accountNumber.Substring(4, 1);
                        day = accountNumber.Substring(5, 2);
                    }
                }
                else if(accountNumber.Substring(0, 4) == "2014")
                {
                        month = accountNumber.Substring(4, 1);
                        day = accountNumber.Substring(5, 2);
                }
            }
            else if (accountNumber.Length == 16)
            {
                if (Convert.ToInt32(accountNumber.Substring(4, 2)) <= 12 && Convert.ToInt32(accountNumber.Substring(4, 2)) > 0) //is a valid month
                {
                    month = accountNumber.Substring(4, 2);
                    day = Convert.ToInt32(accountNumber.Substring(6, 2)) > 0 && Convert.ToInt32(accountNumber.Substring(6, 2)) <= 31 ? accountNumber.Substring(6, 2) : accountNumber.Substring(6, 1);
                }
                else // day is rather two digits
                {
                    month = accountNumber.Substring(4, 1);
                    day = accountNumber.Substring(5, 2);

                    //month = accountNumber.Substring(4, 2);
                    //day = accountNumber.Substring(6, 2);
                }
            }

            else if (accountNumber.Length > 16)
            {
                month = accountNumber.Substring(4, 2);
                day = accountNumber.Substring(6, 2);

            }

            return month + "," + day;
        }


        int GetnumberOfDigitsForMonth(string AccountNumber)
        {
            if (AccountNumber.Length == 14)
            {
                return 1;
            }
            else if (AccountNumber.Length == 16)
            {
                bool canFithAndSithMakeMonth;
                if (Convert.ToInt32(AccountNumber.Substring(4, 2)) > 0 && Convert.ToInt32(AccountNumber.Substring(4, 2)) <= 12)
                {
                    canFithAndSithMakeMonth = true;
                }
                else
                {
                    canFithAndSithMakeMonth = false;
                } 
                return canFithAndSithMakeMonth ? 2 : 1;
            }
            else //if (AccountNumber.Length < 16 && AccountNumber.Length > 14 )
            {
                //can the fith and sixth digits make a month

                return 1;

                //bool canFithAndSithMakeMonth;
                //if (Convert.ToInt32( AccountNumber.ToCharArray(4,2) )> 0 &&Convert.ToInt32(  AccountNumber.ToCharArray(4,2)) <= 12)
                //{
                //    canFithAndSithMakeMonth = true;
                //}
                //else
                //{
                //    canFithAndSithMakeMonth = false;
                //} 
            }
        }


        //not acurate
        int GetnumberOfDigitsForDay(string AccountNumber)
        {
            if (AccountNumber.Length == 14)
            {
                return 1;
            }
            else if (AccountNumber.Length == 16)
            {
                return 2;
            }
            else //if (AccountNumber.Length < 16 && AccountNumber.Length > 14 )
            {
                //can the fith and sixth digits make a month

                return 1;

               
            }
        }
    }
}