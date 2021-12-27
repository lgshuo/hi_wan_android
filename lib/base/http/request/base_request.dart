import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_master/base/http/request/dio/dio_utils.dart';
import 'package:flutter_base_master/base/state/base_state_controller.dart';
import 'package:flutter_base_master/base/utils/toast_utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'base_result.dart';
import 'http_exception.dart';

class Request {
  /// 发起GET请求
  /// [url] 请求url
  /// [params] 请求参数
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  ///

  static void get<T>(
    String url,
    Map<String, String> params, {
    Success<T>? success,
    Fail? fail,
  }) {
    _request(url, "get", params, success: success, fail: fail);
  }

  /// 发起post请求
  /// [url] 请求url
  /// [params] 请求参数
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  static void post<T>(
    String url,
    Map<String, String> params, {
    Success<T>? success,
    Fail? fail,
  }) {
    _request(url, "post", params, success: success, fail: fail);
  }

  /// 请求类
  static Future _request<T>(
      String path, String method, Map<String, dynamic>? params,
      {Success<T>? success, required Fail? fail}) async {
    ///请求前先检查网络连接
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _onError(HttpExceptions.netError, '网络异常，请检查你的网络！', fail);
      return;
    }

    var _dio = DioUtils.createInstance();
    Options options = Options(method: method);
    try {
      Response response;
      response = await _dio.request(
        path,
        queryParameters: params,
        options: options,
      );
      if (success != null) {
        var result = response.data;
        var resultModel = Result.fromJson(result);
        debugPrint("request success =>$resultModel");
        if (resultModel.code == 1) {
          success(resultModel.data);
        } else {
          ///其他状态，弹出错误提示信息
          ToastUtils.showWarn(resultModel.message);
        }
      }
    } on DioError catch (e) {
      final NetError netError = HttpExceptions.handleException(e);
      _onError(netError.code, netError.msg, fail);
      debugPrint("异常=====>$e");
    }
  }
}

/// 错误回调
/// [code] 错误代码
/// [msg] 错误信息
/// [fail] 错误回调
void _onError(int code, String msg, Fail? fail) {
  if (code == 0) {
    code = HttpExceptions.unknownError;
    msg = '未知异常';
  }
  if (fail != null) {
    fail(code, msg);
  }else {
   // var controller = Get.find<BaseStateController>();
   // if(controller!=null){
   //   controller.showError();
   // }
  }
}
