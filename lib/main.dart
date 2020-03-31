import 'package:flutter/material.dart';
import 'package:scorch/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: Colors.black,
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.portrait)),
                  Tab(icon: Icon(Icons.playlist_add_check)),
                  Tab(icon: Icon(Icons.notifications)),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_transit),
              HomePage(),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}