import 'package:api_call_with_riverpod/common/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIProvider {
  final String baseUrl;
  APIProvider({required this.baseUrl});

  final Dio _dioGet = Dio();
  Future<dynamic> get({
    required String endPoint,
  }) async {
    dynamic responseJson;

    final String url = "$baseUrl/$endPoint";
    try {
      Map<String, String> header = {
        'content-type': 'application/json',
      };

      final dynamic response = await _dioGet.get(
        url,
        options: Options(
          headers: header,
        ),
      );

      responseJson = _response(response, url);
    } on DioError catch (e, s) {
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  Future<Map<String, dynamic>> _response(
    Response response,
    String url,
  ) async {
    final res = response.data is List ? response.data : {};

    var responseJson = Map<String, dynamic>();
    responseJson['data'] = res;

    responseJson['statusCode'] = response.statusCode;
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 204:
        return responseJson;
      case 201:
        return responseJson;
      case 404:
        throw ResourceNotFoundException(
            getErrorMessage(res), response.statusCode);

      case 500:
        throw InternalServerErrorException(
            getErrorMessage(res), response.statusCode);
      default:
        throw NoInternetException(
            'Error occured while Communication with Server');
    }
  }

  _handleErrorResponse(DioError e) async {
    if (e.toString().toLowerCase().contains("socketexception")) {
      throw NoInternetException('No Internet connection');
    } else {
      if (e.response != null) {
        return await _response(e.response!, "");
      } else {
        throw FetchDataException('An error occurred while fetching data.');
      }
    }
  }

  String getErrorMessage(Map<String, dynamic> res) {
    String message = "";
    try {
      debugPrint("-------------------GET ERROR ------------------");
      if (res["message"] is List) {
        List<dynamic> messages = res['message'][0]["messages"];
        messages.forEach((dynamic element) {
          message += (element as Map<String, dynamic>)['message'] + '\n';
        });
      } else if (res["message"] is String) {
        message = res["message"];
      }
    } catch (e) {}
    return message;
  }
}
