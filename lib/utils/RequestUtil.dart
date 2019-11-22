import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../utils/Utils.dart';
import '../common/Env.dart';

/**
 * @description: 请求工具类
 * @author: YiWen
 * @date: 2019-11-16 14:19:23
 * @version V1.0.0 
 */
class RequestUtil {
  // BaseOptions options;
  static RequestUtil _instance;
  static final EventBus eventBus = EventBus();
  // 网络错误编码
  static const NETWORK_ERROR = -1; //无网络错误
  static const NETWORK_TIMEOUT = -2; //网络超时
  static const NETWORK_JSON_EXCEPTION = -3; //解析异常
  static const NETWORK_RESPONSE_EXCEPTION = -4; //响应异常
  static const NETWORK_RESPONSE_DATA_EXCEPTION = -5; // 响应体异常
  static const NETWORK_OTHER_ERR = -6; //网络错误

  static RequestUtil getInstance() {
    if (_instance == null) {
      _instance = RequestUtil();
    }

    return _instance;
  }

  // 异常通知处理
  static errorHandleFunction(code, message, noTip) {
    if (!noTip) {
      // eventBus.fire(HttpErrorEvent(code, message));
    }
    return message;
  }
  /* 
   * 发送网络请求
   * @param url 请求url
   * @param data 请求实体
   * @param params url请求参数
   * @param options 配置
   * @param noTip 通知开关
   * @param auth 权限验证
   */
  static request(url, {data,Map params, options, auth=true,noTip = false}) async {
    // 检查网络
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return Utils.resultData(NETWORK_ERROR, "网络请求失败,请检查您的网络设置",
          data: errorHandleFunction(NETWORK_ERROR, "网络请求失败,请检查您的网络设置", noTip));
    }
    // 获取header头
    Map headers = await Utils.getRequestHeader();
    // dio实例
    Dio dio = Dio(BaseOptions(
      baseUrl: Env.API,
      connectTimeout: 5000,
      receiveTimeout: 100000,
      headers: auth ? headers : {},
      contentType: Headers.jsonContentType,
    ));

    if (options == null) {
      options = Options(method: "get");
    }

    // 添加拦截器
    if (Env.DEBUG) {
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
        print("\n================== 请求数据 ==========================");
        print("url = ${options.uri.toString()}");
        print("headers = ${options.headers}");
        print("params = ${options.data}");
      }, onResponse: (Response response) {
        print("\n================== 响应数据 ==========================");
        print("code = ${response.statusCode}");
        print("data = ${response.data}");
        print("\n");
      }, onError: (DioError e) {
        print("\n================== 错误响应数据 ======================");
        print("type = ${e.type}");
        print("message = ${e.message}");
        print("stackTrace = ${e.message}");
        print("\n");
      }));
    }

    // 响应
    Response response;

    // 响应体处理
    try {
      response = await dio.request(url,
          data: data, queryParameters: params, options: options);
    } on DioError catch (e) {
      // 请求错误处理
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: NETWORK_RESPONSE_EXCEPTION);
      }

      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = NETWORK_TIMEOUT;
      }

      if (Env.DEBUG) {
        print('响应体异常: ' + e.toString());
        print('响应体异常 url: ' + url.toString());
      }

      return Utils.resultData(errorResponse.statusCode, "服务器异常,请稍后再试!",
          data: errorHandleFunction(
              errorResponse.statusCode, "服务器异常,请稍后再试!", noTip));
    }

    // 响应数据处理
    try {
      var responseJson = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseJson;
      }
    } catch (e) {
      print('''
        响应数据错误:  ${e.toString()}; 
        url: ${response.realUri.toString()}
        ''');
      return Utils.resultData(NETWORK_RESPONSE_DATA_EXCEPTION, "数据异常,请稍后再试!",
          data: errorHandleFunction(
              NETWORK_RESPONSE_DATA_EXCEPTION, "数据异常,请重试!", noTip));
    }

    return Utils.resultData(NETWORK_OTHER_ERR, "系统错误",
        data: errorHandleFunction(
            NETWORK_RESPONSE_DATA_EXCEPTION, "系统错误", noTip));
  }

}
