import '../../common/Themes.dart';
import 'package:flutter/material.dart';
import '../../services/ScreenAdapter.dart';
import '../../components/Label.dart';
import '../../services/Api.dart';
import '../../utils/Utils.dart';
import '../../components/Loading.dart';

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
  // 配置search搜索框的值
  var _initKeywordsController = TextEditingController();
  // 用于上拉分页
  ScrollController _scrollController = ScrollController();
  // 分页
  int _page = 1;
  bool _flag = true;
  bool _hasMore = true;
  // 二级导航初始选中
  int _selectHeader = 1;
  // 委托单数据
  List _taskList = [];

  // 二级导航数据
  List _subHeaderList = [
    {"id": 1, "title": "未开始", "status": "6"},
    {"id": 2, "title": "进行中", "status": "0,1,2,3,4,5"},
    {"id": 3, "title": "已完成", "status": "9"},
  ];

  @override
  void initState() {
    super.initState();

    _getTaskListData();

    // 监听滚动条滚动事件
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 20) {
        if (this._flag && this._hasMore) {
          this._getTaskListData();
        }
      }
    });
  }

  // 获取委托单列表数据
  _getTaskListData() async {
    setState(() {
      this._flag = false;
    });

    Map<String, dynamic> params = Map();
    var title = this._initKeywordsController.text;
    if (title != "") {
      params["title"] = title;
    }
    params['page'] = this._page;
    params['status'] = this._subHeaderList[this._selectHeader - 1]['status'];

    // 请求数据
    var res = await Api.taskList(params);

    Utils.showToast(res["error_code"], res["msg"]);

    Map taskList = res["data"];
    Map pagination = taskList["pagination"];
    bool hasMore = true;

    if (pagination["current"] * pagination["pageSize"] >= pagination["total"]) {
      hasMore = false;
    }

    setState(() {
      this._taskList.addAll(taskList["list"]);
      this._page++;
      this._flag = true;
      this._hasMore = hasMore;
    });
  }

  // 上拉刷新
  _showMore(index) {
    if (this._hasMore) {
      return (index == this._taskList.length - 1) ? LoadingWidget() : Text("");
    } else {
      return (index == this._taskList.length - 1)
          ? Text("---我的有底线的---")
          : Text("");
    }
  }

  // 切换二级tab栏
  _subHeaderChange(id) {
    setState(() {
      this._selectHeader = id;
      // 重置分页
      this._page = 1;
      // 重置数据
      this._taskList = [];
      // 重置hasmore
      this._hasMore = true;
      this._getTaskListData();
    });
  }

  // 根据不同状态展示不同标签
  Widget _showStatusTags(Map status) {
    String text;
    Color color;
    switch (this._selectHeader) {
      case 1:
        color = Colors.blue;
        break;
      case 2:
        color = Colors.black;
        break;
      case 3:
        color = Colors.green;
        break;
      default:
        break;
    }
    text = status['text'];

    return Container(
      height: ScreenAdapter.height(48),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color),
          color: Color.fromRGBO(250, 250, 250, 0.9)),
      child: Text(
        "${text}",
        style: TextStyle(color: color),
      ),
    );
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
    if (this._taskList.length > 0) {
      return Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        margin: EdgeInsets.only(top: ScreenAdapter.height(80)),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: this._taskList.length,
          itemBuilder: (context, index) {
            // 时间
            String createdAt = this._taskList[index]['created_at'].toString();
            createdAt = createdAt.substring(0, 10);
            // 标签
            List tags = [];
            if (this._taskList[index]['services'].isNotEmpty) {
              this._taskList[index]['services'].forEach((val) {
                tags.add(val['title']);
              });
            }

            return InkWell(
              onTap: () {
                print("进详情啦");
                Navigator.pushNamed(context, '/taskDetail',arguments: {
                  "sn":this._taskList[index]['sn'],
                });
              },
              child: Column(
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
                                "${this._taskList[index]['title']}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: ScreenAdapter.size(28)),
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
                                    "#${this._taskList[index]['sn']}",
                                    style: TextStyle(
                                        fontSize: ScreenAdapter.size(22),
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                              Label(
                                tags: tags,
                              ),
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
                              this._showStatusTags(
                                  this._taskList[index]['status']),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "${createdAt}",
                                  style: TextStyle(
                                      fontSize: ScreenAdapter.size(20)),
                                ),
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
              ),
            );
          },
        ),
      );
    } else {
      return LoadingWidget();
    }
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
                hintText: (this._initKeywordsController.text == "")
                    ? "搜索标题"
                    : this._initKeywordsController.text,
                contentPadding: EdgeInsets.only(top: 8, left: 8),
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
