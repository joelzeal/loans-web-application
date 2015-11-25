using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;


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
                Member _member = null ; //= db.Members.First<Member>(m => m.MemberId == Convert.ToInt32(context.Request.QueryString["mid"]));
                try
                {
                     _member = db.Members.First<Member>(m => m.MemberId == Convert.ToInt32(context.Request.QueryString["mid"]));

                    context.Response.ContentType = "image/jpeg";
                    context.Response.BinaryWrite(_member.MemberPhoto.ToArray());


                }
                catch (Exception)
                {
                    if (_member != null)
                    {
                         if (_member.MemberPhoto == null)
                    {
                        context.Response.WriteFile("~/images/NoImage.png");
                        context.Response.ContentType = "image/png";
                    }
                    }
                   
                }
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