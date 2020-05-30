import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;
import 'package:mock_insurance/themes.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).accentTextTheme;
    double _horizontalPadding = MyTheme.horizontalPadding;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.chevron_left),
                    padding: EdgeInsets.zero,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    alignment: Alignment.centerLeft,
                  ),
                  Text(
                    'YOUR STATS',
                    style: _textTheme.bodyText1.copyWith(
                      letterSpacing: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.notifications),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
            _CircularPI(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: _horizontalPadding,
                vertical: _horizontalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Text(
                          '\$ 13450.13',
                          style: _textTheme.headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Yearly budget',
                          style: _textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: RichText(
                      softWrap: true,
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        text: 'You\'ve spent about ',
                        style: _textTheme.bodyText2,
                        children: <TextSpan>[
                          TextSpan(
                            text: '64%',
                            style: _textTheme.bodyText2.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' of your annual budget so far.',
                            style: _textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Expanded(child: Container()),
            Expanded(
              //width: 100,
              //height: 200,
              //child: _YearChart.withSampleData(),
              child: LineChartSample2(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircularPI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).accentTextTheme;
    double _size = MediaQuery.of(context).size.width / 2.5;
    double _value = 0.65;
    return SizedBox(
      width: _size,
      height: _size,
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: _size,
            width: _size,
            child: CircularProgressIndicator(
              value: 1,
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.black12),
              strokeWidth: 10,
            ),
          ),
          SizedBox(
            height: _size,
            width: _size,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi)..rotateX(math.pi),
              child: CircularProgressIndicator(
                value: _value,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                strokeWidth: 10,
              ),
            ),
          ),
          Positioned(
            //не работает с другими value
            left: _size/2 + math.sin(_value * 2 * math.pi - math.pi/2) * (_size/2),
            top: _size/2 + math.cos(_value * 2 * math.pi - math.pi/2) * (_size/2),
            child: Material(
              color: Colors.red,
              shape: CircleBorder(
                side: BorderSide(
                  width: 0.0,
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '\$8700.0',
                  style: _textTheme.headline6,
                ),
                Text(
                  'Yearly average',
                  style: _textTheme.bodyText2,
                ),
                Icon(
                  Icons.monetization_on,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    //const Color(0xff23b6e6),
    //const Color(0xff02d39a),
    Colors.red,
    //Color.fromRGBO(255, 71, 71, 1),
    Colors.white,
  ];
  Color lineColor = Colors.red;

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9, //1.70,
          child: Container(
            color: Colors.white, //Color(0xff232d37)),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 15.0,
                left: 15.0,
                //top: 24,
                //bottom: 12,
              ),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: FlatButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'Year',
              style: TextStyle(fontSize: 12, color: Colors.black),
              //showAvg ? Colors.white.withOpacity(0.5) : Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    math.Random r = new math.Random();
    List _months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    double _currentMonth = 8.0;
    return LineChartData(
      backgroundColor: Colors.white,
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          /*textStyle: const TextStyle(
              color: Colors.black, //Color(0xff68737d),
              //fontWeight: FontWeight.bold,
              fontSize: 16),*/
          textStyle: Theme.of(context).accentTextTheme.bodyText2,
          getTitles: (value) => _months[value.toInt()],
          margin: 4,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: _currentMonth, //11,
      minY: 0,
      maxY: 10,
      lineBarsData: [
        LineChartBarData(
          spots: [
            for (var i = 0.0; i < _currentMonth + 1; i++)
              FlSpot(i, r.nextDouble() * 10)
          ],
          isCurved: true,
          colors: [lineColor], //gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            cutOffY: 0.1,
            applyCutOffY: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.1)).toList(),
          ),
        ),
      ],
    );
  }
}
