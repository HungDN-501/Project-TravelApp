using BookingTravel.DAL;
using BookingTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.BUS
{
    public class AccountBUS
    {
        AccountDAL accountDAL { get; set; }
        BaseResultModel baseResult { get; set; }
        public AccountBUS()
        {
            this.accountDAL = new AccountDAL();
            this.baseResult = new BaseResultModel();
        }

        public List<GetAccountModel> GetAllAccount(string baseUrl)
        {
            return accountDAL.GetAllAccount(baseUrl);
        }

        public BaseResultModel AddAccount(AddAccountModel item)
        {
            int value;

            if (item.Email.Trim().Contains("@gmail.com"))
            {
                if (CheckEmail(item.Email.Trim()))
                {
                    baseResult.Status = -1;
                    baseResult.Message = "Email này đã được đăng ký";
                }
                else
                {
                    value = accountDAL.AddAccount(item);
                    switch (value)
                    {
                        case 0:
                            baseResult.Status = -1;
                            baseResult.Message = "Lỗi khi thực hiện Sql";
                            break;
                        case 1:
                            baseResult.Status = 1;
                            baseResult.Message = "Thêm thành công";
                            break;
                        default:
                            baseResult.Status = -1;
                            baseResult.Message = "Lỗi không thể xác định";
                            break;
                    }
                }
            }
            else
            {
                baseResult.Status = -1;
                baseResult.Message = "Email không đúng định dạng";
            }

            return baseResult;
        }

        public BaseResultModel UpdatePassword(UpdatePassword item)
        {
            int value;

            if (item.Email.Trim().Contains("@gmail.com"))
            {
                if (!CheckEmail(item.Email.Trim()))
                {
                    baseResult.Status = -1;
                    baseResult.Message = "Email này không đúng";
                }
                else
                {
                    value = accountDAL.UpdatePassword(item);
                    switch (value)
                    {
                        case 0:
                            baseResult.Status = -1;
                            baseResult.Message = "Lỗi khi thực hiện Sql";
                            break;
                        case 1:
                            baseResult.Status = 1;
                            baseResult.Message = "Sửa thành công";
                            break;
                        default:
                            baseResult.Status = -1;
                            baseResult.Message = "Lỗi không thể xác định";
                            break;
                    }
                }
            }
            else
            {
                baseResult.Status = -1;
                baseResult.Message = "Email không đúng định dạng";
            }

            return baseResult;
        }

        public bool CheckEmail (string email)
        {
            return accountDAL.CheckEmail(email);
        }
    }
}
