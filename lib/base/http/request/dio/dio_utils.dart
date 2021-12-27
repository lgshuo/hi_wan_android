import 'package:dio/dio.dart';

import '../request_api.dart';
import 'dio_interceptors.dart';
import 'dio_transformer.dart';

class DioUtils{
  ///全局Dia对象
  static Dio? _dio;
  /// 连接超时时间
  static const int CONNECT_TIMEOUT = 6*1000;
  /// 响应超时时间
  static const int RECEIVE_TIMEOUT = 6*1000;
  /// 最大缓存时间(按秒), 默认缓存七天,可自行调节
  static int MAX_CACHE_AGE = 7 * 24 * 60 * 60;
  /// 最大缓存条数(默认一百条)
  static int MAX_CACHE_COUNT = 100;
  /// 创建 dio 实例对象
  static Dio createInstance() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: RequestApi.baseUrl,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT,
      );
      _dio = Dio(options);
      _dio!.transformer = DioTransformer();
      _dio!.interceptors.add(DioInterceptors());
      _dio!.interceptors.add(LogInterceptor(responseBody: true));

    }
    return _dio!;
  }
}