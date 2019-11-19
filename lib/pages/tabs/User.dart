import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../components/BaseForm/BaseButton.dart';
import '../../common/Themes.dart';
import '../../components/Copyright.dart';

/**
 * @description: 用户中心页
 * @author: YiWen
 * @date: 2019-11-18 15:56:47
 * @version V1.0.0 
 */

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "我的",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: ScreenAdapter.height(80),
            padding: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("账户"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("Yiwen"),
                ),
              ],
            )
          ),
          Divider(),
          Container(
            height: ScreenAdapter.height(80),
            padding: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("姓名"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("tang"),
                ),
              ],
            )
          ),
          Divider(),
          Container(
            height: ScreenAdapter.height(80),
            padding: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("手机"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("17600181453"),
                ),
              ],
            )
          ),
          Divider(),
          Container(
            height: ScreenAdapter.height(80),
            padding: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("邮箱"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("809611051@qq.com"),
                ),
              ],
            )
          ),
          // Divider(),
          // 分割线
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.black12,
          ),
          Container(
            height: ScreenAdapter.height(80),
            padding: EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("企业"),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("809611051@qq.com"),
                ),
              ],
            )
          ),
          Divider(),
          BaseButton(
              text: "退出",
              color: Themes.btnPrimaryColor,
          ),
          SizedBox(height: ScreenAdapter.height(100),),
          Copyright(),
        ],
      ),
    );
  }
}
