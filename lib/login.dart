import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scorch/Services/AccountService.dart';
import 'package:scorch/home.dart';
import 'Widgets/SocialIcons.dart';
import 'CustomIcons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Services/AccountService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSelected = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _makePostLogin() async {
//      var response = await AccountService.makePostLogin(usernameController.text, passwordController.text);
      var response = await AccountService.makePostLogin('eddypretorius@gmail.com', 'P@ssw0rd');
      if(response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        var prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', responseBody['access_token']);
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    }

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                //child: Image.asset("assets/image_01.png"),
              ),
              Expanded(
                child: Container(),
              ),
              //Image.asset("assets/image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
//                      Image.asset(
//                        "assets/logo.png",
//                        width: ScreenUtil.getInstance().setWidth(110),
//                        height: ScreenUtil.getInstance().setHeight(110),
//                      ),
//                      Text("LOGO",
//                          style: TextStyle(
//                              fontFamily: "Poppins-Bold",
//                              fontSize: ScreenUtil.getInstance().setSp(46),
//                              letterSpacing: .6,
//                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(180),
                  ),
                  Container(
                    width: double.infinity,
                    height: ScreenUtil.getInstance().setHeight(500),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 15.0),
                              blurRadius: 15.0),
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, -10.0),
                              blurRadius: 10.0),
                        ]),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Login",
                              style: TextStyle(
                                  fontSize: ScreenUtil.getInstance().setSp(45),
                                  fontFamily: "Poppins-Bold",
                                  letterSpacing: .6)),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Text("Username",
                              style: TextStyle(
                                  fontFamily: "Poppins-Medium",
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(26))),
                          TextField(
                            decoration: InputDecoration(
                                hintText: "username",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 12.0)),
                            controller: usernameController,
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(30),
                          ),
                          Text("PassWord",
                              style: TextStyle(
                                  fontFamily: "Poppins-Medium",
                                  fontSize:
                                      ScreenUtil.getInstance().setSp(26))),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 12.0)),
                            controller: passwordController,
                          ),
                          SizedBox(
                            height: ScreenUtil.getInstance().setHeight(35),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: "Poppins-Medium",
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(28)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil.getInstance().setHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 12.0,
                          ),
                          GestureDetector(
                            onTap: _radio,
                            child: radioButton(_isSelected),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text("Remember me",
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Poppins-Medium"))
                        ],
                      ),
                      InkWell(
                        child: Container(
                          width: ScreenUtil.getInstance().setWidth(330),
                          height: ScreenUtil.getInstance().setHeight(100),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFFff0000),
                                Color(0xFF242222)
                              ]),
                              borderRadius: BorderRadius.circular(6.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF6078ea).withOpacity(.3),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 8.0)
                              ]),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _makePostLogin();
                              },
                              child: Center(
                                child: Text("Sign In",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins-Bold",
                                        fontSize: 18,
                                        letterSpacing: 1.0)),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      horizontalLine(),
                      Text("Social Login",
                          style: TextStyle(
                              fontSize: 16.0, fontFamily: "Poppins-Medium")),
                      horizontalLine()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        colors: [
                          Color(0xFF102397),
                          Color(0xFF187adf),
                          Color(0xFF00eaf8),
                        ],
                        iconData: CustomIcons.facebook,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFFff4f38),
                          Color(0xFFff355d),
                        ],
                        iconData: CustomIcons.googlePlus,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF17ead9),
                          Color(0xFF6078ea),
                        ],
                        iconData: CustomIcons.twitter,
                        onPressed: () {},
                      ),
                      SocialIcon(
                        colors: [
                          Color(0xFF00c6fb),
                          Color(0xFF005bea),
                        ],
                        iconData: CustomIcons.linkedin,
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New User? ",
                        style: TextStyle(fontFamily: "Poppins-Medium"),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text("SignUp",
                            style: TextStyle(
                                color: Color(0xFF5d74e3),
                                fontFamily: "Poppins-Bold")),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//final token = '';
//final emailController = TextEditingController();
//final passwordController = TextEditingController();
//final emailField = TextField(
//  obscureText: false,
//  style: style,
//  decoration: InputDecoration(
//      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//      hintText: "Email",
//      border:
//      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//  controller: emailController,
//);
//final passwordField = TextField(
//  obscureText: true,
//  style: style,
//  decoration: InputDecoration(
//      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//      hintText: "Password",
//      border:
//      OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//  controller: passwordController,
//);
//_makePostLogin() async {
//  // set up POST request arguments
//  String url = 'http://localhost/ScorchApi/token';
//  Map<String, String> headers = {
//    "Content-type": "application/json",
//    "grant_type": "password",
//    "username": emailController.text,
//    "password": passwordController.text
//  };
//  String json = '{}';
//
//  // make POST request
//  Response response = await post(url, headers: headers, body: json);
//
//  // check the status code for the result
//  int statusCode = response.statusCode;
//
//  // this API passes back the id of the new item added to the body
//  String body = response.body;
//  // {
//  //   "title": "Hello",
//  //   "body": "body text",
//  //   "userId": 1,
//  //   "id": 101
//  // }
//}
