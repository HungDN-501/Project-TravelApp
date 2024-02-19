using BookingTravel.DAL;
using BookingTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.BUS
{
    public class TouristAttractionBUS
    {
        TouristAttractionDAL touristAttractionDAL { get; set; }
        BaseResultModel baseResult { get; set; }
        public TouristAttractionBUS()
        {
            this.touristAttractionDAL = new TouristAttractionDAL();
            this.baseResult = new BaseResultModel();
        }

        public List<TouristAttractionModel> GetTouristAttractionRandom(string baseUrl)
        {
            return touristAttractionDAL.GetTouristAttractionRandom(baseUrl);
        }

        public List<TouristAttractionModel> GetTouristAttractionMostStars(string baseUrl)
        {
            return touristAttractionDAL.GetTouristAttractionStar(baseUrl);
        }

        public List<TouristAttractionModel> SearchTouristAttraction(SearchTouristAttractionModel search, string baseUrl)
        {
            return touristAttractionDAL.SearchTouristAttraction(search, baseUrl);
        }

        public List<TouristAttractionModel> GetMarkTour(int idAcc, string baseUrl)
        {
            return touristAttractionDAL.GetMarkTour(idAcc, baseUrl);
        }

        public BaseResultModel HandleMarkTour(HandleMarkTourModel handle)
        {
            int value = touristAttractionDAL.HandleMarkTour(handle);

            switch (value)
            {
                case 1:
                    baseResult.Status = 1;
                    baseResult.Message = "Thêm lưu địa điẻm thành công";
                    break;
                case 2:
                    baseResult.Status = 1;
                    baseResult.Message = "Xóa lưu địa điẻm thành công";
                    break;
                case 3:
                    baseResult.Status = -1;
                    baseResult.Message = "Lỗi vấn đề SQL";
                    break;
                default:
                    baseResult.Status = -1;
                    baseResult.Message = "Lỗi không xác định";
                    break;
            }

            return baseResult;
        }
    }
}
