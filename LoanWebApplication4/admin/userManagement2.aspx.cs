using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace LoanWebApplication4.admin
{
    public partial class userManagement2 : System.Web.UI.Page
    {

        private MembershipUserCollection allRegisteredUsers = Membership.GetAllUsers();
        protected void Page_Load(object sender, EventArgs e)
        {
          
           
        }


        private void BindAllUsers(bool reloadAllUsers)
        {
            MembershipUserCollection allUsers = null;
            if (reloadAllUsers)
            {
                allUsers = Membership.GetAllUsers();
            }
            string emailToMatch = "";
            if (!string.IsNullOrEmpty(this.gvUsers.Attributes["SearchText"]))
            {
                emailToMatch = this.gvUsers.Attributes["SearchText"];
            }
            bool flag = false;
            if (!string.IsNullOrEmpty(this.gvUsers.Attributes["SearchByEmail"]))
            {
                flag = bool.Parse(this.gvUsers.Attributes["SearchByEmail"]);
            }
            if (emailToMatch.Length > 0)
            {
                if (flag)
                {
                    allUsers = Membership.FindUsersByEmail(emailToMatch);
                }
                else
                {
                    allUsers = Membership.FindUsersByName(emailToMatch);
                }
            }
            else
            {
                allUsers = this.allRegisteredUsers;
            }
            this.gvUsers.DataSource = allUsers;
            this.gvUsers.DataBind();
        }

        protected void btn_Delete_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in this.gvUsers.Rows)
                {
                    CheckBox box = (CheckBox)row.FindControl("cbxId");
                    if (box.Checked)
                    {
                        Label label = (Label)this.gvUsers.Rows[row.RowIndex].FindControl("lblUserName");
                        if (Membership.DeleteUser(label.Text))
                        {
                            this.lblMsg.Text = "Selected deleted";
                            this.RefreshGridview();
                            this.btn_Delete.Visible = false;
                        }
                        else
                        {
                            this.lblMsg.Text = "Try again";
                        }
                    }
                }
            }
            catch (Exception exception)
            {
                this.lblMsg.Text = exception.Message.ToString();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            this.btn_Delete.Visible = true;
            bool flag = this.ddlUserSearchTypes.SelectedValue == "E-mail";
            this.gvUsers.Attributes.Add("SearchText", this.txtSearchText.Text + "%");
            this.gvUsers.Attributes.Add("SearchByEmail", flag.ToString());
            this.BindAllUsers(false);
        }

        protected void ContinueButton_Click(object sender, EventArgs e)
        {
            base.Response.Redirect("JustPostBack.aspx");
        }

        protected void gvUsers_DataBound(object sender, EventArgs e)
        {
            if (this.gvUsers.Rows.Count == 0)
            {
                this.btn_Delete.Visible = false;
            }
            else
            {
                this.btn_Delete.Visible = true;
            }
        }

        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                ((CheckBox)e.Row.FindControl("cbxAll")).Attributes.Add("onclick", "javascript:SelectAll('" + ((CheckBox)e.Row.FindControl("cbxAll")).ClientID + "')");
            }
        }


        public void RefreshGridview()
        {
            this.gvUsers.DataSource = Membership.GetAllUsers();
            this.gvUsers.DataBind();
        }

        protected void rptAlphabetBar_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            this.btn_Delete.Visible = true;
            bool flag = false;
            this.gvUsers.Attributes.Add("SearchByEmail", flag.ToString());
            if (e.CommandArgument.ToString().Length == 1)
            {
                this.gvUsers.Attributes.Add("SearchText", e.CommandArgument.ToString() + "%");
                this.BindAllUsers(false);
            }
            else
            {
                this.gvUsers.Attributes.Add("SearchText", "");
                this.BindAllUsers(false);
            }
        }

    
    }
}