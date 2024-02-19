using BookingTravel.DAL;
using BookingTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.BUS
{
    public class BillTourBUS
    {
        BillTourDAL billTourDAL { get; set; }
        BaseResultModel baseResult { get; set; }
        public BillTourBUS()
        {
            this.billTourDAL = new BillTourDAL();
            this.baseResult = new BaseResultModel();
        }

        public BaseResultModel AddBill(AddBillTourModel item)
        {
            int value;

            value = billTourDAL.AddBill(item);
            switch (value)
            {
                case 0:
                    baseResult.Status = -1;
                    baseResult.Message = "Lỗi khi thực hiện Sql";
                    break;
                case 1:
                    baseResult.Status = 1;
                    baseResult.Message = "Thêm bill thành công";
                    break;
                default:
                    baseResult.Status = -1;
                    baseResult.Message = "Lỗi không thể xác định";
                    break;
            }

            return baseResult;
        }

        public List<GetBillTourModel> GetBillTourById(int idAcc)
        {
            return billTourDAL.GetBillTourById(idAcc);
        }
    }
}
