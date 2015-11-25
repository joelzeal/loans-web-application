using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class RecordMobileBankerCashCollection : System.Web.UI.Page
    {

        public clsMobileBanker CurrentMobileBanker
        {
            get
            {
                return Session["CurrentMobileBanker"] as clsMobileBanker;
            }
            set
            {
                Session["CurrentMobileBanker"] = value;
            }
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["mobiId"] != null)
                {
                    CurrentMobileBanker = new clsMobileBanker(Utils.GetDataContext().MobileBankers.FirstOrDefault(m => m.MobileBankerid == Convert.ToInt32(Request.QueryString["mobiId"])));
                }

                //bind data to controls
                DataList1.DataSource = CurrentMobileBanker.Members;
                DataList1.DataBind();

                lblMobileBanker.Text = CurrentMobileBanker.Name;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                foreach (DataListItem item in DataList1.Items)
                {
                    if (((TextBox)item.FindControl("TextBox2")).Text.Trim() == "0" || ((TextBox)item.FindControl("TextBox2")).Text.Trim().Length == 0)
                    {
                        continue;
                    }
         string dd = ((TextBox)item.FindControl("TextBox1")).Text;
                    clsMobileBankerMember _tempMember = CurrentMobileBanker.Members.FirstOrDefault(m => m.MemberId == Convert.ToInt32(((HiddenField)item.FindControl("HiddenField1")).Value));
                    db.Contributions.InsertOnSubmit(new Contribution()
                                        {
                                            InvestmentId = _tempMember.CurrentSUSUInvestmentID,
                                            ContributionAmount = Convert.ToDecimal(((TextBox)item.FindControl("TextBox2")).Text),
                                            ContributionAmountInWords = Utils.ConvertMoneyToText(((TextBox)item.FindControl("TextBox2")).Text),
                                            ContributionBy = ((TextBox)item.FindControl("TextBox3")).Text,
                                            CreatedBy = HttpContext.Current.User.Identity.Name,
                                            CreatedDate = Convert.ToDateTime(((TextBox)item.FindControl("TextBox1")).Text),
                                            Description = "SUSU contribution submitted by mobile banker",
                                            RecievedBy = HttpContext.Current.User.Identity.Name,
                                            IsDeleted = false,
                                            WasReceivedByMobileBanker = true,
                                            MobileBankerID = CurrentMobileBanker.MobileBankerId
                                        });

           
                    db.SubmitChanges();
                }

                //get the values that were entered.
                //foreach (clsMobileBankerMember item in CurrentMobileBanker.Members)
                //{
                //    db.Contributions.InsertOnSubmit(new Contribution()
                //    {
                //        InvestmentId = item.CurrentSUSUInvestmentID,
                //        ContributionAmount = item.PaidAmount,
                //        ContributionAmountInWords = Utils.ConvertMoneyToText(item.PaidAmount.ToString()),
                //        ContributionBy = item.ContributedBy,
                //        CreatedBy = HttpContext.Current.User.Identity.Name,
                //        CreatedDate = item.CreatedDate,
                //        Description = "SUSU contribution submitted by mobile banker",
                //        RecievedBy = HttpContext.Current.User.Identity.Name,
                //        IsDeleted = false,
                //        WasReceivedByMobileBanker = true
                //    });
                //    db.SubmitChanges();
                //}
            }
            Response.Redirect("MobileBankersList.aspx");
        }
    }
}