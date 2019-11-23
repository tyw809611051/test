import 'dart:async';
import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../services/ScreenAdapter.dart';
/**
 * @description: 过渡页面
 * @author: YiWen
 * @date: 2019-11-23 17:04:11
 * @version V1.0.0 
 */

class LaunchPage extends StatefulWidget {
  LaunchPage({Key key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  Timer _timer;
  @override
  void initState() {
    super.initState();
    this._timer = Timer(Duration(milliseconds: 3000), () {
      try {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => new Tabs(),
            ),
            (Route route) => route == null);
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (this._timer == null) {
      this._timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenAdapter.init(context);
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              // height: 50,
              width: 250,
              margin: EdgeInsets.only(top: 50),
              child: Image.asset(
                "lib/assets/imgs//slogo.jpg",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "高端电子元器件在线一站式委托/检测平台",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
