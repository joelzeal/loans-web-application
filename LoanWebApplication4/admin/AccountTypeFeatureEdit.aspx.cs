using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace LoanWebApplication4.admin
{
    public partial class AccountTypeFeatureEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //bind months
                var months = CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;
                for (int i = 0; i < months.Length; i++)
                {
                    cboAnnualMonth.Items.Add(new ListItem(months[i], (i + 1).ToString()));
                }
                using (FinanceManagerDataContext db = new FinanceManagerDataContext())
                {
                    if (Request.QueryString["accType"] != null)
                    {

                        lblActionType.Text = "Edit";
                        lblAccountTypeName.Text = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == Convert.ToInt32(Request.QueryString["accType"])).Description;

                    }
                    else
                    {
                        lblActionType.Text = "New";
                    }

                    if (Request.QueryString["fid"] != null) //load existing account Type feature
                    {
                         AccountTypeFeature _accountFeature = db.AccountTypeFeatures.FirstOrDefault(f => f.AccountFeatureID == Convert.ToInt32(Request.QueryString["fid"]));
                        rbtnIsDeduction.Checked =  _accountFeature.IsDeduction.Value;
             rbtnAddition.Checked = !_accountFeature.IsDeduction.Value;
                        if (_accountFeature.IsPercentage.Value)
                        {
                            rbtnListPercentageOrFixed.SelectedIndex = 0;
                        }
                        else 
                        {
                            rbtnListPercentageOrFixed.SelectedIndex = 1;
                        }

                       cboCalculateOn.SelectedValue = _accountFeature.CalculateOn.ToString();
                       cboCalulationFreq.SelectedValue = _accountFeature.CalculationFrequencyID.ToString();
                       txtValueToApply.Text = _accountFeature.ValueToApply.ToString();
                       chkRunByEndOfDay.Checked = _accountFeature.RunByEndOfFay.Value;
                       
txtFeatureDescription.Text = _accountFeature.FeatureDescription  ;
                        switch (_accountFeature.CalculationFrequencyID)
                        {
                            case 1://monthly
                              cboDayOfMonth.SelectedValue =  _accountFeature.MonthlyCalculationDay.ToString();
                                break;
                            case 2://annially
                                cboAnnualMonth.SelectedValue = _accountFeature.AnnualCalculationMonth.ToString();
                                cboAnnualDayOfMonth.SelectedValue = _accountFeature.AnnualCalculationDay.ToString();
                                break;
                            case 3://custom
                                //_accountFeature.HasCustomCalculationFrequency = true;
                                txtCustomInterval.Text = _accountFeature.CustomCalculationFreqNumberOfDays.Value.ToString();
                                break;
                        }
                        RadioButtonList1_SelectedIndexChanged(sender, e);
                        cboAnnualMonth_SelectedIndexChanged(sender, e);
                        cboCalulationFreq_SelectedIndexChanged(sender, e);
                       
                    }
                }
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbtnListPercentageOrFixed.SelectedIndex == 0)
            {
                Label1.Text = "Percentage";
                //calculateOnRow.Visible = true;
            }
            else if (rbtnListPercentageOrFixed.SelectedIndex == 1)
            {
                Label1.Text = "Fixed";
                //calculateOnRow.Visible = false;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (FinanceManagerDataContext db = new FinanceManagerDataContext())
            {
                // AccountType accType = db.AccountTypes.FirstOrDefault(a => a.AccountTypeId == Convert.ToInt32(Request.QueryString["accType"]));
                AccountTypeFeature _accountFeature;// 

                if (Request.QueryString["fid"] != null)
                {
                    _accountFeature = db.AccountTypeFeatures.FirstOrDefault(f => f.AccountFeatureID == Convert.ToInt32(Request.QueryString["fid"]));
                }
                else
                {
                    _accountFeature = new AccountTypeFeature();
                }

                //_accountFeature.AccountTypeID = Convert.ToInt32(Request.QueryString["accType"]);
                _accountFeature.IsDeduction = rbtnIsDeduction.Checked;

                if (rbtnListPercentageOrFixed.SelectedIndex == 0)
                {
                    _accountFeature.IsPercentage = true;
                }
                else if (rbtnListPercentageOrFixed.SelectedIndex == 1)
                {
                    _accountFeature.IsPercentage = false;
                }

                _accountFeature.CalculateOn = Convert.ToInt32(cboCalculateOn.SelectedValue);
                _accountFeature.CalculationFrequencyID = Convert.ToInt32(cboCalulationFreq.SelectedValue);
                _accountFeature.AccountTypeID = Convert.ToInt32(Request.QueryString["accType"]);
                _accountFeature.RunByEndOfFay = chkRunByEndOfDay.Checked;
                _accountFeature.ValueToApply = Convert.ToDecimal( txtValueToApply.Text);
                _accountFeature.FeatureDescription = txtFeatureDescription.Text;

                switch (_accountFeature.CalculationFrequencyID)
                {
                    case 1://monthly
                        _accountFeature.MonthlyCalculationDay = Convert.ToInt32(cboDayOfMonth.SelectedValue);
                        break;
                    case 2://annially
                        _accountFeature.AnnualCalculationMonth = Convert.ToInt32(cboAnnualMonth.SelectedValue);
                        _accountFeature.AnnualCalculationDay = Convert.ToInt32(cboAnnualDayOfMonth.SelectedValue);
                        break;
                    case 3://custom
                        _accountFeature.HasCustomCalculationFrequency = true;
                        _accountFeature.CustomCalculationFreqNumberOfDays = Convert.ToInt32(txtCustomInterval.Text);
                        break;
                }
                // _accountFeature.IsPercentage = rbtnListPercentageOrFixed

                if (Request.QueryString["fid"] == null)
                {
                    db.AccountTypeFeatures.InsertOnSubmit(_accountFeature);
                }
                //save and redirect
                db.SubmitChanges();
                Response.Redirect("AccountTypeFeatures.aspx?accType=" + Request.QueryString["accType"]);
            }
        }

        protected void cboCalulationFreq_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (cboCalulationFreq.SelectedValue)
            {
                case "1"://monthly
                    MultiView1.SetActiveView(MonthlyFreqView);
                    //_accountFeature.MonthlyCalculationDay = 
                    break;
                case "2"://annially
                    MultiView1.SetActiveView(AnnualFreqView);
                    break;
                case "3"://custom
                    MultiView1.SetActiveView(CustomFreqView);
                    break;
            }
        }

        protected void cboAnnualMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboAnnualDayOfMonth.Items.Clear();
            int days = DateTime.DaysInMonth(DateTime.Now.Year, Convert.ToInt32( cboAnnualMonth.SelectedValue));
            for (int i = 0; i < days; i++)
            {
                cboAnnualDayOfMonth.Items.Add(new ListItem((i + 1).ToString(), i.ToString()));
            }
        }
    }
}