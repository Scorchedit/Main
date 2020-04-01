import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.portrait, color: Colors.white, size: 130,),
                      Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
              Divider(color: Colors.white,),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.settings, color: Colors.white, size: 130,),
                        Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.group, color: Colors.white, size: 130,),
                        Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.notifications, color: Colors.white, size: 130,),
                      Text('Notification Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}
