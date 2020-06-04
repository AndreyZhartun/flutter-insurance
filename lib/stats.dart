import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'dart:math' as math;
import 'package:mock_insurance/themes.dart';

import 'components/top_row.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).accentTextTheme;
    double _horizontalPadding = MyTheme.horizontalPadding;
    Color _accentColor = Theme.of(context).accentColor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            TopRow(
              isWhite: false,
              title: 'YOUR STATS',
              leading: TOP_BUTTONS.back,
              trailing: TOP_BUTTONS.empty,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '\$ 13450.13',
                          style: _textTheme.headline5
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Yearly budget',
                          style: _textTheme.bodyText2.copyWith(
                            color: _accentColor,
                          ),
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
                        style: _textTheme.bodyText2.copyWith(
                          color: _accentColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '64%',
                            style: _textTheme.bodyText2.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' of your annual budget so far.',
                            style: _textTheme.bodyText2.copyWith(
                              color: _accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Expanded(child: Container()),
            Spacer(),
            FractionallySizedBox(
              widthFactor: 1,
              //width: 100,
              //height: 200,
              //child: _YearChart.withSampleData(),
              child: _YearChart(),
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
    Color _color = Theme.of(context).cardColor;
    double _size = MediaQuery.of(context).size.width / 2.5;
    double _horizontalPadding = MyTheme.horizontalPadding;
    double _value = 0.65;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _horizontalPadding * 0.5),
      child: SizedBox(
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
                  valueColor: new AlwaysStoppedAnimation<Color>(_color),
                  strokeWidth: 10,
                ),
              ),
            ),
            Positioned(
              //не работает с другими value
              //то, что это работает с данным value вообще магия
              //TODO пофиксить
              left: _size / 2 +
                  math.sin(_value * 2 * math.pi - math.pi / 2) * (_size / 2),
              top: _size / 2 +
                  math.cos(_value * 2 * math.pi - math.pi / 2) * (_size / 2),
              child: Material(
                color: _color,
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
      ),
    );
  }
}

class _YearChart extends StatefulWidget {
  @override
  _YearChartState createState() => _YearChartState();
}

class _YearChartState extends State<_YearChart> {
  String dropdownValue = '2020';

  @override
  Widget build(BuildContext context) {
    double _horizontalPadding = MyTheme.horizontalPadding;
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: _horizontalPadding),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              underline: Container(),
              items: <String>['2020', '2019', '2018']
                  .map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style:
                          Theme.of(context).accentTextTheme.bodyText2.copyWith(
                                color: Theme.of(context).accentColor,
                              ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ),
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
          textStyle: Theme.of(context).accentTextTheme.bodyText2.copyWith(
                color: Theme.of(context).accentColor,
              ),
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
      lineTouchData: LineTouchData(
        //TODO найти TouchedSpotIndicatorData
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black,
          getTooltipItems: (spotList) {
            return [
              LineTooltipItem(
                '+3.5%',
                Theme.of(context).textTheme.bodyText2.copyWith(
                      letterSpacing: 0.5,
                    ),
              ),
            ];
          },
        ),
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
          colors: [Theme.of(context).cardColor], //gradientColors,
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            //cutOffY: 0.1,
            //applyCutOffY: true,
            gradientFrom: Offset(0.1, 0.5),
            colors: [Theme.of(context).cardColor, Colors.white]
                .map((color) => color.withOpacity(0.3))
                .toList(),
          ),
        ),
      ],
    );
  }
}
