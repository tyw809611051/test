import 'package:flutter/material.dart';

/**
 * @description: 委托单详情页
 * @author: YiWen
 * @date: 2019-11-20 10:12:18
 * @version V1.0.0 
 */

class TaskDetailPage extends StatefulWidget {
  TaskDetailPage({Key key}) : super(key: key);

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("委托单详情",style:TextStyle(color:Colors.white)),),
      ),
      body: Text("data"),
    );
  }
}