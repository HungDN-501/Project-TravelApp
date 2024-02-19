part of 'bill_booking_bloc.dart';

@immutable
sealed class BillBookingState {}

// Trạng thái khởi tạo
final class BillBookingInitial extends BillBookingState {}

// Tạo Bill thành công
final class CreateBillBookingSuccess extends BillBookingState {
  final ResultModel resultModel;

  CreateBillBookingSuccess({required this.resultModel});
}

// Lấy History Bill thành công
final class GetHistoryBillBookingSuccess extends BillBookingState {
  final List<HistoryBillModel> listHistoryBill;

  GetHistoryBillBookingSuccess({required this.listHistoryBill});
}

// Trạng thái thất bại
final class BillBookingFailure extends BillBookingState {
  final String error;

  BillBookingFailure(this.error);
}

// Trạng thái load
final class BillBookingLoading extends BillBookingState {}
