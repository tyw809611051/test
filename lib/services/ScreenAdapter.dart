import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/Themes.dart';

/**
 * @description: 屏幕适配服务类
 * @author: YiWen
 * @date: 2019-11-17 15:52:27
 * @version V1.0.0 
 */
class ScreenAdapter {

  // 初始化设计稿
  static init(context) {
    ScreenUtil.instance = ScreenUtil(width: Themes.designDraftWidth, height: Themes.designDraftHeight)..init(context);
  }

    // 获取适配后的高度
  static height(double value) {
    return ScreenUtil.getInstance().setHeight(value);
  }

  // 获取适配后的宽度
  static width(double value) {
    return ScreenUtil.getInstance().setWidth(value);
  }

  // 当前设备高度 dp
  static getScreenHeight() {
    return ScreenUtil.screenHeightDp;
  }

  // 当前设备宽度 dp
  static getScreenWidth() {
    return ScreenUtil.screenWidthDp;
  }

  static size(double size) {
    return ScreenUtil.getInstance().setSp(size);
  }
}