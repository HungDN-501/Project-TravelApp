part of 'bill_booking_bloc.dart';

@immutable
sealed class BillBookingEvent {}

// Sự kiện lấy API
final class CreateBillBookingEvent extends BillBookingEvent {
  final int tourId;
  final int accId;
  final String booker;
  final int phone;
  final int numPeople;
  final String departureSchedule;
  final int total;

  CreateBillBookingEvent({
    required this.tourId,
    required this.accId,
    required this.booker,
    required this.phone,
    required this.numPeople,
    required this.departureSchedule,
    required this.total,
  });
}

// Check email Event
final class GetBillBookingByIdEvent extends BillBookingEvent {
  final int idAcc;

  GetBillBookingByIdEvent({
    required this.idAcc,
  });
}
