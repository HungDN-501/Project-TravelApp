using Microsoft.AspNetCore.Mvc;
using System.Reflection.Metadata;

namespace ProjectBookingTravel.Formats
{
    public class BaseApiController : ControllerBase
    {
        protected string Message { get; set; }
        protected object Data { get; set; }
        protected int Status { get; set; }
        protected int TotalRow { get; set; }

        private readonly ILogger _BugLogger;

        protected IActionResult GetActionResult()
        {
            return Ok(new
            {
                Status = Status,
                Message = Message,
                Data = Data,
                TotalRow = TotalRow,
            });
        }

        protected IActionResult CreateActionResult(Func<IActionResult> funct)
        {
            try
            {
                return funct.Invoke();
            }
            catch (Exception ex)
            {
                if (_BugLogger != null)
                    _BugLogger.LogInformation(ex.Message);
                Status = -1;
                return Ok(new
                {
                    Status = -1,
                    Message = ex.Message,
                });
            }
        }
    }
}
