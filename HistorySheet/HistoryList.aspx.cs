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
                var records = db.Masters.Select(n => new
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
    }
}