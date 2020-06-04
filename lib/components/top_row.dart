import 'package:flutter/material.dart';

import '../themes.dart';

enum TOP_BUTTONS {
  back,
  notifications,
  two_lines,
  empty,
}

class TopRow extends StatelessWidget {
  final bool isWhite;
  final String title;
  final TOP_BUTTONS leading, trailing;

  TopRow({
    this.isWhite,
    this.title,
    this.leading,
    this.trailing,
  });

  Widget getButton(
    BuildContext context,
    TOP_BUTTONS type, {
    bool alignLeft = true,
  }) {
    final _color =
        isWhite ? Colors.white : Theme.of(context).scaffoldBackgroundColor;
    final _alignment = alignLeft ? Alignment.centerLeft : Alignment.centerRight;
    switch (type) {
      case TOP_BUTTONS.back:
        return IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.chevron_left),
          padding: EdgeInsets.zero,
          color: _color,
          alignment: _alignment,
        );
      case TOP_BUTTONS.notifications:
        return IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_none),
          padding: EdgeInsets.zero,
          color: _color,
          alignment: _alignment,
        );
      case TOP_BUTTONS.two_lines:
        return IconButton(
          onPressed: () {},
          icon: Icon(Icons.drag_handle),
          padding: EdgeInsets.zero,
          color: _color,
          alignment: _alignment,
        );
      case TOP_BUTTONS.empty:
      default:
        return IconButton(
          onPressed: null,
          icon: Icon(Icons.not_interested),
          //padding: EdgeInsets.zero,
          disabledColor: isWhite
              ? Theme.of(context).scaffoldBackgroundColor
              : Colors.white,
          alignment: _alignment,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = isWhite
        ? Theme.of(context).textTheme
        : Theme.of(context).accentTextTheme;
    double _horizontalPadding = MyTheme.horizontalPadding;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: _horizontalPadding * 0.5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getButton(context, leading),
          Text(
            title,
            style: _textTheme.bodyText1.copyWith(
              letterSpacing: 1,
            ),
          ),
          getButton(context, trailing, alignLeft: false),
        ],
      ),
    );
  }
}
