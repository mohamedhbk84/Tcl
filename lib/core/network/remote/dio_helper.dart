import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://appadmin.tclgcc.com/api/',
      receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) { return status! < 500; }
    ));
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? qurey,

  })async {
    return await dio.get(url,queryParameters: qurey);
  }


  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
   // Map<String, dynamic>? query,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
    };

    return dio.post(
      url,
    //  queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio.options.headers =
    {
      'lang':lang,
      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
