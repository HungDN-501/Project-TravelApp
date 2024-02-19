using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.Models
{
    internal class AccountMOD
    {
    }

    public class AccountModel
    {
        public string UserName { get; set; }
        public string Avatar { get; set; }
        public string Email { get; set; }
        public int PhoneNumber { get; set; }
        public string Password { get; set; }
    }

    public class GetAccountModel : AccountModel 
    {
        public int AccountID { get; set; }
    }

    public class AddAccountModel : AccountModel { }

    public class UpdatePassword
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
}
