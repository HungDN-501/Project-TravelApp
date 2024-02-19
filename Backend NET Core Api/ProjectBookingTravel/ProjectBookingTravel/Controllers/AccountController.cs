using BookingTravel.BUS;
using BookingTravel.Models;
using BookingTravel.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Razor.TagHelpers;
using Microsoft.Extensions.Options;
using ProjectBookingTravel.Formats;

namespace ProjectBookingTravel.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountController : BaseApiController
    {
        private AccountBUS accountBUS;

        public AccountController()
        {
            this.accountBUS = new AccountBUS();
        }

        [HttpGet, Route("GetAll")]
        public IActionResult GetAllAccount()
        {
            try
            {
                return CreateActionResult(() =>
                {
                    IList<GetAccountModel> Data;

                    var baseUrl = $"http://{HttpContext.Request.Host}";

                    Data = accountBUS.GetAllAccount(baseUrl);
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

        [HttpPost, Route("Add")]
        public IActionResult AddAccount(AddAccountModel item)
        {
            try
            {
                return CreateActionResult(() =>
                {
                    
                    BaseResultModel result = accountBUS.AddAccount(item);
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

        [HttpPost, Route("CheckEmail")]
        public IActionResult UpdatePassword([FromBody]string email)
        {
            try
            {
                return CreateActionResult(() =>
                {
                    bool check = accountBUS.CheckEmail(email);
                    if (check)
                    {
                        base.Status = 1;
                        base.Message = "Tài khoản này đã có";
                    }
                    else
                    {
                        base.Status = -1;
                        base.Message = "Tài khoản này không tồn tại";
                    }
                   
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

        [HttpPost, Route("UpdatePassword")]
        public IActionResult UpdatePassword(UpdatePassword item)
        {
            try
            {
                return CreateActionResult(() =>
                {
                    BaseResultModel result = accountBUS.UpdatePassword(item);
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
    }
}
