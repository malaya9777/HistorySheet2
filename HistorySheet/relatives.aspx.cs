using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class relatives : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    loadDetails(masterID);
                    loadGrid(masterID);

                }
            }
            globalMethods.readonlyTextbox(txtHistoryID);
        }

        private void loadGrid(int masterID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.Relates.Where(n => n.P_ID == masterID).Select(n => new
                {
                    n.ID,
                    n.P_ID,
                    n.RefMasterID,
                    n.Name,
                    n.Aliases,
                    n.FathersName,
                    n.Relationship,
                    n.Address,
                    n.Occupation,
                    n.Mobile,
                    n.BankAccount,
                    n.NameofBank,
                    n.IFSC,
                    Image = n.Image.ToArray()
                }).ToList();
                grdRelative.DataSource = records;
                grdRelative.DataBind();

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
                Relate r = new Relate();
                r.RefMasterID = globalMethods.getNumber(txtHistoryID.Text);
                r.P_ID = masterID;
                r.Name = txtName.Text;
                r.Aliases = txtAliases.Text;
                r.FathersName = txtFathersName.Text;
                r.Relationship = txtRelationship.Text;
                r.Address = txtAddress.Text;
                r.Occupation = txtOccupation.Text;
                r.Mobile = txtMobileNumber.Text;
                r.BankAccount = txtAccountNumber.Text;
                r.NameofBank = txtBankName.Text;
                r.IFSC = txtIFSC.Text;
                r.Image = fu1.FileBytes;
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.Relates.InsertOnSubmit(r);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void grdRelative_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.Relates.Where(n => n.ID == ID).SingleOrDefault();
                    db.Relates.DeleteOnSubmit(record);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void grdRelative_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            grdRelative.PageIndex = e.NewPageIndex;
            loadGrid(masterID);
        }

        protected void btnSearchHistory_Click(object sender, EventArgs e)
        {
            if (txtSearch2.Text != string.Empty)
            {
                loadHistory(txtSearch2.Text);
            }
            mpe2.Show();
        }
        private void loadHistory(string name)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                var records = db.Masters.Where(n => n.Name.Contains(name) && n.Id != masterID).Select(n => new
                {
                    n.Id,
                    n.Name,
                    n.FathersName,
                    Address = ""
                }).ToList();
                grdHistoryList.DataSource = records;
                grdHistoryList.DataBind();
            }
        }

        protected void grdHistoryList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var ID = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "import")
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    using (DBHistoryDataContext db = new DBHistoryDataContext())
                    {
                        var record = db.Masters.Where(n => n.Id == ID).SingleOrDefault();
                        txtHistoryID.Text = record.Id.ToString();
                        txtName.Text = record.Name;
                        txtAliases.Text = record.Aliases;
                        txtFathersName.Text = record.FathersName;
                        txtOccupation.Text = record.TradeProfession;
                    }
                }
            }
            
        }

        protected void grdHistoryList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHistoryList.PageIndex = e.NewPageIndex;
            loadHistory(txtSearch2.Text);
            mpe2.Show();
        }
    }
}