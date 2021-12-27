import 'package:dio/dio.dart';

class DioInterceptors extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ///这里添加通用参数,比如token等
    // debugPrint("------------------------------------------request----------------------------------\n");
    // debugPrint("url:${options.baseUrl+options.path}\nparams:${options.data.toString()}\n");
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    ///这里处理返回数据,比如添加缓存等
    // debugPrint("------------------------------------------response----------------------------------\n");
    // debugPrint("${response.data}\n");
    super.onResponse(response, handler);
  }
  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   switch(err.type) {
  //   // 连接服务器超时
  //     case DioErrorType.connectTimeout:
  //       {
  //         // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
  //       }
  //       break;
  //   // 响应超时
  //     case DioErrorType.receiveTimeout:
  //       {
  //         // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
  //       }
  //       break;
  //   // 发送超时
  //     case DioErrorType.sendTimeout:
  //       {
  //         // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
  //       }
  //       break;
  //   // 请求取消
  //     case DioErrorType.cancel:
  //       {
  //         // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
  //       }
  //       break;
  //   // 404/503错误
  //     case DioErrorType.response:
  //       {
  //         // 根据自己的业务需求来设定该如何操作,可以是弹出框提示/或者做一些路由跳转处理
  //       }
  //       break;
  //   // other 其他错误类型
  //     case DioErrorType.other:
  //       {
  //
  //       }
  //       break;
  //
  //   }
  //   super.onError(err, handler);
  // }
}