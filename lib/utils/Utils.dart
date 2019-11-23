import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/Storage.dart';
import '../services/CustomNavigatorObserver.dart';

/**
 * @description: 工具类
 * @author: YiWen
 * @date: 2019-11-15 18:05:14
 * @version V1.0.0 
 */

class Utils {
  // 网络错误结果数据
  static Map resultData(error_code, msg, {data = ""}) {
    return {"data": data, "error_code": error_code, "msg": msg};
  }

  // 请求基础header头
  static getRequestHeader() async {
    var accessToken = await Storage.getString("access_token");
    if (accessToken == "") {
      // 跳转到登录页
      CustomNavigatorObserver.getInstance().navigator.pushNamed("/login");
    }

    return {
      "Access-Token": accessToken,
      "Accept": "application/json",
    };
  }

  // toast弹框
  static bool showToast(errCode, msg) {
    if (errCode != 0) {
      Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);

      return false;
    }

    return true;
  }

  // 延迟执行
  static startTimeout(callback,[int milliseconds]) {
    var duration = milliseconds == null ? Duration(seconds: 3) : Duration(milliseconds: 1 * milliseconds);
    return new Timer(duration, callback);
  }
}
