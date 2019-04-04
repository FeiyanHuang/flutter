import 'package:flutter/material.dart';
import '../pages/reset.dart';

class PwdComponents extends StatefulWidget{
  PwdComponents({Key key, this.pwdSubmit}):super(key: key);
  final Function pwdSubmit;

  @override
  _PwdComponentsState createState() => new _PwdComponentsState();
}

class _PwdComponentsState extends State<PwdComponents> with SingleTickerProviderStateMixin{
  TextEditingController _userphone = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  void _pwdSubmit(){
    if (widget.pwdSubmit != null) widget.pwdSubmit(_userphone.text, _password.text);
  }
  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: 
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),)
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,//开头对齐
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, new MaterialPageRoute(builder: (context) => new PasswordPage()));
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PasswordPage()),);
                },
                child: Text(
                  '忘记密码？',
                ),
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
            children: <Widget>[
              new Expanded(child:
                new RaisedButton(
                  onPressed: (){
                    _pwdSubmit();
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
        ],
      ),
    );
  }
}