import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../common/Themes.dart';

/**
 * @description: 通知页
 * @author: YiWen
 * @date: 2019-11-18 15:56:47
 * @version V1.0.0 
 */

class NoticePage extends StatefulWidget {
  NoticePage({Key key}) : super(key: key);

  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> with AutomaticKeepAliveClientMixin {
  
  @override
  bool get wantKeepAlive => true; // 保持页面缓存
  // 二级导航数据
  List _subHeaderList = [
    {
      "id": 1,
      "title": "通知",
    },
    {
      "id": 2,
      "title": "消息",
    },
    {
      "id": 3,
      "title": "待办",
    },
  ];
  // 二级导航初始选中
  int _selectHeader = 1;

  // 切换二级tab栏
  _subHeaderChange(id) {
    setState(() {
      this._selectHeader = id;
    });
  }

  // 二级导航栏
  Widget _subHeaderWidget() {
    return Positioned(
      top: 0,
      height: ScreenAdapter.height(80),
      width: ScreenAdapter.width(750),
      child: Container(
        height: ScreenAdapter.height(80),
        width: ScreenAdapter.width(750),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 1,
          color: Color.fromRGBO(233, 233, 233, 0.9),
        ))),
        child: Row(
          children: this._subHeaderList.map((value) {
            return Expanded(
              flex: 1,
              child: InkWell(
                child: Container(
                    decoration: BoxDecoration(
                      border: (this._selectHeader == value['id'])
                          ? Border(
                              bottom: BorderSide(
                                  width: 1, color: Themes.primaryColor),
                            )
                          : null,
                    ),
                    padding: EdgeInsets.fromLTRB(0, ScreenAdapter.height(16), 0,
                        ScreenAdapter.height(16)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("${value['title']}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: (this._selectHeader == value['id'])
                                    ? Themes.btnPrimaryColor
                                    : Colors.black54)),
                      ],
                    )),
                onTap: () {
                  _subHeaderChange(value['id']);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // 根据tab栏显示不同内容
  Widget _displayContentWidget() {
    switch (this._selectHeader) {
      case 1:
        return Text(
          "您已查看所有通知",
          style: TextStyle(color: Colors.black54),
        );
        break;
      case 2:
        return Text(
          "您已读完所有消息",
          style: TextStyle(color: Colors.black54),
        );
        break;
      case 3:
        return Text(
          "您已完成所有待办",
          style: TextStyle(color: Colors.black54),
        );
        break;
      default:
        return Text(
          "您已查看所有通知",
          style: TextStyle(color: Colors.black54),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("通知", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: ScreenAdapter.height(100),
            width: ScreenAdapter.width(680),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(
              top: ScreenAdapter.height(100),
              left: ScreenAdapter.width(30),
              right: ScreenAdapter.width(30),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: this._displayContentWidget(),
          ),
          _subHeaderWidget(),
        ],
      ),
    );
  }
}
