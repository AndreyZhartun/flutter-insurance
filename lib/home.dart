import 'package:flutter/material.dart';
import 'package:mock_insurance/profile.dart';
import 'package:mock_insurance/stats.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            Profile(),
            Stats(),
            Stats(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.perm_device_information),
            ),
            Tab(
              icon: Icon(Icons.security),
            ),
            Tab(
              icon: Icon(Icons.local_parking),
            ),
          ],
        ),
      ),
    );
  }
}
