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

  // 委托单列表
  static taskList(Map params) async {
    return await RequestUtil.request(
      'api/v1/task/query',
      params: params
    );
  }

  // 详情数据
  static taskDetail(sn) async {
    return await RequestUtil.request(
      'api/v1/task/detail/${sn}'
    );
  }

  // 确认委托
  static confirmTask(id,params) async {
    return await RequestUtil.request(
      'api/v1/task/status/${id}',
      params: params
    );
  }

  // 上传文件
  static upload(data) async {
    return await RequestUtil.request(
      'api/v1/attachment/upload',
      data: data,
      options: Options(method: "POST"),
    );
  }

  // 获取项目
  static getProject() async {
    return await RequestUtil.request(
      'api/v1/project/queryAll',
    );
  }
}
