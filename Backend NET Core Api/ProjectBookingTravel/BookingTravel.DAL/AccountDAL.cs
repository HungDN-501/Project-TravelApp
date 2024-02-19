using BookingTravel.Models;
using BookingTravel.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.DAL
{
    public class AccountDAL
    {
        #region Variable
        private const string pUserName = "@userName";
        private const string pAvatar = "@avatar";
        private const string pEmail = "@email";
        private const string pPhoneNumber = "@phoneNumber";
        private const string pPassword = "@password";

        private const string sGetAll = "GetAllAccount";
        private const string sAdd = "AddAccount";
        private const string sCheckEmail = "CheckEmailAccount";
        private const string sUpdatePassword = "UpdatePasswordAccount";
        
        #endregion

        #region Function
        public List<GetAccountModel> GetAllAccount(string baseUrl)
        {
            try
            {
                List<GetAccountModel> Data = new List<GetAccountModel>();

                using (SqlDataReader dr = SQLHelper.ExecuteReader(SQLHelper.appConnectionStrings, CommandType.StoredProcedure, sGetAll))
                {
                    while (dr.Read())
                    {
                        GetAccountModel item = new GetAccountModel();
                        item.AccountID = Utils.ConvertToInt32(dr["AccountID"], 0);
                        item.UserName = Utils.ConvertToString(dr["UserName"], string.Empty);
                        item.Avatar = Utils.ConvertToString(dr["Avatar"] != "" ? $"{baseUrl}/uploads/{dr["Avatar"]}" : "", string.Empty);
                        item.Email = Utils.ConvertToString(dr["Email"], string.Empty);
                        item.PhoneNumber = Utils.ConvertToInt32(dr["PhoneNumber"], 0);
                        item.Password = Utils.ConvertToString(dr["Password"], string.Empty);

                        Console.WriteLine(dr["Avatar"]);

                        Data.Add(item);
                    }
                    dr.Close();
                }
                return Data;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int AddAccount(AddAccountModel item)
        {
            int result;

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter(pUserName,SqlDbType.NVarChar,100),
                    new SqlParameter(pAvatar,SqlDbType.NVarChar,300),
                    new SqlParameter(pEmail,SqlDbType.NVarChar,200),
                    new SqlParameter(pPhoneNumber,SqlDbType.Int),
                    new SqlParameter(pPassword,SqlDbType.NVarChar,100),
                };
                parameters[0].Value = item.UserName.Trim() ?? Convert.DBNull;
                parameters[1].Value = item.Avatar.Trim() ?? Convert.DBNull;
                parameters[2].Value = item.Email.Trim() ?? Convert.DBNull;
                parameters[3].Value = item.PhoneNumber;
                parameters[4].Value = item.Password.Trim() ?? Convert.DBNull;

                using (SqlConnection conn = new SqlConnection(SQLHelper.appConnectionStrings))
                {
                    conn.Open();
                    using (SqlTransaction trans = conn.BeginTransaction())
                    {
                        try
                        {
                            result = Convert.ToInt32(SQLHelper.ExecuteScalar(trans, CommandType.StoredProcedure, sAdd, parameters));
                            trans.Commit();
                        }
                        catch (Exception ex)
                        {
                            result = 0;
                            trans.Rollback();
                        }
                    }
                }

                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int UpdatePassword(UpdatePassword item)
        {
            int result;

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter(pEmail,SqlDbType.NVarChar,200),
                    new SqlParameter(pPassword,SqlDbType.NVarChar,100),
                };
                parameters[0].Value = item.Email.Trim() ?? Convert.DBNull;
                parameters[1].Value = item.Password.Trim() ?? Convert.DBNull;

                using (SqlConnection conn = new SqlConnection(SQLHelper.appConnectionStrings))
                {
                    conn.Open();
                    using (SqlTransaction trans = conn.BeginTransaction())
                    {
                        try
                        {
                            result = Convert.ToInt32(SQLHelper.ExecuteScalar(trans, CommandType.StoredProcedure, sUpdatePassword, parameters));
                            trans.Commit();
                        }
                        catch (Exception ex)
                        {
                            result = 0;
                            trans.Rollback();
                        }
                    }
                }

                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion

        #region Function support
        public bool CheckEmail(string email)
        {
            bool result;
            int value;

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter(pEmail,SqlDbType.NVarChar,100),
                };
                parameters[0].Value = email.Trim();

                using (SqlConnection conn = new SqlConnection(SQLHelper.appConnectionStrings))
                {
                    conn.Open();
                    using (SqlTransaction trans = conn.BeginTransaction())
                    {
                        try
                        {
                            value = Convert.ToInt32(SQLHelper.ExecuteScalar(trans, CommandType.StoredProcedure, sCheckEmail, parameters));
                            trans.Commit();
                        }
                        catch (Exception ex)
                        {
                            value = 0;
                            trans.Rollback();
                        }
                    }
                }

                if (value == 1)
                {
                    result = true; // đã có
                }
                else
                {
                    result = false; // chưa có
                }

                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        #endregion
    }
}
