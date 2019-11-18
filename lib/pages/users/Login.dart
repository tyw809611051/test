import 'package:flutter/material.dart';
import '../../components/BaseForm/BaseText.dart';
import '../../components/BaseForm/BaseButton.dart';
import '../../common/Themes.dart';

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
                      print(value);
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
                      print(value);
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("忘记密码"),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        //  Navigator.pushNamed(context, '/registerFirst');
                        print("点击企业注册");
                      },
                      child: Text("企业注册"),
                    ),
                  ),
                ],
              ),
            ),

            BaseButton(
              text: "登录",
              color: Color(Themes.btnPrimaryColor),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 250.0,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Copyright",style: TextStyle(color: Colors.black45),),
                    Icon(Icons.copyright),
                    Text("2019 蜂鸟云测 V1.0.0",style: TextStyle(color: Colors.black45),)
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
