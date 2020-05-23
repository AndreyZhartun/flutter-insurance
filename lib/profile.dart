import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theming
    TextTheme textTheme = Theme.of(context).textTheme;
    double horizontalPadding = 30;
    double verticalPadding = 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        //TODO Localizations
        //TODO mock http server
        title: Text('TOTAL PAYMENT'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
          //TODO
          ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              '\$ 1024.68',
              style: textTheme.headline6,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              'Your monthly bill',
              style: textTheme.bodyText2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Row(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'View bill',
                    style: Theme.of(context).accentTextTheme.bodyText2,
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(width: 5),
                FlatButton(
                  onPressed: () {},
                  child: Text('Pay', style: textTheme.bodyText2),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ),
          _TypesList(),
        ],
      ),
    );
  }
}

class _TypesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //theming
    Radius _radius = Radius.circular(50);
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
                _TypesListItem(type: 'Home Insurance', sum: '650.24'),
                _TypesListItem(type: 'Home Insurance', sum: '205.12'),
                _TypesListItem(type: 'Home Insurance', sum: '350.67'),
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
    double horizontalPadding = 30;
    return Padding(
      padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding,),
      child: Container(
        //widthFactor: 0.5,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
          color: Colors.red,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: FlutterLogo(),
                  backgroundColor: Colors.white,
                ),
                title: Text('Name Surname'),
                subtitle: Text('My Agent'),
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
    TextTheme textTheme = Theme.of(context).accentTextTheme;
    double horizontalPadding = 30;
    double verticalPadding = 1;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  type,
                  style: textTheme.bodyText2,
                ),
                Text(
                  '\$ $sum',
                  style: textTheme.subtitle1,
                ),
              ],
            ),
          ),
          /*Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding-25),
            child: */Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'last month',
                  style: textTheme.bodyText2,
                ),
                //TODO graph
                SizedBox(
                    width: 70,
                    height: 20,
                    child: Container(
                      color: Colors.black26,
                    )),
              ],
            ),
          //),
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.black),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}