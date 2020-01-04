using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class offence : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    loadDetails(masterID);
                    loadReadonlyAttribute(masterID);
                    loadGrid(masterID);

                }
                else
                {
                    Response.Redirect("HistoryList");
                }

            }
        }

        private void loadGrid(int masterID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.Offences.Where(n => n.P_ID == masterID).ToList();
                grdOffence.DataSource = records;
                grdOffence.DataBind();

            }
        }

        private void loadReadonlyAttribute(int masterID)
        {
            globalMethods.readonlyTextbox(txtCaseDate);
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
                var off = new Offence();
                off.P_ID = masterID;
                off.PS = txtPS.Text;
                off.CaseNo = globalMethods.getNumber(txtCaseNo.Text);
                off.Date = globalMethods.getDate(txtCaseDate.Text);
                off.Sections = txtSection.Text;
                off.MODetails = txtMOdetails.Text;
                off.Remarks = txtRemarks.Text;
                off.Important = chkIsImportant.Checked;
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.Offences.InsertOnSubmit(off);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }

            }
        }

        protected void grdOffence_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.Offences.Where(n => n.ID == ID).SingleOrDefault();
                    db.Offences.DeleteOnSubmit(record);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void grdOffence_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdOffence.PageIndex = e.NewPageIndex;
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            loadGrid(masterID);
        }
    }
}