using BookingTravel.BUS;
using BookingTravel.Models;
using BookingTravel.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectBookingTravel.Formats;

namespace ProjectBookingTravel.Controllers
{
    [Route("api/bill")]
    [ApiController]
    public class BillTourController : BaseApiController
    {
        private BillTourBUS billTourBUS;

        public BillTourController()
        {
            this.billTourBUS = new BillTourBUS();
        }

        [HttpPost, Route("Add")]
        public IActionResult AddBill(AddBillTourModel item)
        {
            try
            {
                return CreateActionResult(() =>
                {
                    BaseResultModel result = billTourBUS.AddBill(item);
                    base.Status = result.Status;
                    base.Message = result.Message;
                    return base.GetActionResult();
                });
            }
            catch (Exception ex)
            {
                base.Status = -1;
                base.Message = "Error controll : " + ex.Message;
                return base.GetActionResult();
            }
        }

        [HttpGet, Route("GetBillTourById")]
        public IActionResult GetBillTourById(int idAcc)
        {
            try
            {
                return CreateActionResult(() =>
                {
                    IList<GetBillTourModel> Data;

                    Data = billTourBUS.GetBillTourById(idAcc);
                    base.Status = Data.Count > 0 ? 1 : 0;
                    base.Data = Data;
                    base.TotalRow = Data.Count;
                    return base.GetActionResult();
                });
            }
            catch (Exception ex)
            {
                return base.GetActionResult();
            }
        }
    }
}
