using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class HistoryList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var lstHistoryID = Convert.ToInt32(Request.QueryString["HistoryID"]);
            if (!IsPostBack)
            {
                loadGrid();
            }
        }

        private void loadGrid()
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.Masters.Where(n => (n.Name.Contains(GetSearchTerm().Name) || GetSearchTerm().Name == "") && (n.FathersName.Contains(GetSearchTerm().FathersName) || GetSearchTerm().FathersName == "")).Select(n => new
                {
                    n.Id,
                    n.HistoryNo,
                    Name = n.Name + " @" + n.Aliases,
                    n.FathersName,

                }).ToList();
                grdHistoryList.DataSource = records;
                grdHistoryList.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
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
            }
            return _Sterm;
        }
    }

}