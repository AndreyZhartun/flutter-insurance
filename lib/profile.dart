import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theming
    TextTheme textTheme = Theme.of(context).textTheme;
    double horizontalPadding = 30;
    double verticalPadding = 30;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        //TODO Localizations
        //TODO mock http server
        title: Text(
          'TOTAL PAYMENT',
          style: textTheme.bodyText1.copyWith(
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
                horizontal: horizontalPadding,
                vertical: horizontalPadding * 0.5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.drag_handle),
                    padding: EdgeInsets.zero,
                  ),
                  Text(
                    'TOTAL PAYMENT',
                    style: textTheme.bodyText1.copyWith(
                      letterSpacing: 1,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: horizontalPadding,
                right: horizontalPadding,
                //top: horizontalPadding * 0.5,
              ),
              child: Text(
                '\$ 1024.68',
                style: textTheme.headline3.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Your monthly bill',
                style: textTheme.bodyText2.copyWith(
                  letterSpacing: 0.5,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    height: 45,
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
                    width: 120,
                    height: 45,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Pay',
                        style: textTheme.bodyText1.copyWith(
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
    //theming TODO
    Radius _radius = Radius.circular(50);
    double horizontalPadding = 30;
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
                      indent: horizontalPadding,
                      endIndent: horizontalPadding,
                    );
                  },
                  itemCount: types.length,
                ),
              ),
              //_TypesListItem(type: 'Home Insurance', sum: '650.24'),
              //_TypesListItem(type: 'Home Insurance', sum: '205.12'),
              //_TypesListItem(type: 'Home Insurance', sum: '350.67'),
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
    //TODO theming
    TextTheme textTheme = Theme.of(context).textTheme;
    double horizontalPadding = 30;
    double imageRadius = 30;
    return Padding(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        bottom: horizontalPadding,
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
                    top: horizontalPadding * 0.5,
                    left: horizontalPadding * 0.5,
                    right: horizontalPadding * 0.5,
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: FlutterLogo(),
                        radius: imageRadius,
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding * 0.5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name Surname',
                              style: textTheme.subtitle1.copyWith(
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
            padding:
                EdgeInsets.only(top: imageRadius * 2 + horizontalPadding * 0.5),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
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
    TextTheme textTheme = Theme.of(context).accentTextTheme;
    double horizontalPadding = 30;
    double verticalPadding = 1;
    Color accentColor = Theme.of(context).accentColor;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
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
                    style: textTheme.bodyText2.copyWith(
                      color: accentColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Text(
                  '\$ $sum',
                  style: textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          /*Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding-25),
            child: */
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text(
                  'last month',
                  style: textTheme.bodyText2.copyWith(
                    color: accentColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              //TODO graph
              /*SizedBox(
                width: 140,
                //height: 40,
                height: textTheme.headline5.fontSize,
                child: Container(
                  color: Colors.black26,
                ),
              ),*/
              Text(
                  'xd',
                  style: textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          //),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
