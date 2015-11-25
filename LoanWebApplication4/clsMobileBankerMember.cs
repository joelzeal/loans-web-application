using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LoanWebApplication4
{
    public class clsMobileBankerMember : Member
    {
        private int _currentSUSUInvestmentID;

        public int CurrentSUSUInvestmentID
        {
            get { return _currentSUSUInvestmentID; }
            set { _currentSUSUInvestmentID = value; }
        }

        private DateTime _paymentDate;

        public DateTime PaymentDate
        {
            get { return _paymentDate; }
            set { _paymentDate = value; }
        }

        private string _contributedBy;

        public string ContributedBy
        {
            get { return _contributedBy; }
            set { _contributedBy = value; }
        }

        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }   

        private decimal _paidAmount;

        public decimal PaidAmount
        {
            get { return _paidAmount; }
            set { _paidAmount = value; }
        }

        List<Investment> _sUSUInvestments;

        public List<Investment> SUSUInvestments
        {
            get { return _sUSUInvestments; }
            set { _sUSUInvestments = value; }
        }

      
        public  clsMobileBankerMember(Member member) : base()
        { 
            this.Name = member.MemberFirstName.ToString() + " " + member.OtherName.ToString() + " " + member.MemberLastName.ToString();
            this.MemberId = member.MemberId;
            this.ContributedBy = "";
            this.AccountNumber = member.AccountNumber;
            this.Address = member.Address;
            this.BusinessAddress = member.BusinessAddress;
            this.ContactPerson = member.ContactPerson;
            this.ContactPersonPhone = member.ContactPersonPhone;
            try
            {
                this.CurrentSUSUInvestmentID = member.Investments.OrderBy(i => i.InvestmentID).LastOrDefault(inv => inv.InvestmentTypeId == 2).InvestmentID;
            }
            catch (Exception)
            {
            }
            this.DOB = member.DOB;
            this.Fax = member.Fax;
            this.IdentityNumber = member.IdentityNumber;
            this.SUSUInvestments = member.Investments.Where(i => i.InvestmentTypeId == 2).OrderByDescending(inv => inv.InvestmentID).ToList();
        }
    }
}