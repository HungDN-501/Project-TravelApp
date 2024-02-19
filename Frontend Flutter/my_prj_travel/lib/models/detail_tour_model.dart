class DetailTourModel {
  final int? TourID;
  final String? NameTour;
  final String? Image;
  final int? Price;
  final int? Star;
  final int? PlaceView;
  final String? ContentTour;
  final int? LocationID;
  final String? NameLocation;
  final String? NameNation;
  final bool? IsSave;

  DetailTourModel({
    this.TourID,
    this.NameTour,
    this.Image,
    this.Price,
    this.Star,
    this.PlaceView,
    this.ContentTour,
    this.LocationID,
    this.NameLocation,
    this.NameNation,
    this.IsSave,
  });

  // Chuyển dữ liệu Map thành đối tượng LoginModel
  factory DetailTourModel.fromMap(
      Map<String, dynamic> map, List<int> listSave) {
    return DetailTourModel(
      TourID: map['TourID'],
      NameTour: map['NameTour'].toString(),
      Image: map['Image'].toString(),
      Price: map['Price'],
      Star: map['Star'],
      PlaceView: map['PlaceView'],
      ContentTour: map['ContentTour'].toString(),
      LocationID: map['LocationID'],
      NameLocation: map['NameLocation'],
      NameNation: map['NameNation'],
      IsSave: listSave.contains(map['TourID']) ? true : false,
    );
  }

  factory DetailTourModel.fromMapMarkTour(Map<String, dynamic> map) {
    return DetailTourModel(
      TourID: map['TourID'],
      NameTour: map['NameTour'].toString(),
      Image: map['Image'].toString(),
      Price: map['Price'],
      Star: map['Star'],
      PlaceView: map['PlaceView'],
      ContentTour: map['ContentTour'].toString(),
      LocationID: map['LocationID'],
      NameLocation: map['NameLocation'],
      NameNation: map['NameNation'],
      IsSave: true,
    );
  }
}
