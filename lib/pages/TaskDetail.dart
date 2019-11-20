import 'package:flutter/material.dart';
import '../common/Themes.dart';
import '../services/ScreenAdapter.dart';
import '../components/BaseForm/BaseButton.dart';
import '../components/Copyright.dart';

/**
 * @description: 委托单详情页
 * @author: YiWen
 * @date: 2019-11-20 10:12:18
 * @version V1.0.0 
 */

class TaskDetailPage extends StatefulWidget {
  Map arguments;
  TaskDetailPage({Key key, this.arguments}) : super(key: key);

  @override
  _TaskDetailPageState createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("委托单详情", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 20,
              color: Colors.black12,
            ),
            // 基础信息
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(100),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.fiber_manual_record,
                      color: Themes.primaryColor,
                      size: ScreenAdapter.size(22),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "基础信息",
                      style: TextStyle(fontSize: ScreenAdapter.size(32)),
                    ),
                  ),
                ],
              ),
            ),
            // 单号
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(100),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "#111901623",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        height: ScreenAdapter.height(48),
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Themes.primaryColor),
                            color: Color.fromRGBO(250, 250, 250, 1)),
                        child: Text("待用户确认"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
            ),
            // 标题
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "标题",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenAdapter.size(28)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        "采购及质保",
                        style: TextStyle(fontSize: ScreenAdapter.size(28)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
            ),
            // 项目
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "项目",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenAdapter.size(28)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        "小卫星项目",
                        style: TextStyle(fontSize: ScreenAdapter.size(28)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
            ),
            // 委托人
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "委托人",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenAdapter.size(28)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        "YiWen",
                        style: TextStyle(fontSize: ScreenAdapter.size(28)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
            ),
            // 委托时间
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        "委托时间",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenAdapter.size(28)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Text(
                        "2019-03-29 13:57:51",
                        style: TextStyle(fontSize: ScreenAdapter.size(28)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
            ),
            // 需求描述
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(260),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "需求描述",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: ScreenAdapter.size(28)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "需求描述",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: ScreenAdapter.size(24)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              color: Colors.black12,
            ),
            // 服务项
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(100),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.fiber_manual_record,
                      color: Themes.primaryColor,
                      size: ScreenAdapter.size(22),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "基础信息",
                      style: TextStyle(fontSize: ScreenAdapter.size(32)),
                    ),
                  ),
                ],
              ),
            ),
            // 质检服务
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(150),
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: ScreenAdapter.height(48),
                      margin: EdgeInsets.only(top: 3),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Themes.primaryColor),
                          color: Color.fromRGBO(250, 250, 250, 1)),
                      child: Text("待用户确认"),
                    ),
                    Text(
                      "依据标准:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "备注:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ),
            Divider(
              height: 2,
            ),
            // 采购服务
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(150),
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: ScreenAdapter.height(48),
                      margin: EdgeInsets.only(top: 3),
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Themes.primaryColor),
                          color: Color.fromRGBO(250, 250, 250, 1)),
                      child: Text("待用户确认"),
                    ),
                    Text(
                      "依据标准:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "备注:",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ),
            Container(
              width: double.infinity,
              height: 20,
              color: Colors.black12,
            ),
            // 产品
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(100),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.fiber_manual_record,
                      color: Themes.primaryColor,
                      size: ScreenAdapter.size(22),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "产品",
                      style: TextStyle(fontSize: ScreenAdapter.size(32)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: ScreenAdapter.height(150),
              padding: EdgeInsets.only(left: 30),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("REF3033AIDBZT",style: TextStyle(
                          fontSize: ScreenAdapter.size(28)
                        ),),
                        Text(
                          "XXXXXXXXXXXXXXXXXXXXX",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: ScreenAdapter.size(24)
                        ),),
                        Text("#120200006",style: TextStyle(
                          color: Colors.black45,
                          fontSize: ScreenAdapter.size(24)
                        ),),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text("X1",style: TextStyle(
                        color: Themes.primaryColor
                      ),),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: Colors.black12,
            ),
            BaseButton(
              text: "确认委托",
              color: Themes.btnPrimaryColor,

            ),
            SizedBox(height: 20,),
            Copyright()
          ],
        ),
      ),
    );
  }
}
