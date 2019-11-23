import 'package:flutter/material.dart';

/**
 * @description: 自定义导航观察类[实现无context跳转]
 * @author: YiWen
 * @date: 2019-11-20 15:54:15
 * @version V1.0.0 
 */

class CustomNavigatorObserver extends NavigatorObserver {
  static CustomNavigatorObserver _instance;

  static CustomNavigatorObserver getInstance() {
    if (_instance == null) {
      _instance = CustomNavigatorObserver();
    }
    return _instance;
  }

}
