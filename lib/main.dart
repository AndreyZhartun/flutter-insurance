import 'package:flutter/material.dart';
import 'package:mock_insurance/profile.dart';
import 'package:mock_insurance/stats.dart';
import 'package:mock_insurance/themes.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mock Insurance App',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      initialRoute: '/profile',
      routes: {
        '/': (context) => Home(),
        '/profile': (context) => Profile(),
        '/stats': (context) => Stats(),
      },
      //home: Home(),
    );
  }
}