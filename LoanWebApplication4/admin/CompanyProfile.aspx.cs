using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace LoanWebApplication4.admin
{
    public partial class CompanyProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Utils.IsAuthorized("Settings_CompanyProfile", "Open");


            if(!IsPostBack)
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                 addressTextBox.Text=cProfile.address;

                CompanyNameTextBox.Text = cProfile.CompanyName;
                EmailTextBox.Text = cProfile.Email;
                websiteTextBox.Text = cProfile.website;
                RMFICategoryText.Text = cProfile.RMFICategory;

            }
        }


        protected void item_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_CompanyProfile", "Edit");
        }

        protected void item_Deleting(object sender, SqlDataSourceCommandEventArgs e)
        {
            Utils.IsAuthorized("Settings_CompanyProfile", "Delete");
        }


        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            Utils.IsAuthorized("Settings_CompanyProfile", "Create");

            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            
            {
                LoanWebApplication4.CompanyProfile cProfile = db.CompanyProfiles.FirstOrDefault();
                cProfile.address = addressTextBox.Text;
                if(FileUpload1.HasFile){
                cProfile.CompanyLogo = FileUpload1.FileBytes;
                cProfile.LogoFileExt = Path.GetExtension(FileUpload1.FileName);
                };
                cProfile.CompanyName = CompanyNameTextBox.Text;
                cProfile.Email = EmailTextBox.Text;
                cProfile.website = websiteTextBox.Text;
                cProfile.RMFICategory = RMFICategoryText.Text;

                db.SubmitChanges();
            }
        }
    }
}