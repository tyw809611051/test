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
  List tags;
  Label({Key key,this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.tags != null) {
      return Row(
        children: this.tags.map((value) {
          return Container(
            height: ScreenAdapter.height(40),
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.fromLTRB(
              ScreenAdapter.width(20), ScreenAdapter.height(1), 
              ScreenAdapter.height(20), ScreenAdapter.height(1)
              ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Themes.primaryColor),
                
                color: Color.fromRGBO(250, 250, 250, 1)),
            child: Text(
              "${value}",
              style: TextStyle(
                color: Themes.primaryColor,
                fontSize: ScreenAdapter.size(24)
              ),
            ),
          );
        }).toList(),
      );
    } else {
      return Text("");
    }
  }
}
