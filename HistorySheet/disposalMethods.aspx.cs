using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class disposalMethods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {                    
                    loadDetails(masterID);
                    loadGridDetails(masterID);
                }

            }
            addReadonlyAttribute();
        }

        private void loadGridDetails(int masterID)
        {
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.DisposalMethods.Where(n => n.P_ID == masterID).ToList();
                grdDisposalMethod.DataSource = records;
                grdDisposalMethod.DataBind();

            }
        }

        private void addReadonlyAttribute()
        {
            txtHistoryID.Attributes.Add("readonly", "readonly");
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
                var method = new DisposalMethod();
                method.P_ID = masterID;
                method.MasterID = getNumber(txtHistoryID.Text);
                method.Method = txtMethod.Text;
                method.ReceiverName = txtReceiverName.Text;
                method.ReceiverAddress = txtReceiverAddress.Text;
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.DisposalMethods.InsertOnSubmit(method);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
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
                        txtReceiverName.Text = record.Name;

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
        protected void btnSearchHistory_Click(object sender, EventArgs e)
        {
            if (txtSearch2.Text != string.Empty)
            {
                loadHistory(txtSearch2.Text);
            }
            mpe2.Show();
        }

        protected void grdDisposalMethod_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.DisposalMethods.Where(n => n.ID == ID).SingleOrDefault();
                    db.DisposalMethods.DeleteOnSubmit(record);
                    db.SubmitChanges();
                }
            }
        }

        protected void grdDisposalMethod_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            grdDisposalMethod.PageIndex = e.NewPageIndex;
            loadGridDetails(masterID);
        }
    }
}