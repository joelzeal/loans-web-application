using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoanWebApplication4
{
    public partial class MobileBankerDetails : System.Web.UI.Page
    {
        int SusuInvestmentTypeID = 2;
        FinanceManagerDataContext db = new FinanceManagerDataContext();
        public MobileBanker CurrentMobileBanker
        {
            get
            {
                if (Session["CurrentMobileBanker"] == null)
                {
                    Session["CurrentMobileBanker"] = new LoanGroup();
                }
                return (MobileBanker)Session["CurrentMobileBanker"];
            }
            set
            {
                Session["CurrentMobileBanker"] = value;
            }
        }

        public List<MembersView2> GroupMembers
        {
            get
            {
                if (Session["MobileBankerCustomers"] == null)
                    Session["MobileBankerCustomers"] = new List<MembersView2>();
                return (List<MembersView2>)Session["MobileBankerCustomers"];
            }
            set
            {
                Session["MobileBankerCustomers"] = value;
            }
        }

        public List<MembersView2> NonGroupMembers
        {
            get
            {
                if (Session["NonMobileBankerCustomers"] == null)
                    Session["NonMobileBankerCustomers"] = new List<MembersView2>();

                return (List<MembersView2>)Session["NonMobileBankerCustomers"];
            }
            set
            {
                Session["NonMobileBankerCustomers"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Utils.IsAuthorized("MobileBankers", "Open");

            
            if (!IsPostBack)
            {
                if (Request.QueryString["mobiId"] != null)
                {
                    CurrentMobileBanker = db.MobileBankers.FirstOrDefault(m => m.MobileBankerid == Convert.ToInt32(Request.QueryString["mobiId"]));
                    Image1.ImageUrl = "MobileBankerImageDisplay.ashx?mid=" + CurrentMobileBanker.MobileBankerid;

                    FirstNameTextBox.Text = CurrentMobileBanker.FirstName.ToString();
                    OtherNameTextBox.Text = CurrentMobileBanker.OtherName.ToString();
                    LastNameTextBox.Text = CurrentMobileBanker.LastName;
                    AddressTextBox.Text = CurrentMobileBanker.Address;
                    TelephoneTextBox.Text = CurrentMobileBanker.Telephone;
                    MobileBankerCodeTextBox.Text = CurrentMobileBanker.MobileBankerCode;

                    GetAllNonGroupMembers(CurrentMobileBanker.MobileBankerid);
                    GetGroupMembers(CurrentMobileBanker.MobileBankerid);

                    lstMembers.DataSource = GroupMembers.OrderBy(g => g.Member);
                    lstMembers.DataTextField = "Member";
                    lstMembers.DataValueField = "MemberId";
                    lstMembers.DataBind();

                    lstNonMembers.DataSource = NonGroupMembers.OrderBy(g => g.Member);
                    lstNonMembers.DataTextField = "Member";
                    lstNonMembers.DataValueField = "MemberId";
                    lstNonMembers.DataBind();

                    
                    //InvestmentHyperLink.NavigateUrl = "GroupInvestments.aspx?gid=" + CurrentMobileBanker.GroupId;
                    //LoanHyperLink.NavigateUrl = "GroupLoansLoans.aspx?gid=" + CurrentMobileBanker.GroupId;
                   
                }
                else
                {
                    //get the current group id when a group id is passed.
                    //if (Request.QueryString["GroupId"] != null)
                    //    CurrentMobileBanker = db.LoanGroups.FirstOrDefault(g => g.GroupId == Convert.ToInt32(Request.QueryString["GroupId"]));
                    CurrentMobileBanker = new MobileBanker();

                    GetAllNonGroupMembers(CurrentMobileBanker.MobileBankerid);
                    GetGroupMembers(CurrentMobileBanker.MobileBankerid);

                    //lstMembers.DataSource = GroupMembers.OrderBy(g => g.Member);
                    //lstMembers.DataTextField = "Member";
                    //lstMembers.DataValueField = "MemberId";
                    //lstMembers.DataBind();

                    lstNonMembers.DataSource = NonGroupMembers.OrderBy(g => g.Member);
                    lstNonMembers.DataTextField = "Member";
                    lstNonMembers.DataValueField = "MemberId";
                    lstNonMembers.DataBind();
                }
            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            //MemberSqlDataSource.UpdateParameters[""].DefaultValue = ((FileUpload)FormView1.FindControl("FileUpload1")).FileBytes;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["mobiId"] != null)
            {
                Utils.IsAuthorized("MobileBankers", "Create");

                CurrentMobileBanker = db.MobileBankers.FirstOrDefault(g => g.MobileBankerid == CurrentMobileBanker.MobileBankerid); // fetch CurrentGroup again fo update
                CurrentMobileBanker.FirstName = FirstNameTextBox.Text;
                CurrentMobileBanker.OtherName = OtherNameTextBox.Text;
                CurrentMobileBanker.LastName = LastNameTextBox.Text;
                CurrentMobileBanker.MobileBankerCode = MobileBankerCodeTextBox.Text;
                CurrentMobileBanker.Address = AddressTextBox.Text;
                CurrentMobileBanker.Telephone = TelephoneTextBox.Text;

                if (FileUpload1.HasFile)
                    CurrentMobileBanker.Photo = FileUpload1.FileBytes;

                foreach (MembersView2 item in GroupMembers)
                {
                    if (!CurrentMobileBanker.MobileBankerCustomers.Any(g => g.MemberId == item.MemberId))
                    {
                        CurrentMobileBanker.MobileBankerCustomers.Add(new MobileBankerCustomer() { MemberId = item.MemberId });
                        if (db.Investments.Count(i => i.MemberID == item.MemberId && i.InvestmentTypeId == SusuInvestmentTypeID) == 0)
                        {
                            //create sus investment for the current member
                            db.Investments.InsertOnSubmit(new Investment()
                            {
                                MemberID = item.MemberId,
                                InvestmentTypeId = SusuInvestmentTypeID,
                                IsActive = true,
                                IsMatured = false,
                                CreatedBy = HttpContext.Current.User.Identity.Name,
                                CreatedDate = DateTime.Now
                            });
                        }
                    }
                }
                db.SubmitChanges();
                // Utils.GetDataContext().SubmitChanges();
            }
            else
            {
                Utils.IsAuthorized("MobileBankers", "Edit");

                CurrentMobileBanker.FirstName = FirstNameTextBox.Text;
                CurrentMobileBanker.OtherName = OtherNameTextBox.Text;
                CurrentMobileBanker.LastName = LastNameTextBox.Text;
                CurrentMobileBanker.MobileBankerCode = MobileBankerCodeTextBox.Text;
                CurrentMobileBanker.Address = AddressTextBox.Text;
                CurrentMobileBanker.Telephone = TelephoneTextBox.Text;

                if (FileUpload1.HasFile)
                    CurrentMobileBanker.Photo = FileUpload1.FileBytes;


                foreach (MembersView2 item in GroupMembers)
                {
                    if (!CurrentMobileBanker.MobileBankerCustomers.Any(g => g.MemberId == item.MemberId))
                    {
                        CurrentMobileBanker.MobileBankerCustomers.Add(new MobileBankerCustomer() { MemberId = item.MemberId });
                        if (db.Investments.Count(i => i.MemberID == item.MemberId && i.InvestmentTypeId == SusuInvestmentTypeID) == 0)
                        {
                            //create sus investment for the current member
                            db.Investments.InsertOnSubmit(new Investment()
                            {
                                MemberID = item.MemberId,
                                InvestmentTypeId = SusuInvestmentTypeID,
                                IsActive = true,
                                IsMatured = false,
                                CreatedBy = HttpContext.Current.User.Identity.Name,
                                CreatedDate = DateTime.Now
                            });
                        }
                    }

                }
                CurrentMobileBanker.IsDeleted = false;


                //create susu investment for those who dont have


                db.MobileBankers.InsertOnSubmit(CurrentMobileBanker);
                db.SubmitChanges();


                //audit
                Utils.logAction("Insert", CurrentMobileBanker);


                //Utils.GetDataContext().LoanGroups.InsertOnSubmit(CurrentMobileBanker);
                //Utils.GetDataContext().SubmitChanges();

                /*
                if (CheckBox1.Checked)
                {
                    CurrentMobileBanker.AccountNumber = Utils.GenerateAccountNumber(CurrentMobileBanker.GroupId);
                    db.SubmitChanges();
                }*/
            }
            //if (Request.QueryString["RedirectUrl"] == null)
            //{
            //    //redirect to goups
            //    Response.Redirect("MobileBankersList.aspx");
            //}
            //else
            //{
            //    Response.Redirect(Request.QueryString["RedirectUrl"] + "?mobiId=" + CurrentMobileBanker.MobileBankerid);
            //}
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            // SaveFileDialog
        }




        //get all group members
        List<MembersView2> GetGroupMembers(int? MobileBankerID = null)
        {
            List<MembersView2> _groupMembers = new List<MembersView2>();
            if (MobileBankerID == null || MobileBankerID == 0)//group not saved yet
            {
                return GroupMembers;
            }
            else
            {
                MobileBanker _loangroup = db.MobileBankers.FirstOrDefault<MobileBanker>(l => l.MobileBankerid == MobileBankerID);
                foreach (MobileBankerCustomer item in _loangroup.MobileBankerCustomers)
                {
                    _groupMembers.Add(new MembersView2() { Member = ConcatMemberName(item.Member), MemberId = item.MemberId.Value });
                }
                GroupMembers = _groupMembers;
                return _groupMembers;
            }
        }


        //get all non group members
        List<MembersView2> GetAllNonGroupMembers(int? groupID = null)
        {
            List<MembersView2> _groupMembers = new List<MembersView2>();
            if (groupID == null || groupID == 0)//group not saved yet
            {
                foreach (MembersView2 item in db.MembersView2s)
                {
                    if (!GroupMembers.Any(g => g.MemberId == item.MemberId))
                    {
                        _groupMembers.Add(item);
                    }
                }
                NonGroupMembers = _groupMembers;
                return _groupMembers;
            }
            else
            {
                //LoanGroup _loangroup = Utils.GetDataContext().LoanGroups.FirstOrDefault<LoanGroup>(l => l.GroupId = groupID);
                foreach (MembersView2 item in Utils.GetDataContext().MembersView2s)// CurrentMobileBanker.GroupMembers)
                {
                    if (CurrentMobileBanker.MobileBankerCustomers.Any(m => m.MemberId == item.MemberId) == false)
                    { 
                        _groupMembers.Add(new MembersView2() { Member = item.Member, MemberId = item.MemberId });
                    }
                }
                NonGroupMembers = _groupMembers;
                return _groupMembers;
            }
        }

        string ConcatMemberName(Member member)
        {
            return member.MemberFirstName + " " + member.OtherName + " " + member.MemberLastName;
        }


        //add member
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int _selectedMEmber = Convert.ToInt32(lstNonMembers.SelectedValue);
                MembersView2 mv = NonGroupMembers.FirstOrDefault(m => m.MemberId == _selectedMEmber);
                NonGroupMembers.Remove(mv);



                GroupMembers.Add(mv);
                lstMembers.DataSource = GroupMembers;
                lstMembers.DataTextField = "Member";
                lstMembers.DataValueField = "MemberId";
                lstMembers.DataBind();

                lstNonMembers.DataSource = NonGroupMembers;
                lstNonMembers.DataTextField = "Member";
                lstNonMembers.DataValueField = "MemberId";
                lstNonMembers.DataBind();
            }
            catch (Exception)
            {

            }
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                int _selectedMEmber = Convert.ToInt32(lstMembers.SelectedValue);
                MembersView2 mv = GroupMembers.FirstOrDefault(m => m.MemberId == _selectedMEmber);
                GroupMembers.Remove(mv);

                NonGroupMembers.Add(mv);
                lstMembers.DataSource = GroupMembers;
                lstMembers.DataTextField = "Member";
                lstMembers.DataValueField = "MemberId";
                lstMembers.DataBind();

                lstNonMembers.DataSource = NonGroupMembers;
                lstNonMembers.DataTextField = "Member";
                lstNonMembers.DataValueField = "MemberId";
                lstNonMembers.DataBind();

                DeleteMemberFromGroupInDatabase(_selectedMEmber, CurrentMobileBanker.MobileBankerid);

            }
            catch (Exception)
            {

            }
        }


        void DeleteMemberFromGroupInDatabase(int memberID, int mobileBankerID)
        {
            System.Threading.Tasks.Task.Factory.StartNew(() =>
            {
                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    MobileBankerCustomer _customer = db.MobileBankerCustomers.FirstOrDefault(m => m.MemberId == memberID && m.MobileBankerID == mobileBankerID);
                    db.MobileBankerCustomers.DeleteOnSubmit(_customer);
                    db.SubmitChanges();
                }
            });
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["RedirectUrl"] == null)
            {
                Response.Redirect("MobileBankersList.aspx");
            }
            else
            {
                if (CurrentMobileBanker.MobileBankerid == 0)
                    Response.Redirect("MobileBankersList.aspx");

                Response.Redirect(Request.QueryString["RedirectUrl"] + "?mobiId=" + CurrentMobileBanker.MobileBankerid);
            }
        }

        protected void btnSaveAndExit_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["mobiId"] != null)
            {
                Utils.IsAuthorized("MobileBankers", "Create");

                CurrentMobileBanker = db.MobileBankers.FirstOrDefault(g => g.MobileBankerid == CurrentMobileBanker.MobileBankerid); // fetch CurrentGroup again fo update
                CurrentMobileBanker.FirstName = FirstNameTextBox.Text;
                CurrentMobileBanker.OtherName = OtherNameTextBox.Text;
                CurrentMobileBanker.LastName = LastNameTextBox.Text;
                CurrentMobileBanker.MobileBankerCode = MobileBankerCodeTextBox.Text;
                CurrentMobileBanker.Address = AddressTextBox.Text;
                CurrentMobileBanker.Telephone = TelephoneTextBox.Text;
                if (FileUpload1.HasFile)
                    CurrentMobileBanker.Photo = FileUpload1.FileBytes;

                foreach (MembersView2 item in GroupMembers)
                {
                    if (!CurrentMobileBanker.MobileBankerCustomers.Any(g => g.MemberId == item.MemberId))
                    {
                        CurrentMobileBanker.MobileBankerCustomers.Add(new MobileBankerCustomer() { MemberId = item.MemberId });
                        if (db.Investments.Count(i => i.MemberID == item.MemberId && i.InvestmentTypeId == SusuInvestmentTypeID) == 0)
                        {
                            //create sus investment for the current member
                            db.Investments.InsertOnSubmit(new Investment()
                            {
                                MemberID = item.MemberId,
                                InvestmentTypeId = SusuInvestmentTypeID,
                                IsActive = true,
                                IsMatured = false,
                                CreatedBy = HttpContext.Current.User.Identity.Name,
                                CreatedDate = DateTime.Now
                            });
                        }
                    }
                }
                db.SubmitChanges();
                // Utils.GetDataContext().SubmitChanges();
            }
            else
            {
                Utils.IsAuthorized("MobileBankers", "Edit");

                CurrentMobileBanker.FirstName = FirstNameTextBox.Text;
                CurrentMobileBanker.OtherName = OtherNameTextBox.Text;
                CurrentMobileBanker.LastName = LastNameTextBox.Text;
                CurrentMobileBanker.MobileBankerCode = MobileBankerCodeTextBox.Text;
                CurrentMobileBanker.Address = AddressTextBox.Text;
                CurrentMobileBanker.Telephone = TelephoneTextBox.Text;

                if (FileUpload1.HasFile)
                    CurrentMobileBanker.Photo = FileUpload1.FileBytes;


                foreach (MembersView2 item in GroupMembers)
                {
                    if (!CurrentMobileBanker.MobileBankerCustomers.Any(g => g.MemberId == item.MemberId))
                    {
                        CurrentMobileBanker.MobileBankerCustomers.Add(new MobileBankerCustomer() { MemberId = item.MemberId });
                        if (db.Investments.Count(i => i.MemberID == item.MemberId && i.InvestmentTypeId == SusuInvestmentTypeID) == 0)
                        {
                            //create sus investment for the current member
                            db.Investments.InsertOnSubmit(new Investment()
                            {
                                MemberID = item.MemberId,
                                InvestmentTypeId = SusuInvestmentTypeID,
                                IsActive = true,
                                IsMatured = false,
                                CreatedBy = HttpContext.Current.User.Identity.Name,
                                CreatedDate = DateTime.Now
                            });
                        }
                    }

                }
                CurrentMobileBanker.IsDeleted = false;


                //create susu investment for those who dont have

                db.MobileBankers.InsertOnSubmit(CurrentMobileBanker);
                db.SubmitChanges();


                //audit
                Utils.logAction("Insert", CurrentMobileBanker);

            }
            if (Request.QueryString["RedirectUrl"] == null)
            {
                //redirect to goups
                Response.Redirect("MobileBankersList.aspx");
            }
            else
            {
                Response.Redirect(Request.QueryString["RedirectUrl"] + "?mobiId=" + CurrentMobileBanker.MobileBankerid);
            }
        }


        //protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (CheckBox1.Checked)
        //    {
        //        txtAccountNumber.Enabled = false;
        //        txtAccountNumber.BackColor = System.Drawing.Color.YellowGreen;
        //    }
        //    else
        //    {
        //        txtAccountNumber.Enabled = true;
        //        txtAccountNumber.BackColor = System.Drawing.Color.White;
        //    }
        //}

    }
}