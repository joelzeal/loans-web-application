using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class MemberInvestments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Utils.IsAuthorized("Investments", "Open");

            if (!IsPostBack)
            {
                try
                {
                    Image1.ImageUrl = "ImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                    SignatureImage.ImageUrl = "SignatureImageDisplay.ashx?mid=" + Request.QueryString["mid"];
                    IDCardImage.ImageUrl = "IDPhotoImageDisplay.ashx?mid=" + Request.QueryString["mid"];


                    //show appropriate panel
                    Member _currentMember = Utils.GetMemberAcountType(Convert.ToInt32(Request.QueryString["mid"]));

                    lblAccountHeader.Text = _currentMember.AccountType.Description;
                    /*
                    switch (_currentMember.AccountTypeID)
                    {
                        case 1:
                            regularInvestmentPanel.Visible = true;
                            SusuInvestmentPanel.Visible = false;

                            lblAccountHeader.Text = _currentMember.AccountType.Description;

                            break;
                        case 2:
                            regularInvestmentPanel.Visible = true;
                            SusuInvestmentPanel.Visible = false;

                            lblAccountHeader.Text = _currentMember.AccountType.Description;

                            break;

                        case 3:
                            regularInvestmentPanel.Visible = false;
                            SusuInvestmentPanel.Visible = true;

                            lblAccountHeader1.Text = _currentMember.AccountType.Description;

                            break;
                    }*/
                }
                catch (Exception)
                {
                }
            }
        }

        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Investments", "Edit");
        }

        protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Investments", "Delete");
        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewInvestment_MemberPreSelected.aspx?mid=" + Request.QueryString["mid"]);
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewSusuInvestment_MemberPreselected.aspx?mid=" + Request.QueryString["mid"]);
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("NewInvestment_FixedDeposit_MemberPreSelected.aspx?mid=" + Request.QueryString["mid"]);
        }

        protected void SUSUGridView_DataBound(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count == 0)
            {
                btnAddSUSUAcountInvestment.Visible = true;
            }
            else
            {
                btnAddSUSUAcountInvestment.Visible = false;
            }
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (SUSUGridView.Rows.Count == 0)
            {
                btnAddRegularAcountInvestment.Visible = true;
            }
            else
            {
                btnAddRegularAcountInvestment.Visible = false;
            }
        }

        protected void btnAddRegularAcountInvestment_Click(object sender, ImageClickEventArgs e)
        {
            int memberID = 0;

            try
            {
                memberID = Convert.ToInt32(Request.QueryString["mid"]);
                Member tempMember = Utils.GetDataContext().Members.FirstOrDefault(m => m.MemberId == memberID);
                Utils.createAccount(tempMember, tempMember.AccountType, false);
            }
            catch (Exception)
            {
                GridView1.DataBind();
            }
        }

        protected void btnAddSUSUAcountInvestment_Click(object sender, ImageClickEventArgs e)
        {
            int memberID = 0;

            try
            {
                memberID = Convert.ToInt32(Request.QueryString["mid"]);
                Member tempMember = Utils.GetDataContext().Members.FirstOrDefault(m => m.MemberId == memberID);
                Utils.createAccount(tempMember, tempMember.AccountType, false);
            }
            catch (Exception)
            {
                SUSUGridView.DataBind();
            }
        }
    }
}