using BookingTravel.BUS;
using BookingTravel.Models;
using BookingTravel.Utilities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Razor.TagHelpers;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using ProjectBookingTravel.Config;
using ProjectBookingTravel.Formats;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace ProjectBookingTravel.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : BaseApiController
    {
        // IOptions là một interface được sử dụng để lấy các tùy chọn cấu hình trong ứng dụng
        private IOptions<AppSettings> _AppSettings;

        private LoginBUS loginBUS;

        public LoginController(IOptions<AppSettings> Settings)
        {
            _AppSettings = Settings;
            loginBUS = new LoginBUS();
        }

        [Route("login")]
        [HttpPost]
        public IActionResult Login(LoginModel User)
        {
            try
            {
                //string Password = "";

                InfoLoginModel info = null;

                var baseUrl = $"http://{HttpContext.Request.Host}";

                bool checklogin = loginBUS.VerifyUser(User.Email.Trim(), User.Password.Trim(), baseUrl, ref info);

                // đăng nhập thành công
                if (checklogin)
                {
                    // Lưu thông tin vào Log
                    // Task.Run cho phép chạy không đồng bộ để không ảnh hưởng đến quá trình đăng nhập
                    // Task.Run(() => _LogHelper.Log(NguoiDung.CanBoID, "Đăng nhập hệ thống", (int)EnumLogType.DangNhap)); // Lưu lịch sử đăng nhập

                    var claims = new List<Claim>();

                    // Lấy thông tin múi giờ GMT+7
                    TimeZoneInfo gmt7TimeZone = TimeZoneInfo.FindSystemTimeZoneById("SE Asia Standard Time");

                    claims.Add(new Claim("AccountID", info?.AccountID.ToString()));
                    // thời gian hết hạn token
                    claims.Add(new Claim("expires_at", TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow.AddHours(1), gmt7TimeZone).ToString("dd-MM-yyyy HH:mm:ss tt")));
                    
                    // tạo token để phân quyền và xác thực
                    var tokenHandler = new JwtSecurityTokenHandler();

                    // mã hóa thành 1 mảng byte bằng thuật toán ASCII
                    var key = Encoding.ASCII.GetBytes(_AppSettings.Value.AudienceSecret);

                    // thông tin cần thiết của token
                    var tokenDescriptor = new SecurityTokenDescriptor
                    {
                        // chứa thông tin người dùng
                        Subject = new ClaimsIdentity(claims),

                        // Thời gian hết hạn
                        Expires = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow.AddHours(1), gmt7TimeZone),


                        // Khóa và type thuật toán
                        SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
                    };

                    // tạo token lấy thông tin từ tokenDescriptor
                    var token = tokenHandler.CreateToken(tokenDescriptor);

                    // lấy thông tin token
                    info.Token = tokenHandler.WriteToken(token);
                    // Lấy thời gian ngày hiện tại cộng vs ngày lấy từ ứng dụng để biết khi nào hết hạn token
                    info.expires_at = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow.AddHours(1), gmt7TimeZone).ToString("dd-MM-yyyy HH:mm:ss tt");

                    return Ok(new
                    {
                        Status = 1,
                        User = info,
                    });
                }
                else
                {
                    //Console.WriteLine("Id Account : " + info?.AccountID);
                    //// Console.WriteLine("ID "+ info.AccountID);
                    //string mess;
                    //if (info?.AccountID == null)
                    //{
                    //    mess = "Mật khẩu không đúng! Vui lòng thử lại!";
                    //}
                    //else
                    //{
                    //    mess = "Tài khoản không tồn tại!";
                    //}
                    return Ok(new
                    {
                        Status = -1,
                        Message = "Incorrect account",
                    });
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
