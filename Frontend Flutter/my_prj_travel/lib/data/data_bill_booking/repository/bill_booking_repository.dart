import 'dart:convert';

import 'package:my_prj_travel/data/data_bill_booking/provider/bill_booking_provider.dart';
import 'package:my_prj_travel/models/bill_model.dart';
import 'package:my_prj_travel/models/result_model.dart';

class BillBookingRepository {
  final BillBokingProvider billBokingProvider;
  BillBookingRepository(this.billBokingProvider);

  Future<ResultModel> createBillBoking(int tourId, int accId, String booker,
      int phone, int numPeople, String depSche, int total) async {
    try {
      Map body = {
        "TourID": tourId,
        "AccountID": accId,
        "Booker": booker,
        "Phone": phone,
        "NumPeople": numPeople,
        "DepartureSchedule": "${depSche}T00:00:00",
        "Total": total
      };

      // Lấy dữ liệu Json Api
      final loginData = await billBokingProvider.createBillBooking(body);

      // Chuyển dữ liệu Json thành dạng Map
      final data = jsonDecode(loginData);

      // Chuyển dạng Map thành Model
      return ResultModel.fromMap(data);
    } catch (e) {
      print("Error get $e");
      throw e.toString();
    }
  }

  Future<List<HistoryBillModel>> getHistoryBillById(int idAcc) async {
    List<HistoryBillModel> result = [];
    try {
      // Lấy dữ liệu Json Api
      final loginData = await billBokingProvider.getHistoryBillBooking(idAcc);

      // Chuyển dữ liệu Json thành dạng Map
      final dataApi = jsonDecode(loginData);

      var data = dataApi['Data'] as List<dynamic>;

      for (var element in data) {
        result.add(HistoryBillModel.fromMap(element));
      }

      return result;
    } catch (e) {
      print("Error get $e");
      throw e.toString();
    }
  }
}
