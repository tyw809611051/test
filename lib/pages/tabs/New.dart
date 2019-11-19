import '../../common/Themes.dart';
import 'package:flutter/material.dart';
import '../../components/BaseForm/BaseText.dart';
import '../../services/ScreenAdapter.dart';
import '../../components/BaseForm/BaseButton.dart';

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

class _NewPageState extends State<NewPage> {
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
        // padding: EdgeInsets.all(ScreenAdapter.height(10)),
        child: ListView(
          children: <Widget>[
            // 标题
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.wb_sunny,
                  size: 6,
                  color: Colors.red,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "账号",
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
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      onChanged: (value) {
                        print(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            // 项目
            Container(
              height: ScreenAdapter.height(80),
              // width: ScreenAdapter.width(100),
              child: InkWell(
                onTap: () {
                  print("请选择项目");
                },
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.wb_sunny,
                      size: 6,
                      color: Colors.red,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "项目",
                          style: TextStyle(
                            fontSize: 18,
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
                              "请选择项目",
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
              height: ScreenAdapter.height(95),
              padding: EdgeInsets.only(left: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("增值服务"),
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
                                    value: true,
                                    activeColor: Colors.black87,
                                    checkColor: Themes.primaryColor,
                                    onChanged: (value) {
                                      print(value);
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
                                    value: true,
                                    activeColor: Colors.black87,
                                    checkColor: Themes.primaryColor,
                                    onChanged: (value) {
                                      print(value);
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
              height: ScreenAdapter.height(95),
              padding: EdgeInsets.only(left: 5),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text("委托类型"),
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
                                    value: true,
                                    activeColor: Colors.black87,
                                    checkColor: Themes.primaryColor,
                                    onChanged: (value) {
                                      print(value);
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
                                    value: true,
                                    activeColor: Colors.black87,
                                    checkColor: Themes.primaryColor,
                                    onChanged: (value) {
                                      print(value);
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
                                    value: true,
                                    activeColor: Colors.black87,
                                    checkColor: Themes.primaryColor,
                                    onChanged: (value) {
                                      print(value);
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
                          Icons.wb_sunny,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
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
                            hintText: '一句话描述需求',
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onChanged: (value) {
                            print(value);
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
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Icon(
                          Icons.wb_sunny,
                          size: 6,
                          color: Colors.red,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "文件上传",
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
                            hintText: '一句话描述需求',
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          onChanged: (value) {
                            print(value);
                          },
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),

            // 提交
            BaseButton(
              text: "提交",
              color: Themes.btnPrimaryColor,
              cb: () {
                print("提交了");
              },
            ),
          ],
        ),
      ),
    );
  }
}
