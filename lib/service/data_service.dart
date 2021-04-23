import 'package:dio/dio.dart';
import 'package:tokokita/models/list_package_response.dart';

import 'package:tokokita/models/service_response.dart';

import 'app_service.dart';

class DataService {
  static Dio _dio = AppService().dio;
  static Response response;

  static Future getService() async {
    try {
      response = await _dio.get(
        '/service',
      );
      return ServiceResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.request);
      }
    }
  }

  static Future getListPackage({int id}) async {
    try {
      response = await _dio.get(
        '/package-list/$id',
      );
      return PackageListResponse.fromJson(response.data);
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
