using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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

                var images = db.Photographs_FPs.Where(n => n.P_ID == ID).ToList();
                loadImages(images);
                var witnesses = db.Witnesses.Where(n => n.P_ID == ID).ToList();
                loadWitnesses(witnesses);
                var residence = db.Residences.Where(n => n.P_ID == ID).ToList();
                loadResidence(residence);
                var offence = db.Offences.Where(n => n.P_ID == ID).ToList();
                loadOffence(offence);
                var associates = db.Associates.Where(n => n.P_ID == ID).ToList();
                loadAssociates(associates);
                var relatives = db.Relates.Where(n => n.P_ID == ID).ToList();
                loadRelatives(relatives);
                var disposalMethod = db.DisposalMethods.Where(n => n.P_ID == ID).ToList();
                loadDisposalMethod(disposalMethod);
                var pastArrest = db.PastArrests.Where(n => n.P_ID == ID).ToList();
                loadPastArrest(pastArrest);
                var suspected = db.SuspectedCases.Where(n => n.P_ID == ID).ToList();
                loadSuspected(suspected);
                var conviction = db.Convictions.Where(n => n.P_ID == ID).ToList();
                loadConviction(conviction);
                var enquiry = db.EnquiryNotes.Where(n => n.P_ID == ID).ToList();
                loadEnquiry(enquiry);             


            }
        }

        private void loadEnquiry(List<EnquiryNote> enquiry)
        {
            if (enquiry.Count > 0)
            {
                foreach(var e in enquiry)
                {
                    HtmlTableRow row = new HtmlTableRow();
                    row.Cells.Add(getHTMLCell($"<p>Date: {e.Date.Value.ToString("dd-MMM-yyyy")}</p>"));
                    row.Cells.Add(getHTMLCell($"<p>{e.Note}</p>"));
                    row.Cells.Add(getHTMLCell($"<p></p>"));
                    tblEnquiryNote.Rows.Add(row);
                    
                }
            }
        }

        private void loadConviction(List<Conviction> conviction)
        {
            if (conviction.Count > 0)
            {
                foreach(var c in conviction)
                {
                    HtmlTableCell td1 = getHTMLCell($"<p>Sections: {c.Sections}</p><p>MO Details: {c.MO}</p><p>Is SR: {c.IsSR}</p><p>SR No: {c.SRNo}</p>");
                    HtmlTableCell td2 = getHTMLCell($"<p>District: {c.District}</p><p>Police Station: {c.PS}</p><p>Case No: {c.CaseNo}</p><p>Case Date: {c.CaseDate.Value.ToString("dd-MMM-yyyy")}</p><p>Sections: {c.Sections}</p>");
                    HtmlTableCell td3 = getHTMLCell($"<p>Kind of Property:{c.PropertyType}</p><p>Property Value:Rs.{c.PropertyValue}</p>");
                    HtmlTableCell td4 = getHTMLCell($"<p>Court:{c.Court}</p><p>Conviction:{c.Conviction1}</p><p>Conviction Date:{c.ConvictionDate.Value.ToString("dd-MMM-yyyy")}</p><p>Sentence: {c.ConvitionSentence}</p>");
                    HtmlTableCell td5 = getHTMLCell($"<p>F.P.B.:{c.FPBSerialNo}</p><p>F.P.B. Date:{c.FPBDate.Value.ToString("dd-MMM-yyyy")}</p><p>Identifing Witnesses:{c.IdentifyingWitness}</p><p>Date of Release: {c.ReleaseDate.Value.ToString("dd-MMM-yyyy")}</p>");
                    HtmlTableRow row = new HtmlTableRow();
                    row.Cells.Add(td1);
                    row.Cells.Add(td2);
                    row.Cells.Add(td3);
                    row.Cells.Add(td4);
                    row.Cells.Add(td5);
                    tblConviction.Rows.Add(row);
                }
            }
        }

        private HtmlTableCell getHTMLCell(string v)
        {
            var newCell = new HtmlTableCell();
            newCell.InnerHtml = v;
            return newCell;
        }

        private void loadSuspected(List<SuspectedCase> suspected)
        {
            if (suspected.Count > 0)
            {
                foreach(var s in suspected)
                {
                    HtmlTableCell td1 = new HtmlTableCell();
                    td1.InnerHtml = $"<p>Sections: {s.Sections}<p><p>MO Details: {s.MODetails}</p><p>Is a SR:{s.IsSR}</p><p>SR No:{s.SRNo}</p>";
                    HtmlTableCell td2 = new HtmlTableCell();
                    td2.InnerHtml = $"<p>District:{s.District}</p><p>Case No:{s.CaseNo}</p><p>{s.CaseDate.Value.ToString("dd-MMM-yy")}</p>";
                    HtmlTableCell td3 = new HtmlTableCell();
                    td3.InnerHtml = $"<p>{s.PropertyKind}, {s.PropertyValue}</p>";
                    HtmlTableCell td4 = new HtmlTableCell();
                    td4.InnerHtml = $"<p>{s.Remarks}</p>";

                    HtmlTableRow row = new HtmlTableRow();
                    row.Cells.Add(td1);
                    row.Cells.Add(td2);
                    row.Cells.Add(td3);
                    row.Cells.Add(td4);
                    tblSuspected.Rows.Add(row);
                }
                
            }
        }

        private void loadPastArrest(List<PastArrest> pastArrest)
        {
            if (pastArrest.Count > 0)
            {
                foreach(var p in pastArrest)
                {
                    HtmlTableCell td1 = new HtmlTableCell();
                    td1.InnerHtml = $"<p>Police Station{p.PS}</p><p>Case No:{p.CaseNo}</p><p>Case Date:{p.Date.Value.ToString("dd-MMM-yyyy")}</p><p>Section:{p.Sections}</p>";
                    HtmlTableCell td2 = new HtmlTableCell();
                    td2.InnerHtml = $"<p>{p.ArrestedDate.Value.ToString("dd-MMM-yyyy")}</p>";
                    HtmlTableCell td3 = new HtmlTableCell();
                    td3.InnerHtml = $"<p>{p.WhereArrested}</p>";

                    HtmlTableRow row = new HtmlTableRow();
                    row.Cells.Add(td1);
                    row.Cells.Add(td2);
                    row.Cells.Add(td3);
                    tblPastArrest.Rows.Add(row);
                }
            }
        }

        private void loadDisposalMethod(List<DisposalMethod> disposalMethod)
        {
            if (disposalMethod.Count() > 0)
            {
                foreach(var d in disposalMethod)
                {
                    HtmlTableCell td1 = new HtmlTableCell();
                    td1.InnerHtml = $"<p>{d.Method}</p>";
                    HtmlTableCell td2 = new HtmlTableCell();
                    td2.InnerHtml = $"<p>{d.ReceiverName}</p>";
                    HtmlTableCell td3 = new HtmlTableCell();
                    td3.InnerHtml = $"<p>{d.ReceiverAddress}</p>";
                    HtmlTableCell td4 = new HtmlTableCell();
                    td4.InnerHtml = $"<a href='IndividualHistorySheet?H_ID={d.MasterID}'>{d.MasterID}</a>";
                    HtmlTableRow row = new HtmlTableRow();
                    row.Cells.Add(td1);
                    row.Cells.Add(td2);
                    row.Cells.Add(td3);
                    row.Cells.Add(td4);
                    tblDisposalMethod.Rows.Add(row);
                }
            }
        }

        private void loadRelatives(List<Relate> relatives)
        {
            if (relatives.Count > 0)
            {
                foreach(var r in relatives)
                {
                    HtmlTableCell td1 = new HtmlTableCell();
                    td1.InnerHtml = $"<p>{r.Name}</p><p>Relationship:{r.Relationship}</p>";
                    HtmlTableCell td2 = new HtmlTableCell();
                    td2.InnerHtml = $"<p>{r.Address}</p>";
                    HtmlTableCell td3 = new HtmlTableCell();
                    td3.InnerHtml = $"<p>{r.Occupation}</p>";
                    HtmlTableCell td4 = new HtmlTableCell();
                    td4.InnerHtml = $"<a href='IndividualHistorySheet?H_ID={r.RefMasterID}'>{r.RefMasterID}<a>";
                    HtmlTableRow row = new HtmlTableRow();
                    row.Cells.Add(td1);
                    row.Cells.Add(td2);
                    row.Cells.Add(td3);
                    row.Cells.Add(td4);
                    tblRelatives.Rows.Add(row);
                }
            }
        }

        private void loadAssociates(List<Associate> associates)
        {
            if (associates.Count > 0)
            {
                
                foreach(var a in associates)
                {
                    HtmlTableRow row = new HtmlTableRow();
                    HtmlTableCell td1 = new HtmlTableCell();
                    td1.InnerHtml = $"<p>{a.Name} @{a.Aliases}, Father's Name:{a.FathersName}</p>";
                    HtmlTableCell td2 = new HtmlTableCell();
                    td2.InnerHtml = $"<p>{a.Residence}<p>";
                    HtmlTableCell td3 = new HtmlTableCell();
                    td3.InnerHtml = $"<p>{a.Occupation}<p>";
                    HtmlTableCell td4 = new HtmlTableCell();
                    td4.InnerHtml = $"<p>{a.AssociationNature}, <a href='IndividualHistorySheet?H_ID={a.HistoryMasterID}'>{a.HistoryMasterID}</a></p>";
                    row.Cells.Add(td1);
                    row.Cells.Add(td2);
                    row.Cells.Add(td3);
                    row.Cells.Add(td4);
                    associateTable.Rows.Add(row);
                }
            }
        }

        private void loadOffence(List<Offence> offence)
        {
            if (offence.Count > 0)
            {
                string emptyHTML = "";
                foreach(var o in offence)
                {
                    emptyHTML += $"<div style='border-bottom:1px solid #000;border-top:1px solid #000;'><p>PS: {o.PS}</p><p>Case No: {o.CaseNo}</p><p>Case Date: {o.Date.Value.ToString("dd-MMM-yyyy")}</p><p>Sections: {o.Sections}</p></div>" +
                        $"<div style='border-bottom:1px solid #000;border-top:1px solid #000;'><p>MO Details: {o.MODetails}</p></div>" +
                        $"<div style='border-bottom:1px solid #000;border-top:1px solid #000;'><p>Remarks: {o.Remarks}</p></div>" +
                        $"<div style='border-bottom:1px solid #000;border-top:1px solid #000;'><p>Is Important: {o.Important}</p></div>";
                }
                offenceContainer.InnerHtml = emptyHTML;
            }
        }

        private void loadResidence(List<Residence> residence)
        {
            if (residence.Count > 0)
            {
                string emptyHTML = "";
                foreach(var r in residence)
                {
                    emptyHTML += $"<div style='border-bottom:1px solid #000;border-top:1px solid #000;'><p>Country:{r.Country}</p><p>State:{r.State}</p><p>District:{r.District}</p><p>Police Station:{r.PS}</p></div>" +
                        $"<div style='border-bottom:1px solid #000;border-top:1px solid #000;'><p>Address:{r.Address}</p></div>" +
                        $"<div style='border-bottom:1px solid #000;border-top:1px solid #000;'><p>Period Resided:{r.PeriodReside}</p></div>" +
                        $"<div style='border-bottom:1px solid #000;border-top:1px solid #000;'><p>Frequently Visited:{r.FequentlyVisiting}</p></div>";
                }
                residenceContainer.InnerHtml = emptyHTML;
            }
        }

        private void loadImages(List<Photographs_FP> images)
        {
            if (images.Count() > 0)
            {
                string emptyImageHTML = "";
                string emptyFPHTML = "";
                foreach (var img in images)
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

        private void loadWitnesses(List<Witness> witnesses)
        {
            if (witnesses.Count() > 0)
            {
                var emptyHTML = "";
                foreach(var wit in witnesses)
                {
                    if(wit.Image.Length == 0)
                    {
                        emptyHTML += $"<div style='border-bottom:1px solid #000'><img src='data:image/jpg;base64,{Convert.ToBase64String(globalMethods.getDefaultImage(HttpContext.Current))}' style='width:100px' /></div>" +
                       $"<div style='border-bottom:1px solid #000'><p>{wit.Name}</p><p> Gender: {wit.Gender}</p><p> Gender: {wit.DOB.Value.ToString("dd-MMM-yy")}</p><p>Fathser's Name: {wit.FathersName}</p></div>" +
                       $"<div style='border-bottom:1px solid #000'><p>{wit.Address}</p></div>";
                    }
                    else
                    {
                        emptyHTML += $"<div style='border-bottom:1px solid #000'><img src='data:image/jpg;base64,{Convert.ToBase64String(wit.Image.ToArray())}' style='width:100px' /></div>" +
                       $"<div style='border-bottom:1px solid #000'><p>{wit.Name}</p><p> Gender: {wit.Gender}</p><p> Gender: {wit.DOB.Value.ToString("dd-MMM-yy")}</p><p>Fathser's Name: {wit.FathersName}</p></div>" +
                       $"<div style='border-bottom:1px solid #000'><p>{wit.Address}</p></div>";
                    }
                                   
                     
                }
                witnessContainer.InnerHtml = emptyHTML;

            }
        }

       
    }
}