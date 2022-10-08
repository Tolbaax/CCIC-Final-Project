import 'package:dio/dio.dart';
import 'package:social_app/shared/components/constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://store.webautobazaar.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({required String path}) async {
    return await dio.get(path);
  }

  Future<Response> postData({
    required String path,
    required dynamic data,
  }) async {
    return await dio.post(
      path,
      data: data,
      options: Options(
        followRedirects: false,
        validateStatus: (status) => true,
        headers: {
          'Content-Type':
              'multipart/form-data; boundary=<calculated when request is sent>',
          'Authorization': token,
        },
      ),
    );
  }
}
