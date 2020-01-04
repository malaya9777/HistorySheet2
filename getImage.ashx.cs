using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace HistorySheet
{
    /// <summary>
    /// Summary description for getImage
    /// </summary>
    public class getImage : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var photoID = Convert.ToInt32(context.Request.QueryString["ID"]);
            using (DBHistoryDataContext db = new DBHistoryDataContext())
            {
                if (photoID!=0)
                {
                    var image = db.Photographs_FPs.Where(n => n.ID == photoID).SingleOrDefault();
                    if (image != null)
                    {
                        context.Response.BinaryWrite((byte[])image.Image.ToArray());
                        context.Response.ContentType = "image/jpeg";
                    }
                    else
                    {
                       
                        var path = context.Server.MapPath(@"\DefaultImg\default.jpg");
                        context.Response.BinaryWrite((byte[])File.ReadAllBytes(path));
                        context.Response.ContentType = "image/jpeg";
                    }
                    
                }
                else
                {
                    context.Response.Write("Image ID required!");                    
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}