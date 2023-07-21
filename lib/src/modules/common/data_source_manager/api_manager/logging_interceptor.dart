import 'dart:convert';

import 'package:dio/dio.dart';

class CustomLoggingInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handle) async {
    _LoggingModel model;
    if (err.response != null) {
      model = _LoggingModel(
        uri: err.response!.requestOptions.uri.toString(),
        statusCode: err.response!.statusCode?.toString(),
        error: '$err',
      );
    } else {
      model = _LoggingModel(
        uri: err.requestOptions.uri.toString(),
        error: '$err',
      );
    }
    logPrint(model);
    handle.next(err);
  }

  void logPrint(_LoggingModel logs) {
    try {
      var message = json.encode(logs.toJson());
      // log message here
    } on Exception {
      var mess =
          '{\"uri\": \"${logs.uri}\", \"statusCode\": \"${logs.statusCode}\", \"error\":\"${logs.error}\"}';
      // log message here
    }
  }
}

class _LoggingModel {
  String? uri;
  String? statusCode;
  String? error;

  _LoggingModel({this.uri, this.statusCode, this.error});

  _LoggingModel.fromJson(Map<String, dynamic> json) {
    uri = json['uri'];
    statusCode = json['statusCode'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uri'] = uri;
    data['statusCode'] = statusCode;
    data['error'] = error;
    return data;
  }
}
