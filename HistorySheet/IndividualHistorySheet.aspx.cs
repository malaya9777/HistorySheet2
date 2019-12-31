using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class IndividualHistorySheet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var ID = Convert.ToInt32(Request.QueryString["H_ID"]);
                if (ID != 0)
                {
                    loadDetails(ID);
                }

            }
        }

        private void loadDetails(int ID)
        {
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var record = db.Masters.Where(n => n.Id == ID).SingleOrDefault();
                historyNo.InnerText = record.HistoryNo;
                homeDistrict.InnerText = record.HomeDistrict;
                policeStation.InnerText = record.PoliceStation;
                dateofOpening.InnerText =record.DateofReport==null?"": record.DateofReport.Value.ToString("dd-MMM-yyyy");
                Name.InnerText = record.Name;
                Aname.InnerText = record.Aliases;
                FnameHname.InnerText = record.FathersName;
                Trade.InnerText = record.TradeProfession;
                yearofbirth.InnerText = record.YearBirth;
                Height.InnerText = record.Height.ToString()+" Inch";
                built.InnerText = record.Build;
                hair.InnerText = record.HairColor;
                eyebrow.InnerText = record.Eyebrows;
                forehead.InnerText = record.Forehead;
                eyes.InnerText = record.Eyes;
                nose.InnerText = record.Nose;
                mouth.InnerText = record.Mouth;
                chin.InnerText = record.Chin;
                teeth.InnerText = record.Teeth;
                finger.InnerText = record.Fingers;
                ears.InnerText = record.Ears;
                face.InnerText = record.Face;
                complexion.InnerText = record.Complexion;
                facialhair.InnerText = record.FacialHair;
                facialhairtype.InnerText = record.FacialHairType;
                marks.InnerText = record.Marks;
                deformities.InnerText = record.Deformities;
                manners.InnerText = record.Manners;
                gait.InnerText = record.Gait;
                speech.InnerText = record.Speech;
                appearance.InnerText = record.Appearance;
                dressing.InnerText = record.Dressing;
                accomplishments.InnerText = record.Accomplishments;
                habits.InnerText = record.Habits;
                badhabits.InnerText = record.BadHabits;
                otherDescriptivePoints.InnerText = record.OtherDescriptivePoints;
                loadPhotos(ID);


            }
        }

        private void loadPhotos(int iD)
        {
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var images = db.Photographs_FPs.Where(n => n.P_ID == iD).ToList();
                if (images.Count() > 0)
                {
                    string emptyImageHTML = "";
                    string emptyFPHTML = "";
                    foreach(var img in images)
                    {
                        if (img.IsFingerPrint == false)
                        {
                            emptyImageHTML += "<div><img src=\"data:image;base64," + Convert.ToBase64String(img.Image.ToArray()) + "\" style='width:150px;'></div>";
                        }
                        else
                        {
                            emptyFPHTML += "<div><img src=\"data:image;base64," + Convert.ToBase64String(img.Image.ToArray()) + "\" style='width:150px;'></div>";
                        }
                        
                    }
                    imgContainer.InnerHtml = emptyImageHTML;
                    fingerprintContainer.InnerHtml = emptyFPHTML;
                }
            }
        }
    }
}