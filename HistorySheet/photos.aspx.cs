using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public partial class photos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var masterID = Convert.ToInt32(Request.QueryString["H_Id"]);
                if (masterID != 0)
                {
                    loadDetails(masterID);
                    loadPhotoGrid(masterID);
                    loadFingerpritGrid(masterID);
                }                  

            }
        }

        private void loadFingerpritGrid(int masterID)
        {
            if (masterID != 0)
            {
                using (DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var records = db.Photographs_FPs.Where(n => n.P_ID == masterID && n.IsFingerPrint == true).Select(n => new {
                        n.ID,
                        imagePath = "getImage.ashx?ID=" + n.ID
                    }).ToList();
                    dgFingerprint.DataSource = records;
                    dgFingerprint.DataBind();
                }
            }
        }

        private void loadPhotoGrid(int masterID)
        {
            if (masterID != 0)
            {
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    var records = db.Photographs_FPs.Where(n => n.P_ID == masterID && n.IsFingerPrint==false).Select(n=> new {
                    n.ID,
                    imagePath = "getImage.ashx?ID="+n.ID
                    }).ToList();
                    dgPhotos.DataSource = records;
                    dgPhotos.DataBind();
                }
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var pic = new Photographs_FP();
                pic.P_ID = Convert.ToInt32(Request.QueryString["H_Id"]);
                pic.IsFingerPrint = chkIsFingerPrint.Checked;
                pic.Image = fuImage.FileBytes;
                using(DBHistoryDataContext db = new DBHistoryDataContext())
                {
                    db.Photographs_FPs.InsertOnSubmit(pic);
                    db.SubmitChanges();
                    Response.Redirect(Request.RawUrl);
                }

            }
        }

        protected void dgPhotos_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            var ID = Convert.ToInt32(e.CommandArgument);
            using(DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var record = db.Photographs_FPs.Where(n => n.ID == ID).SingleOrDefault();
                db.Photographs_FPs.DeleteOnSubmit(record);
                db.SubmitChanges();
                Response.Redirect(Request.RawUrl);
            }

        }

        protected void dgFingerprint_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            var ID = Convert.ToInt32(e.CommandArgument);
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                var record = db.Photographs_FPs.Where(n => n.ID == ID).SingleOrDefault();
                db.Photographs_FPs.DeleteOnSubmit(record);
                db.SubmitChanges();
                Response.Redirect(Request.RawUrl);
            }
        }
    }
}