import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../components/BaseForm/BaseText.dart';
import '../../components/BaseForm/BaseButton.dart';
import '../../common/Themes.dart';
import '../../services/Api.dart';
import '../../components/Copyright.dart';
import '../../services/Storage.dart';
import '../../utils/Utils.dart';
import '../Tabs.dart';

/**
 * @description: 登录页 
 * @author: YiWen
 * @date: 2019-11-17 15:48:40
 * @version V1.0.0 
 */

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 全局formkey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _username;
  var _password;

  @override
  void initState() { 
    super.initState();
  }

  // 提交
  _loginHandle() async {
    String username = this._username.toString();
    String password = this._password.toString();

    if (username.isEmpty) {
      Fluttertoast.showToast(
        msg: "账号不能为空",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER
      );

      return null;
    }

    if (password.isEmpty) {
      Fluttertoast.showToast(
        msg: "密码不能为空",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER
      );

      return null;
    }

    var res = await Api.login({
        "username": username,
        "password": password,
        "type": "account",
    });

    bool codeRes = Utils.showToast(res["error_code"], res["msg"]);
    if (!codeRes) {
      return false;
    }

    Map userInfo = res["data"];

    String token = userInfo["token"];
    int cid      = userInfo["cid"];
    int uid      = userInfo["uid"];
    int plat     = userInfo["plat"];
    // print(userInfo["plat"] is double);
    String roles = userInfo["roles"].join(',');

    if (roles.indexOf("c_admin") == -1 && roles.indexOf("c_user") == -1) {
      Fluttertoast.showToast(
        msg: "抱歉,目前只对用户端开放!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER
      );

      return null;
    }

    // 存储
    await Storage.setString("access_token", token);
    await Storage.setString("cid", cid.toString());
    await Storage.setString("uid", uid.toString());
    await Storage.setString("roles", roles);
    await Storage.setString("plat", plat.toString());

    Navigator.of(context).pushAndRemoveUntil(
      new MaterialPageRoute(builder:(context)=>new Tabs()), 
      (route)=>route==null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: Container(
        child: ListView(
          children: <Widget>[
            // logo部分
            Center(
              child: Container(
                height: 40,
                width: 150,
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(
                  "lib/assets/imgs//slogo.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),
            // 表单部分
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      "账号",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: BaseText(
                    text: "请输入用户名",
                    onChanged: (value) {
                      setState(() {
                        this._username = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      "密码",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: BaseText(
                    text: "请输入密码",
                    isPassword: true,
                    onChanged: (value) {
                      setState(() {
                        this._password = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Stack(
                children: <Widget>[
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Text("忘记密码"),
                  // ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                         Navigator.pushNamed(context, '/register');
                      },
                      child: Text("企业注册"),
                    ),
                  ),
                ],
              ),
            ),

            BaseButton(
              text: "登录",
              color: Themes.btnPrimaryColor,
              cb: this._loginHandle,
            ),
            SizedBox(
              height: 50,
            ),
            Copyright(),
          ],
        ),
      ),
    );
  }
}
