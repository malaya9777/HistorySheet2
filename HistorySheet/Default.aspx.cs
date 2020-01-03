using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGrid();
            }
        }

        private void loadGrid()
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var records = db.vw_Masters.Where(n => (n.Name.Contains(GetSearchTerm().Name) || GetSearchTerm().Name == "") && (n.FathersName.Contains(GetSearchTerm().FathersName) || GetSearchTerm().FathersName == "") && (n.MobileNumber.Contains(GetSearchTerm().Mobile) || GetSearchTerm().Mobile == "") && (n.AccountNo.Contains(GetSearchTerm().AccountNo) || GetSearchTerm().AccountNo == "") && (n.Disabled == false || n.Disabled == null)).Select(n => new
                {
                    n.Id,
                    n.CrimeDBID,
                    n.SPMODBID,
                    n.HistoryNo,
                    n.Category,
                    PanelColor = getPanelColor(n.Category),
                    Image = getImage(n.Id),
                    n.HomeDistrict,
                    n.PoliceStation,
                    n.DateofReport,
                    n.Name,
                    n.Aliases,
                    n.Gender,
                    n.FathersName,
                    n.Fathersaliases,
                    n.IsHusband,
                    Prefix = n.IsHusband == true ? "Husband's" : "Father's",
                    n.TradeProfession,
                    n.YearBirth,
                    n.Height,
                    n.Build,
                    n.HairColor,
                    n.HairCut,
                    n.Eyebrows,
                    n.Forehead,
                    n.Eyes,
                    n.Nose,
                    n.Mouth,
                    n.Chin,
                    n.Teeth,
                    n.Fingers,
                    n.Ears,
                    n.Face,
                    n.Complexion,
                    n.FacialHair,
                    n.FacialHairType,
                    n.Marks,
                    n.Gait,
                    n.Speech,
                    n.Appearance,
                    n.Dressing,
                    n.Accomplishments,
                    n.Habits,
                    n.BadHabits,
                    n.OtherDescriptivePoints,
                    n.LastUpdate,
                    lastEnquiry = lastEnquiry(n.Id, n.DateofReport),
                    LastEnquiryDate = LastEnquiryDate(n.Id, n.DateofReport),
                    pendingWarning = getWarning(n.Id, n.DateofReport)
                }).Distinct();
                grdList.DataSource = records;
                grdList.DataBind();
            }
        }

        private string getWarning(int id, DateTime? dateofReport)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                int days;
                var date = db.EnquiryNotes.Where(n => n.P_ID == id).OrderByDescending(n => n.Date).Select(n => n.Date).SingleOrDefault();
                if (date == null)
                {
                    days = (int)(DateTime.Now.Date - dateofReport).Value.TotalDays;
                }
                else
                {
                    days = (int)(DateTime.Now.Date - date).Value.TotalDays;
                }
                if (days > 30)
                {
                    return "danger";
                }
                else
                {
                    return "success";
                }
            }
        }

        private DateTime? LastEnquiryDate(int id, DateTime? opningDate)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var date = db.EnquiryNotes.Where(n => n.P_ID == id).OrderByDescending(n => n.Date).Select(n => n.Date).SingleOrDefault();
                if (date == null)
                {
                    return opningDate;
                }
                return date;
            }
        }
        public int lastEnquiry(int id, DateTime? opningDate)
        {

            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var date = db.EnquiryNotes.Where(n => n.P_ID == id).OrderByDescending(n => n.Date).Select(n => n.Date).SingleOrDefault();
                if (date == null)
                {
                    return (int)(DateTime.Now.Date - opningDate).Value.TotalDays;
                }
                return (int)(DateTime.Now.Date - date).Value.TotalDays;
            }


        }

        private Array getImage(int id)
        {
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var image = db.Photographs_FPs.Where(s => s.P_ID == id && s.IsFingerPrint == false).Select(s => s.Image).FirstOrDefault();
                if (image != null)
                {
                    return image.ToArray();
                }
                else
                {
                    var path = Server.MapPath(@"\DefaultImg\default.jpg");
                    return File.ReadAllBytes(path);
                }
            }

        }

        private string getPanelColor(string category)
        {
            switch (category)
            {
                case "A":
                    return "primary";

                case "B":
                    return "success";

                case "C":
                    return "warning";

                default:
                    return "primary";
            }
        }

        protected void grdList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "disable")
            {
                var id = Convert.ToInt32(e.CommandArgument);
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var record = db.Masters.Where(n => n.Id == id).SingleOrDefault();
                    record.Disabled = true;
                    db.SubmitChanges();                  

                }
            }
        }
        protected void grdList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdList.PageIndex = e.NewPageIndex;
            loadGrid();
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
    public class SearchTerm
    {
        public string Name { get; set; } = "";
        public string FathersName { get; set; } = "";
        public string AccountNo { get; set; } = "";
        public string Mobile { get; set; } = "";
    }
}