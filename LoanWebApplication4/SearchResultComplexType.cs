using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LoanWebApplication4
{
    public class SearchResultComplexType
    {
        private List<Member> _membersFound;

        public List<Member> MembersFound
        {
            get { return _membersFound; }
            set { _membersFound = value; }
        }
        private int _numberOfMembers;

        public int NumberOfMembers
        {
            get { return _numberOfMembers; }
            set { _numberOfMembers = value; }
        }
        private List<vwGroup> _groupsFound;

        public List<vwGroup> GroupsFound
        {
            get { return _groupsFound; }
            set { _groupsFound = value; }
        }
        private int _numberOFGroupsFound;

        public int NumberOFGroupsFound
        {
            get { return _numberOFGroupsFound; }
            set { _numberOFGroupsFound = value; }
        }
    }
}