using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.Utilities
{
    public class SQLHelper
    {
        [Obsolete]
        public static string appConnectionStrings = "";

        /// <summary>
		/// Execute a SqlCommand return object, Create by Namts@vega.com.vn
		/// </summary>
		/// <param name="trans"></param>
		/// <param name="cmdType"></param>
		/// <param name="cmdText"></param>
		/// <param name="cmdParms"></param>
		/// <returns></returns>
        public static SqlDataReader ExecuteReader(string connString, CommandType cmdType, string cmdText, params SqlParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();
            SqlConnection conn = new SqlConnection(connString);
            cmd.Parameters.Clear();
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
            // we use a try/catch here because if the method throws an exception we want to 
            // close the connection throw code, because no datareader will exist, hence the 
            // commandBehaviour.CloseConnection will not work
            try
            {
                PrepareCommand(cmd, conn, null, cmdType, cmdText, cmdParms);
                SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                //cmd.Parameters.Clear();
                return rdr;
            }
            catch (Exception ex)
            {
                conn.Close();
                throw;
            }
        }

        /// <summary>
		/// Prepare a command for execution
		/// </summary>
		/// <param name="cmd">SqlCommand object</param>
		/// <param name="conn">SqlConnection object</param>
		/// <param name="trans">SqlTransaction object</param>
		/// <param name="cmdType">Cmd type e.g. stored procedure or text</param>
		/// <param name="cmdText">Command text, e.g. Select * from Products</param>
		/// <param name="cmdParms">SqlParameters to use in the command</param>
		private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {

            if (conn.State != ConnectionState.Open)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandText = cmdText;

            if (trans != null)
            {
                cmd.Transaction = trans;
            }

            cmd.CommandType = cmdType;

            if (cmdParms != null)
            {
                foreach (SqlParameter parm in cmdParms)
                {
                    cmd.Parameters.Add(parm);
                }
            }
            // conn.Close();
        }

        /// <summary>
		/// Execute a SqlCommand return object, Create by Namts@vega.com.vn
		/// </summary>
		/// <param name="trans"></param>
		/// <param name="cmdType"></param>
		/// <param name="cmdText"></param>
		/// <param name="cmdParms"></param>
		/// <returns></returns>
		public static object ExecuteScalar(SqlTransaction trans, CommandType cmdType, string cmdText, params SqlParameter[] cmdParms)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Parameters.Clear();
            PrepareCommand(cmd, trans.Connection, trans, cmdType, cmdText, cmdParms);
            object val = cmd.ExecuteScalar();
            //cmd.Parameters.Clear();
            return val;
        }
    }
}
