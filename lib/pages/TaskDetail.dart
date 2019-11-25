import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../common/Themes.dart';
import '../services/ScreenAdapter.dart';
import '../components/BaseForm/BaseButton.dart';
import '../components/Copyright.dart';
import '../utils/Utils.dart';
import '../services/Api.dart';

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
  Map _detail = Map();

  @override
  void initState() {
    super.initState();

    this._getTaskDetailData(widget.arguments['sn']);
  }

  // 获取详情数据
  _getTaskDetailData(sn) async {
    var res = await Api.taskDetail(sn);

    bool codeRes = Utils.showToast(res['error_code'], res['msg']);
    if (!codeRes) {
      return false;
    }
    Map detail = res["data"];
    setState(() {
      this._detail = detail;
    });
  }

  // 确认委托
  _confirmTask() async {
    if (this._detail.length > 0) {
      var id = this._detail['id'];
      Map<String, dynamic> params = {
        "status": "agree",
        "contents": {
          "commit": "",
          "result": 1,
        }
      };
      var res = await Api.confirmTask(id, params);

      bool codeRes = Utils.showToast(res["error_code"], res["msg"]);
      if (!codeRes) {
        return false;
      }

      Fluttertoast.showToast(
          msg: "处理完成",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);

      _getTaskDetailData(widget.arguments['sn']);
    } else {
      bool codeRes = Utils.showToast(401, "系统正在处理中,请稍候!");
      if (!codeRes) {
        return false;
      }
    }
  }

  // 根据不同状态展示不同标签
  Widget _showStatusTags(Map status) {
    String text;
    Color color;
    if (this._detail.length > 0) {
      switch (status['value']) {
        case 6:
          color = Colors.blue;
          break;
        case 9:
          color = Colors.green;
          break;
        default:
          color = Colors.black;
          break;
      }
      text = status['text'];

      return Container(
        height: ScreenAdapter.height(48),
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.fromLTRB(
            ScreenAdapter.width(20),
            ScreenAdapter.height(4),
            ScreenAdapter.height(20),
            ScreenAdapter.height(4)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: color),
            color: Color.fromRGBO(250, 250, 250, 0.9)),
        child: Text(
          "${text}",
          style: TextStyle(color: color),
        ),
      );
    } else {
      return Text("");
    }
  }

  // 遍历服务项
  Widget _showServiceItem(servicesId) {
    String title = "";
    String standard_info = "";
    String commit = "";
    List service = this._detail['services'] ?? [];
    bool res = service.any((value) => value['id'] == servicesId);
    if (!res) {
      return Container();
    }

    String servId = servicesId.toString();
    switch (servicesId) {
      case 1:
        title = '质检服务';
        break;
      case 3:
        title = '下厂服务';
        break;
      case 4:
        title = '质检服务';
        break;
      default:
        title = '';
        break;
    }
    if (this._detail['configs']['${servId}'] != null) {
      if (this._detail['configs']['${servId}'].containsKey('standard_info')) {
        var code =
            this._detail['configs']['${servId}']['standard_info']['code'] ?? "";
        var name =
            this._detail['configs']['${servId}']['standard_info']['name'] ?? "";
        standard_info = code != null ? "(${code})${name}" : "${name}";
      }

      commit = this._detail['configs']['${servId}']['commit'] ?? "";
    }

    return Container(
        height: ScreenAdapter.height(150),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: Colors.black12
            )
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: ScreenAdapter.height(48),
                margin: EdgeInsets.only(top: 3),
                padding: EdgeInsets.fromLTRB(
                    ScreenAdapter.width(20),
                    ScreenAdapter.height(5),
                    ScreenAdapter.height(20),
                    ScreenAdapter.height(5)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Themes.primaryColor),
                    color: Color.fromRGBO(250, 250, 250, 1)),
                child: Text(
                  "${title}",
                  style: TextStyle(color: Themes.primaryColor),
                ),
              ),
              Text(
                "依据标准: ${standard_info}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "备注: ${commit}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ));
  }

  // 展示产品
  Widget _showMaterial() {
    if (this._detail.length > 0 && this._detail['material'].length > 0) {
      List material = this._detail['material'];
      return Wrap(
        runSpacing: 2,
        children: material.map((value) {
          var model = value['product']['model'] ?? "";
          var name = value['product']['name'] ?? "";

          return Container(
            color: Colors.white,
            height: ScreenAdapter.height(150),
            width: ScreenAdapter.width(750),
            padding: EdgeInsets.only(left: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${model}",
                        style: TextStyle(fontSize: ScreenAdapter.size(28)),
                      ),
                      Text(
                        "${name}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: ScreenAdapter.size(24)),
                      ),
                      Text(
                        "#${value['sn']}",
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: ScreenAdapter.size(24)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "X${value['qty']}",
                      style: TextStyle(color: Themes.primaryColor),
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),
      );
    } else {
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text("委托单详情", style: TextStyle(color: Colors.white)),
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
                        (this._detail.length > 0)
                            ? "#${this._detail['sn']}"
                            : "#---------",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: this._showStatusTags(this._detail['status']),
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
                        (this._detail.length > 0)
                            ? "${this._detail['title']}"
                            : "---",
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
                        (this._detail.length > 0)
                            ? "${this._detail['project']['name']}"
                            : "---",
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
                        (this._detail.length > 0)
                            ? "${this._detail['created_at']}"
                            : "---",
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
                          (this._detail.length > 0 &&
                                  this._detail['content'] != null)
                              ? "${this._detail['content']}"
                              : "",
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
                      "服务项",
                      style: TextStyle(fontSize: ScreenAdapter.size(32)),
                    ),
                  ),
                ],
              ),
            ),

            (this._detail.length > 0 && this._detail['services'].length > 0)
                ? this._showServiceItem(1)
                : Text(""),
            // (this._detail.length > 0 && this._detail['services'].length >= 2)
            //     ? Divider(
            //         height: 2,
            //       )
            //     : Text(""),
            (this._detail.length > 0 && this._detail['services'].length > 0)
                ? this._showServiceItem(3)
                : Text(""),
            // (this._detail.length > 0 && this._detail['services'].length >= 3)
            //     ? Divider(
            //         height: 2,
            //       )
            //     : Text(""),
            (this._detail.length > 0 && this._detail['services'].length > 0)
                ? this._showServiceItem(4)
                : Text(""),

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

            this._showMaterial(),
            Container(
              width: double.infinity,
              height: 30,
              color: Colors.black12,
            ),
            (this._detail.length > 0 && this._detail['status']['value'] == 6)
                ? BaseButton(
                    text: "确认委托",
                    color: Themes.btnPrimaryColor,
                    cb: this._confirmTask,
                  )
                : Text(""),
            SizedBox(
              height: 20,
            ),
            Copyright()
          ],
        ),
      ),
    );
  }
}
