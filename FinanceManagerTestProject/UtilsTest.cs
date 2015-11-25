using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using LoanWebApplication4;

namespace FinanceManagerTestProject
{
    
    
    /// <summary>
    ///This is a test class for UtilsTest and is intended
    ///to contain all UtilsTest Unit Tests
    ///</summary>
    [TestClass()]
    public class UtilsTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for CalculateDefaultersInterest
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void CalculateDefaultersInterestTest()
        {
            Utils.CalculateDefaultersInterest();
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for CalculateInterestRateByDuration
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void CalculateInterestRateByDurationTest()
        {
            Decimal interestRateForDuration = new Decimal(); // TODO: Initialize to an appropriate value
            int duration = 0; // TODO: Initialize to an appropriate value
            double expected = 0F; // TODO: Initialize to an appropriate value
            double actual;
            actual = Utils.CalculateInterestRateByDuration(interestRateForDuration, duration);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for ConvertMoneyToText
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void ConvertMoneyToTextTest()
        {
            string value = string.Empty; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = Utils.ConvertMoneyToText(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GenerateAccountNumber
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void GenerateAccountNumberTest()
        {
            int uniqueId = 0; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = Utils.GenerateAccountNumber(uniqueId);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GenerateContributionSchedule
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void GenerateContributionScheduleTest()
        {
            int months = 0; // TODO: Initialize to an appropriate value
            RepaymentFrequency repaymentFrequency = null; // TODO: Initialize to an appropriate value
            Investment currentLoan = null; // TODO: Initialize to an appropriate value
            Utils.GenerateContributionSchedule(months, repaymentFrequency, currentLoan);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for GenerateRepaymentSchedule
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void GenerateRepaymentScheduleTest()
        {
            int months = 0; // TODO: Initialize to an appropriate value
            RepaymentFrequency repaymentFrequency = null; // TODO: Initialize to an appropriate value
            Loan currentLoan = null; // TODO: Initialize to an appropriate value
            Utils.GenerateRepaymentSchedule(months, repaymentFrequency, currentLoan);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for GenerateRepaymentSchedule_new
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void GenerateRepaymentSchedule_newTest()
        {
            int months = 0; // TODO: Initialize to an appropriate value
            RepaymentFrequency repaymentFrequency = null; // TODO: Initialize to an appropriate value
            Loan currentLoan = null; // TODO: Initialize to an appropriate value
            Utils.GenerateRepaymentSchedule_new(months, repaymentFrequency, currentLoan);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for GetCompoundType
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void GetCompoundTypeTest()
        {
            int typeId = 0; // TODO: Initialize to an appropriate value
            Utils.CompoundType expected = new Utils.CompoundType(); // TODO: Initialize to an appropriate value
            Utils.CompoundType actual;
            actual = Utils.GetCompoundType(typeId);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetDataContext
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void GetDataContextTest()
        {
            FinanceManagerDataContext expected = null; // TODO: Initialize to an appropriate value
            FinanceManagerDataContext actual;
            actual = Utils.GetDataContext();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for HundredsText
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        [DeploymentItem("LoanWebApplication4.dll")]
        public void HundredsTextTest()
        {
            string value = string.Empty; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = Utils_Accessor.HundredsText(value);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for IdentityType
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void IdentityTypeTest()
        {
            int idType = 0; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = Utils.IdentityType(idType);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for InterestTypeName
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void InterestTypeNameTest()
        {
            int interestTypeID = 0; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = Utils.InterestTypeName(interestTypeID);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for LoanStatus
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void LoanStatusTest()
        {
            Nullable<bool> isPaidUp = new Nullable<bool>(); // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = Utils.LoanStatus(isPaidUp);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for RepaymentFreqName
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void RepaymentFreqNameTest()
        {
            int freqID = 0; // TODO: Initialize to an appropriate value
            string expected = string.Empty; // TODO: Initialize to an appropriate value
            string actual;
            actual = Utils.RepaymentFreqName(freqID);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for SearchMember
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void SearchMemberTest()
        {
            string searchStrin = string.Empty; // TODO: Initialize to an appropriate value
            SearchResultComplexType expected = null; // TODO: Initialize to an appropriate value
            SearchResultComplexType actual;
            actual = Utils.SearchMember(searchStrin);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for calculateCompoundInterest
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void calculateCompoundInterestTest()
        {
            double Principal = 0F; // TODO: Initialize to an appropriate value
            double InterestRate = 0F; // TODO: Initialize to an appropriate value
            Decimal NumberOfPeriods = new Decimal(); // TODO: Initialize to an appropriate value
            Utils.CompoundType compoundType = new Utils.CompoundType(); // TODO: Initialize to an appropriate value
            double expected = 0F; // TODO: Initialize to an appropriate value
            double actual;
            actual = Utils.calculateCompoundInterest(Principal, InterestRate, NumberOfPeriods, compoundType);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for calculatePenaltyForEachLoan
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        [DeploymentItem("LoanWebApplication4.dll")]
        public void calculatePenaltyForEachLoanTest()
        {
            FinanceManagerDataContext dataContext = null; // TODO: Initialize to an appropriate value
            CompanyProfile cProfile = null; // TODO: Initialize to an appropriate value
            Nullable<int> days = new Nullable<int>(); // TODO: Initialize to an appropriate value
            Utils_Accessor.calculatePenaltyForEachLoan(dataContext, cProfile, days);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for calculateSimpleInterest
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Desktop\\Zeal v2\\Zeal\\Project\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        public void calculateSimpleInterestTest()
        {
            double Principal = 0F; // TODO: Initialize to an appropriate value
            double InterestRate = 0F; // TODO: Initialize to an appropriate value
            Decimal NumberOfPeriods = new Decimal(); // TODO: Initialize to an appropriate value
            double expected = 0F; // TODO: Initialize to an appropriate value
            double actual;
            actual = Utils.calculateSimpleInterest(Principal, InterestRate, NumberOfPeriods);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }
    }
}
