import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

final ThemeData appTheme = ThemeData(
  //primarySwatch: Colors.black,
  scaffoldBackgroundColor: Color.fromRGBO(53, 53, 53, 1),
  accentColor: Color.fromRGBO(130, 130, 130, 1),
  cardColor: Color.fromRGBO(255, 71, 71, 1),
  textTheme: Typography.whiteMountainView,
  accentTextTheme: Typography.blackMountainView,
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

class MyTheme {
  //горизонтальный паддинг страниц
  static double horizontalPadding = 30;
  //размеры кнопок
  static double buttonWidth = 120;
  static double buttonHeight = 45;
  //радиус нижней белой половины и карты агента
  static double circularRadius = 50;
  //радиус изображения карты агента
  static double imageRadius = 30;
}
