using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class convictions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    loadDetails(masterID);                  
                   
                }
                addReadOnlyAttribute();

            }
        }

        private void addReadOnlyAttribute()
        {
            txtCaseDate.Attributes.Add("readonly", "readonly");
            txtConvictionDate.Attributes.Add("readonly", "readonly");
            txtFPBDate.Attributes.Add("readonly", "readonly");
            txtReleaseDate.Attributes.Add("readonly", "readonly");
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
       

        protected void chkIsSR_CheckedChanged(object sender, EventArgs e)
        {
            if (chkIsSR.Checked)
            {
                txtSRNo.Enabled = true;
            }
            else
            {
                txtSRNo.Enabled = false;
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

        }
        private DateTime? getDate(string v)
        {
            try
            {
                return Convert.ToDateTime(v);
            }
            catch
            {
                return null;
            }
        }
    }
}