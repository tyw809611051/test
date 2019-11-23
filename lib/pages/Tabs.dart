import 'package:flutter/material.dart';
import '../services/Api.dart';
import '../services/ScreenAdapter.dart';
import './tabs/Task.dart';
import './tabs/New.dart';
import './tabs/Notice.dart';
import './tabs/User.dart';
import '../common/Themes.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  // 当前索引页
  int _currentIndex = 0;
  // 页面控制器
  PageController _pageController;
  // 页面列表
  List<Widget> _pageList = [
    TaskPage(),
    NewPage(),
    NoticePage(),
    UserPage(),
  ];

  @override
  void initState() {
    super.initState();
    this._pageController = new PageController(initialPage: this._currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    ScreenAdapter.init(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("haha"),
      // ),
      body: PageView(
        controller: _pageController,
        children: this._pageList,
        // 禁止页面滑动
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
            this._pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Themes.primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("委托单")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            title: Text("发起委托")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            title: Text("通知")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("我的")
          ),
        ],
      ),
    );
  }
}
