using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class associates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    loadDetails(masterID);
                    loadAssociates(masterID);
                }
                else
                {
                    Response.Redirect("HistoryList");
                }

            }
        }

        private void loadAssociates(int masterID)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var associates = db.Associates.Where(n => n.P_ID == masterID).ToList();
                grdAssociates.DataSource = associates;
                grdAssociates.DataBind();
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

        protected void grdAccused_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAccused.PageIndex = e.NewPageIndex;
            loadGrid(txtSearch.Text);
            mpe1.Show();
        }

        protected void grdAccused_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var ID = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "import")
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    using (DBCrimeDataContext db = new DBCrimeDataContext())
                    {
                        var record = db.Tbl_Criminals.Where(n => n.ID == ID).SingleOrDefault();
                        var aso = new Associate();
                        aso.P_ID = masterID;
                        aso.IsAccused = true;
                        aso.AccusedID = record.ID;
                        aso.IsHistorySheeter = false;
                        aso.Name = record.Name;
                        aso.Aliases = record.Short_Name;
                        aso.FathersName = record.Accused_FName;
                        aso.Residence = $"{record.Address1}, {record.Address2}, {record.Address3}";
                        aso.Occupation = record.Occupation;
                        aso.AssociationNature = "Normal";
                        using (DBHistoryDataContext hdb = new DBHistoryDataContext())
                        {
                            hdb.Associates.InsertOnSubmit(aso);
                            hdb.SubmitChanges();
                            Response.Redirect(Request.RawUrl);

                        }

                    }
                }


            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text != "")
            {
                loadGrid(txtSearch.Text);

            }
            mpe1.Show();
        }
        private void loadGrid(string text)
        {
            using (DBCrimeDataContext db = new DBCrimeDataContext())
            {
                var records = db.Tbl_Criminals.Where(n => n.Name.Contains(text)).Select(n => new
                {
                    n.ID,
                    accusedName = string.Format("{0} @{1}", n.Name, n.Short_Name),
                    accusedFathersName = n.Accused_FName,
                    accusedAddress = string.Format("{0}, {1}, {2}", n.Address1, n.Address2, n.Address3),

                }).ToList();

                grdAccused.DataSource = records;
                grdAccused.DataBind();
            }
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
                var records = db.Masters.Where(n => n.Name.Contains(name) && n.Id!=masterID).Select(n => new
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
                        var aso = new Associate();
                        aso.P_ID = masterID;
                        aso.IsAccused = false;
                        aso.IsHistorySheeter = true;
                        aso.HistoryMasterID = record.Id;
                        aso.Name = record.Name;
                        aso.Aliases = record.Aliases;
                        aso.FathersName = record.FathersName;
                        aso.Occupation = record.TradeProfession;
                        aso.Residence = "";
                        aso.AssociationNature = "Normal";
                        db.Associates.InsertOnSubmit(aso);
                        db.SubmitChanges();
                    }
                }
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void grdHistoryList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdHistoryList.PageIndex = e.NewPageIndex;
            loadHistory(txtSearch2.Text);
            mpe2.Show();
        }

        protected void grdAssociates_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.Associates.Where(n => n.ID == ID).SingleOrDefault();
                    db.Associates.DeleteOnSubmit(record);
                    db.SubmitChanges();
                }
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void grdAssociates_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            grdAssociates.PageIndex = e.NewPageIndex;
            loadAssociates(masterID);

        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    Associate aso = new Associate();
                    aso.P_ID = Convert.ToInt32(Request.QueryString["H_Id"]);
                    aso.IsAccused = false;
                    aso.IsHistorySheeter = false;
                    aso.Name = txtName.Text;
                    aso.FathersName = txtFatherName.Text;
                    aso.Aliases = txtAliases.Text;
                    aso.Residence = txtResidence.Text;
                    aso.AssociationNature = "Normal";
                    db.Associates.InsertOnSubmit(aso);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);

                }
            }
        }
    }
}