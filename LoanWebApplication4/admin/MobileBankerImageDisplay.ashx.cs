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
    public class MobileBankerImageDisplay : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.QueryString["mid"] != null)
            {
                FinanceManagerDataContext db = new FinanceManagerDataContext();
                MobileBanker _mobileBanker = null; //= db.Members.First<Member>(m => m.MemberId == Convert.ToInt32(context.Request.QueryString["mid"]));
                try
                {
                    _mobileBanker = db.MobileBankers.First<MobileBanker>(m => m.MobileBankerid == Convert.ToInt32(context.Request.QueryString["mid"]));

                    context.Response.ContentType = "image/jpeg";
                    context.Response.BinaryWrite(_mobileBanker.Photo.ToArray());


                }
                catch (Exception)
                {
                    if (_mobileBanker != null)
                    {
                        if (_mobileBanker.Photo == null)
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