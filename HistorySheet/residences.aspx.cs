using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class residences : System.Web.UI.Page
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
        }

        private void loadGrid(int masterID)
        {
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.Residences.Where(n => n.P_ID == masterID).ToList();
                grdResidence.DataSource = records;
                grdResidence.DataBind();
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

        protected void grdResidence_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.Residences.Where(n => n.ID == ID).SingleOrDefault();
                    db.Residences.DeleteOnSubmit(record);
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void grdResidence_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            grdResidence.PageIndex = e.NewPageIndex;
            loadGrid(masterID);

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            if (masterID != 0)
            {
                Residence r = new Residence();
                r.P_ID = masterID;
                r.Country = txtCountry.Text;
                r.State = txtState.Text;
                r.District = txtDistrict.Text;
                r.PS = txtPoliceStation.Text;
                r.Address = txtAddress.Text;
                r.FequentlyVisiting = chkFrequentlyVisiting.Checked;
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.Residences.InsertOnSubmit(r); ;
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);      
                }
            }
        }
    }
}