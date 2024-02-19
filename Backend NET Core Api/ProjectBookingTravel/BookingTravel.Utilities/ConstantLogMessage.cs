using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookingTravel.Utilities
{
    public static class ConstantLogMessage
    {
        #region API Mess
        public static readonly string API_Success = "Thực hiện thành công!";
        public static readonly string API_Error = "Có lỗi! Thử lại!";
        public static readonly string API_Error_Duplicate = "Có trường trùng lặp với đối tượng khác !Thử lại!";
        public static readonly string API_Error_System = "Lỗi hệ thống! vui lòng liên hệ quản trị viên để được hỗ trợ";
        public static readonly string API_Error_NotSelected = "Chưa chọn đối tượng hoặc đối tượng không tồn tại! Thử lại";
        public static readonly string API_Error_Exist = "Đối tượng đã tồn tại ! Thử lại!";
        public static readonly string API_Error_NotExist = "Đối tượng có trường không tồn tại ! Thử lại!";
        public static readonly string API_Error_NotSpecialCharacter = "Không thể chứa kí tự đặc biệt ! Thử lại!";
        public static readonly string API_Error_NotFill = "Không được để trống trường bắt buộc!";
        public static readonly string API_Insert_SuVHTTess = "Thêm mới thành công!";
        public static readonly string API_Update_SuVHTTess = "Update thành công";
        public static readonly string API_Delete_SuVHTTess = "Xóa thành công";
        public static readonly string API_NoData = "Không có dữ liệu";
        public static readonly string API_Error_TooLong = "Dữ liệu nhập vượt quá số ký tự quy định. Vui lòng kiểm tra lại";
        public static readonly string API_SuVHTTess_Import = "Import dữ liệu thành công!";
        public static readonly string API_Error_Email = "Email không đúng định dạng!";
        public static readonly string API_Error_PhoneNumBer = "Số điện thoại không đúng định dạng!";
        public static readonly string API_SendMail = "Gửi Mail!";
        public static readonly string API_Error_Status = "Trạng thái sử dụng không đúng định dạng";
        public static readonly string API_Export_ExelFile = "Export Exel file";
        #endregion
    }
}
