import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scorch/Services/SetupService.dart';

import 'Services/AccountService.dart';
import 'login.dart';

class SearchSettingsPage extends StatefulWidget {
  @override
  _SearchSettingsState createState() => _SearchSettingsState();
}

class _SearchSettingsState extends State<SearchSettingsPage> {
  double min = 0;
  double max = 100;
  SearchOptionsDto model = new SearchOptionsDto();

  Future setSearchSetting(String key, bool value, int type) async {
    var obj = new SearchOptionsModel(key, value, type);
    SetupService.setSearchSetting(obj);
  }

  @override
  void initState() {
    AccountService.checkIfAuthenticated().then((success) {
      if (!success) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {

      }
    });
    SetupService.getSearchSettings().then((obj) {
      var model = jsonDecode(obj);
      this.model.Categories = (model['Categories'] as List).map((item) => new SearchOptionsModel(item['Key'], item['Value'], item['Type'])).toList();
      this.model.Tags = (model['Tags'] as List).map((item) => new SearchOptionsModel(item['Key'], item['Value'], item['Type'])).toList();
      this.model.Distance = model['Distance'];
      setState(() {});
    });
    super.initState();
  }

  Widget getCategories(List<SearchOptionsModel> children) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .map((item) => new Row(
                children: <Widget>[
                  Text(
                    item.Key,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Switch(
                    onChanged: (value) {
                      setState(() {
                        item.Value = value;
                        setSearchSetting(item.Key, value, item.Type);
                      });

                    },
                    value: item.Value,
                    activeColor: Colors.red,
                  )
                ],
              ))
          .toList(),
    );
  }

  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: new FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text(
                'Back',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Search Location',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Search Distance:',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '${model.Distance.truncate()} Km',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              Slider(
                value: model.Distance,
                min: min,
                max: max,
                activeColor: Colors.red,
                onChanged: (newRange) {
                  setState(() {
                    model.Distance = newRange.roundToDouble();
                    SetupService.setSearchDistanceSetting(newRange.roundToDouble());
                  });
                },
              ),
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Categories:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Divider(color: Colors.white,),
                  getCategories(model.Categories),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Tags:',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Divider(color: Colors.white,),
                  getCategories(model.Tags),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class ActionButton {
  String key;
  bool value;

  ActionButton(String key, bool value) {
    this.key = key;
    this.value = value;
  }
}

class SearchOptionsDto {
  SearchOptionsDto() {
    Categories = [];
    Tags = [];
    Distance = 0;
  }
  List<SearchOptionsModel> Categories;
  List<SearchOptionsModel> Tags;
  double Distance;
}
class SearchOptionsModel {
  SearchOptionsModel(String key, bool value, int type) {
    Key = key;
    Value = value;
    Type = type;
  }
  String Key;
  bool Value;
  int Type;
}