using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class enquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {

                    loadDetails(masterID);
                    loadGridView(masterID);
                }

            }
            loadReadonlyAttribute();
        }

        private void loadGridView(int masterID)
        {
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.EnquiryNotes.Where(n => n.P_ID == masterID).Select(n=> new { 
                n.ID,
                Date = n.Date.Value.ToShortDateString(),
                n.EntryTakenBy,
                n.Note,
                EntryDate = n.EntryDate.Value.ToShortDateString()
                }).ToList();
                grdEnquiry.DataSource = records;
                grdEnquiry.DataBind();

            }
        }

        private void loadReadonlyAttribute()
        {
            txtDate.Attributes.Add("readonly", "readonly");
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
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var enq = new EnquiryNote();
                    enq.P_ID = masterID;
                    enq.Date = globalMethods.getDate(txtDate.Text);
                    enq.Note = txtEnquiryReport.Text;
                    enq.EntryTakenBy = txtEnquiryTakenBy.Text;
                    enq.EntryDate = DateTime.Now;
                    db.EnquiryNotes.InsertOnSubmit(enq);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void grdEnquiry_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            grdEnquiry.PageIndex = e.NewPageIndex;
            loadGridView(masterID);
        }

        protected void grdEnquiry_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var ID = Convert.ToInt32(e.CommandArgument);
                    var record = db.EnquiryNotes.Where(n => n.ID == ID).SingleOrDefault();
                    db.EnquiryNotes.DeleteOnSubmit(record);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }
    }
}