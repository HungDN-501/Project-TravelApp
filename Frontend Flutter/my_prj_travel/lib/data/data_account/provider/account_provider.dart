import 'dart:convert';

import 'package:http/http.dart' as http;

class AccountDataProvider {
  // Login từ Api
  Future<String> getCurrentLogin(Map body) async {
    try {
      // Lấy dữ liệu Json từ Api trả về
      final res = await http.post(
        Uri.parse(
          'http://localhost:8081/api/Login/login',
        ),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      // 200 : Oke
      // 404 : Sai Url Api
      // 400 : Sai model body

      // print("Status API : ${res.statusCode}");
      // print("Result API : ${res.reasonPhrase}");
      print("Body API : ${res.body}");

      // lấy thông tin nội dung
      return res.body;
    } catch (e) {
      print("error : ${e.toString()}");
      throw e.toString();
    }
  }

  // register
  Future<String> getCurrentRegister(Map body) async {
    try {
      // Lấy dữ liệu Json từ Api trả về
      final res = await http.post(
        Uri.parse(
          'http://localhost:8081/api/account/Add',
        ),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      // 200 : Oke
      // 404 : Sai Url Api
      // 400 : Sai model body

      // print("Status API : ${res.statusCode}");
      // print("Result API : ${res.reasonPhrase}");
      // print("Body API : ${res.body}");

      // lấy thông tin nội dung
      return res.body;
    } catch (e) {
      print("error : ${e.toString()}");
      throw e.toString();
    }
  }

  // Check mail
  Future<String> getCurrentCheckMail(String body) async {
    try {
      // Lấy dữ liệu Json từ Api trả về
      final res = await http.post(
        Uri.parse(
          'http://localhost:8081/api/account/CheckEmail',
        ),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      // 200 : Oke
      // 404 : Sai Url Api
      // 400 : Sai model body

      // print("Status API : ${res.statusCode}");
      // print("Result API : ${res.reasonPhrase}");
      // print("Body API : ${res.body}");

      // lấy thông tin nội dung
      return res.body;
    } catch (e) {
      print("error : ${e.toString()}");
      throw e.toString();
    }
  }

  // Check mail
  Future<String> getCurrentResetPass(Map body) async {
    try {
      // Lấy dữ liệu Json từ Api trả về
      final res = await http.post(
        Uri.parse(
          'http://localhost:8081/api/account/UpdatePassword',
        ),
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      // 200 : Oke
      // 404 : Sai Url Api
      // 400 : Sai model body

      // print("Status API : ${res.statusCode}");
      // print("Result API : ${res.reasonPhrase}");
      // print("Body API : ${res.body}");

      // lấy thông tin nội dung
      return res.body;
    } catch (e) {
      print("error : ${e.toString()}");
      throw e.toString();
    }
  }
}
