import 'package:dio/dio.dart';
import 'http_config.dart';

class HttpRequest {
  //1.创建DIO实例
 static BaseOptions baseOptions = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: BASE_TIMEOUT,
  );
 static final dio = Dio(baseOptions);

  //封装成静态方法然后每次只需要HttpRequest.requset()即可使用
  static Future request(String url,
      {String method = 'get', Map<String, dynamic> params}) async {
    //2.发送网络请求
    Options options = Options(method: method); //每次请求
    try {
      final result =
          await dio.request(url, queryParameters: params, options: options);
      return result;
    } on DioError catch (err) {
      throw err;
    }
  }
}
