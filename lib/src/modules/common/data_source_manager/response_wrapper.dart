import 'package:equatable/equatable.dart' as data_source_manager;
import 'package:super_app_framework/src/modules/common/error_handler/error_model.dart';

import 'data_source_public.dart';


class ResponseWrapper<T> extends data_source_manager.Equatable {
  ErrorModel? _error;
  T? _data;

  void setException(ExceptionHandler error) {
    _error = error.getErrorModel();
    if (error.getDioError() != null) {
      var dioErrorRequest = error.getDioError()?.requestOptions;
      var path = '${dioErrorRequest?.baseUrl}${dioErrorRequest?.path}';
      var dioErrorResponse = error.getDioError()?.response?.toString();
      // add log here
    } else {
      // add log here
    }
  }

  void setErrorModel(ErrorModel? error) {
    _error = error;
    // add log here
  }

  ResponseWrapper({T? data, ExceptionHandler? error})
      : _data = data,
        _error = error?.getErrorModel();

  void setData(T data) {
    _data = data;
  }

  T? get getData => _data;

  ErrorModel? get getException => _error;

  bool get hasException => _error != null;

  bool get hasData => _data != null;

  @override
  List<Object?> get props => [_data, _error];
}
