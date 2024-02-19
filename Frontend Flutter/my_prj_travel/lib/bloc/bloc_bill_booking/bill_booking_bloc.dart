import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/data/data_bill_booking/repository/bill_booking_repository.dart';
import 'package:my_prj_travel/models/bill_model.dart';
import 'package:my_prj_travel/models/result_model.dart';

part 'bill_booking_event.dart';
part 'bill_booking_state.dart';

class BillBookingBloc extends Bloc<BillBookingEvent, BillBookingState> {
  final BillBookingRepository billBookingRepository;

  // Constructor
  BillBookingBloc(this.billBookingRepository) : super(BillBookingInitial()) {
    on<CreateBillBookingEvent>(_createBillBooking);
    on<GetBillBookingByIdEvent>(_getBillBookingById);
  }

  void _createBillBooking(
      CreateBillBookingEvent event, Emitter<BillBookingState> emit) async {
    // Load
    emit(BillBookingLoading());

    try {
      // Láy thông tin đối tượng
      final result = await billBookingRepository.createBillBoking(
        event.tourId,
        event.accId,
        event.booker,
        event.phone,
        event.numPeople,
        event.departureSchedule,
        event.total,
      );

      // Lấy thông tin thành công
      emit(CreateBillBookingSuccess(resultModel: result));
    } catch (e) {
      // Lấy thông tin lỗi
      emit(BillBookingFailure(e.toString()));
    }
  }

  void _getBillBookingById(
      GetBillBookingByIdEvent event, Emitter<BillBookingState> emit) async {
    // Load
    emit(BillBookingLoading());

    try {
      // Láy thông tin đối tượng
      final result =
          await billBookingRepository.getHistoryBillById(event.idAcc);

      // Lấy thông tin thành công
      emit(GetHistoryBillBookingSuccess(listHistoryBill: result));
    } catch (e) {
      // Lấy thông tin lỗi
      emit(BillBookingFailure(e.toString()));
    }
  }
}
