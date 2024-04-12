import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator/locator.dart';

/// [DioBuilder] will build the dio instances that will be used in the app
/// the timeout is 20 seconds
/// the interceptors of this dio are
/// 1- Cache interceptor with hive
/// 2- Curl interceptor the trace all the calls made in the app
/// 3- Error interceptor for better management of all kind of dio errors

class DioBuilder {
  final dio = createDio();

  DioBuilder._internal();

  static final _singleton = DioBuilder._internal();

  factory DioBuilder() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://oria.pro/v1",
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
      ),
    );

    dio.interceptors.addAll([
      AppInterceptors(dio),
    ]);
    if (kDebugMode) {
      dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true));
    }

    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await GetIt.instance.isReady<SharedPreferences>();
    SharedPreferences prefs = AppLocator().get();
    final String? token = prefs.getString("token");
    options.headers.addAll(
      {
        Headers.contentTypeHeader: "application/json",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
    options.followRedirects = false;
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(err.response, err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(err.response, err.requestOptions);
          case 401:
            throw UnauthorizedException(err.response, err.requestOptions);
          case 404:
            throw NotFoundException(err.response, err.requestOptions);
          case 409:
            throw ConflictException(err.response, err.requestOptions);
          case 500:
            throw InternalServerErrorException(
                err.response, err.requestOptions);
          case 502:
            throw BadGetwayException(err.response, err.requestOptions);
          default:
            throw UnknownException(err.response, err.requestOptions);
        }
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.response, err.requestOptions);
      default:
        throw UnknownException(err.response, err.requestOptions);
    }
  }
}

class UnknownException extends DioException {
  UnknownException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return 'Unknown error';
  }
}

class BadRequestException extends DioException {
  BadRequestException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return response?.data["message"] ?? 'Invalid request';
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return response?.data["message"] ??
        'Unknown error occurred, please try again later.';
  }
}

class BadGetwayException extends DioException {
  BadGetwayException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return response?.data["message"] ?? 'Bad Getway';
  }
}

class ConflictException extends DioException {
  ConflictException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return response?.data["message"] ?? 'Conflict occurred';
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return response?.data["message"] ?? 'Access denied';
  }
}

class NotFoundException extends DioException {
  NotFoundException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return response?.data["message"] ??
        'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return response?.data["message"] ??
        'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(Response? response, RequestOptions r)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return response?.data["message"] ??
        'The connection has timed out, please try again.';
  }
}
