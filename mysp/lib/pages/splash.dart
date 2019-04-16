import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './home.dart';
import './login.dart';

class SplashPage extends StatefulWidget{
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>{
  bool isStartHomePage = false;
  bool localUser;

  @override
  void initState() {
    super.initState();
    countDown();
    user();
  }

  void user() async {
    await getLocalUser();
  }

  Future<bool> getLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString("user");
    if(user != null){
      setState(() {
        localUser = true;  
      });
      return true;
    }else{
      setState(() {
        localUser = false;  
      });
      return false;
    }
  }

  void countDown() async {
    var _duration = new Duration(seconds: 3);
    new Future.delayed(_duration, gotoHomePage);
  }

  void gotoHomePage() {
    //如果页面还未跳转过则跳转页面,不然会被执行两次
    if(!isStartHomePage){
      //跳转主页 且销毁当前页面
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => localUser??false ? HomePage():LoginPage()),);
      isStartHomePage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(),
          child: Image.asset("assets/background.png"),
        ),
        Container(
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(top: 30.0, right: 30.0),
              padding: EdgeInsets.only(top: 4.0, left: 8.0, bottom: 4.0, right: 8.0),
              decoration: BoxDecoration(
                color: Color.fromRGBO(200, 200, 200, 0.4),
                border: Border.all(
                  color: Color.fromRGBO(200, 200, 200, 1)
                )
              ),
              child: GestureDetector(
                onTap: gotoHomePage,
                child: Text(
                  '跳过',
                  style: TextStyle(
                    color: Color.fromRGBO(120, 120, 120, 1),
                    fontSize: 18.0,
                    decoration: TextDecoration.none
                  ),
                ),
              )
            ),
          ),
        )
      ],
    );
  }
}