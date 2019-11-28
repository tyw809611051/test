import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/users/Login.dart';
import '../pages/users/Register.dart';
import '../pages//users/Agreement.dart';
import '../pages/users/Privacy.dart';
import '../pages/TaskDetail.dart';


final routes={
  '/': (context) => Tabs(),
  '/login': (context) => LoginPage(),
  '/register': (context) => RegisterPage(),
  '/taskDetail': (context,{arguments}) => TaskDetailPage(arguments: arguments),
  '/agreement': (context) => AgreementPage(),
  '/privacy': (context) => PrivacyPage(),
};

/**
 * 路由配置传参
 * @RouteSettings settings
 * @returns {route}
 */

var onGenerateRoute = (RouteSettings settings){
  // 统一处理 
  final String name=settings.name;
  final Function pageContentBuilder=routes[name]; 
  if(pageContentBuilder!=null){ 
    if(settings.arguments!=null){
      final Route route=MaterialPageRoute( 
        builder:(context)=> pageContentBuilder(context,arguments:settings.arguments)
      ); 
      return route; 
    } else {
      final Route route=MaterialPageRoute( 
        builder:(context)=> pageContentBuilder(context)
      ); 
      return route;
    }
  }
};