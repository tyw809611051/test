import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/ScreenAdapter.dart';
import '../../services/CustomNavigatorObserver.dart';
import '../../components/BaseForm/BaseButton.dart';
import '../../common/Themes.dart';
import '../../services/Api.dart';
import '../../utils/Utils.dart';
import '../Tabs.dart';

/**
 * @description: 创建委托单页
 * @author: YiWen
 * @date: 2019-11-18 15:56:47
 * @version V1.0.0 
 */

class NewPage extends StatefulWidget {
  NewPage({Key key}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false; // 保持页面缓存

  // 标题
  String title;
  // 项目ID
  int projectId;
  String projectText;
  // 增值服务
  List valueServices = List();
  // 委托类型
  List services = List();
  // 需求内容
  String content;
  // 附件ID
  List attachments = List();
  // 项目数据
  List _project = List();
  // 选中状态
  bool _expedited = false,
      _storage = false,
      _inspectedService = false,
      _factoryService = false,
      _purchaseService = false;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    // 请求项目数据
    _getProjectData();
  }

  @override
  void dispose() {
    super.dispose();
    if (this._timer != null) {
      this._timer.cancel();
    }
  }

  // 请求项目数据
  _getProjectData() async {
    var res = await Api.getProject();
    bool codeRes = Utils.showToast(res['error_code'], res['msg']);

    if (!codeRes) {
      return false;
    }

    setState(() {
      this._project = res['data'];
    });
  }

