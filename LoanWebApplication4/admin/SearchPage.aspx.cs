using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4.admin
{
    public partial class SearchPage : System.Web.UI.Page
    {

        public string NavigateUrl {
            get
            {
                try
                {
                    return Session["NavigateUrl"].ToString();
                }
                catch (Exception)
                {
                    Session["NavigateUrl"] = "";
                    return "";
                }
            }
            set
            {
                Session["NavigateUrl"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["str"] != null)
                {
                    txtSearch.Text = Request.QueryString["str"];
                    ImageButton1_Click(this, new ImageClickEventArgs(0,1));
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            SearchResultComplexType _searchResultComplexType = Utils.SearchMember(txtSearch.Text);

            //set group and member counts
            btnGroup.Text = "Groups (" + _searchResultComplexType.NumberOFGroupsFound.ToString() + ")";
            btnMembers.Text = "Members (" + _searchResultComplexType.NumberOfMembers.ToString() + ")";

            Repeater2.DataSource = _searchResultComplexType.MembersFound;
            Repeater2.DataBind();

            if (Repeater2.Items.Count == 0)
            {
                lblNoResults.Visible = true;
            }
            else
            {
                lblNoResults.Visible = false;
            }

            GroupResultsRepeater.DataSource = _searchResultComplexType.GroupsFound;
            GroupResultsRepeater.DataBind();

            if (GroupResultsRepeater.Items.Count == 0)
            {
                lblGroupMessage.Visible = true;
            }
            else
            {
                lblGroupMessage.Visible = false;
            }

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Member  _member= e.Item.DataItem as Member;
            ((Image)e.Item.FindControl("Image1")).ImageUrl = "ImageDisplay.ashx?mid=" + _member.MemberId;

            ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = "MemberDetails.aspx?mid=" + _member.MemberId;
            ((HyperLink)e.Item.FindControl("HyperLink1")).NavigateUrl = "MemberDetails.aspx?mid=" + _member.MemberId;
            ((HyperLink)e.Item.FindControl("hplInvestments")).NavigateUrl = "MemberInvestments.aspx?mid=" + _member.MemberId;
            ((HyperLink)e.Item.FindControl("hplLoans")).NavigateUrl = "MemberLoans.aspx?mid=" + _member.MemberId;


            if (NavigateUrl.Length > 0)
            {
                ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = NavigateUrl + "?mid=" + _member.MemberId;
                ((HyperLink)e.Item.FindControl("HyperLink1")).NavigateUrl = NavigateUrl + "?mid=" + _member.MemberId;
            }
            //((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = NavigateUrl + "?GroupId=" + _group.GroupId;
            else
            {
                ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = "MemberDetails.aspx?mid=" + _member.MemberId;
                ((HyperLink)e.Item.FindControl("HyperLink1")).NavigateUrl = "MemberDetails.aspx?mid=" + _member.MemberId;
            }
        }

        protected void RepaymentImage_Click(object sender, ImageClickEventArgs e)
        {
            Repeater2.DataSource = Utils.SearchMember(txtSearch.Text);
            Repeater2.DataBind();
        }

        protected void btnMembers_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(MemberView);
        }

        protected void btnGroup_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(GroupView);
        }

        protected void GroupResultsRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            vwGroup _group = e.Item.DataItem as vwGroup;

            ((HyperLink)e.Item.FindControl("hplGroupInvestments")).NavigateUrl = "GroupInvestments.aspx?gid=" + _group.GroupId;
            ((HyperLink)e.Item.FindControl("hplGroupLoans")).NavigateUrl = "GroupLoansLoans.aspx?gid=" + _group.GroupId;


            if (NavigateUrl.Length > 0)
                ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = NavigateUrl + "?GroupId=" + _group.GroupId;
            else
            {
                ((HyperLink)e.Item.FindControl("mainLink")).NavigateUrl = "MemberGroupDetails.aspx?GroupId=" + _group.GroupId;
            }
        }
    }
}