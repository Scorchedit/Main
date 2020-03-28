import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Center(
        child: GestureDetector(
          onTap: () {

          },
          child:  CircleAvatar(
            radius: 55.0,
            backgroundColor: Colors.red,
            child: Text(
                'Scorch'
            ),
          ),
        ),
      ),

    );
  }
}