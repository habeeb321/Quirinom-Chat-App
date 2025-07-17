import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:qurinom_chat_app/screens/login/model/login_model.dart';

class LoginService {
  static final Dio dio = Dio();

  static Future<LoginModel?> getLogin({
    required String email,
    required String password,
    required String role,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "email": email,
      "password": password,
      "role": role,
    });

    try {
      Response response = await dio.post(
        'http://45.129.87.38:6065/user/login',
        options: Options(headers: headers),
        data: body,
      );

      if (response.statusCode == 200 && response.data != null) {
        log('Success: ${response.data}');
        if (response.data is String) {
          Map<String, dynamic> data = jsonDecode(response.data);
          return LoginModel.fromJson(data);
        } else if (response.data is Map) {
          Map<String, dynamic> data = response.data;
          return LoginModel.fromJson(data);
        } else {
          log('Unexpected response format');
          return null;
        }
      } else {
        log('HTTP Error: Status code ${response.statusCode}');
      }
    } catch (e) {
      log('getLogin Error : $e');
    }
    return null;
  }
}
