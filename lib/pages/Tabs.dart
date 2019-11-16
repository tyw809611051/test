import 'package:flutter/material.dart';
import '../services/Api.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  _getData() {
    Api.login("api/v1/login", options: {
      "data": {
        "username": "pingtai",
        "password": 123456,
        "type": "account",
      }
    }).then( (res) => {
      print("1111"+res)
    }).catchError( (e) => {
      print(e)
    }) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("haha"),
      ),
    );
  }
}
