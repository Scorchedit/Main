import 'package:flutter/material.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.portrait)),
                Tab(icon: Icon(Icons.playlist_add_check)),
                Tab(icon: Icon(Icons.notifications)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Scaffold(
                body: (
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/Baby Inuyasha.jpg'),
                            radius: 80,
                            backgroundColor: Colors.red,
                            child:
                            Text(
                                'Scorch',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                      ],
                    )
                ),
              ),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}