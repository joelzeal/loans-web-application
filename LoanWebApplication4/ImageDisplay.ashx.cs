using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LoanWebApplication4
{
    /// <summary>
    /// Summary description for ImageDisplay
    /// </summary>
    public class ImageDisplay : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.QueryString["mid"] != null)
            {
                FinanceManagerDataContext db = new FinanceManagerDataContext();
                Member _member = db.Members.First<Member>(m => m.MemberId == Convert.ToInt32(context.Request.QueryString["mid"]));
                context.Response.ContentType = "image/jpeg";
                context.Response.BinaryWrite(_member.MemberPhoto.ToArray());
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