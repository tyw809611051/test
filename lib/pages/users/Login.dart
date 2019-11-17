import 'package:flutter/material.dart';

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
      body: Container(
        // color: Colors.red,
        child: ListView(
          children: <Widget>[
            // logo部分
            Center(
              child: Container(
                height: 80,
                width: 300,
                margin: EdgeInsets.only(top: 50),
                child: Image.asset("lib/assets/imgs//slogo.jpg",fit: BoxFit.cover,),
              ),
            ),

            SizedBox(height: 30,)
            // 表单部分
            

          ],
        ),
      ),
    );
  }
}