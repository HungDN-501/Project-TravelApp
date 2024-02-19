using BookingTravel.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BookingTravel.Models;

namespace BookingTravel.DAL
{
    public class LoginDAL
    {
        public InfoLoginModel GetInfoByLogin(string Email, string Password, string baseUrl)
        {
            InfoLoginModel user = null;
            if (string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Password))
            {
                return user;
            }
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@email",SqlDbType.NVarChar),
                new SqlParameter("@password",SqlDbType.NVarChar),
            };

            parameters[0].Value = Email.Trim();
            parameters[1].Value = Password.Trim();
            try
            {

                using (SqlDataReader dr = SQLHelper.ExecuteReader(SQLHelper.appConnectionStrings, CommandType.StoredProcedure, "GetByLogin", parameters))
                {
                    if (dr.Read())
                    {
                        user = new InfoLoginModel();
                        user.AccountID = Utils.ConvertToInt32(dr["AccountID"], 0);
                        user.UserName = Utils.ConvertToString(dr["UserName"], string.Empty);
                        user.Avatar = Utils.ConvertToString(dr["Avatar"] != "" ? $"{baseUrl}/uploads/{dr["Avatar"]}" : "", string.Empty);
                        user.Email = Utils.ConvertToString(dr["Email"], string.Empty);
                        user.PhoneNumber = Utils.ConvertToInt32(dr["PhoneNumber"], 0);
                    }
                    dr.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return user;
        }
    }
}
