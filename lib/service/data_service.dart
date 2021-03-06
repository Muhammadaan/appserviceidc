import 'package:dio/dio.dart';
import 'package:tokokita/models/create_order_request.dart';
import 'package:tokokita/models/create_order_response.dart';
import 'package:tokokita/models/domisili_response.dart';
import 'package:tokokita/models/list_package_response.dart';
import 'package:tokokita/models/payment_response.dart';

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

  static Future getListDomisili() async {
    try {
      response = await _dio.get(
        '/domisili',
      );
      return DomisliResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.request);
      }
    }
  }

  static Future getListPayment() async {
    try {
      response = await _dio.get(
        '/method-payment',
      );
      return PayementResponse.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        print(e.response.statusCode);
      } else {
        print(e.message);
        print(e.request);
      }
    }
  }

  static Future createdOrder({CreateOrderRequest dataorder}) async {
    try {
      response = await _dio.post('/create-order', data: dataorder);
      return CreateOrderResponse.fromJson(response.data);
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
