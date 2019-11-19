import 'package:flutter/material.dart';
import '../common/Env.dart';

/**
 * @description: 版权组件
 * @author: YiWen
 * @date: 2019-11-19 15:51:49
 * @version V1.0.0 
 */

class Copyright extends StatelessWidget {
  
  Copyright({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime toYear = DateTime.now();
    return Container(
        width: 250.0,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Copyright",
              style: TextStyle(color: Colors.black45),
            ),
            Icon(Icons.copyright),
            Text(
              "${toYear.year} 蜂鸟云测 ${Env.version}",
              style: TextStyle(color: Colors.black45),
            )
          ],
        ));
  }
}
