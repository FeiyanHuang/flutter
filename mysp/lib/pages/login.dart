import 'package:flutter/material.dart';
import '../model/user.dart';
import 'package:provide/provide.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _pwd = true;
  TextEditingController _userphone = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  void pwdSubmit() {
    print('here');
    getUserByPwd(_userphone.text, _password.text).then((User user){
      Provide.value<UserModel>(context).login(user);
      Future.delayed(const Duration(microseconds: 500), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
      });
      print('here');
    }).catchError((e){
      scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.deepOrange, content: Text('登录失败')));
    });
  }

  void codeSubmit() {
    print(_userphone.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,//开头对齐
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'MeYoung',
            ),
            Text(
              '欢迎登录米多多',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                children: <Widget>[
                  InkWell(
                    child: new Container(
                      margin: EdgeInsets.only(right: 20.0),
                      decoration: new BoxDecoration(
                        border: new Border(
                          bottom: BorderSide(
                            color: !(_pwd??false) ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                            width: 3.0,
                          ),
                        )
                      ),
                      child: new Padding(
                        padding: new EdgeInsets.all(8.0),                        
                        child: Text(
                          '密码登录',
                          style: new TextStyle(
                            color: !(_pwd??false) ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                          ),
                        ),
                      ),
                    ),  
                    onTap: () {   
                      setState(() {
                        _pwd = true;
                      });                       
                      // print("pwd");
                    },
                  ),
                  InkWell(
                    child: new Container(
                      margin: EdgeInsets.only(right: 20.0),
                      decoration: new BoxDecoration(
                        border: new Border(
                          bottom: BorderSide(
                            color: _pwd??false ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                            width: 3.0,
                          ),
                        )
                      ),
                      child: new Padding(
                        padding: new EdgeInsets.all(8.0),                        
                        child: Text(
                          '验证码登录',
                          style: new TextStyle(
                            color: _pwd??false ? Colors.grey : Color.fromRGBO(79, 123, 254,1),
                          ),
                        ),
                      ),
                    ),  
                    onTap: () {                          
                      setState(() {
                        _pwd = false;
                      });  
                    },
                  ),

                ],
              ),
            ),
            
            _pwd ? pwd(): code(),
          ],
        ),
      ),
      )
    );
  }

  Widget code() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, 
                child:TextField(
                  controller: _userphone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '请输入手机号',
                  ),
                )
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, 
                child:TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '请输入验证码',
                  ),
                )
              ),
              Column(
                children: <Widget>[
                  Text('获取验证码'),
                ],
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,//开头对齐
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '忘记密码？',
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(child:
                new RaisedButton(
                  onPressed: (){
                    codeSubmit();
                  },
                  child: new Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                  child: new Text(  
                      "登录", 
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                        )
                    ),
                  ),
                  color: Color.fromRGBO(79, 123, 254,1),
                  // borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,//开头对齐
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '注册司机',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(79, 123, 254,1),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pwd() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, 
                child:TextField(
                  controller: _userphone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '请输入手机号',
                  ),
                )
              )
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1, 
                child:TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10.0),
                    labelText: '请输入密码',
                  ),
                )
              )
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,//开头对齐
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '忘记密码？',
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(child:
                new RaisedButton(
                  onPressed: (){
                    pwdSubmit();
                  },
                  child: new Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                  child: new Text(  
                      "登录", 
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                        )
                    ),
                  ),
                  color: Color.fromRGBO(79, 123, 254,1),
                  // borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              new Expanded(
                child: 
                  Padding(padding: new EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,//开头对齐
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '注册司机',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(79, 123, 254,1),
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
