import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Color color;
  final String text;
  final Object cb;

  BaseButton(
      {Key key, this.color = Colors.black, this.text = "按钮", this.cb = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      child: InkWell(
        onTap: this.cb,
        child: Container(
          height: 38,
          width: double.infinity,
          decoration: BoxDecoration(
              color: this.color, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "${this.text}",
              style: TextStyle(
                color: Colors.white, 
                letterSpacing: 3,
                fontSize: 16
              ),
            ),
          ),
        ),
      ),
    );
  }
}
