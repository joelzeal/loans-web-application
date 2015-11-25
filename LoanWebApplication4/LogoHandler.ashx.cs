using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LoanWebApplication4
{
    /// <summary>
    /// Summary description for LogoHandler
    /// </summary>
    public class LogoHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                context.Response.ContentType = "image/" + cProfile.LogoFileExt.Remove(0,1);
                context.Response.BinaryWrite(cProfile.CompanyLogo.ToArray()); 
                
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}