import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_prj_travel/data/data_detail_tour/repository/detail_tour_repository.dart';
import 'package:my_prj_travel/models/detail_tour_model.dart';
import 'package:my_prj_travel/models/result_model.dart';

part 'detail_tour_event.dart';
part 'detail_tour_state.dart';

class DetailTourBloc extends Bloc<DetailTourEvent, DetailTourState> {
  final DetailTourRepository detailTourRepository;

  // Constructor
  DetailTourBloc(this.detailTourRepository) : super(DetailTourInitial()) {
    on<DetailTourFetchedRandomAndStar>(_getCurrentTourRandomAndStar);
    on<DetailTourFetchedBySearch>(_getCurrentTourSearch);
    on<DetailTourHandleMarkTour>(_handleMarkTour);
    on<DetailMarkTourFetched>(_getMarkTour);
  }

  // Random and Star
  void _getCurrentTourRandomAndStar(DetailTourFetchedRandomAndStar event,
      Emitter<DetailTourState> emit) async {
    // Load
    emit(DetailTourLoading());

    try {
      final tourRandom =
          await detailTourRepository.getCurrentTourRandom(event.idAcc);
      final tourStar =
          await detailTourRepository.getCurrentTourStar(event.idAcc);

      // Lấy thông tin thành công
      emit(GetDetailTourRandomAndStarSuccess(
          listDetailTourModelRandom: tourRandom,
          listDetailTourModelStar: tourStar));
    } catch (e) {
      // Lấy thông tin lỗi
      emit(GetDetailTourRandomAndStarFailure(e.toString()));
    }
  }

  // Search
  void _getCurrentTourSearch(
      DetailTourFetchedBySearch event, Emitter<DetailTourState> emit) async {
    // Load
    emit(DetailTourLoading());

    try {
      final tourSearch = await detailTourRepository.getCurrentTourSearch(
          event.keyWord, event.idAcc);

      // Lấy thông tin thành công
      emit(GetDetailTourSearchSuccess(listDetailTourModelSearch: tourSearch));
    } catch (e) {
      // Lấy thông tin lỗi
      emit(GetDetailTourRandomAndStarFailure(e.toString()));
    }
  }

  // Get Mark Tour
  void _getMarkTour(
      DetailMarkTourFetched event, Emitter<DetailTourState> emit) async {
    // Load
    emit(DetailTourLoading());

    try {
      final tourSearch =
          await detailTourRepository.getDetailMarkTour(event.idAcc);

      // Lấy thông tin thành công
      emit(GetDetailMarkTourSuccess(listDetailMarkTourModel: tourSearch));
    } catch (e) {
      // Lấy thông tin lỗi
      emit(GetDetailTourRandomAndStarFailure(e.toString()));
    }
  }

  // Handle IsMark
  void _handleMarkTour(
      DetailTourHandleMarkTour event, Emitter<DetailTourState> emit) async {
    // Load
    emit(DetailTourLoading());

    try {
      final result = await detailTourRepository.handleMarkTour(
          event.idAcc, event.idTour, event.typeHandle);

      // Lấy thông tin thành công
      emit(HandleMarkTourSuccess(resultModel: result));
    } catch (e) {
      // Lấy thông tin lỗi
      emit(GetDetailTourRandomAndStarFailure(e.toString()));
    }
  }
}
