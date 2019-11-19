import '../../common/Themes.dart';
import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../components/Label.dart';

/**
 * @description: 委托单列表页
 * @author: YiWen
 * @date: 2019-11-18 15:56:47
 * @version V1.0.0 
 */

class TaskPage extends StatefulWidget {
  TaskPage({Key key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  // 二级导航初始选中
  int _selectHeader = 1;
  // 二级导航数据
  List _subHeaderList = [
    {"id": 1, "title": "未开始", "status": "6"},
    {"id": 2, "title": "进行中", "status": "0,1,2,3,4,5"},
    {"id": 3, "title": "已完成", "status": "9"},
  ];

  // 配置search搜索框的值
  var _initKeywordsController = TextEditingController();
  // 用于上拉分页
  ScrollController _scrollController = ScrollController();

  // 获取委托单列表数据
  _getTaskListData() {
    print(111);
  }

  // 上拉刷新
  _showMore(index) {}

  // 切换二级tab栏
  _subHeaderChange(id) {
    setState(() {
      this._selectHeader = id;
    });
  }

  // 顶部tab栏
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

  // 委托单列表
  Widget _taskListWidget() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      height: ScreenAdapter.height(180),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "采购及质保",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: ScreenAdapter.size(28)),
                          ),
                          Row(
                            children: <Widget>[
                              Transform(
                                transform: Matrix4.identity()
                                  ..rotateZ(30.0), // 旋转的角度
                                origin: Offset(4, 7), // 旋转的中心点
                                child: Icon(
                                  Icons.local_offer,
                                  color: Themes.primaryColor,
                                  size: 12.0,
                                ),
                              ),
                              SizedBox(
                                width: ScreenAdapter.width(10),
                              ),
                              Text(
                                "111901623",
                                style: TextStyle(
                                    fontSize: ScreenAdapter.size(22),
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          Label(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: ScreenAdapter.height(180),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: ScreenAdapter.height(48),
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Themes.primaryColor),
                                color: Color.fromRGBO(250, 250, 250, 1)),
                            child: Text("待用户确认"),
                          ),
                          Container(
                            margin: EdgeInsets.only(top:10),
                            child: Text("2019-03-29",style: TextStyle(
                              fontSize: ScreenAdapter.size(20)
                            ),),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: ScreenAdapter.height(68),
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            controller: _initKeywordsController,
            autofocus: false,
            decoration: InputDecoration(
              hintText: "搜索标题或单号",
              contentPadding: EdgeInsets.only(top: 8,left:8),
                border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30),
            )),
            onChanged: (value) {
              setState(() {
                this._initKeywordsController.text = value;
              });
            },
          ),
        ),
        actions: <Widget>[
          InkWell(
            child: Container(
              height: ScreenAdapter.height(68),
              width: ScreenAdapter.width(80),
              child: Row(
                children: <Widget>[Text("搜索")],
              ),
            ),
            onTap: () {
              this._getTaskListData();
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          _taskListWidget(),
          _subHeaderWidget(),
        ],
      ),
    );
  }
}
