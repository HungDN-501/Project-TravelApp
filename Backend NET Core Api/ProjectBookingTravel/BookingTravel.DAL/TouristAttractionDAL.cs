using BookingTravel.Models;
using BookingTravel.Utilities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;
using System.Reflection.PortableExecutable;

namespace BookingTravel.DAL
{
    public class TouristAttractionDAL
    {
        #region Variable
        private const string pKeyword = "@keyword";
        private const string pPlaceView = "@placeView";
        private const string pIdAcc = "@idAcc";
        private const string pIdTour = "@idTour";
        private const string pTypeHandle = "@typeUpdate";

        private const string sGetRandom = "GetTouristAttractionRandom";
        private const string sGetStar = "GetTouristAttractionStar";
        private const string sSearch = "SearchTouristAttraction";
        private const string sGetMarkTour = "GetMarkTourById";
        private const string sHandleMarkTour = "HandleMarkTourById";
        #endregion

        #region Function
        public List<TouristAttractionModel> GetTouristAttractionRandom(string baseUrl)
        {
            try
            {
                List<TouristAttractionModel> Data = new List<TouristAttractionModel>();

                using (SqlDataReader dr = SQLHelper.ExecuteReader(SQLHelper.appConnectionStrings, CommandType.StoredProcedure, sGetRandom))
                {
                    while (dr.Read())
                    {
                        TouristAttractionModel item = new TouristAttractionModel();

                        item.TourID = Utils.ConvertToInt32(dr["TourID"], 0);
                        item.NameTour = Utils.ConvertToString(dr["NameTour"], string.Empty);
                        item.Image = Utils.ConvertToString($"{baseUrl}/uploads/{dr["Image"]}", string.Empty);
                        item.Price = Utils.ConvertToInt32(dr["Price"], 0);
                        item.Star = Utils.ConvertToInt32(dr["Star"], 0);
                        item.PlaceView = Utils.ConvertToInt32(dr["PlaceView"], 0);
                        item.ContentTour = Utils.ConvertToString(dr["ContentTour"], string.Empty);
                        item.LocationID = Utils.ConvertToInt32(dr["LocationID"], 0);
                        item.NameLocation = Utils.ConvertToString(dr["NameLocation"], string.Empty);
                        item.NameNation = Utils.ConvertToString(dr["NameNation"], string.Empty);

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

        public List<TouristAttractionModel> GetTouristAttractionStar(string baseUrl)
        {
            try
            {
                List<TouristAttractionModel> Data = new List<TouristAttractionModel>();

                using (SqlDataReader dr = SQLHelper.ExecuteReader(SQLHelper.appConnectionStrings, CommandType.StoredProcedure, sGetStar))
                {
                    while (dr.Read())
                    {
                        TouristAttractionModel item = new TouristAttractionModel();
                        item.TourID = Utils.ConvertToInt32(dr["TourID"], 0);
                        item.NameTour = Utils.ConvertToString(dr["NameTour"], string.Empty);
                        item.Image = Utils.ConvertToString($"{baseUrl}/uploads/{dr["Image"]}", string.Empty);
                        item.Price = Utils.ConvertToInt32(dr["Price"], 0);
                        item.Star = Utils.ConvertToInt32(dr["Star"], 0);
                        item.PlaceView = Utils.ConvertToInt32(dr["PlaceView"], 0);
                        item.ContentTour = Utils.ConvertToString(dr["ContentTour"], string.Empty);
                        item.LocationID = Utils.ConvertToInt32(dr["LocationID"], 0);
                        item.NameLocation = Utils.ConvertToString(dr["NameLocation"], string.Empty);
                        item.NameNation = Utils.ConvertToString(dr["NameNation"], string.Empty);

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

        public List<TouristAttractionModel> SearchTouristAttraction(SearchTouristAttractionModel search, string baseUrl)
        {
            List<TouristAttractionModel> Data = new List<TouristAttractionModel>();

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter(pKeyword,SqlDbType.NVarChar,100),
                    new SqlParameter(pPlaceView,SqlDbType.Int),
                };
                parameters[0].Value = search.Keyword;
                parameters[1].Value = search.PlaceView == 0 ? Convert.DBNull : search.PlaceView;

                using (SqlDataReader dr = SQLHelper.ExecuteReader(SQLHelper.appConnectionStrings, CommandType.StoredProcedure, sSearch, parameters))
                {
                    while (dr.Read())
                    {
                        TouristAttractionModel item = new TouristAttractionModel();
                        item.TourID = Utils.ConvertToInt32(dr["TourID"], 0);
                        item.NameTour = Utils.ConvertToString(dr["NameTour"], string.Empty);
                        item.Image = Utils.ConvertToString($"{baseUrl}/uploads/{dr["Image"]}", string.Empty);
                        item.Price = Utils.ConvertToInt32(dr["Price"], 0);
                        item.Star = Utils.ConvertToInt32(dr["Star"], 0);
                        item.PlaceView = Utils.ConvertToInt32(dr["PlaceView"], 0);
                        item.ContentTour = Utils.ConvertToString(dr["ContentTour"], string.Empty);
                        item.LocationID = Utils.ConvertToInt32(dr["LocationID"], 0);
                        item.NameLocation = Utils.ConvertToString(dr["NameLocation"], string.Empty);
                        item.NameNation = Utils.ConvertToString(dr["NameNation"], string.Empty);

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

        public List<TouristAttractionModel> GetMarkTour(int idAcc, string baseUrl)
        {
            List<TouristAttractionModel> Data = new List<TouristAttractionModel>();

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter(pIdAcc,SqlDbType.Int),
                };
                parameters[0].Value = idAcc;

                using (SqlDataReader dr = SQLHelper.ExecuteReader(SQLHelper.appConnectionStrings, CommandType.StoredProcedure, sGetMarkTour, parameters))
                {
                    while (dr.Read())
                    {
                        TouristAttractionModel item = new TouristAttractionModel();
                        item.TourID = Utils.ConvertToInt32(dr["TourID"], 0);
                        item.NameTour = Utils.ConvertToString(dr["NameTour"], string.Empty);
                        item.Image = Utils.ConvertToString($"{baseUrl}/uploads/{dr["Image"]}", string.Empty);
                        item.Price = Utils.ConvertToInt32(dr["Price"], 0);
                        item.Star = Utils.ConvertToInt32(dr["Star"], 0);
                        item.PlaceView = Utils.ConvertToInt32(dr["PlaceView"], 0);
                        item.ContentTour = Utils.ConvertToString(dr["ContentTour"], string.Empty);
                        item.LocationID = Utils.ConvertToInt32(dr["LocationID"], 0);
                        item.NameLocation = Utils.ConvertToString(dr["NameLocation"], string.Empty);
                        item.NameNation = Utils.ConvertToString(dr["NameNation"], string.Empty);

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

        public int HandleMarkTour(HandleMarkTourModel handle)
        {
            int result;

            try
            {
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter(pIdAcc,SqlDbType.Int),
                    new SqlParameter(pIdTour,SqlDbType.Int),
                    new SqlParameter(pTypeHandle,SqlDbType.Int),
                };
                parameters[0].Value = handle.AccountID;
                parameters[1].Value = handle.TourID;
                parameters[2].Value = handle.TypeHandle;

                using (SqlConnection conn = new SqlConnection(SQLHelper.appConnectionStrings))
                {
                    conn.Open();
                    using (SqlTransaction trans = conn.BeginTransaction())
                    {
                        try
                        {
                            result = Convert.ToInt32(SQLHelper.ExecuteScalar(trans, CommandType.StoredProcedure, sHandleMarkTour, parameters));
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
    }
    #endregion
}
