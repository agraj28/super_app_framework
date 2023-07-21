import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../data_provider/helper/app_exceptions.dart';
import '../../error_handler/error_model.dart';
import '../data_source_public.dart';


abstract class ExceptionHandler implements Exception {
  ErrorModel? _errorModel;
  DioError? _dioError;
  Exception? _exception;

  ExceptionHandler(Exception error) {
    // Init the error model for the default case
    _errorModel = ErrorModel(
        kApiUnknownErrorCode, kApiUnknownError, kErrorMessageGenericError);

    if (error is DioError) {
      _handleDioError(error);
      _dioError = error; // TODO: Check, if this is required
    }

    _exception = error;
  }

  ErrorModel? getErrorModel() => _errorModel;

  DioError? getDioError() => _dioError;

  Exception? getException() => _exception;

  void _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        _errorModel = ErrorModel(
            kApiCanceledCode, kApiCanceled, kErrorMessageGenericError);
        break;
      case DioErrorType.connectTimeout:
        _errorModel = ErrorModel(kApiConnectionTimeoutCode,
            kApiConnectionTimeout, kErrorMessageGenericError);
        break;
      case DioErrorType.other:
        if (error.error is SocketException || error.error is HttpException) {
          _errorModel = ErrorModel(
              kApiDefaultCode, kApiDefault, kErrorMessageNetworkError);
        } else if (error.error is UnauthorisedException) {
          _errorModel = ErrorModel(kApiUnAuthorisedExceptionErrorCode,
              kApiAuthExceptionError, kErrorMessageHandshakeException);
        } else if (error.error is! String &&
            error.error?.type == kHandshakeExceptionTypeKey) {
          _errorModel = ErrorModel(kApiHandshakeExceptionErrorCode,
              kApiHandshakeExceptionError, kErrorMessageHandshakeException);
        } else if (error.error?.response?.statusCode != null) {
          _errorModel = ErrorModel(
            error.error?.response?.statusCode ?? kApiDefaultCode,
            error.error?.response?.statusMessage ?? kApiDefault,
            kErrorMessageGenericError,
          );
        } else {
          _errorModel = ErrorModel(
              kApiDefaultCode, kApiDefault, kErrorMessageGenericError);
        }
        break;
      case DioErrorType.receiveTimeout:
        _errorModel = ErrorModel(kApiReceiveTimeoutCode, kApiReceiveTimeout,
            kErrorMessageConnectionTimeout);
        break;
      case DioErrorType.response:
        _errorModel = ErrorModel(error.response!.statusCode, kApiResponseError,
            kErrorMessageGenericError);
        // Override the error, if required
        handleDioResponseError(error.response);
        break;
      case DioErrorType.sendTimeout:
        _errorModel = ErrorModel(kApiSendTimeoutCode, kApiSendTimeout,
            kErrorMessageConnectionTimeout);
        break;
      default:
        _errorModel = ErrorModel(
            kApiUnknownErrorCode, kApiUnknownError, kErrorMessageGenericError);
    }
  }

  void handleDioResponseError(Response? response);
}
