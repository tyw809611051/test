import '../common/Themes.dart';
import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';

/**
 * @description: 镂空标签
 * @author: YiWen
 * @date: 2019-11-19 10:48:23
 * @version V1.0.0 
 */

class Label extends StatelessWidget {
  final List tags;
  Label({Key key,this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: ScreenAdapter.height(38),
          margin: EdgeInsets.only(right: 10),
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Themes.primaryColor),
              color: Color.fromRGBO(250, 250, 250, 1)),
          child: Text("质检"),
        ),
      ],
    );
  }
}
