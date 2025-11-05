import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ride_hailing/env.dart';
import 'package:ride_hailing/services/auth_service.dart';
import 'package:ride_hailing/stores/stores.dart';
import 'package:ride_hailing/utils/utils.dart';

typedef HttpServiceProgressHandler = void Function(int sent, int total);

enum HttpServiceRequestMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class HttpService {
  late Dio _dio;
  late BaseOptions _baseOptions;
  final AuthService _authService;

  /// Construct a new HttpService instance.
  HttpService(this._authService) {
    _baseOptions = BaseOptions(
      baseUrl: '$baseApiUrl/',
      contentType: Headers.jsonContentType,
      headers: {
        HttpHeaders.userAgentHeader: 'CyberHygieneApp',
      },
    );

    _dio = Dio(_baseOptions);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint('Token: $token');
          if (hasToken) {
            options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
          }

          return handler.next(options);
        },
        onError: (error, handler) async {
          var response = error.response;
          // print(error.requestOptions.uri);

          if (response != null && response.statusCode == 401) {
            // CyberHygieneToast.show(
            //   'Your session has expired. Please login again.',
            // );

            // CyberHygieneRouter.pushNewStack(SignInScreen.routeName);

            return handler.reject(error);
          } else {
            return handler.next(error);
          }
        },
      ),
    );
  }

  /// Authentication token for the current user.
  String? get token => _authService.token;

  /// Check if a user is logged in.
  bool get hasToken => _authService.isLoggedIn;

  /// Send Generic HTTP request.
  Future<HttpServiceResponse<T>> _send<T>(
    HttpServiceRequestMethod method,
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic body,
    HttpServiceProgressHandler? onProgress,
    T Function(dynamic data)? transformer,
  }) async {
    try {
      Response response;

      switch (method) {
        case HttpServiceRequestMethod.get:
          response = await _dio.get(
            path,
            queryParameters: queryParameters,
            onReceiveProgress: onProgress,
          );
          break;
        case HttpServiceRequestMethod.post:
          response = await _dio.post(
            path,
            data: body,
            queryParameters: queryParameters,
            onSendProgress: onProgress,
          );
          break;
        case HttpServiceRequestMethod.put:
          response = await _dio.put(
            path,
            data: body,
            queryParameters: queryParameters,
            onSendProgress: onProgress,
          );
          break;
        case HttpServiceRequestMethod.patch:
          response = await _dio.patch(
            path,
            data: body,
            queryParameters: queryParameters,
            onSendProgress: onProgress,
          );
          break;
        case HttpServiceRequestMethod.delete:
          response = await _dio.delete(
            path,
            queryParameters: queryParameters,
            data: body,
          );
          break;
      }

      return HttpServiceResponse<T>.fromResponse(response, transformer);
    } on DioException catch (e) {
      debugPrint('[${enumToString(method)}] $path: $e');

      return HttpServiceResponse<T>.fromResponse(e.response, transformer);
    }
  }

  /// Send GET HTTP request.
  Future<HttpServiceResponse<T>> get<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    HttpServiceProgressHandler? onProgress,
    T Function(dynamic data)? transformer,
  }) {
    return _send<T>(
      HttpServiceRequestMethod.get,
      path,
      body: body,
      queryParameters: queryParameters,
      onProgress: onProgress,
      transformer: transformer,
    );
  }

  /// Send POST HTTP request.
  Future<HttpServiceResponse<T>> post<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    HttpServiceProgressHandler? onProgress,
    T Function(dynamic data)? transformer,
  }) {
    return _send<T>(
      HttpServiceRequestMethod.post,
      path,
      body: body,
      queryParameters: queryParameters,
      onProgress: onProgress,
      transformer: transformer,
    );
  }

  /// Send PATCH HTTP request.
  Future<HttpServiceResponse<T>> patch<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    HttpServiceProgressHandler? onProgress,
    T Function(dynamic data)? transformer,
  }) {
    return _send<T>(
      HttpServiceRequestMethod.patch,
      path,
      body: body,
      queryParameters: queryParameters,
      onProgress: onProgress,
      transformer: transformer,
    );
  }

  /// Send DELETE HTTP request.
  Future<HttpServiceResponse<T>> delete<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic data)? transformer,
  }) {
    return _send<T>(
      HttpServiceRequestMethod.delete,
      path,
      body: body,
      queryParameters: queryParameters,
      transformer: transformer,
    );
  }

  AuthApi get auth => AuthApi(this);

  UserApi get user => UserApi(this);
}

class HttpServiceResponse<T> {
  final T? data;
  final bool ok;
  final int code;
  final String? message;
  final Headers? headers;
  final Map<String, dynamic>? errors;
  final HttpServiceResponseMeta? meta;

  HttpServiceResponse({
    this.meta,
    this.headers,
    required this.ok,
    required this.data,
    required this.code,
    required this.errors,
    required this.message,
  });

  bool get isServerError => code >= 500;

  bool get isNotFoundError => code == 404;

  bool get isForbiddenError => code == 403;

  bool get isValidationError => code == 422;

  bool get isUnauthorizedError => code == 401;

  factory HttpServiceResponse.fromResponse([
    Response? response,
    T Function(dynamic data)? transformer,
  ]) {
    final body = response?.data;
    final hasBody = body != null && body is Map;
    final hasResponse = response != null;
    final isOk = hasResponse &&
        hasBody &&
        response.statusCode! >= 200 &&
        response.statusCode! <= 299;

    return HttpServiceResponse(
      ok: isOk,
      code: hasResponse ? response.statusCode! : 0,
      headers: hasResponse ? response.headers : null,
      data: isOk
          ? transformer != null
              ? transformer(body['data'])
              : body['data']
          : null,
      message: hasBody && body.containsKey('message')
          ? body['message']
          : 'An unknown error occurred.',
      errors: !isOk && hasBody && body.containsKey('errors')
          ? body['errors']
          : null,
      meta: isOk && body.containsKey('meta')
          ? HttpServiceResponseMeta.fromMap(body['meta'])
          : null,
    );
  }
}

class HttpServiceResponseMeta {
  final int? perPage;
  final int? nextPage;
  final int? totalPages;
  final int? currentPage;
  final int? previousPage;

  HttpServiceResponseMeta({
    required this.perPage,
    required this.nextPage,
    required this.totalPages,
    required this.currentPage,
    required this.previousPage,
  });

  factory HttpServiceResponseMeta.fromMap(Map<String, dynamic> map) {
    // print(map);
    return HttpServiceResponseMeta(
      perPage: (map['per_page'] != null)
          ? int.parse(map['per_page'].toString())
          : null,
      nextPage: (map['next_page'] != null)
          ? int.parse(map['next_page'].toString())
          : null,
      totalPages: (map['total_pages'] != null)
          ? int.parse(map['total_pages'].toString())
          : null,
      currentPage: (map['current_page'] != null)
          ? int.parse(map['current_page'].toString())
          : null,
      previousPage: (map['previous_page'] != null)
          ? int.parse(map['previous_page'].toString())
          : null,
    );
  }
}
