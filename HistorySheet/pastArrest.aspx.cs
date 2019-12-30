using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class passtArrest : System.Web.UI.Page
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
                    loadReadonlyAttribute();
                }
            }
        }

        private void loadGrid(int masterID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.PastArrests.Where(n => n.P_ID == masterID).Select(n => new
                {
                    n.ID,
                    n.PS,
                    n.CaseNo,
                    Date=globalMethods.setDate(n.Date),
                    ArrestedDate = globalMethods.setDate(n.ArrestedDate),
                    n.Sections,
                    n.WhereArrested,
                }).ToList();
                grdPastArrest.DataSource = records;
                grdPastArrest.DataBind();
            }
        }


        private void loadReadonlyAttribute()
        {
            txtDate.Attributes.Add("readonly", "readonly");
            txtArrestDate.Attributes.Add("readonly", "readonly");
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
                    var pArrest = new PastArrest();
                    pArrest.P_ID = masterID;
                    pArrest.PS = txtPS.Text;
                    pArrest.CaseNo = globalMethods.getNumber(txtCaseNo.Text);
                    pArrest.Date = globalMethods.getDate(txtDate.Text);
                    pArrest.Sections = txtSection.Text;
                    pArrest.ArrestedDate = globalMethods.getDate(txtArrestDate.Text);
                    pArrest.WhereArrested = txtWhereArrested.Text;
                    db.PastArrests.InsertOnSubmit(pArrest);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void grdPastArrest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.PastArrests.Where(n => n.ID == ID).SingleOrDefault();
                    db.PastArrests.DeleteOnSubmit(record);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void grdPastArrest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            grdPastArrest.PageIndex = e.NewPageIndex;
            loadGrid(masterID);
        }
    }
}