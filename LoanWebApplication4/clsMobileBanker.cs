using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LoanWebApplication4
{
    public class clsMobileBanker
    {
        private string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        private List<clsMobileBankerMember> _members;

        public List<clsMobileBankerMember> Members
        {
            /*.OrderBy(mm => mm.MemberFirstName)*/
            get { return _members.OrderBy(m => m.AccountNumber).ToList(); }
            set { _members = value; }
        }
        private List<LoanGroup> _groups;

        public List<LoanGroup> Groups
        {
            get { return _groups; }
            set { _groups = value; }
        }


        private int _mobileBankerId;

        public int MobileBankerId
        {
            get { return _mobileBankerId; }
            set { _mobileBankerId = value; }
        }

        public clsMobileBanker(MobileBanker mobileBanker)
        {
            _name = mobileBanker.FirstName + " " + mobileBanker.OtherName + " " + mobileBanker.LastName;
           
            _members = new List<clsMobileBankerMember>();
            _members.AddRange(ExtractMembers(mobileBanker.MobileBankerCustomers.ToList()));
            _mobileBankerId = mobileBanker.MobileBankerid;
           
        }

        private List<clsMobileBankerMember> ExtractMembers(List<MobileBankerCustomer> mobileBankerCustomers)
        {
            List<clsMobileBankerMember> _tempClsMobileBankerMembers = new List<clsMobileBankerMember>();
            foreach (MobileBankerCustomer item in mobileBankerCustomers)
            {
                clsMobileBankerMember _tempClsMobileBankerMember = new clsMobileBankerMember( item.Member);
                _tempClsMobileBankerMember.PaymentDate = DateTime.Today;

                _tempClsMobileBankerMembers.Add(_tempClsMobileBankerMember);
            }
            return _tempClsMobileBankerMembers;
        }


        //private List<clsMobileBankerMemberGroup> ExtractGroups(List<clsMobileBankerMemberGroup> clsMobileBankerMemberGroup)
        //{
        //    List<clsMobileBankerMemberGroup> _tempClsMobileBankerMembers = new List<clsMobileBankerMemberGroup>();
        //    foreach (clsMobileBankerMemberGroup item in clsMobileBankerMemberGroup)
        //    {
        //        clsMobileBankerMember _tempClsMobileBankerMember = new clsMobileBankerMember(item.);
        //    }
        //    return _tempClsMobileBankerMembers;
        //}

    }
}