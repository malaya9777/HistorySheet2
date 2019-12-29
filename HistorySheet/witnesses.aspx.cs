using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class witnesses : System.Web.UI.Page
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

        protected void grdWitness_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            if(masterID != 0)
            {
                var witness = new Witness();
                witness.P_ID = masterID;
                witness.Name = txtName.Text;
                witness.Gender = ddlGender.SelectedValue;
                witness.DOB = Convert.ToDateTime(txtDOB.Text);
                witness.FathersName = txtFName.Text;
                witness.Address = txtAddress.Text;
                
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.Witnesses.InsertOnSubmit(witness);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }
            }
        }
    }
}