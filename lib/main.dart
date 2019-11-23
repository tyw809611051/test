import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'routes/router.dart';
import './common/Themes.dart';
import './services/CustomNavigatorObserver.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [],
      child: MaterialApp(
        navigatorObservers: [CustomNavigatorObserver.getInstance()],

        initialRoute: '/login',
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Themes.primaryColor
        ),
      ),
    );
  }
}