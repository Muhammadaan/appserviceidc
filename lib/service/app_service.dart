import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokokita/utils/global_method_helper.dart';

class AppService {
  static AppService _instance;
  final String apiBaseURL;
  final String appTitle;

  SharedPreferences prefs;
  Dio dio;

  AppService.configure({this.apiBaseURL, this.appTitle}) {
    _instance = this;
  }

  factory AppService() {
    if (_instance == null) {
      throw UnimplementedError("App must be configured first.");
    }

    return _instance;
  }

  Future<Null> init() async {
    prefs = await SharedPreferences.getInstance();

    dio = Dio(BaseOptions(
        baseUrl: apiBaseURL,
        connectTimeout: 10000,
        receiveTimeout: 50000,
        responseType: ResponseType.json));

    dio.options.headers = {
      'Authorization': 'Bearer ${prefs.getString('token')}',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };

    dio.interceptors.add(InterceptorsWrapper(onError: (DioError e) async {
      Map<String, dynamic> data = e.response.data;
      if (e.response.statusCode != null) {
        if (e.response.statusCode == 400) {}
        // INFO : Kicking out user to login page when !authenticated
        if (e.response.statusCode == 401) {
          String message = data['message'];
          if (!GlobalMethodHelper.isEmpty(message)) {
            if (message == 'Unauthorized') {
              //  PopUp

            }
          }
        }
      }
      return e;
    }));
  }
}
