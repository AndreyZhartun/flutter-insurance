import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mock_insurance/themes.dart';
import 'dart:math' as math;
//import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theming
    TextTheme _textTheme = Theme.of(context).textTheme;
    double _horizontalPadding = MyTheme.horizontalPadding;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        //TODO Localizations
        //TODO mock http server
        title: Text(
          'TOTAL PAYMENT',
          style: _textTheme.bodyText1.copyWith(
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),*/
      drawer: Drawer(
          //TODO
          ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
                vertical: _horizontalPadding * 0.5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.drag_handle),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                  ),
                  Text(
                    'TOTAL PAYMENT',
                    style: _textTheme.bodyText1.copyWith(
                      letterSpacing: 1,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _horizontalPadding,
                right: _horizontalPadding,
                //top: _horizontalPadding * 0.5,
              ),
              child: Text(
                '\$ 1024.68',
                style: _textTheme.headline3.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
              child: Text(
                'Your monthly bill',
                style: _textTheme.bodyText2.copyWith(
                  letterSpacing: 0.5,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
                vertical: 30,
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MyTheme.buttonWidth,
                    height: MyTheme.buttonHeight,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'View bill',
                        style: Theme.of(context)
                            .accentTextTheme
                            .bodyText1
                            .copyWith(
                                //letterSpacing: 0.5,
                                ),
                      ),
                      color: Colors.white,
                      //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  SizedBox(
                    width: MyTheme.buttonWidth,
                    height: MyTheme.buttonHeight,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Pay',
                        style: _textTheme.bodyText1.copyWith(
                            //letterSpacing: 0.5,
                            ),
                      ),
                      //padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _TypesList(),
          ],
        ),
      ),
    );
  }
}

class _TypesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theming
    Radius _radius = Radius.circular(MyTheme.circularRadius);
    double _horizontalPadding = MyTheme.horizontalPadding;
    //data
    List types = [
      {
        "type": "Home Insurance",
        "sum": "650.24",
      },
      {
        "type": "Car Insurance",
        "sum": "205.12",
      },
      {
        "type": "Life Insurance",
        "sum": "350.20",
      },
      {
        "type": "Life Insurance",
        "sum": "350.20",
      },
    ];
    return Expanded(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: _radius,
                  topRight: _radius,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _AgentCard(),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return _TypesListItem(
                      type: types[index]["type"],
                      sum: types[index]["sum"],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      indent: _horizontalPadding,
                      endIndent: _horizontalPadding,
                    );
                  },
                  itemCount: types.length,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AgentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theming
    TextTheme _textTheme = Theme.of(context).textTheme;
    double _horizontalPadding = MyTheme.horizontalPadding;
    double _imageRadius = MyTheme.imageRadius;
    return Padding(
      padding: EdgeInsets.only(
        left: _horizontalPadding,
        right: _horizontalPadding,
        bottom: _horizontalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //widthFactor: 0.5,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            color: Color.fromRGBO(255, 71, 71, 1),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    top: _horizontalPadding * 0.5,
                    left: _horizontalPadding * 0.5,
                    right: _horizontalPadding * 0.5,
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: FlutterLogo(),
                        radius: _imageRadius,
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: _horizontalPadding * 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name Surname',
                              style: _textTheme.subtitle1.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('My Agent'),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.chat),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.mail),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: _imageRadius * 2 + _horizontalPadding * 0.5),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Stats()),
                    );*/
                    Navigator.pushNamed(context, '/stats');
                  },
                  icon: Icon(
                    Icons.more_horiz,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  iconSize: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TypesListItem extends StatelessWidget {
  final String type;
  final String sum;

  _TypesListItem({
    this.type,
    this.sum,
  });

  @override
  Widget build(BuildContext context) {
    //theming
    TextTheme _textTheme = Theme.of(context).accentTextTheme;
    double _horizontalPadding = 30;
    Color accentColor = Theme.of(context).accentColor;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding,
        vertical: 1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Text(
                    type,
                    style: _textTheme.bodyText2.copyWith(
                      color: accentColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Text(
                  '\$ $sum',
                  style: _textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          /*Padding(
            padding: EdgeInsets.symmetric(horizontal: _horizontalPadding-25),
            child: */
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text(
                  'last month',
                  style: _textTheme.bodyText2.copyWith(
                    color: accentColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              /*SizedBox(
                width: 140,
                //height: 40,
                height: _textTheme.headline5.fontSize,
                child: Container(
                  color: Colors.black26,
                ),
              ),*/
              /*Text(
                'xd',
                style: _textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),*/
              _MiniChart(),
            ],
          ),
          //),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black),
            onPressed: () {},
            alignment: Alignment.centerRight,
          ),
        ],
      ),
    );
  }
}

class _MiniChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: LineChart(
        mainData(context),
      ),
    );
  }

  //TODO graph
  LineChartData mainData(BuildContext context) {
    math.Random r = new math.Random();
    return LineChartData(
      backgroundColor: Colors.white,
      gridData: FlGridData(show: false),
      titlesData: FlTitlesData(
        show: false,
        bottomTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(showTitles: false),
      ),
      borderData: FlBorderData(show: false),
      lineTouchData: LineTouchData(handleBuiltInTouches: false),
      minX: 0,
      maxX: 6, //11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [for (var i = 0.0; i < 6; i++) FlSpot(i, r.nextDouble() * 10)],
          isCurved: true,
          colors: [Colors.green], //[lineColor], //gradientColors,
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            cutOffY: 0.1,
            applyCutOffY: true,
            colors: [Colors.green, Colors.greenAccent]
                .map((color) => color.withOpacity(0.1))
                .toList(),
          ),
        ),
      ],
    );
  }
}
