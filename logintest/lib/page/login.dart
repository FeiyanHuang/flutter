import 'package:flutter/material.dart';
import '../model/user.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() =>new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Text("账号"),
              Expanded(flex: 1, child:TextField(controller: _username,))
            ],),
            Row(children: <Widget>[
              Text("密码"),
              Expanded(flex: 1, child:TextField(controller: _password,obscureText: true,))
            ],),
            Row(children: <Widget>[
              RaisedButton(
                child: new Text('提交'),
                onPressed: (){submit();},  
              )
            ],)
          ],
        ),
      ),
    );
  }
  void submit(){
    User user = new User();
    user.login(_username.text, _password.text);
  }
}