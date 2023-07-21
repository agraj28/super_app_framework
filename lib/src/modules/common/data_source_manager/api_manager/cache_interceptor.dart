import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class CacheInterceptorManager {
  void removeCacheInterceptor(Dio dio) {
    if (dio.options.extra.isNotEmpty) {
      dio.options.extra
        ..remove(DIO_CACHE_KEY_TRY_CACHE)
        ..remove(DIO_CACHE_KEY_MAX_AGE)
        ..remove(DIO_CACHE_KEY_MAX_STALE)
        ..remove(DIO_CACHE_KEY_PRIMARY_KEY)
        ..remove(DIO_CACHE_KEY_SUB_KEY)
        ..remove(DIO_CACHE_KEY_FORCE_REFRESH);
    }
    if (dio.interceptors.isNotEmpty) {
      dio.interceptors
          .removeWhere((element) => element is CacheInterceptorHandler);
    }
  }

  void attachCacheInterceptor(Dio? dio,
      {Options? options,
      Duration? maxAge,
      Duration? maxStale,
      String? primaryKey,
      String? subKey,
      bool? forceRefresh}) {
    if (dio != null) {
      removeCacheInterceptor(dio);
      var config = buildConfigurableCacheOptions(
          options: options,
          maxAge: maxAge,
          maxStale: maxStale,
          primaryKey: primaryKey,
          subKey: subKey,
          forceRefresh: forceRefresh);
      if (config.extra != null && config.extra!.isNotEmpty) {
        dio.options.extra.addAll(config.extra!);
        dio.interceptors.add(CacheInterceptorHandler());
      }
    }
  }
}

class CacheInterceptorHandler implements InterceptorsWrapper {
  final DioCacheManager _cacheManager = DioCacheManager(CacheConfig());

  @override
  Future? onError(DioError err, ErrorInterceptorHandler handler) {
    return _cacheManager.interceptor.onError(err, handler);
  }

  @override
  Future? onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    return _cacheManager.interceptor.onRequest(options, handler);
  }

  @override
  Future? onResponse(Response response, ResponseInterceptorHandler handler) {
    return _cacheManager.interceptor.onResponse(response, handler);
  }
}
