import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';
import 'package:provide/provide.dart';
import './login.dart';
import 'dart:convert';

class MyPage extends StatefulWidget{
  @override
  _MyPageState createState() => new _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin{
  TabController controller;
  User userinfo;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
    getUser();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getUser() async{
     userinfo =  await getLocalUser();
  }

  Future<User> getLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = prefs.getString("user");
    var info = json.decode(user);

    setState(() {
      userinfo = User.fromJson(info["user"]);
    });


    return User.fromJson(info["user"]);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // user name
            new Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Provide<UserModel>(builder: (context, child,model){
                return new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,//开头对齐
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      userinfo != null ? userinfo.name : "未登入",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                      ),
                    ),
                    new Row(
                      children: <Widget>[
                        new Text(
                          '浙A-Y262',
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                        new  Padding(padding: new EdgeInsets.only(right: 40)),
                        new Text(
                          '高低平板',
                          style: new TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              })
            ),
            new Padding(padding: EdgeInsets.all(10.0),),
            // user info
            new Container(
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,//开头对齐
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {   
                      setState(() {
                         print('手机号');
                      });
                      // print("pwd");
                    },
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,//两端对齐
                      children: <Widget>[
                        new Text('手机号'),
                        new Align(
                          alignment: Alignment.topRight,
                          child: new Text(
                            userinfo != null ? userinfo.phone.toString().replaceRange(3, 7, "****") : "未登入",
                            textAlign: TextAlign.right,
                            style: new TextStyle(
                              color: Colors.red
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                  // new Drawer(),
                  new Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text('身份证号'),
                      new Text('333********2234')
                    ],
                  ),
                  new Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text('银行卡'),
                      new Text('未上传')
                    ],
                  )
                ],
              )
            ),
            new Padding(padding: EdgeInsets.all(10.0),),
            // car info
            new Container(
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text('车辆信息'),
                      new Text('>')
                    ],
                  ),
                  new Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text('设置'),
                      new Text('>')
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: new RaisedButton(
                      onPressed: (){
                        // print('退出');
                        Provide.value<UserModel>(context).logout();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (Route<dynamic> route) => false);
                      },
                      child: Text('退出'),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2500,
                percent: 0.8,
                center: Text("80.0%"),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
              ),
            ),
          ],
        ),
      )
    );
  }
}