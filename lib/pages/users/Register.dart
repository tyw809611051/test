import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../services/Api.dart';
import '../../services/ScreenAdapter.dart';
import '../../utils/Utils.dart';
import '../../common/Themes.dart';
import '../../components/BaseForm/BaseButton.dart';
import '../../components/Copyright.dart';

/**
 * @description: 注册页
 * @author: YiWen
 * @date: 2019-11-23 13:54:59
 * @version V1.0.0 
 */

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // 手机号
  String _phone;
  // 公司名称
  String _name;
  // 验证码
  String _vcode;
  // 账户
  String _username;
  // 密码
  String _password;
  // 确认密码
  String _confirmPassword;
  // 邀请码
  String _inviteCode;
  // 发送短信状态
  bool _isSend = true;
  // 倒计时
  int _countdownTime = 0;
  Timer _timer;

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }

  // 倒计时方法
  _startCountDown() {
    this._countdownTime = 60;
    final call = (timer) {
      if (this._countdownTime < 1) {
        _timer.cancel();
      } else {
        setState(() {
          this._countdownTime -= 1;
        });
      }
    };
    this._timer = Timer.periodic(Duration(seconds: 1), call);
  }
  // 发送短信
  _sendVerCode() async {

    if (this._phone == null || this._phone == "") {
      Fluttertoast.showToast(
          msg: "请填写手机号码",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      return false;
    }

    RegExp phoneCode = new RegExp(r'1[3456789]\d{9}');

    if (!phoneCode.hasMatch(this._phone)) {
      Fluttertoast.showToast(
          msg: "手机号码格式不正确",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      return false;
    }
    var res = await Api.sendVerCode({
      "phone": this._phone,
    });
    bool codeRes = Utils.showToast(res['error_code'], res['msg']);

    if (!codeRes) {
      return false;
    }

    Fluttertoast.showToast(
        msg: res['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
    
    //倒计时
    _startCountDown();
  }

  // 注册
  _registerAccount() async {
    if (this._phone == null || this._phone == "") {
      Utils.showToast(401, "手机号码不能为空");
      return false;
    }
    RegExp phoneCode = new RegExp(r'1[3456789]\d{9}');
    if (!phoneCode.hasMatch(this._phone)) {
      Utils.showToast(401, "手机号码格式不正确");
      return false;
    }

    if (this._vcode == null || this._vcode == "") {
      Utils.showToast(401, "验证码不能为空");
      return false;
    }
    if (this._name == null || this._name == "") {
      Utils.showToast(401, "企业名称不能为空");
      return false;
    }

    if (this._username == null || this._username == "") {
      Utils.showToast(401, "账号不能为空");
      return false;
    }
    if (this._username.length < 4 || this._username.length >= 150) {
      Utils.showToast(401, "账号长度4-150位数字字母下划线");
      return false;
    }

    if (this._password == null || this._password == "") {
      Utils.showToast(401, "密码不能为空");
      return false;
    }

    if (this._confirmPassword != this._password) {
      Utils.showToast(401, "两次输入的密码不匹配!");
      return false;
    }

    Map data = Map();
    data = {
      "name": this._name,
      "phone": this._phone,
      "vcode": this._vcode,
      "username": this._username,
      "password": this._password,
      "password_confirmation": this._confirmPassword,
    };
    if (this._inviteCode != null || this._inviteCode != "") {
      data['invite_code'] = this._inviteCode;
    }
    var res = await Api.register(data);
    bool codeRes = Utils.showToast(res['error_code'], res['msg']);
    if (!codeRes) {
      return false;
    }

    Fluttertoast.showToast(
          msg: "注册成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    
    this._timer = Utils.startTimeout(() {
      Navigator.of(context).pop();
    },2000);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text("通知", style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            // 手机号码
            Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(100),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 4),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text("手机号码"),
                      ),
                      Expanded(
                        flex: 6,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 35, maxWidth: 200),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              hintText: '输入手机号码',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            onChanged: (value) {
                              setState(() {
                                this._phone = value;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
            // 验证码
            Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(100),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 4),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text("验证码"),
                      ),
                      Expanded(
                        flex: 4,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 35, maxWidth: 200),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              hintText: '输入验证码',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            onChanged: (value) {
                              setState(() {
                                this._vcode = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Themes.primaryColor,
                          child: (this._countdownTime > 0) ? Text("${this._countdownTime}s") : Text("获取验证码"),
                          onPressed: (this._countdownTime == 0) ? this._sendVerCode : null,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
            // 企业名称
            Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(100),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 4),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text("企业名称"),
                      ),
                      Expanded(
                        flex: 6,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 35, maxWidth: 200),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              hintText: '输入企业名称',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            onChanged: (value) {
                              setState(() {
                                this._name = value.toString();
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
            // 管理员账号
            Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(100),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 4),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text("管理员账号"),
                      ),
                      Expanded(
                        flex: 6,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 35, maxWidth: 200),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              hintText: '输入管理员账号',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            onChanged: (value) {
                              setState(() {
                                this._username = value.toString();
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
            // 密码
            Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(100),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 4),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text("密码"),
                      ),
                      Expanded(
                        flex: 6,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 35, maxWidth: 200),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              hintText: '输入密码',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            onChanged: (value) {
                              setState(() {
                                this._password = value.toString();
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
            // 确认密码
            Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(100),
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 4),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text("确认密码"),
                      ),
                      Expanded(
                        flex: 6,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 35, maxWidth: 200),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 4.0),
                              hintText: '再次输入密码',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            onChanged: (value) {
                              setState(() {
                                this._confirmPassword = value.toString();
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
            // 邀请码
            Column(
              children: <Widget>[
                Container(
                  height: ScreenAdapter.height(100),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text("邀请码"),
                          )),
                      Expanded(
                        flex: 6,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 35, maxWidth: 200),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 22.0),
                              hintText: '输入邀请码',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                            onChanged: (value) {
                              setState(() {
                                this._inviteCode = value.toString();
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 2,
                )
              ],
            ),
            // 注册
            Container(
              child: BaseButton(
                text: "注册",
                color: Themes.btnPrimaryColor,
                cb: this._registerAccount,
              ),
            ),
            // 版权
            Copyright(),
          ],
        ),
      ),
    );
  }
}