  // 选择文件
  _selectFile() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image is File) {
      String path = image.path;
      List tempArr = path.split('/');
      String name = tempArr[tempArr.length - 1];

      FormData formData = FormData.fromMap(
          {"file": await MultipartFile.fromFile(image.path, filename: name)});

      var res = await Api.upload(formData);
      bool codeRes = Utils.showToast(res['error_code'], res['msg']);

      if (!codeRes) {
        return false;
      }

      Fluttertoast.showToast(
          msg: "上传成功",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);

      setState(() {
        this.attachments.add(res['data']);
      });
    } else {
      Fluttertoast.showToast(
          msg: "上传失败",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);

      return false;
    }
  }

  // 创建委托单
  _createTask() async {
    if (this.title == null) {
      Utils.showToast(401, "标题不能为空");
      return false;
    }
    if (this.projectId == null) {
      Utils.showToast(401, "项目不能为空");
      return false;
    }
    if (this.content == null) {
      Utils.showToast(401, "需求描述不能为空");
      return false;
    }

    Map data = Map();
    //处理文件
    if (this.attachments.length > 0) {
      data['attachments'] = List();
      this.attachments.forEach((value) {
        data['attachments'].add(value['id']);
      });
    }

    // 增值服务
    if (this.valueServices.length > 0) {
      data['value_services'] = List();
      data['value_services'].addAll(this.valueServices);
    }

    // 服务
    if (this.services.length > 0) {
      data['services'] = List();
      data['services'].addAll(this.services);
    }

    data['title'] = this.title;
    data['project'] = this.projectId;
    data['content'] = this.content;

    var res = await Api.createTask(data);

    bool codeRes = Utils.showToast(res['error_code'], res['msg']);
    if (!codeRes) {
      return false;
    }

    Fluttertoast.showToast(
        msg: res['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);

    this._timer = Utils.startTimeout(() {
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new Tabs()),
          (route) => route == null);
    }, 2000);
  }

  // 展示项目
  _showProjectItem() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (this._project.length <= 0) {
          return Container(
            height: ScreenAdapter.height(50),
            child: Text("无项目数据!"),
          );
        }
        return StatefulBuilder(builder: (BuildContext context, setBottomState) {
          return GestureDetector(
            onTap: () {
              return false;
            },
            child: Container(
              height: ScreenAdapter.height(400),
              child: ListView.builder(
                itemCount: this._project.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          this.projectId = this._project[index]['key'];
                          this.projectText = this._project[index]['text'];
                        });
                        Navigator.of(context).pop();
                      },
                      child: Column(
                        children: <Widget>[
                          Text("${this._project[index]['text']}")
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        });
      },
    );
  }

  // 展示已上传的文件
  Widget _showUploadFiles() {
    if (this.attachments.length > 0) {
      int index = 0;
      return Wrap(
        runSpacing: 2,
        children: this.attachments.map((value) {
          return Container(
            color: Colors.white,
            height: ScreenAdapter.height(60),
            width: ScreenAdapter.width(750),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15),
                    child: Text("${value['name']}"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "删除成功",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER);
                        setState(() {
                          this.attachments.removeAt(index++);
                        });
                      },
                      child: Text(
                        "X",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "发起委托",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            // 标题
            Container(
              height: ScreenAdapter.height(100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 6,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Text(
                        "标题",
                        style: TextStyle(
                          fontSize: ScreenAdapter.size(24),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: 35, maxWidth: 200),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 4.0),
                          hintText: '一句话描述需求',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        onChanged: (value) {
                          setState(() {
                            this.title = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            // 项目
            Container(
              height: ScreenAdapter.height(80),
              // width: ScreenAdapter.width(100),
              child: InkWell(
                onTap: () {
                  this._showProjectItem();
                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.fiber_manual_record,
                        size: 6,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Text(
                          "项目",
                          style: TextStyle(
                            fontSize: ScreenAdapter.size(24),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text(
                              (this.projectText == null)
                                  ? "请选择项目"
                                  : this.projectText,
                              style: TextStyle(
                                fontSize: ScreenAdapter.size(24),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black45,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            // 增值服务
            Container(
              height: ScreenAdapter.height(100),
              padding: EdgeInsets.only(left: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text("增值服务",
                          style: TextStyle(fontSize: ScreenAdapter.size(24))),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("加急"),
                                Container(
                                  width: ScreenAdapter.width(45),
                                  child: Checkbox(
                                    value: this._expedited,
                                    activeColor: Themes.primaryColor,
                                    // checkColor: Themes.primaryColor,
                                    tristate: false,
                                    onChanged: (bool bol) {
                                      if (mounted) {
                                        bol
                                            ? valueServices.add(1)
                                            : valueServices.remove(1);
                                        setState(() {
                                          this._expedited = bol;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("贮存"),
                                Container(
                                  width: ScreenAdapter.width(45),
                                  child: Checkbox(
                                    value: this._storage,
                                    activeColor: Themes.primaryColor,
                                    // checkColor: Themes.primaryColor,
                                    onChanged: (bool bol) {
                                      if (mounted) {
                                        bol
                                            ? valueServices.add(2)
                                            : valueServices.remove(2);
                                        setState(() {
                                          this._storage = bol;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            // 委托类型
            Container(
              height: ScreenAdapter.height(100),
              padding: EdgeInsets.only(left: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: Text(
                      "委托类型",
                      style: TextStyle(fontSize: ScreenAdapter.size(24)),
                    )),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("质检服务"),
                                Container(
                                  width: ScreenAdapter.width(45),
                                  child: Checkbox(
                                    value: this._inspectedService,
                                    activeColor: Themes.primaryColor,
                                    // checkColor: Themes.primaryColor,
                                    onChanged: (bool bol) {
                                      if (mounted) {
                                        bol
                                            ? services.add(1)
                                            : services.remove(1);
                                        setState(() {
                                          this._inspectedService = bol;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("下场服务"),
                                Container(
                                  width: ScreenAdapter.width(45),
                                  child: Checkbox(
                                    value: this._factoryService,
                                    activeColor: Themes.primaryColor,
                                    // checkColor: Themes.primaryColor,
                                    onChanged: (bool bol) {
                                      if (mounted) {
                                        bol
                                            ? services.add(3)
                                            : services.remove(3);
                                        setState(() {
                                          this._factoryService = bol;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("采购服务"),
                                Container(
                                  width: ScreenAdapter.width(45),
                                  child: Checkbox(
                                    value: this._purchaseService,
                                    activeColor: Themes.primaryColor,
                                    // checkColor: Themes.primaryColor,
                                    onChanged: (bool bol) {
                                      if (mounted) {
                                        bol
                                            ? services.add(4)
                                            : services.remove(4);
                                        setState(() {
                                          this._purchaseService = bol;
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // 分割线
            Container(
              width: double.infinity,
              height: 20,
              color: Colors.black12,
            ),
            // 需求描述
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Icon(
                          Icons.fiber_manual_record,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4, top: 10),
                        child: Text(
                          "需求描述",
                          style: TextStyle(
                            fontSize: ScreenAdapter.size(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: ScreenAdapter.height(250),
                        width: ScreenAdapter.width(700),
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          maxLines: 8,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                            hintText: '   需求描述',
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onChanged: (value) {
                            setState(() {
                              this.content = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
            // 分割线
            Container(
              width: double.infinity,
              height: 20,
              color: Colors.black12,
            ),
            // 文件上传
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(left: 15, top: 10),
                          child: Text(
                            "文件上传",
                            style: TextStyle(
                              fontSize: ScreenAdapter.size(24),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              width: ScreenAdapter.width(150),
                              height: ScreenAdapter.height(60),
                              margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.only(top: 5),
                              // color: Colors.orange,
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Themes.primaryColor,
                                onPressed: () {
                                  _selectFile();
                                },
                                child: Text("上传"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),

            // 展示文件
            _showUploadFiles(),
            // 提交
            BaseButton(
              text: "提交",
              color: Themes.btnPrimaryColor,
              cb: this._createTask,
            ),
          ],
        ),
      ),
    );
  }
}
