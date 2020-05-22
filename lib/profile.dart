import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //TODO Localizations
        //TODO mock http server
        title: Text('TOTAL PAYMENT'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          )
        ],
      ),
      drawer: Drawer(
          //TODO
          ),
      body: Column(
        children: <Widget>[
          Text(
            '\$ 1024.68',
            style: textTheme.headline6,
          ),
          Text(
            'Your monthly bill',
            style: textTheme.bodyText2,
          ),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text(
                  'View bill',
                  style: Theme.of(context).accentTextTheme.bodyText2,
                ),
                color: Colors.white,
              ),
              //outline button v
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
          _TypesList(),
        ],
      ),
    );
  }
}

class _TypesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Radius _radius = Radius.circular(50);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: _radius,
            topRight: _radius,
          ),
        ),
        child: Column(
          children: <Widget>[
            _AgentCard(),
            _TypesListItem(type: 'type1', sum: '650.24'),
            _TypesListItem(type: 'type2', sum: '205.12'),
            _TypesListItem(type: 'type3', sum: '350.67'),
          ],
        ),
      ),
    );
  }
}

class _AgentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      //TODO pad 1/8 - card - 3/8
      widthFactor: 0.5,
      child: Card(
        color: Colors.red,
        child: ListTile(
          leading: CircleAvatar(
              child: Container(
            color: Colors.white,
          )),
          title: Text('Name Surname'),
          subtitle: Text('My Agent'),
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
    return Row(
      children: <Widget>[
        Column(
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
        Column(
          children: <Widget>[
            Text(
              'last month',
              style: textTheme.bodyText2,
            ),
            //TODO graph
            SizedBox(
              width: 100,
              height: 20,
              child: Container(color: Colors.black26,)
            ),
          ],
        ),
      ],
    );
  }
}
