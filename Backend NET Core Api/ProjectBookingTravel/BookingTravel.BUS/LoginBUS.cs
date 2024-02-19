using BookingTravel.DAL;
using BookingTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.BUS
{
    public class LoginBUS
    {
        private LoginDAL loginDAL;
        public LoginBUS()
        {
            loginDAL = new LoginDAL();
        }

        private InfoLoginModel GetInfoByLogin(string Email, string Password, string baseUrl)
        {
            return loginDAL.GetInfoByLogin(Email, Password, baseUrl);
        }

        public bool VerifyUser(string Email, string Password, string baseUrl, ref InfoLoginModel NguoiDung)
        {
            NguoiDung = GetInfoByLogin(Email, Password, baseUrl);
            if (NguoiDung != null)
            {
                return true;
            }
            return false;
        }
    }
}
