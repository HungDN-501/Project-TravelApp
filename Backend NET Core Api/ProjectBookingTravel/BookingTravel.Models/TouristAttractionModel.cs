using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.Models
{
    public class TouristAttractionModel
    {
        public int TourID { get; set; }
        public string NameTour { get; set; }
        public string Image { get; set; }
        public int Price { get; set; }
        public int Star { get; set; }
        public int PlaceView { get; set; }
        public string ContentTour { get; set; }
        public int LocationID { get; set; }
        public string NameLocation { get; set; }
        public string NameNation { get; set; }
    }

    public class SearchTouristAttractionModel
    {
        public int? PlaceView { get; set; }
        public string Keyword { get; set; } = "";
    }

    public class HandleMarkTourModel
    {
        public int AccountID { get; set; }
        public int TourID { get; set; }
        public int TypeHandle { get; set; } // 1 lưu, 2 xóa
    }
}
