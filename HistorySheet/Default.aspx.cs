using System;
using System.Collections.Generic;
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
                var records = db.Masters.Select(n => new
                {
                    n.Id,
                    n.CrimeDBID,
                    n.SPMODBID,
                    n.HistoryNo,
                    n.Category,
                    PanelColor = getPanelColor(n.Category),
                    n.HomeDistrict,
                    n.PoliceStation,
                    n.DateofReport,
                    n.Name,
                    n.Aliases,
                    n.Gender,
                    n.FathersName,
                    n.Fathersaliases,
                    n.IsHusband,
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
                    n.LastUpdate
                }).ToList();
                grdList.DataSource = records;
                grdList.DataBind();
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

        }

        protected void grdList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
    }
}