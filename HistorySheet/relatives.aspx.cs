using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class relatives : System.Web.UI.Page
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
            globalMethods.readonlyTextbox(txtHistoryID);
        }

        private void loadGrid(int masterID)
        {
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.Relates.Where(n => n.P_ID == masterID).ToList();

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
            if (masterID != 0)
            {
                Relate r = new Relate();
                r.RefMasterID = globalMethods.getNumber(txtHistoryID.Text);
                r.Name = txtName.Text;
                r.Aliases = txtAliases.Text;
                r.FathersName = txtFathersName.Text;
                r.Relationship = txtRelationship.Text;
                r.Address = txtAddress.Text;
                r.Occupation = txtOccupation.Text;
                r.Mobile = txtMobileNumber.Text;
                r.BankAccount = txtAccountNumber.Text;
                r.NameofBank = txtBankName.Text;
                r.IFSC = txtIFSC.Text;
                r.Image = fu1.FileBytes;
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.Relates.InsertOnSubmit(r);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }
    }
}