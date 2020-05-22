import 'package:flutter/material.dart';
import 'package:mock_insurance/profile.dart';

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
      theme: ThemeData(
        //primarySwatch: Colors.black,
        scaffoldBackgroundColor: Colors.black87,
        accentColor: Colors.black26,
        textTheme: Typography.whiteMountainView,
        accentTextTheme: Typography.blackMountainView,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Profile(),
    );
  }
}