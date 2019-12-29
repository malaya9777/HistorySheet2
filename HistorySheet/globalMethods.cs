using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    }
}