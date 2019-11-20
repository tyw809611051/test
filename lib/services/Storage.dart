import 'package:shared_preferences/shared_preferences.dart';

/**
 * @description: 存储服务类
 * @author: YiWen
 * @date: 2019-11-17 16:12:16
 * @version V1.0.0 
 */

class Storage {
  // 设置存储key，value
  static Future<void> setString(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  // 获取存储值
  static Future<String> getString(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    try {
      return sp.getString(key);
    } catch (e) {
      return "";
    }
  }

  // 移除key对应的值
  static Future<void> remove(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  // 清楚所有存储值
  static Future<void> clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
