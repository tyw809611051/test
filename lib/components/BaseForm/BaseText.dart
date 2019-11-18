import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../common/Themes.dart';

class BaseText extends StatelessWidget {
  String text;
  bool isPassword;
  Function onChanged;

  BaseText(
      {Key key,
      this.text = "请输入内容",
      this.isPassword = false,
      this.onChanged = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenAdapter.height(Themes.formBasicHeight),
      // width: 100.0,
      margin: EdgeInsets.only(right: 30),
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 1,
          color: Colors.black12,
        )),
      ),
      child: TextField(
        obscureText: this.isPassword,
        decoration: InputDecoration(
            // icon: Icon(Icons.person_outline),
            hintText: this.text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            )),
        onChanged: this.onChanged,
      ),
    );
  }
}
