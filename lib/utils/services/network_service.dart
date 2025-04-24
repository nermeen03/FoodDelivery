

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../models/api_response_model.dart';

class MealsService{
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "https://www.themealdb.com/api/json/v1/1/",
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 5),
  ))..interceptors.add(PrettyDioLogger());

  static Future<ApiResponse> fetchData({required String path, String? category,String? mealId}) async {
    try {
      final response = (category!=null)
          ? await _dio.get(path,queryParameters: {"c": category})
          : (mealId!=null)? await _dio.get(path,queryParameters: {"i":mealId})
          : await _dio.get(path) ;
      if (response.statusCode == 200) {
        return ApiResponse(
          success: true,
          data: response.data,
        );
      } else {
        return ApiResponse(
          success: false,
          message: 'Failed with status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      return ApiResponse(
        success: false,
        message: 'Error: ${e.toString()}',
      );
    }
  }

}

