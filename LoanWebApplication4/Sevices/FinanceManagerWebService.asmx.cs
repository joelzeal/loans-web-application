using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace LoanWebApplication4.Sevices
{
    /// <summary>
    /// Summary description for FinanceManagerWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class FinanceManagerWebService : System.Web.Services.WebService
    {

        public FinanceManagerWebService()
        {
           
        }

        [WebMethod]
        public void RunCalculcateDefaultersInterest()
        {
            //bool isAth = this.User.Identity.IsAuthenticated;
            if(Utils.webServiceLastRunDate.DayOfYear != DateTime.Today.DayOfYear) //make sure this operation is performed only once a day so the system wont be slow.
            if (HttpContext.Current.User.Identity.IsAuthenticated /* && HttpContext.Current.User.IsInRole("SystemAdmin")*/)
            {
                System.Threading.Tasks.Task.Factory.StartNew(() => { Utils.CalculateDefaultersInterest();
                Utils.MarkMaturedInvestmentsAsSo();
                Utils.webServiceLastRunDate = DateTime.Now;
                });
            }

            //mark matured investments as so
            //System.Threading.Tasks.Task.Factory.StartNew(() => { Utils.MarkMaturedInvestmentsAsSo(); }).Start();

        }

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }
    }
}
