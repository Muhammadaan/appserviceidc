import 'package:dio/dio.dart';

import 'package:tokokita/models/login_response.dart';
import 'package:tokokita/models/register_response.dart';

import 'app_service.dart';

class AuthService {
  static Dio _dio = AppService().dio;
  static Response response;

  static Future login({String email, String password}) async {
    try {
      response = await _dio
          .post('/login', data: {'emailorphone': email, 'password': password});
      return LoginResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.request);
      }
    }
  }

  static Future register(
      {String name, String email, String mobilePhone, String password}) async {
    try {
      response = await _dio.post('/register', data: {
        'name': name,
        'email': email,
        'mobile_phone': mobilePhone,
        'password': password
      });
      return RegisterResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.request);
      }
    }
  }
}
