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
                    loadGrid(masterID);

                }
                addReadOnlyAttribute();

            }
        }

        private void loadGrid(int masterID)
        {
            if (masterID != 0)
            {
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var records = db.Convictions.Where(n => n.P_ID == masterID).Select(n=>new {
                        n.ID,
                        n.IsSR,
                        n.SRNo,
                        n.District,
                        n.PS,
                        n.CaseNo,
                        CaseDate = n.CaseDate.Value.ToShortDateString(),
                        n.Sections,
                        n.PropertyType,
                        n.PropertyValue,
                        Conviction = n.Conviction1,
                        n.MO,
                        n.Court,
                        ConvictionDate = n.ConvictionDate.Value.ToShortDateString(),
                        n.ConvitionSentence,
                        FPBDate=n.FPBDate.Value.ToShortDateString(),
                        n.FPBSerialNo,
                        n.IdentifyingWitness,
                        ReleaseDate=n.ReleaseDate.Value.ToShortDateString(),

                    }).ToList();
                    grdConvictions.DataSource = records;
                    grdConvictions.DataBind();
                }
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
            var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
            if (masterID != 0)
            {
                if (Page.IsValid)
                {
                    using (DBHistoryDataContext db = new DBHistoryDataContext())
                    {
                        Conviction con = new Conviction();
                        con.P_ID = masterID;
                        con.IsSR = chkIsSR.Checked;
                        con.SRNo = globalMethods.getNumber(txtSRNo.Text);
                        con.District = txtDistrict.Text;
                        con.PS = txtPS.Text;
                        con.CaseNo = globalMethods.getNumber(txtCaseNo.Text);
                        con.CaseDate = globalMethods.getDate(txtCaseDate.Text);
                        con.Sections = txtSections.Text;
                        con.MO = txtMO.Text;
                        con.Court = txtCourt.Text;
                        con.Conviction1 = txtConviction.Text;
                        con.ConvictionDate = globalMethods.getDate(txtConvictionDate.Text);
                        con.ConvitionSentence = txtConvitionSentence.Text;
                        con.FPBSerialNo = globalMethods.getNumber(txtFPBSerialNo.Text);
                        con.FPBDate = globalMethods.getDate(txtFPBDate.Text);
                        con.IdentifyingWitness = txtWitness.Text;
                        con.ReleaseDate = globalMethods.getDate(txtReleaseDate.Text);
                        db.Convictions.InsertOnSubmit(con);
                        db.SubmitChanges();
                        Response.Redirect(Request.RawUrl);

                    }
                }
            }
        }       

        protected void grdConvictions_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                var ID = Convert.ToInt32(e.CommandArgument);
                if (ID != 0)
                {
                    using(DBHistoryDataContext db = new DBHistoryDataContext())
                    {
                        var record = db.Convictions.Where(n => n.ID == ID).SingleOrDefault();
                        db.Convictions.DeleteOnSubmit(record);
                        db.SubmitChanges();
                        Response.Redirect(Request.RawUrl);
                    }
                }
            }
        }

        protected void grdConvictions_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdConvictions.PageIndex = e.NewPageIndex;
            loadGrid(Convert.ToInt32(Request.QueryString["H_Id"]));
        }
    }
}