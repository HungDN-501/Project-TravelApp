using BookingTravel.Models;
using BookingTravel.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection.PortableExecutable;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.DAL
{
    public class BillTourDAL
    {
        #region Variable
        private const string pTourID = "@tourID";
        private const string pAccountID = "@accountID";
        private const string pBooker = "@booker";
        private const string pPhone = "@phone";
        private const string pNumPeople = "@numPeople";
        private const string pDepartureSchedule = "@departureSchedule";
        private const string pTotal = "@total";

        private const string sCreateBill = "CreateBillTour";
        private const string sGetBillByID = "GetBillTourByID";

        #endregion

        #region Function
        public int AddBill(AddBillTourModel item)
        {
            int result;

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter(pTourID,SqlDbType.Int),
                    new SqlParameter(pAccountID,SqlDbType.Int),
                    new SqlParameter(pBooker,SqlDbType.NVarChar,200),
                    new SqlParameter(pPhone,SqlDbType.Int),
                    new SqlParameter(pNumPeople,SqlDbType.Int),
                    new SqlParameter(pDepartureSchedule,SqlDbType.Date),
                    new SqlParameter(pTotal,SqlDbType.Int),
                };
                parameters[0].Value = item.TourID;
                parameters[1].Value = item.AccountID;
                parameters[2].Value = item.Booker.Trim() ?? Convert.DBNull;
                parameters[3].Value = item.Phone;
                parameters[4].Value = item.NumPeople;
                parameters[5].Value = item.DepartureSchedule.ToShortDateString();
                parameters[6].Value = item.Total;

                using (SqlConnection conn = new SqlConnection(SQLHelper.appConnectionStrings))
                {
                    conn.Open();
                    using (SqlTransaction trans = conn.BeginTransaction())
                    {
                        try
                        {
                            result = Convert.ToInt32(SQLHelper.ExecuteScalar(trans, CommandType.StoredProcedure, sCreateBill, parameters));
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

        public List<GetBillTourModel> GetBillTourById(int accountID)
        {
            try
            {
                List<GetBillTourModel> Data = new List<GetBillTourModel>();

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter(pAccountID,SqlDbType.Int),
                };
                parameters[0].Value = accountID;

                using (SqlDataReader dr = SQLHelper.ExecuteReader(SQLHelper.appConnectionStrings, CommandType.StoredProcedure, sGetBillByID, parameters))
                {
                    while (dr.Read())
                    {
                        GetBillTourModel item = new GetBillTourModel();

                        item.BillBookID = Utils.ConvertToInt32(dr["BillBookID"], 0);
                        item.NameTour = Utils.ConvertToString(dr["NameTour"], string.Empty);
                        item.TourID = Utils.ConvertToInt32(dr["TourID"], 0);
                        item.AccountID = Utils.ConvertToInt32(dr["AccountID"], 0);
                        item.Booker = Utils.ConvertToString(dr["Booker"], string.Empty);
                        item.Phone = Utils.ConvertToInt32(dr["Phone"], 0);
                        item.NumPeople = Utils.ConvertToInt32(dr["NumPeople"], 0);
                        item.DepartureSchedule = Utils.ConvertToDateTime(dr["DepartureSchedule"], DateTime.Now);
                        item.Total = Utils.ConvertToInt32(dr["Total"], 0);

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
        #endregion
    }
}
