import 'dart:convert';

import 'package:my_prj_travel/data/data_detail_tour/provider/detail_tour_provider.dart';
import 'package:my_prj_travel/models/detail_tour_model.dart';
import 'package:my_prj_travel/models/result_model.dart';

class DetailTourRepository {
  final DetailTourDataProvider detailTourDataProvider;
  DetailTourRepository(this.detailTourDataProvider);

  // dữ liệu Random
  Future<List<DetailTourModel>> getCurrentTourRandom(int idAcc) async {
    List<DetailTourModel> result = [];

    try {
      // Lấy dữ liệu Json Api
      final loginData = await detailTourDataProvider.getCurrentTourRandom();

      List<int> listSave = await getIdMarkTour(idAcc);

      // Chuyển dữ liệu Json thành dạng Map
      final dataApi = jsonDecode(loginData);

      var data = dataApi['Data'] as List<dynamic>;

      for (var element in data) {
        result.add(DetailTourModel.fromMap(element, listSave));
      }

      return result;
    } catch (e) {
      print("Error get Random $e");
      throw e.toString();
    }
  }

  // dữ liệu most stars
  Future<List<DetailTourModel>> getCurrentTourStar(int idAcc) async {
    List<DetailTourModel> result = [];

    try {
      // Lấy dữ liệu Json Api
      final loginData = await detailTourDataProvider.getCurrentTourStar();

      List<int> listSave = await getIdMarkTour(idAcc);

      // Chuyển dữ liệu Json thành dạng Map
      final dataApi = jsonDecode(loginData);

      var data = dataApi['Data'] as List<dynamic>;

      for (var element in data) {
        result.add(DetailTourModel.fromMap(element, listSave));
      }

      return result;
    } catch (e) {
      print("Error get Star $e");
      throw e.toString();
    }
  }

  // dữ liệu search
  Future<List<DetailTourModel>> getCurrentTourSearch(
      String keyWord, int idAcc) async {
    List<DetailTourModel> result = [];

    try {
      Map body = {
        "PlaceView": 0,
        "Keyword": keyWord,
      };

      // Lấy dữ liệu Json Api
      final loginData = await detailTourDataProvider.getCurrentTourSearch(body);

      List<int> listSave = await getIdMarkTour(idAcc);

      // Chuyển dữ liệu Json thành dạng Map
      final dataApi = jsonDecode(loginData);

      var data = dataApi['Data'] as List<dynamic>;

      for (var element in data) {
        result.add(DetailTourModel.fromMap(element, listSave));
      }

      return result;
    } catch (e) {
      print("Error get Search $e");
      throw e.toString();
    }
  }

  // dữ liệu Detail lưu địa điểm
  Future<List<DetailTourModel>> getDetailMarkTour(int idAcc) async {
    List<DetailTourModel> result = [];

    try {
      // Lấy dữ liệu Json Api
      final loginData = await detailTourDataProvider.getDetailMarkTour(idAcc);

      // Chuyển dữ liệu Json thành dạng Map
      final dataApi = jsonDecode(loginData);

      var data = dataApi['Data'] as List<dynamic>;

      for (var element in data) {
        result.add(DetailTourModel.fromMapMarkTour(element));
      }

      return result;
    } catch (e) {
      print("Error get MarkTour $e");
      throw e.toString();
    }
  }

  // dữ liệu ID lưu địa điểm
  Future<List<int>> getIdMarkTour(int idAcc) async {
    List<int> result = [];

    try {
      // Lấy dữ liệu Json Api
      final loginData = await detailTourDataProvider.getDetailMarkTour(idAcc);

      // Chuyển dữ liệu Json thành dạng Map
      final dataApi = jsonDecode(loginData);

      var data = dataApi['Data'] as List<dynamic>;

      for (var element in data) {
        result.add(element["TourID"]);
      }

      return result;
    } catch (e) {
      print("Error get Id MarkTour $e");
      throw e.toString();
    }
  }

  Future<ResultModel> handleMarkTour(
      int accId, int tourId, int typeHandle) async {
    try {
      Map body = {
        "AccountID": accId,
        "TourID": tourId,
        "TypeHandle": typeHandle
      };

      // Lấy dữ liệu Json Api
      final loginData = await detailTourDataProvider.handleMarkTour(body);

      // Chuyển dữ liệu Json thành dạng Map
      final data = jsonDecode(loginData);

      // Chuyển dạng Map thành Model
      return ResultModel.fromMap(data);
    } catch (e) {
      print("Error get $e");
      throw e.toString();
    }
  }
}
