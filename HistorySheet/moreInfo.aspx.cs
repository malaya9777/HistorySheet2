using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class moreInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    loadDetails(masterID);
                    loadMobileGrid(masterID);
                    loadBankGrid(masterID);
                    loadPoliticalGrid(masterID);
                }

            }
        }

        private void loadDetails(int masterID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var record = db.Masters.Where(n => n.Id == masterID).SingleOrDefault();
                Name.InnerText = record.Name + " @" + record.Aliases;
                fathersName.InnerText = "Father's name:" + record.FathersName + " @" + record.Fathersaliases;
                category.InnerText = "Category: " + record.Category;
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);

            if (masterID != 0)
            {
                var mobile = new MobileNumber();
                mobile.P_Id = masterID;
                mobile.MobileNumber1 = txtMobNumber.Text;
                mobile.Operator = txtOperator.Text;
                mobile.Status = ddlStatus.SelectedValue == "Active" ? true : false;
                mobile.ReportDate = DateTime.Now;

                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.MobileNumbers.InsertOnSubmit(mobile);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }


        }

        protected void grdMobile_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.MobileNumbers.Where(n => n.Id == ID).SingleOrDefault();
                    db.MobileNumbers.DeleteOnSubmit(record);
                    db.SubmitChanges();
                }
                Response.Redirect(Request.RawUrl);
            }
        }

        private void loadMobileGrid(int ID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {

                var records = db.MobileNumbers.Where(n => n.P_Id == ID).Select(n => new
                {
                    n.Id,
                    n.MobileNumber1,
                    n.Operator,
                    n.Status,
                    ReportDate = n.ReportDate.Value.ToShortDateString(),
                }).ToList();

                grdMobile.DataSource = records;
                grdMobile.DataBind();

            }
        }

        protected void btBankDetail_Click(object sender, EventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            if (masterID != 0)
            {
                var Bank = new BankAccount();
                Bank.P_Id = masterID;
                Bank.AccountNo = txtAcctNo.Text;
                Bank.BankName = txtBankDetail.Text;
                Bank.Balance = getNumber(txtBankBalance.Text);
                Bank.ReportedOn = DateTime.Now;

                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.BankAccounts.InsertOnSubmit(Bank);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);

                }
            }
        }

        private void loadBankGrid(int ID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                var records = db.BankAccounts.Where(n => n.P_Id == ID).Select(n => new
                {
                    n.Id,
                    n.BankName,
                    n.Balance,
                    ReportedOn = n.ReportedOn.Value.ToShortDateString(),
                }).ToList();

                grdBankDetail.DataSource = records;
                grdBankDetail.DataBind();
            }
        }

        protected void grdBankDetail_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var records = db.BankAccounts.Where(n => n.Id == ID).SingleOrDefault();
                    db.BankAccounts.DeleteOnSubmit(records);
                    db.SubmitChanges();
                }
                Response.Redirect(Request.RawUrl);
            }
        }

        private DateTime? getDate(string v)
        {
            try
            {
                return Convert.ToDateTime(v);
            }
            catch
            {
                return null;
            }
        }
        private int? getNumber(string v)
        {
            try
            {
                return Convert.ToInt32(v);
            }
            catch (Exception)
            {

                return null;
            }
        }

        protected void btnAddPolitical_Click(object sender, EventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            if (masterID != 0)
            {

                var Political = new PoliticalLink();
                Political.P_Id = masterID;
                Political.Name = txtNamePolitical.Text;
                Political.Status = ddlStatus2.SelectedValue == "Active" ? true : false;
                Political.Since = getDate(txtSince.Text);
                Political.ReportedOn = DateTime.Now;

                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.PoliticalLinks.InsertOnSubmit(Political);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void grdPoliticalLink_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);

                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var records = db.PoliticalLinks.Where(n => n.Id == ID).SingleOrDefault();
                    db.PoliticalLinks.DeleteOnSubmit(records);
                    db.SubmitChanges();

                }
                Response.Redirect(Request.RawUrl);
            }
        }

        private void loadPoliticalGrid(int ID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
               
                var records = db.PoliticalLinks.Where(n => n.P_Id == ID).Select(n => new
                {
                    n.Id,
                    n.Name,
                    n.Status,
                    Since = n.Since.Value.ToShortDateString(),
                    ReportedOn = n.ReportedOn.Value.ToShortDateString(),
                }).ToList();

                grdPoliticalLink.DataSource = records;
                grdPoliticalLink.DataBind();
            }

        }
    }
}