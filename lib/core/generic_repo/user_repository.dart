import 'dart:developer';

import 'package:technaureus/core/common/app_common_functions.dart';
import 'package:technaureus/core/generic_repo/network_request.dart';
import 'package:technaureus/core/utils/app_strings.dart';
import 'package:technaureus/core/utils/app_urls.dart';

class GenericError {
  final String error;
  final int? errorCode;
  GenericError({
    required this.error,
    this.errorCode,
  });
}

class GenericReponse {
  GenericReponse({
    this.status,

    //this.statusCode,
  });

  String? status;

  factory GenericReponse.fromJson(Map<String, dynamic> json) => GenericReponse(
        status: json["status"],
      );
}

class UserRepository {
  static Future<dynamic> networkRequest({
    required String path,
    required dynamic responseModel,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
    String baseUrl = AppUrls.baseUrl,
    NetworkRequestType requestType = NetworkRequestType.GET,
    NetworkRequestBody jsonData = const NetworkRequestBody.empty(),
  }) async {
    final isInterNetConnected =
        await AppCommonFunctions.checkInternetAvailability();
    if (!isInterNetConnected) {
      return GenericError(error: AppStrings.noInternet);
    } else {
      dynamic finalResponse;
      // final userData = await LoginDbHelper.instance.getLoginData();
      try {
        final service = NetworkService(baseUrl: baseUrl);
        // PREPARING REQUEST:

        final request = NetworkRequest(
          type: requestType,
          path: path,
          data: jsonData,
          headers:
              //hard coded access token
              headers ?? {"Authorization": "Bearer {hardcodedAccessToken}"},
          queryParams: queryParams,
        );
        // Executing request and converting response to given model:

        log('EXECUTING REQUEST');
        final response = await service.execute(
          request,
          // Json to convert API response to our model
          responseModel,
        );
        log('RESPONSE IS ${response.toString()}');
        // Handling possible outcomes:
        await response.maybeWhen(
          ok: (authResponse) async {
            log('== SUCCESS IN REPO ==');
            // ASSIGNING THE RESPONSE
            finalResponse = authResponse;
          },
          badRequest: (err) {
            // log('bad request in repo ##$err');
            finalResponse = GenericError(error: 'BAD REQUEST', errorCode: 400);
          },
          noAuth: (err) async {
            finalResponse =
                GenericError(error: 'Session expired. Please login again !!');
            // final isGotRefreshToken = await _refreshToken();
            // if (isGotRefreshToken) {
            //   finalResponse = GenericError(
            //       error:
            //           'It seems your serrsion has been expired.. Please try again !!');
            // } else {
            //   finalResponse = GenericError(
            //       error:
            //           'It seems your serrsion has been expired, please try again or do login again !!');
            // }
          },
          noData: (err) {
            log('no data in repo: ##$err');
            finalResponse = GenericError(
                error: AppStrings.somethingWentWrong, errorCode: 500);
          },
          conflict: (err) {
            log('conflict in repo: ##$err');
            finalResponse = GenericError(
                error: AppStrings.somethingWentWrong, errorCode: 409);
          },
          invalidParameters: (err) {
            log('invalid parameter in repo: ##$err');
            finalResponse = GenericError(
                error: AppStrings.somethingWentWrong, errorCode: 400);
          },
          noAccess: (err) {
            log('no access in repo: ##$err');
            finalResponse = GenericError(
                error: AppStrings.somethingWentWrong, errorCode: 403);
          },
          notFound: (err) {
            log('not found in repo: ##$err');
            finalResponse = GenericError(
                error: AppStrings.somethingWentWrong, errorCode: 404);
          },
          exception: (errMsg, errCode) {
            log('exeption in repo: ##$errMsg');
            finalResponse = GenericError(error: errMsg, errorCode: errCode);
          },
          socketException: (err) {
            log('socketException in repo: ##$err');
            finalResponse = GenericError(error: AppStrings.noInternet);
          },
          orElse: () {
            log('=== or else in repo ====##');
            finalResponse = GenericError(error: AppStrings.somethingWentWrong);
          },
        );
      } catch (e) {
        log('catch in USER repo #$e');
        finalResponse = GenericError(error: AppStrings.somethingWentWrong);
      }
      // log('returning final response from repo');
      return finalResponse;
    }
  }
}
