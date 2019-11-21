import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../utils/RequestUtil.dart';
/**
 * @description: API接口类
 * @author: YiWen
 * @date: 2019-11-16 16:40:51
 * @version V1.0.0 
 */

class Api {
  // 登录
  static login(data) async {
    return await RequestUtil.request(
      'api/v1/login',
      data: data,
      options: Options(method: "POST"),
      auth: false,
    );
  }

  // 获取用户信息
  static currentUser() async {
    return await RequestUtil.request(
      'api/v1/current_user',
    );
  }
}
