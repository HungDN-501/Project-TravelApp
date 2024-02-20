import 'dart:convert';

import 'package:http/http.dart' as http;

class BillBokingProvider {
  //
  Future<String> createBillBooking(Map body) async {
    try {
      // Lấy dữ liệu Json từ Api trả về
      final res = await http.post(
        Uri.parse(
          'http://localhost:8081/api/bill/Add',
        ),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      // lấy thông tin nội dung
      return res.body;
    } catch (e) {
      print("error : ${e.toString()}");
      throw e.toString();
    }
  }

  Future<String> getHistoryBillBooking(int idAcc) async {
    try {
      // Lấy dữ liệu Json từ Api trả về
      final res = await http.get(
        Uri.parse(
          'http://localhost:8081/api/bill/GetBillTourById?idAcc=$idAcc',
        ),
        headers: {'Content-Type': 'application/json'},
      );

      // lấy thông tin nội dung
      return res.body;
    } catch (e) {
      print("error : ${e.toString()}");
      throw e.toString();
    }
  }
}
