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
            if (!IsPostBack)
            {
                importID.Value = "0";
                txtHistoryNo.Text = getHistoryNo().ToString();
                txtReportDate.Attributes.Add("readonly", "readonly"); 
            }
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
            int HistoryNo = getHistoryNo();
            var h = new Master();
            h.CrimeDBID = Convert.ToInt32(importID.Value);
            h.HistoryNo = HistoryNo.ToString();
            h.Category = ddlCategory.SelectedValue;
            h.HomeDistrict = txtDistrict.Text;
            h.PoliceStation = txtPoliceStation.Text;
            h.Name = txtName.Text;
            h.Aliases = txtAliases.Text;
            h.FathersName = txtFName.Text;
            h.Fathersaliases = txtFAliases.Text;
            h.IsHusband = Convert.ToBoolean(rblPrefix.SelectedValue);
            h.Gender = rblPrefix.SelectedValue;
            h.TradeProfession = txtProfession.Text; 
            h.CrimeDBID = Convert.ToInt32(importID.Value);
            h.DateofReport = getDate(txtReportDate.Text);
            h.YearBirth = getDate(txtBirthYear.Text);
            h.Height = getHeight(txtHeight.Text);
            h.Build = ddlBuild.SelectedValue;
            h.HairColor = txtHaircolor.Text;
            h.HairCut = txtHaircut.Text;
            h.Eyebrows = ddlEyebrow.SelectedValue;
            h.Forehead = ddlForehead.SelectedValue;
            h.Eyes = ddlEye.SelectedValue;
            h.Nose = ddlNose.SelectedValue;
            h.Mouth = ddlMouth.SelectedValue;
            h.Chin = ddlChin.SelectedValue;
            h.Teeth = ddlTeeth.SelectedValue;
            h.Fingers = ddlFingers.SelectedValue;
            h.Ears = ddlEars.SelectedValue;
            h.Face = ddlFace.SelectedValue;
            h.Complexion = ddlComplexion.SelectedValue;
            h.FacialHair = ddlFacialHair.SelectedValue;
            h.FacialHairType = ddlFacialHairType.SelectedValue;
            h.Marks = txtMarks.Text;
            h.Deformities = txtDeformities.Text;
            h.Manners = txtManners.Text;
            h.Gait = txtGait.Text;
            h.Speech = txtSpeech.Text;
            h.Appearance = txtAppreance.Text;
            h.Dressing = txtDressing.Text;
            h.Accomplishments = txtAcomplishment.Text;
            h.Habits = txtHabits.Text;
            h.BadHabits = txtBadHabits.Text;
            h.OtherDescriptivePoints = txtOtherPoints.Text;

            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                db.Masters.InsertOnSubmit(h);
                db.SubmitChanges();
                var ID = db.Masters.OrderByDescending(n => n.Id).Select(n=>n.Id).FirstOrDefault();
                Response.Redirect($"HistoryList.aspx?HistoryID={ID}");
            }
        }

        private double? getHeight(string text)
        {
            try
            {
                return Convert.ToDouble(txtHeight.Text.Substring(0, 4).Replace("_", ""));

            }
            catch
            {
                return null;
            }
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

        private int getHistoryNo()
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                int lastHistoryNo = Convert.ToInt32(db.Masters.OrderByDescending(n => n.Id).Select(n => n.HistoryNo).FirstOrDefault());
                if (lastHistoryNo == 0)
                {
                    return 1;
                }
                else
                {
                    return lastHistoryNo + 1;
                }

            }
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {

        }
    }
}