using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.Utilities
{
    public class Utils
    {
        public static int ConvertToInt32(object value, int defaultValue)
        {
            try
            {
                if (value == null) return defaultValue;
                return Convert.ToInt32(value.ToString().Trim());
            }
            catch (Exception ex)
            {
                return defaultValue;
            }
        }

        public static string ConvertToString(object value, string defaultValue)
        {
            try
            {
                if (value == null) return defaultValue;
                return Convert.ToString(value.ToString().Trim());
            }
            catch
            {
                return defaultValue;
            }
        }

        public static bool ConvertToBoolean(object value, bool defaultValue)
        {
            try
            {
                return Convert.ToBoolean(value.ToString());
            }
            catch
            {
                return defaultValue;
            }
        }

        public static DateTime ConvertToDateTime(object value, DateTime defaultValue)
        {
            try
            {
                DateTime datetime = new DateTime();
                bool result = DateTime.TryParseExact(value.ToString(), "dd/MM/yyyy", null, DateTimeStyles.None, out datetime);
                if (!result)
                {
                    datetime = DateTime.Parse(value.ToString().Trim());
                }
                else
                {
                    //datetime = DateTime.Parse(value.ToString("yyyy/MM/dd hh:mm:ss"));
                }
                return datetime;
            }
            catch
            {
                return defaultValue;
            }
        }
    }
}
