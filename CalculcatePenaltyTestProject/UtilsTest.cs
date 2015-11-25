using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting.Web;
using LoanWebApplication4;

namespace CalculcatePenaltyTestProject
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
        ///A test for calculatePenaltyForEachLoan
        ///</summary>
        // TODO: Ensure that the UrlToTest attribute specifies a URL to an ASP.NET page (for example,
        // http://.../Default.aspx). This is necessary for the unit test to be executed on the web server,
        // whether you are testing a page, web service, or a WCF service.
        [TestMethod()]
        [HostType("ASP.NET")]
        [AspNetDevelopmentServerHost("C:\\Users\\ZeaL\\Documents\\Visual Studio 2010\\Projects\\LoanWebApplication4\\LoanWebApplication4", "/")]
        [UrlToTest("http://localhost:1165/")]
        [DeploymentItem("LoanWebApplication4.dll")]
        public void calculatePenaltyForEachLoanTest()
        {
            FinanceManagerDataContext dataContext = null; // TODO: Initialize to an appropriate value
            CompanyProfile cProfile = null; // TODO: Initialize to an appropriate value
            Utils_Accessor.calculatePenaltyForEachLoan(dataContext, cProfile);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }
    }
}
