using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.Models
{
    public class BillTourModel
    {
        public int TourID { get; set; }
        public int AccountID { get; set; }
        public string Booker { get; set; } = "";
        public int Phone { get; set; }
        public int NumPeople { get; set; }
        public DateTime DepartureSchedule { get; set; }
        public int Total { get; set; }
    }

    public class GetBillTourModel : BillTourModel
    {
        public int BillBookID { get; set; }
        public string NameTour { get; set; } = "";
    }

    public class AddBillTourModel : BillTourModel
    {
    }
}
