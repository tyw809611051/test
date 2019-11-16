import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

/**
 * @description: 请求工具类
 * @author: YiWen
 * @date: 2019-11-16 14:19:23
 * @version V1.0.0 
 */
class RequestUtil {
  // BaseOptions options;
  static RequestUtil _instance;
  
  Dio dio = new Dio();

  static RequestUtil getInstance() {
    if (_instance == null) {
      _instance = RequestUtil();
    }

    return _instance;
  }
  RequestUtil() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.test.cisslab.com/',
      connectTimeout: 5000,
      receiveTimeout: 100000,
      headers: {
        HttpHeaders.userAgentHeader: "dio",
        "api": "1.0.0",
      },
      contentType: Headers.jsonContentType,
      // Transform the response data to a String encoded with UTF8.
      // The default value is [ResponseType.JSON].
      // responseType: ResponseType.plain,
    ));

  }

  get(url, {data, options, cancelToken}) async {
    print('get请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.get(
        url,
        cancelToken: cancelToken,
      );
      print('get请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }

  post(url, Map<String, Map<String, Object>> map, {data, options, cancelToken}) async {
    print('post请求启动! url：$url ,body: $data');
    Response response;
    try {
      response = await dio.post(
        url,
        data: data,
      );
      print('post请求成功!response.data：${json.encode(response)}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }

}