import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
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
                          style: _textTheme.headline5.copyWith(fontWeight: FontWeight.bold),
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
            //Spacer(),
            Expanded(
              //width: 100,
              //height: 200,
              child: _YearChart.withSampleData(),
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
                value: 0.6,
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                strokeWidth: 10,
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

class _YearChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  _YearChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory _YearChart.withSampleData() {
    return new _YearChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<_TimeSeriesSpending, DateTime>>
      _createSampleData() {
    math.Random r = new math.Random();

    final data = [
      for (var i = 1; i < 13; i++)
        _TimeSeriesSpending(new DateTime(2020, i, 1), r.nextInt(100))
    ];

    return [
      new charts.Series<_TimeSeriesSpending, DateTime>(
        id: 'Spending',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (_TimeSeriesSpending spending, _) => spending.time,
        measureFn: (_TimeSeriesSpending spending, _) => spending.spending,
        data: data,
      )
    ];
  }
}

///дата модель трат
class _TimeSeriesSpending {
  final DateTime time;
  final int spending;

  _TimeSeriesSpending(this.time, this.spending);
}
