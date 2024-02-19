part of 'detail_tour_bloc.dart';

@immutable
sealed class DetailTourEvent {}

// Sự kiện lấy API Random
final class DetailTourFetchedRandomAndStar extends DetailTourEvent {
  final int idAcc;
  DetailTourFetchedRandomAndStar({required this.idAcc});
}

// Sự kiện lấy API Most Search
final class DetailTourFetchedBySearch extends DetailTourEvent {
  final int idAcc;
  final String keyWord;
  DetailTourFetchedBySearch({required this.idAcc, required this.keyWord});
}

// Sự kiện lấy API MarkTour
final class DetailMarkTourFetched extends DetailTourEvent {
  final int idAcc;
  DetailMarkTourFetched({required this.idAcc});
}

// Sự kiện lấy API HandleMarkTour
final class DetailTourHandleMarkTour extends DetailTourEvent {
  final int idAcc;
  final int idTour;
  final int typeHandle;
  DetailTourHandleMarkTour({
    required this.idAcc,
    required this.idTour,
    required this.typeHandle,
  });
}
