using BookingTravel.BUS;
using BookingTravel.Models;
using BookingTravel.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ProjectBookingTravel.Formats;

namespace ProjectBookingTravel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TouristAttractionController : BaseApiController
    {
        private TouristAttractionBUS touristAttractionBUS;

        public TouristAttractionController()
        {
            this.touristAttractionBUS = new TouristAttractionBUS();
        }

        [HttpGet, Route("GetTouristAttractionRandom")]
        public IActionResult GetTouristAttractionRandom()
        {
            try
            {
                return CreateActionResult(() =>
                {
                    IList<TouristAttractionModel> Data;

                    var baseUrl = $"http://{HttpContext.Request.Host}";

                    Data = touristAttractionBUS.GetTouristAttractionRandom(baseUrl);
                    if (Data.Count == 0)
                    {
                        base.Status = -1;
                        base.Message = ConstantLogMessage.API_NoData;
                    }
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

        [HttpGet, Route("GetTouristAttractionMostStars")]
        public IActionResult GetTouristAttractionMostStars()
        {
            try
            {
                return CreateActionResult(() =>
                {
                    IList<TouristAttractionModel> Data;

                    var baseUrl = $"http://{HttpContext.Request.Host}";

                    Data = touristAttractionBUS.GetTouristAttractionMostStars(baseUrl);
                    if (Data.Count == 0)
                    {
                        base.Status = -1;
                        base.Message = ConstantLogMessage.API_NoData;
                    }
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

        [HttpPost, Route("SearchTouristAttraction")]
        public IActionResult SearchTouristAttraction([FromBody] SearchTouristAttractionModel search)
        {
            try
            {
                return CreateActionResult(() =>
                {
                    IList<TouristAttractionModel> Data;

                    var baseUrl = $"http://{HttpContext.Request.Host}";

                    Data = touristAttractionBUS.SearchTouristAttraction(search, baseUrl);
                    if (Data.Count == 0)
                    {
                        base.Status = -1;
                        base.Message = ConstantLogMessage.API_NoData;
                    }
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

        [HttpPost, Route("GetMarkTourById")]
        public IActionResult GetMarkTourById([FromBody] int idAcc)
        {
            try
            {
                return CreateActionResult(() =>
                {
                    IList<TouristAttractionModel> Data;

                    var baseUrl = $"http://{HttpContext.Request.Host}";

                    Data = touristAttractionBUS.GetMarkTour(idAcc, baseUrl);
                    base.Status = 1;
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

        [HttpPost, Route("HandleMarkTourById")]
        public IActionResult HandleMarkTourById([FromBody] HandleMarkTourModel handle)
        {
            try
            {
                return CreateActionResult(() =>
                {
                    if(handle.TypeHandle == 1 || handle.TypeHandle == 2)
                    {
                        BaseResultModel result = touristAttractionBUS.HandleMarkTour(handle);
                        base.Status = result.Status;
                        base.Message = result.Message;
                        
                    }
                    else
                    {
                        base.Status = -1;
                        base.Message = "Kiểu xử lý TypeHandle không đúng";
                    }

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
