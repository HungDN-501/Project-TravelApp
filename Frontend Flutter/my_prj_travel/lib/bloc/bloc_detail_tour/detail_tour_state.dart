part of 'detail_tour_bloc.dart';

@immutable
sealed class DetailTourState {}

// Trạng thái khởi tạo
final class DetailTourInitial extends DetailTourState {}

// Trạng thái API Random and Star thành công
final class GetDetailTourRandomAndStarSuccess extends DetailTourState {
  final List<DetailTourModel> listDetailTourModelRandom;
  final List<DetailTourModel> listDetailTourModelStar;

  GetDetailTourRandomAndStarSuccess({
    required this.listDetailTourModelRandom,
    required this.listDetailTourModelStar,
  });
}

// Trạng thái API Search thành công
final class GetDetailTourSearchSuccess extends DetailTourState {
  final List<DetailTourModel> listDetailTourModelSearch;

  GetDetailTourSearchSuccess({
    required this.listDetailTourModelSearch,
  });
}

// Trạng thái API MarkTour thành công
final class GetDetailMarkTourSuccess extends DetailTourState {
  final List<DetailTourModel> listDetailMarkTourModel;

  GetDetailMarkTourSuccess({
    required this.listDetailMarkTourModel,
  });
}

// Trạng thái API Handle MarkTour thành công
final class HandleMarkTourSuccess extends DetailTourState {
  final ResultModel resultModel;

  HandleMarkTourSuccess({
    required this.resultModel,
  });
}

// Trạng thái API Random thất bại
final class GetDetailTourRandomAndStarFailure extends DetailTourState {
  final String error;

  GetDetailTourRandomAndStarFailure(this.error);
}

// Trạng thái load
final class DetailTourLoading extends DetailTourState {}
