using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.Models
{
    public class LoginModel
    {
        public string UserName { get; set; }
        public string Email { get; set; } = "";
        public string Password { get; set; }
    }

    public class InfoLoginModel
    {
        public int AccountID { get; set; }
        public string Token { get; set; }
        public string expires_at { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; } = "";
        public string Avatar { get; set; }
        public int PhoneNumber { get; set; }
    }
}
