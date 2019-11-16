import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
/**
 * @description: API接口类
 * @author: YiWen
 * @date: 2019-11-16 16:40:51
 * @version V1.0.0 
 */

class Api {
  static String api = "https://api.test.cisslab.com/";
  static login(url, {options}) async {
    var api = Api.api+url;
    print(api);
    print(options["data"]);
    var response = await Dio().post(api,data: options["data"]);
    var res = json.encode(response.data);
    return res;
    // if (res['error_code'] != 0) {
    //   options.reject();
    // }
    // options.resolve();
  }
}
