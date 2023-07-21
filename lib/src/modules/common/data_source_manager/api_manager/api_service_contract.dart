import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:super_app_framework/super_app_framework.dart';

import 'cache_interceptor.dart';
import 'interceptor_contract.dart';
import 'logging_interceptor.dart';

abstract class BaseApiService {
  late Dio _dioClient;
  late Dio _tokenDioClient;
  late CacheInterceptorManager _cacheManager;
  int timeout = 30 * 1000; // 30 seconds

  Dio getDioClient(
      {DioClientType type = DioClientType.DEFAULT_DIO, String? pem = ''}) {
    Dio dio;

    if (pem != null && pem.isNotEmpty) {
      type = DioClientType.SSL_PINNED_DIO;
    }

    if (type == DioClientType.TOKEN_DIO) {
      dio = _tokenDioClient = _getTokenDioClient();
    } else if (type == DioClientType.SSL_PINNED_DIO) {
      dio = _dioClient = _getSSLPinnedDioClient(pem: pem);
    } else {
      dio = _dioClient = _getDioClient();
    }
    _cacheManager = CacheInterceptorManager();
    _cacheManager.removeCacheInterceptor(dio);
    return dio;
  }

  CacheInterceptorManager getCacheInterceptorManager() {
    _cacheManager = CacheInterceptorManager();
    return _cacheManager;
  }

  void plugInterceptor(InterceptorContract contract) {
    var interceptor = _dioClient.interceptors.firstWhereOrNull(
        (element) => element.runtimeType == contract.runtimeType);
    if (interceptor == null) {
      _dioClient.interceptors.add(contract);
    }
  }

  void plugTokenInterceptor(InterceptorContract contract) {
    var interceptor = _tokenDioClient.interceptors.firstWhereOrNull(
        (element) => element.runtimeType == contract.runtimeType);
    if (interceptor == null) {
      _tokenDioClient.interceptors.add(contract);
    }
  }

  Dio _getDioClient() {
    final dio = Dio(BaseOptions(
      connectTimeout: timeout,
      receiveTimeout: timeout,
    ));

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    } else {
      dio.interceptors.add(CustomLoggingInterceptor());
    }
    return dio;
  }

  Dio _getTokenDioClient() {
    final dio = Dio(BaseOptions(
      connectTimeout: timeout,
      receiveTimeout: timeout,
    ));

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    } else {
      dio.interceptors.add(CustomLoggingInterceptor());
    }
    return dio;
  }

  Dio _getSSLPinnedDioClient({String? pem = ''}) {
    final dio = Dio(BaseOptions(
      connectTimeout: timeout,
      receiveTimeout: timeout,
    ));

    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
    } else {
      dio.interceptors.add(CustomLoggingInterceptor());
    }

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      //create a SecurityContext that doesn't trust the OS's certificates:
      var context = SecurityContext(withTrustedRoots: false);
      var pemBytes = utf8.encode(pem!);
      context.setTrustedCertificatesBytes(pemBytes);
      var httpClient = HttpClient(context: context)
        ..badCertificateCallback = _callBack;
      return httpClient;
    };

    return dio;
  }

  // This provide provision to handle the rejected connection request.
  // Setting it false i.e we don't want to continue for rejected connection.
  bool _callBack(X509Certificate cert, String host, int port) {
    return false;
  }
}
