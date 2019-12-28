﻿using System;
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
                mobile.ReportDate = Convert.ToDateTime(txtReportDate.Text);

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
                    n.ReportDate,
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
                Bank.BankName = txtBankBalance.Text;
                Bank.Balance = getNumber(txtBankBalance.Text);
                Bank.ReportedOn = getDate(txtReportDate.Text);

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
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                var records = db.BankAccounts.Where(n => n.P_Id == ID).Select(n => new
                {
                    n.Id,
                    n.BankName,
                    n.Balance,
                    n.ReportedOn,
                }).ToList();

                grdBankDetail.DataSource = records;
                grdBankDetail.DataBind();
            }
        }

        protected void grdBankDetail_RowCommand(object sender, GridViewCommandEventArgs e)
        {

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
    }
}