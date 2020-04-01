import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> rowList = ['Aandklas', 'Baraccas', 'Elephants and Friends', 'Madison\'s avenue',
  'Rock@88', 'Salsa Mexican', 'Aandklas', 'Baraccas', 'Elephants and Friends', 'Madison\'s avenue',
  'Rock@88', 'Salsa Mexican', 'Aandklas', 'Baraccas', 'Elephants and Friends', 'Madison\'s avenue'];

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        border: Border.all(color: Colors.white),
      );
    }
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              ButtonTheme(
                minWidth: 150,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0)
                  ),

                  color: Colors.white,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Happening Now",
                  ),
                ),
              ),
              Container(
                height: 30.0,
                width: 1.0,
                color: Colors.white30,
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
              ),
              ButtonTheme(
                minWidth: 150,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0)
                  ),

                  color: Colors.white,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Broadcasts",
                  ),
                ),
              ),
              SizedBox()
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: new ListView.builder(
                itemCount: rowList.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return new Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: myBoxDecoration(),
                    child: Text(
                      rowList[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
