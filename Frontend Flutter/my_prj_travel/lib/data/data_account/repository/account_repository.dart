import 'dart:convert';

import 'package:my_prj_travel/data/data_account/provider/account_provider.dart';
import 'package:my_prj_travel/models/account_model.dart';
import 'package:my_prj_travel/models/result_model.dart';

class AccountRepository {
  final AccountDataProvider accountDataProvider;
  AccountRepository(this.accountDataProvider);

  // Lấy tông tin dữ liệu LoginModel từ API
  Future<AccInfoModel> getCurrentLogin(String email, String password) async {
    try {
      Map body = {
        "UserName": "",
        "Email": email.trim(),
        "Password": password.trim(),
      };

      // Lấy dữ liệu Json Api
      final loginData = await accountDataProvider.getCurrentLogin(body);

      // Chuyển dữ liệu Json thành dạng Map
      final data = jsonDecode(loginData);

      // Chuyển dạng Map thành Model
      return AccInfoModel.fromMap(data);
    } catch (e) {
      print("Error get $e");
      throw e.toString();
    }
  }

  // Lấy tông tin dữ liệu LoginModel từ API
  Future<ResultModel> getCurrentRegister(
      String username, String email, int phone, String password) async {
    try {
      Map body = {
        "UserName": username,
        "Avatar": "",
        "Email": email,
        "PhoneNumber": phone,
        "Password": password,
      };

      // Lấy dữ liệu Json Api
      final loginData = await accountDataProvider.getCurrentRegister(body);

      // Chuyển dữ liệu Json thành dạng Map
      final data = jsonDecode(loginData);

      // Chuyển dạng Map thành Model
      return ResultModel.fromMap(data);
    } catch (e) {
      print("Error get $e");
      throw e.toString();
    }
  }

  Future<ResultModel> getCurrentCheckMail(String email) async {
    try {
      // Lấy dữ liệu Json Api
      final loginData = await accountDataProvider.getCurrentCheckMail(email);

      // Chuyển dữ liệu Json thành dạng Map
      final data = jsonDecode(loginData);

      // Chuyển dạng Map thành Model
      return ResultModel.fromMap(data);
    } catch (e) {
      print("Error get $e");
      throw e.toString();
    }
  }

  Future<ResultModel> getCurrentResetPass(String email, String newPass) async {
    try {
      Map body = {"Email": email, "Password": newPass};

      // Lấy dữ liệu Json Api
      final loginData = await accountDataProvider.getCurrentResetPass(body);

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
