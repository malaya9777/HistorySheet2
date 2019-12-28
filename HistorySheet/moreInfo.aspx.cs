using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class moreInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                    loadDetails(masterID);

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

            if(masterID != 0)
            {
                var mobile = new MobileNumber();
                mobile.P_Id = masterID;
                mobile.MobileNumber1 = txtMobNumber.Text;
                mobile.Operator = txtOperator.Text;
                mobile.Status = ddlStatus.SelectedValue == "Active" ? true:false ;
                mobile.ReportDate = Convert.ToDateTime(txtReportDate.Text);

                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.MobileNumbers.InsertOnSubmit(mobile);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
            
            
        }
    }
}