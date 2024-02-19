import 'package:my_prj_travel/models/detail_tour_model.dart';

class BillTourModel {
  final String? booker;
  final int? phone;
  final int? numberPeople;
  final String? departureSchedule;
  final DetailTourModel? detailTourModel;

  BillTourModel({
    this.booker,
    this.phone,
    this.numberPeople,
    this.departureSchedule,
    this.detailTourModel,
  });
}

class HistoryBillModel {
  final int? billBookID;
  final String? nameTour;
  final int? tourID;
  final int? accountID;
  final String? booker;
  final int? phone;
  final int? numPeople;
  final String? departureSchedule;
  final int? total;

  HistoryBillModel({
    this.billBookID,
    this.nameTour,
    this.tourID,
    this.accountID,
    this.booker,
    this.phone,
    this.numPeople,
    this.departureSchedule,
    this.total,
  });

  factory HistoryBillModel.fromMap(Map<String, dynamic> map) {
    return HistoryBillModel(
      billBookID: map['BillBookID'],
      nameTour: map['NameTour'].toString(),
      tourID: map['TourID'],
      accountID: map['AccountID'],
      booker: map['Booker'].toString(),
      phone: map['Phone'],
      numPeople: map['NumPeople'],
      departureSchedule: map['DepartureSchedule'].toString(),
      total: map['Total'],
    );
  }
}
