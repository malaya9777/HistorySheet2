using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace HistorySheet
{
    public class globalMethods
    {
        public static DateTime? getDate(string v)
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
        public static int? getNumber(string v)
        {
            try
            {
                return Convert.ToInt32(v);
            }
            catch (Exception)
            {

                return null;
            }
        }
        public static void refresh_page(HttpContext context)
        {
            context.Response.Redirect(context.Request.RawUrl);
        }
        public static string setDate(DateTime? d)
        {
            return d == null ? null : d.Value.ToShortDateString();
        }

        public static void readonlyTextbox(TextBox box)
        {
            box.Attributes.Add("readonly", "readonly");
        }
    }
}