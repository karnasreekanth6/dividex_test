import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dividex_new/customers/network/DioUtils.dart';
import 'package:flutter/foundation.dart';

class Network {

  static final Network instance = Network();
  Response? response;

  Future<bool> hasNetworkAvailable({bool isFromRetryScreen = false}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  Future<dynamic> getApi(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        dynamic data,
      }) async {
    try {
      if (kDebugMode) {
        print("Api $url\n Method---> GET\n");
      }
      final dio = await DioUtils.instance.getDioInstance();
      if (headers != null) {
        dio.options.headers.addAll(headers);
      }
      print('dio method called');
      final response = await dio.get(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      if (kDebugMode) {
        print("Response $response");
      }
      return response;
    } catch (error) {
      rethrow;
    }
  }


}