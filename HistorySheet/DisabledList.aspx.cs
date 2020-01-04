using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class DisabledList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGrid();
            }
            
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            loadGrid();
        }

        protected void grdDisabledList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "enable")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.Masters.Where(n => n.Id == ID).SingleOrDefault();
                    record.Disabled = false;
                    db.SubmitChanges();
                    loadGrid();
                }
            }
        }

        private void loadGrid()
        {
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.Masters.Where(n => n.Disabled == true && (n.Name.Contains(GetSearchTerm().Name) || GetSearchTerm().Name == "") && (n.FathersName.Contains(GetSearchTerm().FathersName) || GetSearchTerm().FathersName == "")).Select(n => new
                {
                    n.Id,
                    n.Name,
                    n.FathersName,
                    n.HistoryNo,
                    n.DateofReport
                }).ToList();
                grdDisabledList.DataSource = records;
                grdDisabledList.DataBind();
            }
        }

        protected void grdDisabledList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdDisabledList.PageIndex = e.NewPageIndex;
            loadGrid();
        }
        public SearchTerm GetSearchTerm()
        {
            var _Sterm = new SearchTerm();
            switch (lstSearchTerm.SelectedValue)
            {
                case "Name":
                    _Sterm.Name = txtSearchbox.Text;
                    break;
                case "FName":
                    _Sterm.FathersName = txtSearchbox.Text;
                    break;
                case "Account":
                    _Sterm.AccountNo = txtSearchbox.Text;
                    break;
                case "Mobile":
                    _Sterm.Mobile = txtSearchbox.Text;
                    break;
            }
            return _Sterm;
        }
    }
}