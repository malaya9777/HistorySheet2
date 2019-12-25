using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void grdAccused_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            var ID = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "import")
            {
                using (DBCrimeDataContext db = new DBCrimeDataContext())
                {
                    var record = db.Tbl_Criminals.Where(n => n.ID == ID).SingleOrDefault();
                    importID.Value = record.ID.ToString();
                    txtPoliceStation.Text = record.Police_Station;
                    txtName.Text = record.Name;
                    txtAliases.Text = record.Short_Name;
                    txtFName.Text = record.Accused_FName;
                    txtProfession.Text = record.Occupation;
                    txtBirthYear.Text = record.YearofBirth;
                    txtHeight.Text = record.Height;
                    ddlBuild.SelectedValue = record.Built;
                    txtHabits.Text = record.Habits;
                    ddlComplexion.SelectedValue = record.Skin_Color;
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

        protected void grdAccused_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdAccused.PageIndex = e.NewPageIndex;
            loadGrid(txtSearch.Text);
            mpe1.Show();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var date = txtReportDate.Text;

        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {

        }
    }
}