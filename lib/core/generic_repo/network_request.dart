// ignore_for_file: constant_identifier_names
import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:technaureus/core/utils/app_strings.dart';

part 'network_request.freezed.dart';

@freezed
class NetworkRequestBody with _$NetworkRequestBody {
  const factory NetworkRequestBody.empty() = Empty;
  const factory NetworkRequestBody.json(Map<String, dynamic> data) = Json;
  const factory NetworkRequestBody.text(String data) = Text;
  const factory NetworkRequestBody.formData(FormData data) = FormDataBody;
}

class AccessTokenResponse {
  String? accessToken;
  AccessTokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
  }
}

enum NetworkRequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkRequest {
  const NetworkRequest({
    required this.type,
    required this.path,
    required this.data,
    this.queryParams,
    this.headers,
  });

  final NetworkRequestType type;
  final String path;
  final NetworkRequestBody data;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
}

@freezed
class NetworkResponse<Model> with _$NetworkResponse {
  const factory NetworkResponse.ok(Model data) = Ok; //200
  const factory NetworkResponse.invalidParameters(String message) =
      InvalidParameters;
  const factory NetworkResponse.badRequest(String message) = BadRequest; //400
  const factory NetworkResponse.noAuth(String message) = NoAuth; //401
  const factory NetworkResponse.noAccess(String message) = NoAccess; //403
  const factory NetworkResponse.notFound(String message) = NotFound; //404
  const factory NetworkResponse.conflict(String message) = Conflict; //409
  const factory NetworkResponse.noData(String message) = NoData; //500
  const factory NetworkResponse.socketException(String message) =
      SocketException;
  const factory NetworkResponse.exception(String message, {int? errCode}) =
      Exceptions;
}

class _PreparedNetworkRequest<Model> {
  const _PreparedNetworkRequest(
    this.request,
    this.parser,
    this.dio,
    this.headers,
    this.onSendProgress,
    this.onReceiveProgress,
  );
  final NetworkRequest request;
  final Model Function(Map<String, dynamic>) parser;
  final Dio dio;
  final Map<String, dynamic> headers;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
}

Future<NetworkResponse<Model>> _executeRequest<Model>(
  _PreparedNetworkRequest request,
) async {
  try {
    dynamic body = request.request.data.whenOrNull(
      json: (data) => data,
      text: (data) => data,
      formData: (data) => data,
    );
    log('==== body in network request ${body.toString()} ====');
    log('==== path in network request ${request.request.path} ====');

    final response = await request.dio.request(
      request.request.path,
      data: body,
      queryParameters: request.request.queryParams,
      options: Options(
        method: request.request.type.name,
        headers: request.headers,
      ),
      onSendProgress: request.onSendProgress,
      onReceiveProgress: request.onReceiveProgress,
    );
    //log('==== response in network request ${response.data.toString()} ====');
    return NetworkResponse.ok(request.parser(response.data));
  } on DioException catch (error) {
    final errorText = error.toString();
    log('DIO ERROR IN NETWORKREQUEST CLASS: $errorText');
    if (error.requestOptions.cancelToken?.isCancelled ?? 1 < 0) {
      return NetworkResponse.noData(errorText);
    }
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return const NetworkResponse.exception('CONNECTION TIMED OUT');
    }
    if (error.response?.data["errorMessage"] != null) {
      log('ERROR IN REPO ${error.response?.data["errorMessage"]}');
      return NetworkResponse.exception(error.response?.data["errorMessage"]);
    }
    switch (error.response?.statusCode) {
      case 400:
        log('400 ERROR IN REPO $errorText');
        return NetworkResponse.badRequest('400 $errorText');
      case 401:
        log('401 ERROR IN REPO $errorText');
        return NetworkResponse.noAuth('401 $errorText');
      case 403:
        log('403 ERROR IN REPO $errorText');
        return NetworkResponse.noAccess('403 $errorText');
      case 404:
        log('404 ERROR IN REPO $errorText');
        return NetworkResponse.notFound('404 $errorText');
      case 409:
        log('409 ERROR IN REPO $errorText');
        return NetworkResponse.conflict('409 $errorText');
      case 500:
        log('500 ERROR IN REPO $errorText');
        return NetworkResponse.noData('500 $errorText');
      default:
        log('DEFAULT ERROR IN REPO $errorText');
        return const NetworkResponse.exception(AppStrings.somethingWentWrong);
    }
  } on SocketException catch (_) {
    log('SocketException ERROR IN REPO');
    return const NetworkResponse.socketException('SOCKET EXCEPTION');
  } on FormatException catch (_) {
    log('FormatException ERROR IN REPO');

    return const NetworkResponse.exception('FORMAT EXCEPTION');
  } on TimeoutException catch (_) {
    log('TimeoutException ERROR IN REPO');

    return const NetworkResponse.exception('TIMEOUT EXCEPTION');
  } on Exception catch (_) {
    log('DEFAULT EXCEPTION ERROR IN REPO');

    return const NetworkResponse.exception('DEFAULT EXCEPTION');
  } catch (e) {
    log('#### CATCH IN NETWORK REQ: ${e.toString()}');
    return const NetworkResponse.exception('CATCH EXCEPTION');
  }
}

class NetworkService {
  NetworkService({
    required this.baseUrl,
    dioClient,
    httpHeaders,
  })  : _dio = dioClient,
        _headers = httpHeaders ?? {};
  Dio? _dio;
  final String baseUrl;
  final Map<String, String> _headers;

  // Default dio obj
  Future<Dio> _getDefaultDioClient() async {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60), // 1 minute
      receiveTimeout: const Duration(seconds: 60), // 1 minute
      sendTimeout: const Duration(seconds: 60), // 1 minute
    ));
    return dio;
  }

  // to add bearer token
  void addBasicAuth(String accessToken) {
    _headers['Authorization'] = 'Bearer $accessToken';
  }

  // API REQUEST EXECUTION
  Future<NetworkResponse<Model>> execute<Model>(
    NetworkRequest request,
    Model Function(Map<String, dynamic>) parser, {
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio ??= await _getDefaultDioClient();
    final req = _PreparedNetworkRequest<Model>(
      request,
      parser,
      _dio!,
      {..._headers, ...(request.headers ?? {})},
      onSendProgress,
      onReceiveProgress,
    );
    final result = await compute(
      _executeRequest<Model>,
      req,
    );
    return result;
  }

  String getErrorMsg(e) {
    if (e is DioException) {
      if (e.response == null) {
        return AppStrings.somethingWentWrong;
      } else if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return AppStrings.timeOut;
      } else if (e.type == DioExceptionType.badResponse) {
        return e.response?.data["message"] ?? AppStrings.somethingWentWrong;
      }
    } else if (e is SocketException) {
      return AppStrings.noInternet;
    } else if (e is FormatException) {
      return AppStrings.somethingWentWrong;
    } else if (e is TimeoutException) {
      return AppStrings.timeOut;
    }
    return 'defaultErrorMsg';
  }
}
