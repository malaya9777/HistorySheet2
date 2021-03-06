﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class suspectedIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    loadDetails(masterID);
                    loadSuspectGrid(masterID);
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

        protected void chkSR_CheckedChanged(object sender, EventArgs e)
        {
            if (chkSR.Checked)
            {
                txtSRNo.Enabled = true;
                txtPropertyKind.Enabled = true;
                txtPropertyValue.Enabled = true;
            }
            else
            {
                txtSRNo.Enabled = false;
                txtPropertyKind.Enabled = false;
                txtPropertyValue.Enabled = false;
            }


        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);

            if (masterID != 0)
            {
                if (Page.IsValid)
                {
                    using (DBHistoryDataContext db = new DBHistoryDataContext())
                    {
                        var suspect = new SuspectedCase();
                        suspect.P_ID = masterID;
                        suspect.IsSR = chkSR.Checked;
                        suspect.District = txtDistrict.Text;
                        suspect.PS = txtPS.Text;
                        suspect.CaseNo = getNumber(txtCaseNo.Text);
                        suspect.CaseDate = getDate(txtCaseDate.Text);
                        suspect.SRNo = getNumber(txtSRNo.Text);
                        suspect.PropertyKind = txtPropertyKind.Text;
                        suspect.PropertyValue = txtPropertyValue.Text;
                        suspect.MODetails = txtMODetails.Text;
                        suspect.Sections = txtSections.Text;
                        db.SuspectedCases.InsertOnSubmit(suspect);
                        db.SubmitChanges();
                        Response.Redirect(Request.RawUrl);
                    }
                }
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

        private void loadSuspectGrid(int ID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.SuspectedCases.Where(n => n.P_ID == ID).Select(n => new
                {
                    n.ID,
                    n.District,
                    n.PS,
                    n.CaseNo,
                    n.CaseDate,
                    n.SRNo,
                    n.PropertyKind,
                    n.PropertyValue,
                }).ToList();

                grdSuspect.DataSource = records;
                grdSuspect.DataBind();
            }
        }
       
        protected void grdSuspect_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var records = db.SuspectedCases.Where(n => n.ID == ID).SingleOrDefault();
                    db.SuspectedCases.DeleteOnSubmit(records);
                    db.SubmitChanges();
                }
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}