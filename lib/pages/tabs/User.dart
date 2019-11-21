import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../components/BaseForm/BaseButton.dart';
import '../../common/Themes.dart';
import '../../components/Copyright.dart';
import '../../services/Api.dart';
import '../../utils/Utils.dart';
import '../../services/Storage.dart';
import '../../pages/users/Login.dart';

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

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin {
  Map _userInfo = Map();
  @override
  bool get wantKeepAlive => true; // 保持页面缓存

  @override
  void initState() {
    super.initState();

    _getUserInfo();
  }

  // 获取用户数据
  _getUserInfo() async {
    var res = await Api.currentUser();

    bool codeRes = Utils.showToast(res["error_code"], res["msg"]);

    if (!codeRes) {
      return;
    }

    setState(() {
      this._userInfo = res["data"];
    });
  }

  // 退出登录处理
  _logoutHandle() async {
    await Storage.remove("access_token");
    await Storage.remove("cid");
    await Storage.remove("uid");
    await Storage.remove("roles");
    await Storage.remove("plat");

    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new LoginPage()),
        (route) => route == null);
  }

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
                    child: (this._userInfo.length > 0)
                        ? Text("${this._userInfo['username']}")
                        : Text("---"),
                  ),
                ],
              )),
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
                    child: (this._userInfo.length > 0)
                        ? Text("${this._userInfo['name']}")
                        : Text("---"),
                  ),
                ],
              )),
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
                    child: (this._userInfo.length > 0 &&
                            this._userInfo['phone'] != null)
                        ? Text("${this._userInfo['phone']}")
                        : Text("---"),
                  ),
                ],
              )),
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
                    child: (this._userInfo.length > 0 &&
                            this._userInfo['email'] != null)
                        ? Text("${this._userInfo['email']}")
                        : Text("---"),
                  ),
                ],
              )),
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
                    child: (this._userInfo.length > 0)
                        ? Text("${this._userInfo['company']['name']}")
                        : Text("---"),
                  ),
                ],
              )),
          Divider(),
          BaseButton(
            text: "退出",
            color: Themes.btnPrimaryColor,
            cb: this._logoutHandle,
          ),
          SizedBox(
            height: ScreenAdapter.height(100),
          ),
          Copyright(),
        ],
      ),
    );
  }
}
